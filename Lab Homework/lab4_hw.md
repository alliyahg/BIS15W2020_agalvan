---
title: "Lab 4 Homework"
author: "Alliyah Galvan"
date: "02/07/2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove any `#` for included code chunks to run.  

## Load the tidyverse

```r
library(tidyverse)
```

For this assignment we are going to work with a large dataset from the [United Nations Food and Agriculture Organization](http://www.fao.org/about/en/) on world fisheries. First, load the data.  

1. Load the data `FAO_1950to2012_111914.csv` as a new object titled `fisheries`.

```r
fisheries <- readr::read_csv("data lab 4/FAO_1950to2012_111914.csv")
```

```
## Parsed with column specification:
## cols(
##   .default = col_character(),
##   `ISSCAAP group#` = col_double(),
##   `FAO major fishing area` = col_double()
## )
```

```
## See spec(...) for full column specifications.
```

```r
fisheries
```

```
## # A tibble: 17,692 x 71
##    Country `Common name` `ISSCAAP group#` `ISSCAAP taxono<U+2026> `ASFIS species#`
##    <chr>   <chr>                    <dbl> <chr>            <chr>           
##  1 Albania Angelsharks,<U+2026>               38 Sharks, rays, c<U+2026> 10903XXXXX      
##  2 Albania Atlantic bon<U+2026>               36 Tunas, bonitos,<U+2026> 1750100101      
##  3 Albania Barracudas n<U+2026>               37 Miscellaneous p<U+2026> 17710001XX      
##  4 Albania Blue and red<U+2026>               45 Shrimps, prawns  2280203101      
##  5 Albania Blue whiting<U+2026>               32 Cods, hakes, ha<U+2026> 1480403301      
##  6 Albania Bluefish                    37 Miscellaneous p<U+2026> 1702021301      
##  7 Albania Bogue                       33 Miscellaneous c<U+2026> 1703926101      
##  8 Albania Caramote pra<U+2026>               45 Shrimps, prawns  2280100117      
##  9 Albania Catsharks, n<U+2026>               38 Sharks, rays, c<U+2026> 10801003XX      
## 10 Albania Common cuttl<U+2026>               57 Squids, cuttlef<U+2026> 3210200202      
## # <U+2026> with 17,682 more rows, and 66 more variables: `ASFIS species name` <chr>,
## #   `FAO major fishing area` <dbl>, Measure <chr>, `1950` <chr>, `1951` <chr>,
## #   `1952` <chr>, `1953` <chr>, `1954` <chr>, `1955` <chr>, `1956` <chr>,
## #   `1957` <chr>, `1958` <chr>, `1959` <chr>, `1960` <chr>, `1961` <chr>,
## #   `1962` <chr>, `1963` <chr>, `1964` <chr>, `1965` <chr>, `1966` <chr>,
## #   `1967` <chr>, `1968` <chr>, `1969` <chr>, `1970` <chr>, `1971` <chr>,
## #   `1972` <chr>, `1973` <chr>, `1974` <chr>, `1975` <chr>, `1976` <chr>,
## #   `1977` <chr>, `1978` <chr>, `1979` <chr>, `1980` <chr>, `1981` <chr>,
## #   `1982` <chr>, `1983` <chr>, `1984` <chr>, `1985` <chr>, `1986` <chr>,
## #   `1987` <chr>, `1988` <chr>, `1989` <chr>, `1990` <chr>, `1991` <chr>,
## #   `1992` <chr>, `1993` <chr>, `1994` <chr>, `1995` <chr>, `1996` <chr>,
## #   `1997` <chr>, `1998` <chr>, `1999` <chr>, `2000` <chr>, `2001` <chr>,
## #   `2002` <chr>, `2003` <chr>, `2004` <chr>, `2005` <chr>, `2006` <chr>,
## #   `2007` <chr>, `2008` <chr>, `2009` <chr>, `2010` <chr>, `2011` <chr>,
## #   `2012` <chr>
```


2. What are the names of the columns? Do you see any potential problems with the column names?

```r
colnames(fisheries)
```

```
##  [1] "Country"                 "Common name"            
##  [3] "ISSCAAP group#"          "ISSCAAP taxonomic group"
##  [5] "ASFIS species#"          "ASFIS species name"     
##  [7] "FAO major fishing area"  "Measure"                
##  [9] "1950"                    "1951"                   
## [11] "1952"                    "1953"                   
## [13] "1954"                    "1955"                   
## [15] "1956"                    "1957"                   
## [17] "1958"                    "1959"                   
## [19] "1960"                    "1961"                   
## [21] "1962"                    "1963"                   
## [23] "1964"                    "1965"                   
## [25] "1966"                    "1967"                   
## [27] "1968"                    "1969"                   
## [29] "1970"                    "1971"                   
## [31] "1972"                    "1973"                   
## [33] "1974"                    "1975"                   
## [35] "1976"                    "1977"                   
## [37] "1978"                    "1979"                   
## [39] "1980"                    "1981"                   
## [41] "1982"                    "1983"                   
## [43] "1984"                    "1985"                   
## [45] "1986"                    "1987"                   
## [47] "1988"                    "1989"                   
## [49] "1990"                    "1991"                   
## [51] "1992"                    "1993"                   
## [53] "1994"                    "1995"                   
## [55] "1996"                    "1997"                   
## [57] "1998"                    "1999"                   
## [59] "2000"                    "2001"                   
## [61] "2002"                    "2003"                   
## [63] "2004"                    "2005"                   
## [65] "2006"                    "2007"                   
## [67] "2008"                    "2009"                   
## [69] "2010"                    "2011"                   
## [71] "2012"
```
**Yes I see an error with the column names because the years should be part of the data set and used as variables**

3. What is the structure of the data? Show the classes of each variable.

```r
str(fisheries)
```

```
## Classes 'spec_tbl_df', 'tbl_df', 'tbl' and 'data.frame':	17692 obs. of  71 variables:
##  $ Country                : chr  "Albania" "Albania" "Albania" "Albania" ...
##  $ Common name            : chr  "Angelsharks, sand devils nei" "Atlantic bonito" "Barracudas nei" "Blue and red shrimp" ...
##  $ ISSCAAP group#         : num  38 36 37 45 32 37 33 45 38 57 ...
##  $ ISSCAAP taxonomic group: chr  "Sharks, rays, chimaeras" "Tunas, bonitos, billfishes" "Miscellaneous pelagic fishes" "Shrimps, prawns" ...
##  $ ASFIS species#         : chr  "10903XXXXX" "1750100101" "17710001XX" "2280203101" ...
##  $ ASFIS species name     : chr  "Squatinidae" "Sarda sarda" "Sphyraena spp" "Aristeus antennatus" ...
##  $ FAO major fishing area : num  37 37 37 37 37 37 37 37 37 37 ...
##  $ Measure                : chr  "Quantity (tonnes)" "Quantity (tonnes)" "Quantity (tonnes)" "Quantity (tonnes)" ...
##  $ 1950                   : chr  NA NA NA NA ...
##  $ 1951                   : chr  NA NA NA NA ...
##  $ 1952                   : chr  NA NA NA NA ...
##  $ 1953                   : chr  NA NA NA NA ...
##  $ 1954                   : chr  NA NA NA NA ...
##  $ 1955                   : chr  NA NA NA NA ...
##  $ 1956                   : chr  NA NA NA NA ...
##  $ 1957                   : chr  NA NA NA NA ...
##  $ 1958                   : chr  NA NA NA NA ...
##  $ 1959                   : chr  NA NA NA NA ...
##  $ 1960                   : chr  NA NA NA NA ...
##  $ 1961                   : chr  NA NA NA NA ...
##  $ 1962                   : chr  NA NA NA NA ...
##  $ 1963                   : chr  NA NA NA NA ...
##  $ 1964                   : chr  NA NA NA NA ...
##  $ 1965                   : chr  NA NA NA NA ...
##  $ 1966                   : chr  NA NA NA NA ...
##  $ 1967                   : chr  NA NA NA NA ...
##  $ 1968                   : chr  NA NA NA NA ...
##  $ 1969                   : chr  NA NA NA NA ...
##  $ 1970                   : chr  NA NA NA NA ...
##  $ 1971                   : chr  NA NA NA NA ...
##  $ 1972                   : chr  NA NA NA NA ...
##  $ 1973                   : chr  NA NA NA NA ...
##  $ 1974                   : chr  NA NA NA NA ...
##  $ 1975                   : chr  NA NA NA NA ...
##  $ 1976                   : chr  NA NA NA NA ...
##  $ 1977                   : chr  NA NA NA NA ...
##  $ 1978                   : chr  NA NA NA NA ...
##  $ 1979                   : chr  NA NA NA NA ...
##  $ 1980                   : chr  NA NA NA NA ...
##  $ 1981                   : chr  NA NA NA NA ...
##  $ 1982                   : chr  NA NA NA NA ...
##  $ 1983                   : chr  NA NA NA NA ...
##  $ 1984                   : chr  NA NA NA NA ...
##  $ 1985                   : chr  NA NA NA NA ...
##  $ 1986                   : chr  NA NA NA NA ...
##  $ 1987                   : chr  NA NA NA NA ...
##  $ 1988                   : chr  NA NA NA NA ...
##  $ 1989                   : chr  NA NA NA NA ...
##  $ 1990                   : chr  NA NA NA NA ...
##  $ 1991                   : chr  NA NA NA NA ...
##  $ 1992                   : chr  NA NA NA NA ...
##  $ 1993                   : chr  NA NA NA NA ...
##  $ 1994                   : chr  NA NA NA NA ...
##  $ 1995                   : chr  "0 0" "1" NA "0 0" ...
##  $ 1996                   : chr  "53" "2" NA "3" ...
##  $ 1997                   : chr  "20" "0 0" NA "0 0" ...
##  $ 1998                   : chr  "31" "12" NA NA ...
##  $ 1999                   : chr  "30" "30" NA NA ...
##  $ 2000                   : chr  "30" "25" "2" NA ...
##  $ 2001                   : chr  "16" "30" NA NA ...
##  $ 2002                   : chr  "79" "24" NA "34" ...
##  $ 2003                   : chr  "1" "4" NA "22" ...
##  $ 2004                   : chr  "4" "2" "2" "15" ...
##  $ 2005                   : chr  "68" "23" "4" "12" ...
##  $ 2006                   : chr  "55" "30" "7" "18" ...
##  $ 2007                   : chr  "12" "19" NA NA ...
##  $ 2008                   : chr  "23" "27" NA NA ...
##  $ 2009                   : chr  "14" "21" NA NA ...
##  $ 2010                   : chr  "78" "23" "7" NA ...
##  $ 2011                   : chr  "12" "12" NA NA ...
##  $ 2012                   : chr  "5" "5" NA NA ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   Country = col_character(),
##   ..   `Common name` = col_character(),
##   ..   `ISSCAAP group#` = col_double(),
##   ..   `ISSCAAP taxonomic group` = col_character(),
##   ..   `ASFIS species#` = col_character(),
##   ..   `ASFIS species name` = col_character(),
##   ..   `FAO major fishing area` = col_double(),
##   ..   Measure = col_character(),
##   ..   `1950` = col_character(),
##   ..   `1951` = col_character(),
##   ..   `1952` = col_character(),
##   ..   `1953` = col_character(),
##   ..   `1954` = col_character(),
##   ..   `1955` = col_character(),
##   ..   `1956` = col_character(),
##   ..   `1957` = col_character(),
##   ..   `1958` = col_character(),
##   ..   `1959` = col_character(),
##   ..   `1960` = col_character(),
##   ..   `1961` = col_character(),
##   ..   `1962` = col_character(),
##   ..   `1963` = col_character(),
##   ..   `1964` = col_character(),
##   ..   `1965` = col_character(),
##   ..   `1966` = col_character(),
##   ..   `1967` = col_character(),
##   ..   `1968` = col_character(),
##   ..   `1969` = col_character(),
##   ..   `1970` = col_character(),
##   ..   `1971` = col_character(),
##   ..   `1972` = col_character(),
##   ..   `1973` = col_character(),
##   ..   `1974` = col_character(),
##   ..   `1975` = col_character(),
##   ..   `1976` = col_character(),
##   ..   `1977` = col_character(),
##   ..   `1978` = col_character(),
##   ..   `1979` = col_character(),
##   ..   `1980` = col_character(),
##   ..   `1981` = col_character(),
##   ..   `1982` = col_character(),
##   ..   `1983` = col_character(),
##   ..   `1984` = col_character(),
##   ..   `1985` = col_character(),
##   ..   `1986` = col_character(),
##   ..   `1987` = col_character(),
##   ..   `1988` = col_character(),
##   ..   `1989` = col_character(),
##   ..   `1990` = col_character(),
##   ..   `1991` = col_character(),
##   ..   `1992` = col_character(),
##   ..   `1993` = col_character(),
##   ..   `1994` = col_character(),
##   ..   `1995` = col_character(),
##   ..   `1996` = col_character(),
##   ..   `1997` = col_character(),
##   ..   `1998` = col_character(),
##   ..   `1999` = col_character(),
##   ..   `2000` = col_character(),
##   ..   `2001` = col_character(),
##   ..   `2002` = col_character(),
##   ..   `2003` = col_character(),
##   ..   `2004` = col_character(),
##   ..   `2005` = col_character(),
##   ..   `2006` = col_character(),
##   ..   `2007` = col_character(),
##   ..   `2008` = col_character(),
##   ..   `2009` = col_character(),
##   ..   `2010` = col_character(),
##   ..   `2011` = col_character(),
##   ..   `2012` = col_character()
##   .. )
```


```r
lapply(fisheries, class)
```

```
## $Country
## [1] "character"
## 
## $`Common name`
## [1] "character"
## 
## $`ISSCAAP group#`
## [1] "numeric"
## 
## $`ISSCAAP taxonomic group`
## [1] "character"
## 
## $`ASFIS species#`
## [1] "character"
## 
## $`ASFIS species name`
## [1] "character"
## 
## $`FAO major fishing area`
## [1] "numeric"
## 
## $Measure
## [1] "character"
## 
## $`1950`
## [1] "character"
## 
## $`1951`
## [1] "character"
## 
## $`1952`
## [1] "character"
## 
## $`1953`
## [1] "character"
## 
## $`1954`
## [1] "character"
## 
## $`1955`
## [1] "character"
## 
## $`1956`
## [1] "character"
## 
## $`1957`
## [1] "character"
## 
## $`1958`
## [1] "character"
## 
## $`1959`
## [1] "character"
## 
## $`1960`
## [1] "character"
## 
## $`1961`
## [1] "character"
## 
## $`1962`
## [1] "character"
## 
## $`1963`
## [1] "character"
## 
## $`1964`
## [1] "character"
## 
## $`1965`
## [1] "character"
## 
## $`1966`
## [1] "character"
## 
## $`1967`
## [1] "character"
## 
## $`1968`
## [1] "character"
## 
## $`1969`
## [1] "character"
## 
## $`1970`
## [1] "character"
## 
## $`1971`
## [1] "character"
## 
## $`1972`
## [1] "character"
## 
## $`1973`
## [1] "character"
## 
## $`1974`
## [1] "character"
## 
## $`1975`
## [1] "character"
## 
## $`1976`
## [1] "character"
## 
## $`1977`
## [1] "character"
## 
## $`1978`
## [1] "character"
## 
## $`1979`
## [1] "character"
## 
## $`1980`
## [1] "character"
## 
## $`1981`
## [1] "character"
## 
## $`1982`
## [1] "character"
## 
## $`1983`
## [1] "character"
## 
## $`1984`
## [1] "character"
## 
## $`1985`
## [1] "character"
## 
## $`1986`
## [1] "character"
## 
## $`1987`
## [1] "character"
## 
## $`1988`
## [1] "character"
## 
## $`1989`
## [1] "character"
## 
## $`1990`
## [1] "character"
## 
## $`1991`
## [1] "character"
## 
## $`1992`
## [1] "character"
## 
## $`1993`
## [1] "character"
## 
## $`1994`
## [1] "character"
## 
## $`1995`
## [1] "character"
## 
## $`1996`
## [1] "character"
## 
## $`1997`
## [1] "character"
## 
## $`1998`
## [1] "character"
## 
## $`1999`
## [1] "character"
## 
## $`2000`
## [1] "character"
## 
## $`2001`
## [1] "character"
## 
## $`2002`
## [1] "character"
## 
## $`2003`
## [1] "character"
## 
## $`2004`
## [1] "character"
## 
## $`2005`
## [1] "character"
## 
## $`2006`
## [1] "character"
## 
## $`2007`
## [1] "character"
## 
## $`2008`
## [1] "character"
## 
## $`2009`
## [1] "character"
## 
## $`2010`
## [1] "character"
## 
## $`2011`
## [1] "character"
## 
## $`2012`
## [1] "character"
```

4. Think about the classes. Will any present problems? Make any changes you think are necessary below.



```r
real_titles <- c(1:8)
fisheries[,real_titles] <- lapply(fisheries[,real_titles], as.factor)
lapply(fisheries, class)
```

```
## $Country
## [1] "factor"
## 
## $`Common name`
## [1] "factor"
## 
## $`ISSCAAP group#`
## [1] "factor"
## 
## $`ISSCAAP taxonomic group`
## [1] "factor"
## 
## $`ASFIS species#`
## [1] "factor"
## 
## $`ASFIS species name`
## [1] "factor"
## 
## $`FAO major fishing area`
## [1] "factor"
## 
## $Measure
## [1] "factor"
## 
## $`1950`
## [1] "character"
## 
## $`1951`
## [1] "character"
## 
## $`1952`
## [1] "character"
## 
## $`1953`
## [1] "character"
## 
## $`1954`
## [1] "character"
## 
## $`1955`
## [1] "character"
## 
## $`1956`
## [1] "character"
## 
## $`1957`
## [1] "character"
## 
## $`1958`
## [1] "character"
## 
## $`1959`
## [1] "character"
## 
## $`1960`
## [1] "character"
## 
## $`1961`
## [1] "character"
## 
## $`1962`
## [1] "character"
## 
## $`1963`
## [1] "character"
## 
## $`1964`
## [1] "character"
## 
## $`1965`
## [1] "character"
## 
## $`1966`
## [1] "character"
## 
## $`1967`
## [1] "character"
## 
## $`1968`
## [1] "character"
## 
## $`1969`
## [1] "character"
## 
## $`1970`
## [1] "character"
## 
## $`1971`
## [1] "character"
## 
## $`1972`
## [1] "character"
## 
## $`1973`
## [1] "character"
## 
## $`1974`
## [1] "character"
## 
## $`1975`
## [1] "character"
## 
## $`1976`
## [1] "character"
## 
## $`1977`
## [1] "character"
## 
## $`1978`
## [1] "character"
## 
## $`1979`
## [1] "character"
## 
## $`1980`
## [1] "character"
## 
## $`1981`
## [1] "character"
## 
## $`1982`
## [1] "character"
## 
## $`1983`
## [1] "character"
## 
## $`1984`
## [1] "character"
## 
## $`1985`
## [1] "character"
## 
## $`1986`
## [1] "character"
## 
## $`1987`
## [1] "character"
## 
## $`1988`
## [1] "character"
## 
## $`1989`
## [1] "character"
## 
## $`1990`
## [1] "character"
## 
## $`1991`
## [1] "character"
## 
## $`1992`
## [1] "character"
## 
## $`1993`
## [1] "character"
## 
## $`1994`
## [1] "character"
## 
## $`1995`
## [1] "character"
## 
## $`1996`
## [1] "character"
## 
## $`1997`
## [1] "character"
## 
## $`1998`
## [1] "character"
## 
## $`1999`
## [1] "character"
## 
## $`2000`
## [1] "character"
## 
## $`2001`
## [1] "character"
## 
## $`2002`
## [1] "character"
## 
## $`2003`
## [1] "character"
## 
## $`2004`
## [1] "character"
## 
## $`2005`
## [1] "character"
## 
## $`2006`
## [1] "character"
## 
## $`2007`
## [1] "character"
## 
## $`2008`
## [1] "character"
## 
## $`2009`
## [1] "character"
## 
## $`2010`
## [1] "character"
## 
## $`2011`
## [1] "character"
## 
## $`2012`
## [1] "character"
```

**Yes, character classes will cause problems**

5. How many countries are represented in the data? Provide a count.



6. What are the names of the countries?


7. Use `rename()` to rename the columns and make them easier to use. The new column names should be:  
+ country
+ commname
+ ASFIS_sciname
+ ASFIS_spcode
+ ISSCAAP_spgroup
+ ISSCAAP_spgroupname
+ FAO_area
+ unit

8. Are these data tidy? Why or why not, and, how do you know? Use the appropriate pivot function to tidy the data. Remove the NA's. Put the tidy data frame into a new object `fisheries_tidy`.  


9. Refocus the data only to include country, ISSCAAP_spgroupname, ASFIS_spcode, ASFIS_sciname, year, and catch.


10. Re-check the classes of `fisheries_tidy2`. Notice that "catch" is shown as a character! This is a problem because we will want to treat it as a numeric. How will you deal with this?


11. Based on the ASFIS_spcode, how many distinct taxa were caught as part of these data?


12. Which country had the largest overall catch in the year 2000?


13. Which country caught the most sardines (_Sardina_) between the years 1990-2000?


14. Which five countries caught the most cephalopods between 2008-2012?


15. Given the top five countries from question 12 above, which species was the highest catch total? The lowest?


16. In some cases, the taxonomy of the fish being caught is unclear. Make a new data frame called `coastal_fish` that shows the taxonomic composition of "Miscellaneous coastal fishes" within the ISSCAAP_spgroupname column.


17. Use the data to do at least one exploratory analysis of your choice. What can you learn?

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.
