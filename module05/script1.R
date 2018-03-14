library(fivethirtyeight)
library(tidyverse)

data("steak_survey", package="fivethirtyeight")
View(steak_survey)

sdat <- na.omit(steak_survey) %>%
  filter(region=="Mountain")

ggplot(sdat, 
       aes(x = steak_prep, fill = female)) + 
  geom_bar(position="dodge") +
  ggtitle(paste0("Steak Preparation Preference by Gender for ",
                 "Mountain"," Region"))

# ------------------------

barplot(prop.table(table(sdat$age))*100,
        xlab="Ages",ylab="Percentage",
        main="Age of Survey Respondents")

tt <- prop.table(table(sdat$age))*100
ttdf <- as.data.frame(tt)
knitr::kable(ttdf,
             col.names=c("Ages","%"),
             digits=2)

tb <- sdat %>% 
  select(age) %>%
  table() %>%
  prop.table()*100

as.data.frame(tb) %>%
  knitr::kable(col.names=c("Ages","%"),
               digits=2)

tb <- sdat %>% 
  select(educ) %>%
  table() %>%
  prop.table()*100

as.data.frame(tb) %>%
  knitr::kable(col.names=c("Education","%"),
               digits=2)

tb <- sdat %>% 
  select(hhold_income) %>%
  table() %>%
  prop.table()*100

as.data.frame(tb) %>%
  knitr::kable(col.names=c("Income","%"),
               digits=2)

# --------------

tb1 <- sdat %>% 
  select(age) %>%
  table() %>%
  prop.table()*100

tb2 <- sdat %>% 
  select(educ) %>%
  table() %>%
  prop.table()*100

tb3 <- sdat %>% 
  select(hhold_income) %>%
  table() %>%
  prop.table()*100

tb1df <- as.data.frame(tb1) 
tb2df <- as.data.frame(tb2)
tb3df <- as.data.frame(tb3)

mtb <- merge(data.frame(tb1df, row.names = NULL),
             data.frame(tb2df, row.names = NULL),
             by=0, all=TRUE)[-1]

mtb2 <- merge(data.frame(mtb, row.names = NULL),
              data.frame(tb3df, row.names = NULL),
              by=0, all=TRUE)[-1]

options(knitr.kable.NA='')
mtb2%>%
  knitr::kable(col.names=c("Age","%","Education","%",
                           "Income","%"),
               digits=2)



# kable extra options for floating tables
# for HTML only??
library(kableExtra)

kable(dt) %>%
  kable_styling(bootstrap_options = "striped", 
                full_width = F, position = "float_right")

library(knitr)
library(kableExtra)
dt <- mtcars[1:5, 1:4]

# HTML table
kable(dt, format = "html", caption = "Demo Table") %>%
  kable_styling(bootstrap_options = "striped",
                full_width = F) %>%
  add_header_above(c(" ", "Group 1" = 2, "Group 2[note]" = 2)) %>%
  add_footnote(c("table footnote"))






format(Sys.Date(), '%A, %B %d, %Y')

data("airline_safety", package="fivethirtyeight")
View(airline_safety)

data("weather_check", package="fivethirtyeight")
View(weather_check)
names(weather_check)
table(weather_check$weather_source)
table(weather_check$weather_source_site)
summary(weather_check)

mean(is.na(weather_check$weather_source_site))
length(unique(weather_check$weather_source_site))

# -----------------------------

rmarkdown::render("steakArticleParams.Rmd", 
                  params = list(region = "Mountain"))

var1 = "a"
var2 = "b"
sprintf("report %s vs. %s", var2, var1)

# https://stackoverflow.com/questions/41525300/how-to-generate-multiple-files-from-r-script-function-with-knitr




regionvar <- "Mountain"

render_report <- function(regionvar){
  template <- "steakArticleParams.Rmd"
  outfile <- sprintf("steakArticle_%s.html",regionvar)
  parameters <- list(region = regionvar)
  rmarkdown::render(template,
                    output_file=outfile,
                    params=parameters)
  invisible(TRUE)
}

rlist <- list("Pacific")
render_report(rlist)

library(purrr)
params_list <- list(list("East North Central",
                         "East South Central", "Middle Atlantic",
                         "Mountain", "New England", "Pacific",
                         "South Atlantic", "West North Central",
                         "West South Central"))
pmap(params_list,render_report)




  