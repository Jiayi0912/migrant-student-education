## data cleaning ##
library(haven) #to import STATA files
library(MASS) #robust regressions
library(tidyverse) 
library(knitr) #to use kable
library(estimatr) #to use lm_robust
library(sandwich) #to use lm.cluster

setwd("F:/UChicago/课程/D2MR/repos/migrant-student-education")

## Investigate w2 data ##

## import w2 data 
cepsw2.st <- read_dta("./cepsw2data/cepsw2studentEN.dta")
cepsw2.st.orig <- cepsw2.st

# rename `w2a01` as `mig_status`
cepsw2.st.orig <- cepsw2.st.orig %>% 
  rename(mig_status = w2a01) %>%
  mutate(
    # calculate the percentage of chinese, math, and english scores
    w2chnpct = w2chn/w2upchn,
    w2matpct = w2mat/w2upmat,
    w2engpct = w2eng/w2upeng
  )

## examine `mig_status`
summary(cepsw2.st.orig$mig_status)
tabulate(cepsw2.st.orig$mig_status)

## generate a new dataset only containing migrant students
cepsw2.st.mig <- cepsw2.st.orig %>% filter(mig_status == 2)
summary(cepsw2.st.mig$w2cog3pl)
summary(cepsw2.st.mig$w2chnpct)
summary(cepsw2.st.mig$w2matpct)
summary(cepsw2.st.mig$w2engpct)

## generate a new dataset only containing non-migrant students
cepsw2.st.nonmig <- cepsw2.st.orig %>% filter(mig_status == 1)
summary(cepsw2.st.nonmig$w2cog3pl)
summary(cepsw2.st.nonmig$w2chnpct)
summary(cepsw2.st.nonmig$w2matpct)
summary(cepsw2.st.nonmig$w2engpct)

## import w2 school data (principle data)
cepsw2.pr <- read_dta("./cepsw2data/cepsw2principalEN.dta")
cepsw2.pr.orig <- cepsw2.pr

## investigate w2 school data
# rename variables of interests
cepsw2.pr.orig <- cepsw2.pr.orig %>% 
  rename(per_st_funding = w2pla15, 
         mig_funding = w2pla16, 
         centgov_fund_pct= w2pla1701,
         prefgov_fund_pct = w2pla1702,
         countgov_fund_pct = w2pla1703,
         stucharge_pct = w2pla1704,
         same_charge_std = w2pld0200,
         mig_subsidy = w2pld0405) 
summary(cepsw2.pr.orig$per_st_funding)
summary(cepsw2.pr.orig$centgov_fund_pct)
summary(cepsw2.pr.orig$prefgov_fund_pct)
summary(cepsw2.pr.orig$countgov_fund_pct)
summary(cepsw2.pr.orig$stucharge_pct)

tabulate(cepsw2.pr.orig$mig_funding)
tabulate(cepsw2.pr.orig$same_charge_std)
tabulate(cepsw2.pr.orig$mig_subsidy)

## import w2 parents data
cepsw2.pa <- read_dta("./cepsw2data/cepsw2parentEN.dta")
cepsw2.pa.orig <- cepsw2.pa

## rename variables
cepsw2.pa.orig <- cepsw2.pa.orig %>% 
  rename(mig_status = w2bd01,
         mig_local_adm = w2bc07,
         mig_local_quali = w2bc0800) 

cepsw2.pa.mig <- cepsw2.pa.orig %>% filter(mig_status == 2)
tabulate(cepsw2.pa.mig$mig_local_adm)
tabulate(cepsw2.pa.mig$mig_local_quali)

## wrangling data
# merge w2 parent data with w2 student data
cepsw2.join.stpa <- cepsw2.st.orig %>%
  left_join(cepsw2.st.orig, cepsw2.pa.orig, by = c("ids", "clsids", "w2clsids", "schids", "ctyids"))
# merge w2 school data with `cepsw2.join.stpa`
cepsw2.join <- cepsw2.join.stpa %>%
  left_join(cepsw2.pr.orig, by = c("schids", "ctyids"))

## select variables that account
cepsw2.wrangled <- cepsw2.join %>% 
  rename(fam_fin = w2be23,
         fam_edu = w2be08,
         fam_ocp = w2be09
) %>%
  select(
  ids, clsids, w2clsids, schids, ctyids, mig_status, w2cog3pl, w2chnpct, w2matpct, w2engpct, 
  per_st_funding, mig_funding, centgov_fund_pct, prefgov_fund_pct, countgov_fund_pct, stucharge_pct, 
  same_charge_std, mig_subsidy, mig_local_adm, mig_local_quali, fam_fin, fam_edu, fam_ocp
)
