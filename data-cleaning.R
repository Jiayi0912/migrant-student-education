#### Investigate CEPS wave 2 data ####


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
