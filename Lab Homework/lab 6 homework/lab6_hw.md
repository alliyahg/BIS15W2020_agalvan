---
title: "Lab 6 Homework"
author: "Alliyah Galvan"
date: "02/21/2020"
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
```

## Resources
The idea for this assignment came from [Rebecca Barter's](http://www.rebeccabarter.com/blog/2017-11-17-ggplot2_tutorial/) ggplot tutorial so if you get stuck this is a good place to have a look.  

## Gapminder
For this assignment, we are going to use the dataset [gapminder](https://cran.r-project.org/web/packages/gapminder/index.html). Gapminder includes information about economics, population, and life expectancy from countries all over the world. You will need to install it before use. This is the same data that we used for the practice midterm. You may want to load that assignment for reference.  

```r
library("gapminder")
```

## Questions
The questions below are open-ended and have many possible solutions. Your approach should, where appropriate, include numerical summaries and visuals. Be creative; assume you are building an analysis that you would ultimately present to an audience of stakeholders. Feel free to try out different `geoms` if they more clearly present your results.  

**1. Use the function(s) of your choice to get an idea of the overall structure of the data frame, including its dimensions, column names, variable classes, etc. As part of this, determine how NAs are treated in the data.**  

```r
sapply(gapminder,class)
```

```
##   country continent      year   lifeExp       pop gdpPercap 
##  "factor"  "factor" "integer" "numeric" "integer" "numeric"
```

```r
dim(gapminder)
```

```
## [1] 1704    6
```

```r
colnames(gapminder)
```

```
## [1] "country"   "continent" "year"      "lifeExp"   "pop"       "gdpPercap"
```

```r
summary(gapminder)
```

```
##         country        continent        year         lifeExp     
##  Afghanistan:  12   Africa  :624   Min.   :1952   Min.   :23.60  
##  Albania    :  12   Americas:300   1st Qu.:1966   1st Qu.:48.20  
##  Algeria    :  12   Asia    :396   Median :1980   Median :60.71  
##  Angola     :  12   Europe  :360   Mean   :1980   Mean   :59.47  
##  Argentina  :  12   Oceania : 24   3rd Qu.:1993   3rd Qu.:70.85  
##  Australia  :  12                  Max.   :2007   Max.   :82.60  
##  (Other)    :1632                                                
##       pop              gdpPercap       
##  Min.   :6.001e+04   Min.   :   241.2  
##  1st Qu.:2.794e+06   1st Qu.:  1202.1  
##  Median :7.024e+06   Median :  3531.8  
##  Mean   :2.960e+07   Mean   :  7215.3  
##  3rd Qu.:1.959e+07   3rd Qu.:  9325.5  
##  Max.   :1.319e+09   Max.   :113523.1  
## 
```

**2. Among the interesting variables in gapminder is life expectancy. How has global life expectancy changed between 1952 and 2007?**

```r
gapminder %>% 
  filter(year <= 2007 & year >= 1952) %>% 
  group_by(year) %>% 
  summarize(global_lifeExp = sum(lifeExp)) %>% 
  ggplot(aes(x = year, y = global_lifeExp)) +
  geom_line() +
  labs(title = "Global Life Expectancy (1952-2007) ",
       x = "Year",
       y = "Global Life Expectancy")+ 
 theme(plot.title = element_text(size = 18, face = "bold"),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 12))
```

![](lab6_hw_files/figure-html/unnamed-chunk-7-1.png)<!-- -->


**3. How do the distributions of life expectancy compare for the years 1952 and 2007? _Challenge: Can you put both distributions on a single plot?_**

```r
gapminder %>%
  filter(year == "2007" | year == "1952") %>% 
   mutate_at(vars(year), as.factor) %>% 
  ggplot(aes(x=year, y=lifeExp, group=year))+
  geom_boxplot()+
  labs(title="Global Life Expectancy (1952 vs. 2007)",
       x= "Year",
       y="Life Expectancy") +
  theme(plot.title = element_text(size = 18, face = "bold"),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 12))
```

![](lab6_hw_files/figure-html/unnamed-chunk-8-1.png)<!-- -->


**4. Your answer above doesn't tell the whole story since life expectancy varies by region. Make a summary that shows the min, mean, and max life expectancy by continent for all years represented in the data.**

```r
gapminder %>% 
  group_by(continent) %>% 
  summarize(min_lifeExp=min(lifeExp),
            max_lifeExp=max(lifeExp),
            mean_lifeExp=mean(lifeExp)) %>% 
  arrange(continent)
```

```
## # A tibble: 5 x 4
##   continent min_lifeExp max_lifeExp mean_lifeExp
##   <fct>           <dbl>       <dbl>        <dbl>
## 1 Africa           23.6        76.4         48.9
## 2 Americas         37.6        80.7         64.7
## 3 Asia             28.8        82.6         60.1
## 4 Europe           43.6        81.8         71.9
## 5 Oceania          69.1        81.2         74.3
```


**5. How has life expectancy changed between 1952-2007 for each continent? Try using `geom_line()` for this, including all continents on the same  plot.**

```r
gapminder %>% 
  group_by(year, continent) %>% 
  summarize(mean_lifeExp=mean(lifeExp)) %>% 
  ggplot(aes(x=year, y=mean_lifeExp, color=continent))+
  geom_point() +
  geom_line(alpha=.6) +
  labs(title="Global Life Expectancy by Continent",
       x= "Year",
       y="Life Expectancy") +
  theme(plot.title = element_text(size = 18, face = "bold"),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 12))
```

![](lab6_hw_files/figure-html/unnamed-chunk-10-1.png)<!-- -->


**6. We are interested in the relationship between per capita GDP and life expectancy; i.e. does having more money help you live longer?**

```r
gapminder %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()+
  labs(title = "Relationship: GDP per capita & Life Expectancy",
       x = "GDP Per Capita",
       y = "Life Expectancy")+ 
    theme(plot.title = element_text(size = 16, face = "bold"),
        axis.text = element_text(size = 10),
        axis.title = element_text(size = 12))
```

![](lab6_hw_files/figure-html/unnamed-chunk-11-1.png)<!-- -->
**The realtionship is inconclusive because there is no evidence that having more money helps you live longer.**

**7. There is extreme disparity in per capita GDP. Rescale the x axis to make this easier to interpret. How would you characterize the relationship?**

```r
gapminder %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()+
    scale_x_log10() +
  labs(title = "Relationship: GDP per capita & Life Expectancy",
       x = "GDP Per Capita",
       y = "Life Expectancy")+ 
    theme(plot.title = element_text(size = 16, face = "bold"),
        axis.text = element_text(size = 10),
        axis.title = element_text(size = 12))+
  geom_smooth(method=lm, se=T)
```

![](lab6_hw_files/figure-html/unnamed-chunk-12-1.png)<!-- -->
**When rescaling x with a log base of 10, there is a clear pattern that life expectancy does increase at a linear slope with an increased GDP per capita.**

**8. Which countries have had the largest population growth since 1952?**

```r
gapminder %>% 
   filter(year >= 1952) %>% 
  select(Country=country, year, pop) %>%
  group_by(Country) %>% 
  summarize(population_growth = last(pop)-first(pop)) %>% 
  arrange(desc(population_growth))
```

```
## # A tibble: 142 x 2
##    Country       population_growth
##    <fct>                     <int>
##  1 China                 762419569
##  2 India                 738396331
##  3 United States         143586947
##  4 Indonesia             141495000
##  5 Brazil                133408087
##  6 Pakistan              127924057
##  7 Bangladesh            103561480
##  8 Nigeria               101912068
##  9 Mexico                 78556574
## 10 Philippines            68638596
## # <U+2026> with 132 more rows
```
**China has had the largest population growth since 1952.**

**9. Use your results from the question above to plot population growth for the top five countries since 1952.**

```r
gapminder %>% 
  filter(country == "China" | country == "India" | country == "United States" | country == "Indonesia" | country == "Brazil" ) %>% 
  ggplot(aes(x = year, y = pop, color = country)) +
  geom_line()+
  geom_point() +
  labs(title = "Top 5 Countries' Population Growth Since 1952",
       x = "Year",
       y = "Population")+ 
   theme(plot.title = element_text(size = 15, face = "bold"),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 12))
```

![](lab6_hw_files/figure-html/unnamed-chunk-14-1.png)<!-- -->


**10. How does per capita GDP growth compare between these same five countries?**

```r
gapminder %>% 
  filter(country == "China" | country == "India" | country == "United States" | country == "Indonesia" | country == "Brazil" ) %>% 
  ggplot(aes(x = year, y = gdpPercap, color = country)) +
  geom_point() +
  geom_line()+
  labs(title = "Gdp per capita of Top 5 Largest Growing Countries since 1952",
       x = "Year",
       y = "GDP Per Capita")+ 
  theme(plot.title = element_text(size = 11, face = "bold"),
        axis.text = element_text(size = 9),
        axis.title = element_text(size = 9))
```

![](lab6_hw_files/figure-html/unnamed-chunk-15-1.png)<!-- -->
**USA takes the win.**

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 
