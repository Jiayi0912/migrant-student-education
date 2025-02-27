## data cleaning ##
library(haven) #to import STATA files
library(MASS) #robust regressions
library(tidyverse) 
library(knitr) #to use kable
library(estimatr) #to use lm_robust
library(sandwich) #to use lm.cluster

#### Investigate CEPS wave 2 data ####

## import w2 data 
w2.st <- read_dta("./cepsw2data/cepsw2studentEN.dta")
w2.st.orig <- w2.st

## import w2 school data (principle data)
w2.pr <- read_dta("./cepsw2data/cepsw2principalEN.dta")
w2.pr.orig <- w2.pr

## import w2 parents data
w2.pa <- read_dta("./cepsw2data/cepsw2parentEN.dta")
w2.pa.orig <- w2.pa

# wrangling data
## merge w2 parent data with w2 student data
w2.st.pa <- w2.st.orig %>%
  left_join(w2.pa.orig, by = c("ids", "clsids", "w2clsids", "schids", "ctyids"))

## merge w2 school data with `w2.st.pa`
w2.join <- w2.pr.orig %>%
  left_join(w2.st.pa, by = c("schids", "ctyids"))

## select variables that account
w2.selected <- w2.join %>% 
  ## rename variables
  rename(## migrant status
         mig_status = w2a01, 
         ## school data
         per_st_funding = w2pla15, ## per student funding
         mig_funding = w2pla16, ## migrant student funding
         centgov_fund_pct= w2pla1701, ## central government funding percentage
         prefgov_fund_pct = w2pla1702, ## prefectural government funding percentage
         countgov_fund_pct = w2pla1703, ## county government funding percentage
         stucharge_pct = w2pla1704, ## student charging percentage
         same_charge_std = w2pld0200, ## same charging standard
         mig_subsidy = w2pld0405, ## whether migrant student are covered with subsidy
         ## parent data
         mig_locsch_access = w2bc07, ## can migrant students apply for local schools
         mig_locsch_require = w2bc0800, ## if so, what are the special requirements
         fam_fin = w2be23, ## family financial status-SES indicator
         fam_edu = w2be08, ## family education status-SES indicator
         fam_ocp = w2be09 ## family occupation status-SES indicator
  ) %>%
  mutate(
    # calculate the percentage of chinese, math, and english scores
    # in this way, when comparing the scores of migrant and non-migrant students, the outcome is standardized using percentage rather than raw score.
    w2chnpct = w2chn/w2upchn,
    w2matpct = w2mat/w2upmat,
    w2engpct = w2eng/w2upeng
  ) %>%
  ## select variables of interests
  select(
  ids, clsids, w2clsids, schids, ctyids, mig_status, w2chnpct, w2matpct, w2engpct, 
  per_st_funding, mig_funding, centgov_fund_pct, prefgov_fund_pct, countgov_fund_pct, stucharge_pct, 
  same_charge_std, mig_subsidy, mig_locsch_access, mig_locsch_require, fam_fin, fam_edu, fam_ocp
  )

# investigate the selected data
## examine `mig_status`
summary(w2.selected$mig_status)
tabulate(w2.selected$mig_status)

## examine variables of interests
summary(w2.selected$per_st_funding)
summary(w2.selected$centgov_fund_pct)
summary(w2.selected$prefgov_fund_pct)
summary(w2.selected$countgov_fund_pct)
summary(w2.selected$stucharge_pct)

tabulate(w2.selected$mig_funding)
tabulate(w2.selected$same_charge_std)
tabulate(w2.selected$mig_subsidy)
tabulate(w2.selected$mig_locsch_access)
tabulate(w2.selected$mig_locsch_require)




#### Compute seperated dataframes for migrant and non-migrant students ####
## generate a new dataframe only containing migrant students
w2.mig <- w2.selected %>% filter(mig_status == 2)
summary(w2.mig$w2cog3pl)
summary(w2.mig$w2chnpct)
summary(w2.mig$w2matpct)
summary(w2.mig$w2engpct)

## generate a new dataframe only containing non-migrant students
w2.nonmig <- w2.selected %>% filter(mig_status == 1)
summary(w2.nonmig$w2cog3pl)
summary(w2.nonmig$w2chnpct)
summary(w2.nonmig$w2matpct)
summary(w2.nonmig$w2engpct)

#### Save wrangled data ####
## write_csv( , " ") 
