# code for steak article

# code chunk

# load R packages
library(fivethirtyeight)
library(tidyverse)
library(knitr)
library(kableExtra)
library(ggthemes)

# load steak_survey dataset
data("steak_survey", package="fivethirtyeight")

# create subset, no missing NAs
# pick a specific region
sdat <- na.omit(steak_survey) %>%
  filter(region=="Mountain")

# code chunk

# create table of the age categories
tb <- sdat %>% 
  select(age) %>%
  table() %>%
  prop.table()*100

# convert table to data frame
dt <- as.data.frame(tb)

# use kable from knitr package to make table
# and use kable styling from kableExtra package
knitr::kable(dt, format="html",
             col.names=c("Ages","%"),
             digits=2,
             caption="Ages of Survey Respondents") %>%
  kableExtra::kable_styling(bootstrap_options = "striped",
                            full_width=FALSE)

# code chunk

# repeat for education
tb <- sdat %>% 
  select(educ) %>%
  table() %>%
  prop.table()*100

dt <- as.data.frame(tb)

knitr::kable(dt, format="html",
             col.names=c("Education","%"),
             digits=2,
             caption="Education of Survey Respondents") %>%
  kableExtra:: kable_styling(bootstrap_options = "striped",
                             full_width=FALSE)

# code chunk

# repeat for household income
tb <- sdat %>% 
  select(hhold_income) %>%
  table() %>%
  prop.table()*100

dt <- as.data.frame(tb)

knitr::kable(dt, format="html",
             col.names=c("Income","%"),
             digits=2,
             caption="Income of Survey Respondents") %>%
  kableExtra:: kable_styling(bootstrap_options = "striped",
                             full_width=FALSE)

# optional

# create table summary for ages
tb1 <- sdat %>% 
  select(age) %>%
  table() %>%
  prop.table()*100

# create table summary for education
tb2 <- sdat %>% 
  select(educ) %>%
  table() %>%
  prop.table()*100

# create table summary for income
tb3 <- sdat %>% 
  select(hhold_income) %>%
  table() %>%
  prop.table()*100

# convert all tables to data frames
tb1df <- as.data.frame(tb1) 
tb2df <- as.data.frame(tb2)
tb3df <- as.data.frame(tb3)

# merge 1st 2 data frames together
mtb <- merge(data.frame(tb1df, row.names = NULL),
             data.frame(tb2df, row.names = NULL),
             by=0, all=TRUE)[-1]

# merge result with 3rd data frame
mtb2 <- merge(data.frame(mtb, row.names = NULL),
              data.frame(tb3df, row.names = NULL),
              by=0, all=TRUE)[-1]

# use the final data frame
# make into a table with kable
# add styling with kableExtra
# add header with labels spanning 2 columns each
mtb2 %>%
  knitr::kable(format="html",
               col.names=c("Category","%",
                           "Category","%",
                           "Category","%"),
               digits=2,
               caption="Demographics of Survey Respondents") %>%
  kableExtra::kable_styling(c("striped","bordered"),
                            full_width=FALSE) %>%
  add_header_above(c("Ages"=2,"Education"=2,"Income"=2))

# add plot

ggplot(sdat, 
       aes(x = steak_prep, fill = female)) + 
  geom_bar(position="dodge",colour="black") +
  ggtitle(paste0("Steak Preference by Gender: ",
                 "Mountain"," Region")) +
  xlab("Steak Preparation Preference") +
  ylab("Number of Respondents") +
  scale_fill_manual(values=c("skyblue","palevioletred"),
                    name="Gender",
                    breaks=c(FALSE,TRUE),
                    labels=c("Male", "Female")) +
  theme_fivethirtyeight() 

