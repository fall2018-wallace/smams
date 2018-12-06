
res <- SurveyData %>% group_by(Age) %>% summarise(Freq=n(), percLessThan3= sum(Satisfaction<3, na.rm = TRUE))
res$perc <- (res$percLessThan3/res$Freq)*100

res_Airline <- SurveyData %>% group_by(Airline_Name) %>% summarise(Freq=n(), percLessThan3= sum(Satisfaction<3, na.rm = TRUE))
res_Airline$perc <- (res_Airline$percLessThan3/res_Airline$Freq)*100


airlineNameFreq = ggplot(res_Airline, aes(x=Airline_Name ,y = Freq, fill=perc))+geom_col()+theme(axis.text.x = element_text(angle = 90, hjust = 1))
airlineNameFreq

ageFreq = ggplot(res, aes(x=Age ,y = Freq, fill=perc))+geom_col()+theme(axis.text.x = element_text(angle = 90, hjust = 1))
ageFreq
