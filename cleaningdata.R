
library(dplyr)
library(ggplot2)
library(kernlab) 
library(arules)

summary(SurveyData)
str(SurveyData)

trimws(SurveyData$Satisfaction, which = c("both"))
trimws(SurveyData$Airline.Status, which = c("both"))
trimws(SurveyData$Airline.Code, which = c("both"))
trimws(SurveyData$Airline.Name, which = c("both"))
trimws(SurveyData$Age, which = c("both"))
trimws(SurveyData$Gender, which = c("both"))
trimws(SurveyData$Price.Sensitivity, which = c("both"))
trimws(SurveyData$Year.of.First.Flight, which = c("both"))
trimws(SurveyData$No.of.Flights.p.a., which = c("both"))
trimws(SurveyData$No..of.other.Loyalty.Cards, which = c("both"))
trimws(SurveyData$X..of.Flight.with.other.Airlines, which = c("both"))
trimws(SurveyData$Type.of.Travel, which = c("both"))
trimws(SurveyData$Shopping.Amount.at.Airport, which = c("both"))
trimws(SurveyData$Eating.and.Drinking.at.Airport, which = c("both"))
trimws(SurveyData$Class, which = c("both"))
trimws(SurveyData$Day.of.Month, which = c("both"))
trimws(SurveyData$Flight.Distance, which = c("both"))
trimws(SurveyData$Flight.date, which = c("both"))
trimws(SurveyData$Flight.cancelled, which = c("both"))
trimws( SurveyData$Flight.time.in.minutes,which = c("both"))
trimws(SurveyData$Orgin.City, which = c("both"))
trimws(SurveyData$Origin.State,which = c("both"))
trimws(SurveyData$Destination.City, which = c("both"))
trimws(SurveyData$Destination.State, which = c("both"))
trimws(SurveyData$Scheduled.Departure.Hour, which = c("both"))
trimws(SurveyData$Arrival.Delay.in.Minutes, which = c("both"))
trimws(SurveyData$Arrival.Delay.greater.5.Mins, which = c("both"))



#Change the column names
colnames(SurveyData)[colnames(SurveyData)=="Airline.Status"] <- "Airline_Status"
colnames(SurveyData)[colnames(SurveyData)=="Price.Sensitivity"] <- "Price_Sensitivity"
colnames(SurveyData)[colnames(SurveyData)=="Year.of.First.Flight"] <- "Year_of_First_Flight"
colnames(SurveyData)[colnames(SurveyData)=="No.of.Flights.p.a."] <- "No_of_Flights_per_annum"
colnames(SurveyData)[colnames(SurveyData)=="X..of.Flight.with.other.Airlines"] <- "Percent_of_Flight_with_other_Airlines"
colnames(SurveyData)[colnames(SurveyData)=="Type.of.Travel"] <- "Type_of_Travel"
colnames(SurveyData)[colnames(SurveyData)=="No..of.other.Loyalty.Cards"] <- "No_of_other_Loyalty_Cards"
colnames(SurveyData)[colnames(SurveyData)=="Shopping.Amount.at.Airport"] <- "Shopping_Amount_at_Airport"
colnames(SurveyData)[colnames(SurveyData)=="Eating.and.Drinking.at.Airport"] <- "Eating_and_Drinking_at_Airport"
colnames(SurveyData)[colnames(SurveyData)=="Day.of.Month"] <- "Day_of_Month"
colnames(SurveyData)[colnames(SurveyData)=="Flight.date"] <- "Flight_date"
colnames(SurveyData)[colnames(SurveyData)=="Airline.Code"] <- "Airline_Code"
colnames(SurveyData)[colnames(SurveyData)=="Airline.Name"] <- "Airline_Name"
colnames(SurveyData)[colnames(SurveyData)=="Origin.City"] <- "Origin_City"
colnames(SurveyData)[colnames(SurveyData)=="Origin.State"] <- "Origin_State"
colnames(SurveyData)[colnames(SurveyData)=="Destination.City"] <- "Destination_City"
colnames(SurveyData)[colnames(SurveyData)=="Destination.State"] <- "Destination_State"
colnames(SurveyData)[colnames(SurveyData)=="Scheduled.Departure.Hour"] <- "Scheduled_Departure_Hour"
colnames(SurveyData)[colnames(SurveyData)=="Departure.Delay.in.Minutes"] <- "Departure_Delay_in_Minutes"
colnames(SurveyData)[colnames(SurveyData)=="Arrival.Delay.in.Minutes"] <- "Arrival_Delay_in_Minutes"
colnames(SurveyData)[colnames(SurveyData)=="Flight.cancelled"] <- "Flight_cancelled"
colnames(SurveyData)[colnames(SurveyData)=="Flight.time.in.minutes"] <- "Flight_time_in_minutes"
colnames(SurveyData)[colnames(SurveyData)=="Flight.Distance"] <- "Flight_Distance"
colnames(SurveyData)[colnames(SurveyData)=="Arrival.Delay.greater.5.Mins"] <- "Arrival_Delay_greater_5_Mins"


#Converting the NAs in the three columns to their mean values
SurveyData$Flight_time_in_minutes[is.na(SurveyData$Flight_time_in_minutes)] <- round(mean(SurveyData$Flight_time_in_minutes, na.rm = TRUE))
SurveyData$Arrival_Delay_in_Minutes[is.na(SurveyData$Arrival_Delay_in_Minutes)] <- round(mean(SurveyData$Arrival_Delay_in_Minutes, na.rm = TRUE))
SurveyData$Departure_Delay_in_Minutes[is.na(SurveyData$Departure_Delay_in_Minutes)] <- round(mean(SurveyData$Departure_Delay_in_Minutes, na.rm = TRUE))
summary(SurveyData)

# Converting the data types to numeric.

convertData <- function(SurveyData){
  for (i in 1:28){
    SurveyData[,i] <- as.numeric(SurveyData[,i])
    
    
  }
  return(SurveyData)
}

#Verify
str(SurveyData)
