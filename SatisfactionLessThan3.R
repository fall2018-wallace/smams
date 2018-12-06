
res <- SurveyData %>% group_by(Age) %>% summarise(Freq=n(), percLessThan3= sum(Satisfaction<3, na.rm = TRUE))
res$perc <- (res$percLessThan3/res$Freq)*100
