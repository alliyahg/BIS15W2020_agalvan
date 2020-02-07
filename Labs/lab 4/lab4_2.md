---
title: "Tidyr 2: `pivot_wider()`, `summarize()`, and `group_by()`"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
    toc: yes
    toc_float: yes
  pdf_document:
    toc: yes
---

## Learning Goals
*At the end of this exercise, you will be able to:*    
1. Explain the difference between tidy and messy data.  
2. Evaluate a dataset as tidy or untidy.  
3. Use the `pivot_wider()` function of tidyr to transform data from long to wide format.  
4. Use `summarize()` and `group_by()` to produce statistical summaries of data.

## Group Project
Let's take 10 minutes to decide on groups and think about a theme for our projects. What data interest you? Make a plan on doing some internet searches and selecting data that will work for your group. Think about the kinds of questions you might ask.  

## Resources
- [tidyr `pivot_wider()`](https://tidyr.tidyverse.org/reference/pivot_wider.html)  
- [pivoting](https://cran.r-project.org/web/packages/tidyr/vignettes/pivot.html)  

## Review
Last time we learned the fundamentals of tidy data and used the `pivot_longer()` function to wrangle a few types of frequently encountered untidy data. In the second part of today's lab we will use the `pivot_wider()` function to deal with a second type of untidy data.  

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

## `pivot_longer()`
Recall that we use `pivot_longer()` when our column names actually represent variables. A classic example would be that the column names represent observations of a variable.

```r
datasets::USPersonalExpenditure
```

```
##                       1940   1945  1950 1955  1960
## Food and Tobacco    22.200 44.500 59.60 73.2 86.80
## Household Operation 10.500 15.500 29.00 36.5 46.20
## Medical and Health   3.530  5.760  9.71 14.0 21.10
## Personal Care        1.040  1.980  2.45  3.4  5.40
## Private Education    0.341  0.974  1.80  2.6  3.64
```

```r
?USPersonalExpenditure
```

Here we add a new column of expenditure types, which are stored as rownames above, with `mutate()`. The USPersonalExpenditures data also needs to be converted to a data frame before we can use the tidyverse functions, because it comes as a matrix.

```r
expenditures <- 
  USPersonalExpenditure %>% 
  as.data.frame() %>% 
  mutate(expenditure = rownames(USPersonalExpenditure))
expenditures
```

```
##     1940   1945  1950 1955  1960         expenditure
## 1 22.200 44.500 59.60 73.2 86.80    Food and Tobacco
## 2 10.500 15.500 29.00 36.5 46.20 Household Operation
## 3  3.530  5.760  9.71 14.0 21.10  Medical and Health
## 4  1.040  1.980  2.45  3.4  5.40       Personal Care
## 5  0.341  0.974  1.80  2.6  3.64   Private Education
```

## Practice
1. Are these data tidy? Please use `pivot_longer()` to tidy the data. Here we use back ticks on the column names so R does not confuse them with numerical indices.

```r
expenditures2 <- expenditures %>% 
  pivot_longer(-expenditure,
               names_to = "years",
                values_to = "billions of dollars")
expenditures2
```

```
## # A tibble: 25 x 3
##    expenditure         years `billions of dollars`
##    <chr>               <chr>                 <dbl>
##  1 Food and Tobacco    1940                   22.2
##  2 Food and Tobacco    1945                   44.5
##  3 Food and Tobacco    1950                   59.6
##  4 Food and Tobacco    1955                   73.2
##  5 Food and Tobacco    1960                   86.8
##  6 Household Operation 1940                   10.5
##  7 Household Operation 1945                   15.5
##  8 Household Operation 1950                   29  
##  9 Household Operation 1955                   36.5
## 10 Household Operation 1960                   46.2
## # <U+2026> with 15 more rows
```

2. Restrict the data to medical and health expenditures only. Sort in ascending order.

```r
expenditures2 %>% 
  filter (expenditure == "Medical and Health")
```

```
## # A tibble: 5 x 3
##   expenditure        years `billions of dollars`
##   <chr>              <chr>                 <dbl>
## 1 Medical and Health 1940                   3.53
## 2 Medical and Health 1945                   5.76
## 3 Medical and Health 1950                   9.71
## 4 Medical and Health 1955                  14   
## 5 Medical and Health 1960                  21.1
```

## `pivot_wider()`
The opposite of `pivot_longer()`. You use `pivot_wider()` when you have an observation scattered across multiple rows. In the example below, `cases` and `population` represent variable names not observations.  

Rules:  
+ `pivot_wider`(names_from, values_from)  
+ `names_from` - Values in the `names_from` column will become new column names  
+ `values_from` - Cell values will be taken from the `values_from` column  


```r
tb_data <- read_csv("data/tb_data.csv")
```

```
## Parsed with column specification:
## cols(
##   country = col_character(),
##   year = col_double(),
##   key = col_character(),
##   value = col_double()
## )
```

```r
tb_data
```

```
## # A tibble: 12 x 4
##    country      year key             value
##    <chr>       <dbl> <chr>           <dbl>
##  1 Afghanistan  1999 cases             745
##  2 Afghanistan  1999 population   19987071
##  3 Afghanistan  2000 cases            2666
##  4 Afghanistan  2000 population   20595360
##  5 Brazil       1999 cases           37737
##  6 Brazil       1999 population  172006362
##  7 Brazil       2000 cases           80488
##  8 Brazil       2000 population  174504898
##  9 China        1999 cases          212258
## 10 China        1999 population 1272915272
## 11 China        2000 cases          213766
## 12 China        2000 population 1280428583
```

When using `pivot_wider()` we use `names_from` to identify the variables (new column names) and `values_from` to identify the values associated with the new columns.

```r
tb_data %>% 
  pivot_wider(names_from = "key", #the observations under key will become new columns
              values_from = "value")
```

```
## # A tibble: 6 x 4
##   country      year  cases population
##   <chr>       <dbl>  <dbl>      <dbl>
## 1 Afghanistan  1999    745   19987071
## 2 Afghanistan  2000   2666   20595360
## 3 Brazil       1999  37737  172006362
## 4 Brazil       2000  80488  174504898
## 5 China        1999 212258 1272915272
## 6 China        2000 213766 1280428583
```

## Practice
1. Load the `gene_exp.csv` data as a new object `gene_exp`. Are these data tidy? Use `pivot_wider()` to tidy the data.

```r
gene_exp <-  readr::read_csv("data/gene_exp.csv")
```

```
## Parsed with column specification:
## cols(
##   gene_id = col_character(),
##   type = col_character(),
##   L4_values = col_double()
## )
```

```r
gene_exp
```

```
## # A tibble: 6 x 3
##   gene_id type      L4_values
##   <chr>   <chr>         <dbl>
## 1 gene1   treatment      15.6
## 2 gene1   control        19.3
## 3 gene2   treatment      22.2
## 4 gene2   control        16.0
## 5 gene3   treatment      17.7
## 6 gene3   control        26.9
```


```r
wide <- gene_exp %>% 
  pivot_wider(names_from = "type",
              values_from = "L4_values")
wide
```

```
## # A tibble: 3 x 3
##   gene_id treatment control
##   <chr>       <dbl>   <dbl>
## 1 gene1        15.6    19.3
## 2 gene2        22.2    16.0
## 3 gene3        17.7    26.9
```

## `rename()`
The `rename()` function is actually part of *dplyr*, but I put it here because I think of it as part of transforming untidy data. Remember, youcan still rename columns as part of `select()`.

```r
tb_data %>% 
  pivot_wider(names_from = "key",
              values_from = "value") %>% 
  dplyr::rename(
    Country=country,
    Year=year,
    New_Cases=cases,
    Population=population
  )
```

```
## # A tibble: 6 x 4
##   Country      Year New_Cases Population
##   <chr>       <dbl>     <dbl>      <dbl>
## 1 Afghanistan  1999       745   19987071
## 2 Afghanistan  2000      2666   20595360
## 3 Brazil       1999     37737  172006362
## 4 Brazil       2000     80488  174504898
## 5 China        1999    212258 1272915272
## 6 China        2000    213766 1280428583
```

```r
#Name within select
tb_data %>% 
  pivot_wider(names_from = "key",
              values_from = "value") %>% 
  select(Country=country, Pop=population)
```

```
## # A tibble: 6 x 2
##   Country            Pop
##   <chr>            <dbl>
## 1 Afghanistan   19987071
## 2 Afghanistan   20595360
## 3 Brazil       172006362
## 4 Brazil       174504898
## 5 China       1272915272
## 6 China       1280428583
```

## `summarize()`
`summarize()` will produce summary statistics for a given variable in a data frame. For example, in homework 2 you were asked to calculate the mean of the sleep total column for large and small mammals. We did this using a combination of tidyverse and base R commands, which isn't very efficient or clean. We can do better!  

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

From homework 2.

```r
large <- 
  msleep %>% 
  select(name, genus, bodywt, sleep_total) %>% 
  filter(bodywt >= 200) %>% 
  arrange(desc(bodywt))
large
```

```
## # A tibble: 7 x 4
##   name             genus         bodywt sleep_total
##   <chr>            <chr>          <dbl>       <dbl>
## 1 African elephant Loxodonta      6654          3.3
## 2 Asian elephant   Elephas        2547          3.9
## 3 Giraffe          Giraffa         900.         1.9
## 4 Pilot whale      Globicephalus   800          2.7
## 5 Cow              Bos             600          4  
## 6 Horse            Equus           521          2.9
## 7 Brazilian tapir  Tapirus         208.         4.4
```


```r
mean(large$sleep_total)
```

```
## [1] 3.3
```

We can accomplish the same task using the `summarize()` function in the tidyverse and make things cleaner.

```r
msleep %>% 
  filter(bodywt >= 200) %>%
  summarize(mean_sleep_lg = mean(sleep_total))
```

```
## # A tibble: 1 x 1
##   mean_sleep_lg
##           <dbl>
## 1           3.3
```

You can also combine functions to make useful summaries for multiple variables.

```r
msleep %>% 
    filter(bodywt >= 200) %>% 
    summarize(mean_sleep_lg = mean(sleep_total), 
              min_sleep_lg = min(sleep_total),
              max_sleep_lg = max(sleep_total),
              total = n())
```

```
## # A tibble: 1 x 4
##   mean_sleep_lg min_sleep_lg max_sleep_lg total
##           <dbl>        <dbl>        <dbl> <int>
## 1           3.3          1.9          4.4     7
```

`n_distinct()` is a very handy way of cleanly presenting the number of distinct observations. Here we show the number of distinct genera over 200 in body weight.

```r
msleep %>% 
  filter(bodywt >= 200) %>% 
  summarise(n_genera=n_distinct(genus))
```

```
## # A tibble: 1 x 1
##   n_genera
##      <int>
## 1        7
```

There are many other useful summary statistics, depending on your needs: sd(), min(), max(), median(), sum(), n() (returns the length of vector), first() (returns first value in vector), last() (returns last value in vector) and n_distinct() (number of distinct values in vector).

## Practice
1. How many genera are represented in the msleep data frame?

```r
msleep %>% 
  summarise(n_orders=n_distinct(order))
```

```
## # A tibble: 1 x 1
##   n_orders
##      <int>
## 1       19
```

2. What are the min, max, and mean body weight for all of the mammals? Be sure to include the total n.

```r
msleep %>% 
    summarize(mean(bodywt), 
               min(bodywt),
               max(bodywt),
              total = n())
```

```
## # A tibble: 1 x 4
##   `mean(bodywt)` `min(bodywt)` `max(bodywt)` total
##            <dbl>         <dbl>         <dbl> <int>
## 1           166.         0.005          6654    83
```

## `group_by()`
The `summarize()` function is most useful when used in conjunction with `group_by()`. Although producing a summary of body weight for all of the mammals in the dataset is helpful, what if we were interested in body weight by feeding ecology?

```r
names(msleep)
```

```
##  [1] "name"         "genus"        "vore"         "order"        "conservation"
##  [6] "sleep_total"  "sleep_rem"    "sleep_cycle"  "awake"        "brainwt"     
## [11] "bodywt"
```


```r
msleep %>%
  group_by(vore) %>% #we are grouping by feeding ecology
  summarize(min_bodywt = min(bodywt),
            max_bodywt = max(bodywt),
            mean_bodywt = mean(bodywt),
            total=n())
```

```
## # A tibble: 5 x 5
##   vore    min_bodywt max_bodywt mean_bodywt total
##   <chr>        <dbl>      <dbl>       <dbl> <int>
## 1 carni        0.028      800        90.8      19
## 2 herbi        0.022     6654       367.       32
## 3 insecti      0.01        60        12.9       5
## 4 omni         0.005       86.2      12.7      20
## 5 <NA>         0.021        3.6       0.858     7
```

`count()` is an easy way of determining how many observations you have within a column. It effectively acts like a combination of `group_by()` and `n()`.

```r
msleep %>% 
  count(order, sort = T)
```

```
## # A tibble: 19 x 2
##    order               n
##    <chr>           <int>
##  1 Rodentia           22
##  2 Carnivora          12
##  3 Primates           12
##  4 Artiodactyla        6
##  5 Soricomorpha        5
##  6 Cetacea             3
##  7 Hyracoidea          3
##  8 Perissodactyla      3
##  9 Chiroptera          2
## 10 Cingulata           2
## 11 Didelphimorphia     2
## 12 Diprotodontia       2
## 13 Erinaceomorpha      2
## 14 Proboscidea         2
## 15 Afrosoricida        1
## 16 Lagomorpha          1
## 17 Monotremata         1
## 18 Pilosa              1
## 19 Scandentia          1
```

You can also use `count()` across multiple variables.

```r
msleep %>% 
  count(order, vore, sort = TRUE)
```

```
## # A tibble: 32 x 3
##    order          vore        n
##    <chr>          <chr>   <int>
##  1 Rodentia       herbi      16
##  2 Carnivora      carni      12
##  3 Primates       omni       10
##  4 Artiodactyla   herbi       5
##  5 Cetacea        carni       3
##  6 Perissodactyla herbi       3
##  7 Rodentia       <NA>        3
##  8 Soricomorpha   omni        3
##  9 Chiroptera     insecti     2
## 10 Hyracoidea     herbi       2
## # <U+2026> with 22 more rows
```

`add_count()` adds a new column to the dataframe.

```r
msleep %>% 
  select(name:order) %>% 
  add_count(order) %>% 
  top_n(-5) #the bottom 5 
```

```
## Selecting by n
```

```
## # A tibble: 5 x 5
##   name                genus        vore    order            n
##   <chr>               <chr>        <chr>   <chr>        <int>
## 1 Three-toed sloth    Bradypus     herbi   Pilosa           1
## 2 Rabbit              Oryctolagus  herbi   Lagomorpha       1
## 3 Short-nosed echidna Tachyglossus insecti Monotremata      1
## 4 Tenrec              Tenrec       omni    Afrosoricida     1
## 5 Tree shrew          Tupaia       omni    Scandentia       1
```

## Practice
1. Calculate mean brain weight by taxonomic order in the msleep data.

```r
msleep %>%
  group_by(order) %>%
  summarize( mean_brain_wt= mean(brainwt))
```

```
## # A tibble: 19 x 2
##    order           mean_brain_wt
##    <chr>                   <dbl>
##  1 Afrosoricida         0.0026  
##  2 Artiodactyla        NA       
##  3 Carnivora           NA       
##  4 Cetacea             NA       
##  5 Chiroptera           0.000275
##  6 Cingulata            0.0459  
##  7 Didelphimorphia     NA       
##  8 Diprotodontia       NA       
##  9 Erinaceomorpha       0.00295 
## 10 Hyracoidea           0.0152  
## 11 Lagomorpha           0.0121  
## 12 Monotremata          0.025   
## 13 Perissodactyla       0.414   
## 14 Pilosa              NA       
## 15 Primates            NA       
## 16 Proboscidea          5.16    
## 17 Rodentia            NA       
## 18 Scandentia           0.0025  
## 19 Soricomorpha         0.000592
```


```r
msleep %>% 
  filter(order=="Artiodactyla")
```

```
## # A tibble: 6 x 11
##   name  genus vore  order conservation sleep_total sleep_rem sleep_cycle awake
##   <chr> <chr> <chr> <chr> <chr>              <dbl>     <dbl>       <dbl> <dbl>
## 1 Cow   Bos   herbi Arti<U+2026> domesticated         4         0.7       0.667  20  
## 2 Roe <U+2026> Capr<U+2026> herbi Arti<U+2026> lc                   3        NA        NA      21  
## 3 Goat  Capri herbi Arti<U+2026> lc                   5.3       0.6      NA      18.7
## 4 Gira<U+2026> Gira<U+2026> herbi Arti<U+2026> cd                   1.9       0.4      NA      22.1
## 5 Sheep Ovis  herbi Arti<U+2026> domesticated         3.8       0.6      NA      20.2
## 6 Pig   Sus   omni  Arti<U+2026> domesticated         9.1       2.4       0.5    14.9
## # <U+2026> with 2 more variables: brainwt <dbl>, bodywt <dbl>
```

2. What does `NA` mean?
**NA means no value available**

3. Try running the code again, but this time add `na.rm=TRUE`. What is the problem with Cetacea?

```r
msleep %>%
  group_by(order) %>%
  summarize( mean_brain_wt= mean(brainwt, na.rm= TRUE))
```

```
## # A tibble: 19 x 2
##    order           mean_brain_wt
##    <chr>                   <dbl>
##  1 Afrosoricida         0.0026  
##  2 Artiodactyla         0.198   
##  3 Carnivora            0.0986  
##  4 Cetacea            NaN       
##  5 Chiroptera           0.000275
##  6 Cingulata            0.0459  
##  7 Didelphimorphia      0.0063  
##  8 Diprotodontia        0.0114  
##  9 Erinaceomorpha       0.00295 
## 10 Hyracoidea           0.0152  
## 11 Lagomorpha           0.0121  
## 12 Monotremata          0.025   
## 13 Perissodactyla       0.414   
## 14 Pilosa             NaN       
## 15 Primates             0.254   
## 16 Proboscidea          5.16    
## 17 Rodentia             0.00357 
## 18 Scandentia           0.0025  
## 19 Soricomorpha         0.000592
```
**There is no known way to record brain weight of Crustacea because Crustacea do not have brains?**

## That's it, let's take a break!   

-->[Home](https://jmledford3115.github.io/datascibiol/)
