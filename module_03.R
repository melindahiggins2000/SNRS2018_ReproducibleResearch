# ----------------------------------
# MODULE 03 - R code
# ----------------------------------
# Working with R objects, datasets
# loading R packages

# load R packages
library(fivethirtyeight)
library(tidyverse)
library(knitr)
library(kableExtra)
library(ggthemes)

# load steak_survey dataset
data("steak_survey", package="fivethirtyeight")
View(fivethirtyeight::steak_survey)

# create subset
# pick a specific region
sdat <- steak_survey %>%
  filter(region=="Mountain")

# create table of the age categories
tb <- sdat %>% 
  select(age) %>%
  table() %>%
  prop.table()*100

# use kable from knitr package to make table
# and use kable styling from kableExtra package
# see Viewer window
knitr::kable(as.data.frame(tb),
             format="html",
             col.names=c("Ages","%"),
             digits=2,
             caption="Ages of Survey Respondents") %>%
  kableExtra::kable_styling(bootstrap_options = "striped",
                            full_width=FALSE)

# make barplot - steak preferences by gender

ggplot(sdat, aes(x = steak_prep, fill = female)) + 
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

