#Annie Casey/Datakind - Mobility in Foster Care Project
#
# using the rp_placements_clean.csv available in the dropbox
#to answer the question on child demographics
#
install.packages("dplyr")
install.packages("ggplot2")
#
library(dplyr)
library(ggplot2)
#
rm(list=ls())
setwd("~/analytics/DatakindAC")
#
#import data
placement<-read.csv("rp_placements_clean.csv")
str(placement)

length(unique(placement$CLIENT_ID))
length(unique(placement$HOME_RMVL_KEY))

table(placement$HOME_RMVL_SEQ_NBR)
table(placement$RMVL_PLMT_NO)
table(placement$CLIENT_PLMT_NO)

table(placement$GENDER)
#Male
#Female
#Unknown
prop.table(table(placement$RACE_GROUP))
#African American
#Other Single Race Identified
#Two or More Races Identified
#Unknown
#White

summary(placement$RMVL_AGE)
summary(placement$PLMT_AGE)


#obtaining tables needed
placement2 <- placement[ 
                 ,c("CLIENT_ID",
                   "HOME_RMVL_KEY",
                   "PLCMNT_KEY",
                   "HOME_RMVL_SEQ_NBR",
                   "RMVL_PLMT_NO",
                   "CLIENT_PLMT_NO",
                   "RMVL_DATE",
                   "RTRN_DATE",
                   "ANALYSIS_ENTRY_DT",
                   "ANALYSIS_EXIT_DT",
                   "GENDER",
                   "RACE_GROUP",
                   "BIRTH_YEAR",
                   "RMVL_AGE",
                   "PLMT_AGE"
                   )]
placement2 <- unique(placement2)
dim(placement2)
length(unique(placement2$CLIENT_ID))

#Demographics for first spell first placement for each kid
placement2demo <- placement2[(placement2$CLIENT_PLMT_NO ==1) 
                         ,c("CLIENT_ID",
                             "HOME_RMVL_KEY",
                             "PLCMNT_KEY",
                             "HOME_RMVL_SEQ_NBR",
                             "RMVL_PLMT_NO",
                             "CLIENT_PLMT_NO",
                             "RMVL_DATE",
                             "RTRN_DATE",
                             "ANALYSIS_ENTRY_DT",
                             "ANALYSIS_EXIT_DT",
                             "GENDER",
                             "RACE_GROUP",
                             "BIRTH_YEAR",
                             "RMVL_AGE",
                             "PLMT_AGE"
                     )]
dim(placement2demo)

write.csv(placement2demo,file = "placement2demo.csv", row.names = FALSE)
