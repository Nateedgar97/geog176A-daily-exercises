# Name: Nate Edgar
# Date: 8/11/20
# Purpose: Question 1

#Read In Data:

library(tidyverse)
covid=read_csv('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv')

#Create a New (data.frame) using state.abb,state.name & state.region)

region=data.frame(state=state.name,region=state.region)

covid_region=inner_join(covid,region,by="state")

covid_region=covid %>%
  right_join(region,by="state") %>%
  group_by(region,date) %>%
  summarize (cases=sum(cases),
    deaths=sum(deaths)) %>%
pivot_longer(cols=c('cases','deaths'))

image2= ggplot(covid_region,aes(x=date,y=value))+
  geom_line(aes(col=region))+
  facet_grid(name~region, scale="free")+
  theme_linedraw()+
  theme(legend.position="bottom")+
  theme(legend.position="NA")+
  labs(title="Cummulative Cases and Deaths: Region",
  y="Daily Cumulative Count",
  x="Date",
  caption="Daily Exercise07",
  subtitle="Covid-19 Data:NY-Times")
ggsave(image2,file="img/CummulativeCasesandDeathsRegion.png")



