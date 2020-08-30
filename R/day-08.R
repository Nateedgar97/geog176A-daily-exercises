# Name: Nate Edgar
# Date: 8/13/20
# Purpose: Question 1

#Make tidyverse package accessible & read in covid-19 url data from NY Times

library(tidyverse)
covid=read_csv('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv')


#Install "zoo" package

install.packages("zoo")
library(zoo)
?rollmean


#Plot the daily new cases overlaid with a 7-day rolling mean for a state of your choice (cannot be Alabama)

state.of.interest = ("Illinois")

q1=covid %>%
  filter(state == "Illinois") %>%
  group_by(date) %>%
  summarise(cases = sum(cases)) %>%
  mutate(newCases = cases - lag(cases),
         roll7 = rollmean(newCases, 7, fill = NA, align="right")) %>%
  ggplot(aes(x = date)) +
  geom_col(aes(y = newCases), col = NA, fill = "#F5B8B5") +
  geom_line(aes(y = roll7), col = "darkred", size = 1) +
  ggthemes::theme_wsj() +
  labs(title = paste("New Reported cases by day in", "Illinois")) +
  theme(plot.background = element_rect(fill = "white"),
        panel.background = element_rect(fill = "white"),
        plot.title = element_text(size = 14, face = 'bold')) +
  theme(aspect.ratio = .5)


#Save the plot image as a ggsave()

ggsave(q1,file="img/NewReportedCasesByDayInIllinois.png", width = 8)




