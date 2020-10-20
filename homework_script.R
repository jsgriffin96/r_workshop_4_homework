library('tidyverse')
#import data
cars <- read_csv("data/fleet-asset-management-system-open-data-2015-2019.csv")

#convert purchase price from char to number
cars['Purchase_Price'] <- parse_number(cars[['Purchase_Price']])

#select columns relevant to our question
agencyVeh.df <- cars %>%
  select(Agency, Report_Year, Acquisition_Method, Purchase_Price, Asset_Type)

#filter to make sure we only have purchased vehicles that also have a price listed
agencyVeh.df <- agencyVeh.df %>% 
  filter(Acquisition_Method=='Purchase') %>%
  filter(Purchase_Price!='Null')

#group by agency and year to get our results
results <- agencyVeh.df %>%
  group_by(Agency, Report_Year) %>% 
  summarise(mean(Purchase_Price))   #find the mean of each purchase price




