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