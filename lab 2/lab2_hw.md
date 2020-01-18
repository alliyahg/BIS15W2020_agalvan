---
title: "Lab 2 Homework"
author: "Joel Ledford"
date: "Winter 2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to our [GitHub repository](https://github.com/FRS417-DataScienceBiologists). I will randomly select a few examples of student work at the start of each session to use as examples so be sure that your code is working to the best of your ability.

## Load the tidyverse

```r
library("tidyverse")
```

```
## <U+2500><U+2500> Attaching packages <U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500> tidyverse 1.3.0 <U+2500><U+2500>
```

```
## <U+2713> ggplot2 3.2.1     <U+2713> purrr   0.3.3
## <U+2713> tibble  2.1.3     <U+2713> dplyr   0.8.3
## <U+2713> tidyr   1.0.0     <U+2713> stringr 1.4.0
## <U+2713> readr   1.3.1     <U+2713> forcats 0.4.0
```

```
## <U+2500><U+2500> Conflicts <U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500><U+2500> tidyverse_conflicts() <U+2500><U+2500>
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

## Mammals Sleep
For this assignment, we are going to use built-in data on mammal sleep patterns.  

```r
msleep
```

```
## # A tibble: 83 x 11
##    name  genus vore  order conservation sleep_total sleep_rem sleep_cycle awake
##    <chr> <chr> <chr> <chr> <chr>              <dbl>     <dbl>       <dbl> <dbl>
##  1 Chee<U+2026> Acin<U+2026> carni Carn<U+2026> lc                  12.1      NA        NA      11.9
##  2 Owl <U+2026> Aotus omni  Prim<U+2026> <NA>                17         1.8      NA       7  
##  3 Moun<U+2026> Aplo<U+2026> herbi Rode<U+2026> nt                  14.4       2.4      NA       9.6
##  4 Grea<U+2026> Blar<U+2026> omni  Sori<U+2026> lc                  14.9       2.3       0.133   9.1
##  5 Cow   Bos   herbi Arti<U+2026> domesticated         4         0.7       0.667  20  
##  6 Thre<U+2026> Brad<U+2026> herbi Pilo<U+2026> <NA>                14.4       2.2       0.767   9.6
##  7 Nort<U+2026> Call<U+2026> carni Carn<U+2026> vu                   8.7       1.4       0.383  15.3
##  8 Vesp<U+2026> Calo<U+2026> <NA>  Rode<U+2026> <NA>                 7        NA        NA      17  
##  9 Dog   Canis carni Carn<U+2026> domesticated        10.1       2.9       0.333  13.9
## 10 Roe <U+2026> Capr<U+2026> herbi Arti<U+2026> lc                   3        NA        NA      21  
## # <U+2026> with 73 more rows, and 2 more variables: brainwt <dbl>, bodywt <dbl>
```

1. From which publication are these data taken from? Don't do an internet search; show the code that you would use to find out in R.

2. Put these data into a new object `sleep`. Make sure they are organized as a data frame.  


3. Show a list of the column names is this data frame.


4. Use `glimpse()` to summarize the data in `sleep`.


5. Use `summary()` to summarize the data in `sleep`.


6. Print out the first column of the data frame and then print out the first row.


7. We are interested in two groups; small and large mammals. Let's define small as less than or equal to 1kg body weight and large as greater than or equal to 200kg body weight. Make two new dataframes (large and small) based on these parameters.  


8. What is the mean weight for both the large and small mammals?


9. Let's try to figure out if large mammals sleep, on average, longer than small mammals. What is the average sleep duration for large mammals as we have defined them?


10. What is the average sleep duration for small mammals as we have defined them?


11. Which animals are the sleepiest? Which sleep least 18 hours per day?  


## Push your final code to GitHub
