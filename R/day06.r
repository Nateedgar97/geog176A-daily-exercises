# Name: Nate Edgar
# Date: 8/11/20
# Purpose: Answering Question 1 & 2

library(tidyverse)
covid=read_csv('https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv')

q1=covid %>%
  filter(date==max(date)) %>%
  group_by(state) %>%
  summarize (cases=sum(cases,na.rm= TRUE)) %>%
  ungroup() %>%
  slice_max(cases,n=6) %>%
  pull(state)

img1=covid %>%
  filter(state %in% q1) %>%
  group_by(state,date) %>%
  summarise(cases=sum(cases)) %>%
  ungroup() %>%
  ggplot(aes(x=date,y=cases,color=state))+
  geom_line(size=2)+
  facet_wrap(~state)+
  theme_bw()+
  theme(legend.position='NA')+
  labs(title="Cummulative Case Counts",
       subtitle="Data Source: NY-Times",
       x="Date",
       y="Cases",
       caption= "Daily Exercises 06")

ggsave(img1,file="img/CummulativeCaseCounts.png")


q2=covid %>%
  group_by(date) %>%
  summarize(cases=sum(cases)) %>%
  ggplot(aes(x=date,y=cases))+
  geom_col(fill="darkred", color="darkred", alpha=.25)+
  geom_line(color="darkred", size=3)+
  theme_bw()+
  labs(title="National Cummulative Case Counts",
  x= "Date",
  y= "Cases",
  caption= "Daily Exercise 06")

ggsave(q2,file="img/NationalCummulativeCaseCounts.png")
ggsave(q2,file="img/NationalCummulativeCaseCounts.png")

