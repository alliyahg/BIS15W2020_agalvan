---
title: "Lab 7 Homework"
author: "Alliyah Galvan"
date: "02/28/2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for any included code chunks to run.  

## Libraries

```r
library(tidyverse)
library(shiny)
library(shinydashboard)
```

## Data
The data for this assignment come from the [University of California Information Center](https://www.universityofcalifornia.edu/infocenter). Admissions data were collected for the years 2010-2019 for each UC campus. Admissions are broken down into three categories: applications, admits, and enrollees. The number of individuals in each category are presented by demographic.  

```r
UC_admit <- readr::read_csv("data lab 7/UC_admit.csv")
```

```
## Parsed with column specification:
## cols(
##   Campus = col_character(),
##   Academic_Yr = col_double(),
##   Category = col_character(),
##   Ethnicity = col_character(),
##   `Perc FR` = col_character(),
##   FilteredCountFR = col_double()
## )
```

```r
UC_admit %>% 
  mutate_at(vars(Academic_Yr), as.factor) %>% 
    mutate_at(vars(Ethnicity), as.factor)
```

```
## # A tibble: 2,160 x 6
##    Campus Academic_Yr Category   Ethnicity        `Perc FR` FilteredCountFR
##    <chr>  <fct>       <chr>      <fct>            <chr>               <dbl>
##  1 Davis  2019        Applicants International    21.16%              16522
##  2 Davis  2019        Applicants Unknown          2.51%                1959
##  3 Davis  2019        Applicants White            18.39%              14360
##  4 Davis  2019        Applicants Asian            30.76%              24024
##  5 Davis  2019        Applicants Chicano/Latino   22.44%              17526
##  6 Davis  2019        Applicants American Indian  0.35%                 277
##  7 Davis  2019        Applicants African American 4.39%                3425
##  8 Davis  2019        Applicants All              100.00%             78093
##  9 Davis  2018        Applicants International    19.87%              15507
## 10 Davis  2018        Applicants Unknown          2.83%                2208
## # <U+2026> with 2,150 more rows
```

**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc. As part of this, determine if there are NA's and how they are treated.**  

```r
glimpse(UC_admit)
```

```
## Observations: 2,160
## Variables: 6
## $ Campus          <chr> "Davis", "Davis", "Davis", "Davis", "Davis", "Davis",<U+2026>
## $ Academic_Yr     <dbl> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2018,<U+2026>
## $ Category        <chr> "Applicants", "Applicants", "Applicants", "Applicants<U+2026>
## $ Ethnicity       <chr> "International", "Unknown", "White", "Asian", "Chican<U+2026>
## $ `Perc FR`       <chr> "21.16%", "2.51%", "18.39%", "30.76%", "22.44%", "0.3<U+2026>
## $ FilteredCountFR <dbl> 16522, 1959, 14360, 24024, 17526, 277, 3425, 78093, 1<U+2026>
```


```r
dim(UC_admit)
```

```
## [1] 2160    6
```


```r
colnames(UC_admit)
```

```
## [1] "Campus"          "Academic_Yr"     "Category"        "Ethnicity"      
## [5] "Perc FR"         "FilteredCountFR"
```


```r
summary(UC_admit)
```

```
##     Campus           Academic_Yr     Category          Ethnicity        
##  Length:2160        Min.   :2010   Length:2160        Length:2160       
##  Class :character   1st Qu.:2012   Class :character   Class :character  
##  Mode  :character   Median :2014   Mode  :character   Mode  :character  
##                     Mean   :2014                                        
##                     3rd Qu.:2017                                        
##                     Max.   :2019                                        
##                                                                         
##    Perc FR          FilteredCountFR   
##  Length:2160        Min.   :     1.0  
##  Class :character   1st Qu.:   447.5  
##  Mode  :character   Median :  1837.0  
##                     Mean   :  7142.6  
##                     3rd Qu.:  6899.5  
##                     Max.   :113755.0  
##                     NA's   :1
```

**2. The president of UC has asked you to build a shiny app that shows admissions by ethnicity across all UC campuses. Your app should allow users to explore year, campus, and admit category as interactive variables. Use shiny dashboard and try to incorporate the aesthetics you have learned in ggplot to 


```r
ui <- dashboardPage(
  dashboardHeader(title = "Ethnicities Data App"),
  dashboardSidebar("UC System"),
  dashboardBody(
    radioButtons("x", "Select Choice", choices = c("Academic_Yr", "Campus", "Category"), 
              selected = "Category"),
    plotOutput("plot", width = "800px", height = "600px")
    ))

server <- function(input, output, session) { 
  output$plot <- renderPlot({
    ggplot(UC_admit, aes_string(x = "Ethnicity", y="FilteredCountFR", fill=input$x)) +
    geom_col(position = "dodge") + theme_light(base_size = 18)+ coord_flip()+
labs(x = "Ethnicity",
       y = "Filtered Count FR") 
  })
  
  session$onSessionEnded(stopApp)
}

shinyApp(ui, server)
```

<!--html_preserve--><div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div><!--/html_preserve-->


**3. Make alternate version of your app above by tracking enrollment at a campus over all of the represented years while allowing users to interact with campus, category, and ethnicity.**


```r
ui <- dashboardPage(
  dashboardHeader(title = "Ethnicity Data App"),
  dashboardSidebar("UC System"),
  dashboardBody(
  selectInput("x", "Select Fill", choices = c("Campus", "Category", "Ethnicity"), 
              selected = "Ethnicity"), 
  plotOutput("plot", width = "600px", height = "400px"))
)
  
server <- function(input, output, session) { 
  output$plot <- renderPlot({
    UC_admit %>% 
    filter(Ethnicity != "All") %>% 
      ggplot(aes_string(x = "Academic_Yr", y = "FilteredCountFR", fill = input$x))+ theme(axis.text.x = element_text(angle = 60, hjust = 1))+ geom_bar(stat = "identity") + labs(x = "Academic Year",
       y = "Filtered Count FR") 
  
})
  session$onSessionEnded(stopApp)

  }

shinyApp(ui, server)
```

<!--html_preserve--><div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div><!--/html_preserve-->

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
