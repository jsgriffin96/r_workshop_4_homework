library('tidyverse')
#import data from website
cars <- read_csv("https://data.ca.gov/dataset/1b31c08e-b1a7-4459-8aef-41cfff61fc5e/resource/5c42e9f6-e172-4db4-9a51-ca1256b03a26/download/fleet-asset-management-system-open-data-2015-2019.csv")

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




