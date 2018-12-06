
res_Airline <- SurveyData %>% group_by(Airline_Name) %>% summarise(Freq=n(), percLessThan3= sum(Satisfaction<3, na.rm = TRUE))
res_Airline$perc <- (res_Airline$percLessThan3/res_Airline$Freq)*100
