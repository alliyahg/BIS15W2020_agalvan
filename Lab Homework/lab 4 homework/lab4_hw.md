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
sapply(fisheries, class)
```

```
##                 Country             Common name          ISSCAAP group# 
##             "character"             "character"               "numeric" 
## ISSCAAP taxonomic group          ASFIS species#      ASFIS species name 
##             "character"             "character"             "character" 
##  FAO major fishing area                 Measure                    1950 
##               "numeric"             "character"             "character" 
##                    1951                    1952                    1953 
##             "character"             "character"             "character" 
##                    1954                    1955                    1956 
##             "character"             "character"             "character" 
##                    1957                    1958                    1959 
##             "character"             "character"             "character" 
##                    1960                    1961                    1962 
##             "character"             "character"             "character" 
##                    1963                    1964                    1965 
##             "character"             "character"             "character" 
##                    1966                    1967                    1968 
##             "character"             "character"             "character" 
##                    1969                    1970                    1971 
##             "character"             "character"             "character" 
##                    1972                    1973                    1974 
##             "character"             "character"             "character" 
##                    1975                    1976                    1977 
##             "character"             "character"             "character" 
##                    1978                    1979                    1980 
##             "character"             "character"             "character" 
##                    1981                    1982                    1983 
##             "character"             "character"             "character" 
##                    1984                    1985                    1986 
##             "character"             "character"             "character" 
##                    1987                    1988                    1989 
##             "character"             "character"             "character" 
##                    1990                    1991                    1992 
##             "character"             "character"             "character" 
##                    1993                    1994                    1995 
##             "character"             "character"             "character" 
##                    1996                    1997                    1998 
##             "character"             "character"             "character" 
##                    1999                    2000                    2001 
##             "character"             "character"             "character" 
##                    2002                    2003                    2004 
##             "character"             "character"             "character" 
##                    2005                    2006                    2007 
##             "character"             "character"             "character" 
##                    2008                    2009                    2010 
##             "character"             "character"             "character" 
##                    2011                    2012 
##             "character"             "character"
```

4. Think about the classes. Will any present problems? Make any changes you think are necessary below.


```r
real_titles<- c(1,2,4:6,8)
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
## [1] "numeric"
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
## [1] "numeric"
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


```r
nlevels(fisheries$Country)
```

```
## [1] 204
```


6. What are the names of the countries?

```r
levels(fisheries$Country)
```

```
##   [1] "Albania"                   "Algeria"                  
##   [3] "American Samoa"            "Angola"                   
##   [5] "Anguilla"                  "Antigua and Barbuda"      
##   [7] "Argentina"                 "Aruba"                    
##   [9] "Australia"                 "Bahamas"                  
##  [11] "Bahrain"                   "Bangladesh"               
##  [13] "Barbados"                  "Belgium"                  
##  [15] "Belize"                    "Benin"                    
##  [17] "Bermuda"                   "Bonaire/S.Eustatius/Saba" 
##  [19] "Bosnia and Herzegovina"    "Brazil"                   
##  [21] "British Indian Ocean Ter"  "British Virgin Islands"   
##  [23] "Brunei Darussalam"         "Bulgaria"                 
##  [25] "C<f4>te d'Ivoire"          "Cabo Verde"               
##  [27] "Cambodia"                  "Cameroon"                 
##  [29] "Canada"                    "Cayman Islands"           
##  [31] "Channel Islands"           "Chile"                    
##  [33] "China"                     "China, Hong Kong SAR"     
##  [35] "China, Macao SAR"          "Colombia"                 
##  [37] "Comoros"                   "Congo, Dem. Rep. of the"  
##  [39] "Congo, Republic of"        "Cook Islands"             
##  [41] "Costa Rica"                "Croatia"                  
##  [43] "Cuba"                      "Cura<e7>ao"               
##  [45] "Cyprus"                    "Denmark"                  
##  [47] "Djibouti"                  "Dominica"                 
##  [49] "Dominican Republic"        "Ecuador"                  
##  [51] "Egypt"                     "El Salvador"              
##  [53] "Equatorial Guinea"         "Eritrea"                  
##  [55] "Estonia"                   "Ethiopia"                 
##  [57] "Falkland Is.(Malvinas)"    "Faroe Islands"            
##  [59] "Fiji, Republic of"         "Finland"                  
##  [61] "France"                    "French Guiana"            
##  [63] "French Polynesia"          "French Southern Terr"     
##  [65] "Gabon"                     "Gambia"                   
##  [67] "Georgia"                   "Germany"                  
##  [69] "Ghana"                     "Gibraltar"                
##  [71] "Greece"                    "Greenland"                
##  [73] "Grenada"                   "Guadeloupe"               
##  [75] "Guam"                      "Guatemala"                
##  [77] "Guinea"                    "GuineaBissau"             
##  [79] "Guyana"                    "Haiti"                    
##  [81] "Honduras"                  "Iceland"                  
##  [83] "India"                     "Indonesia"                
##  [85] "Iran (Islamic Rep. of)"    "Iraq"                     
##  [87] "Ireland"                   "Isle of Man"              
##  [89] "Israel"                    "Italy"                    
##  [91] "Jamaica"                   "Japan"                    
##  [93] "Jordan"                    "Kenya"                    
##  [95] "Kiribati"                  "Korea, Dem. People's Rep" 
##  [97] "Korea, Republic of"        "Kuwait"                   
##  [99] "Latvia"                    "Lebanon"                  
## [101] "Liberia"                   "Libya"                    
## [103] "Lithuania"                 "Madagascar"               
## [105] "Malaysia"                  "Maldives"                 
## [107] "Malta"                     "Marshall Islands"         
## [109] "Martinique"                "Mauritania"               
## [111] "Mauritius"                 "Mayotte"                  
## [113] "Mexico"                    "Micronesia, Fed.States of"
## [115] "Monaco"                    "Montenegro"               
## [117] "Montserrat"                "Morocco"                  
## [119] "Mozambique"                "Myanmar"                  
## [121] "Namibia"                   "Nauru"                    
## [123] "Netherlands"               "Netherlands Antilles"     
## [125] "New Caledonia"             "New Zealand"              
## [127] "Nicaragua"                 "Nigeria"                  
## [129] "Niue"                      "Norfolk Island"           
## [131] "Northern Mariana Is."      "Norway"                   
## [133] "Oman"                      "Other nei"                
## [135] "Pakistan"                  "Palau"                    
## [137] "Palestine, Occupied Tr."   "Panama"                   
## [139] "Papua New Guinea"          "Peru"                     
## [141] "Philippines"               "Pitcairn Islands"         
## [143] "Poland"                    "Portugal"                 
## [145] "Puerto Rico"               "Qatar"                    
## [147] "R<e9>union"                "Romania"                  
## [149] "Russian Federation"        "Saint Barth<e9>lemy"      
## [151] "Saint Helena"              "Saint Kitts and Nevis"    
## [153] "Saint Lucia"               "Saint Vincent/Grenadines" 
## [155] "SaintMartin"               "Samoa"                    
## [157] "Sao Tome and Principe"     "Saudi Arabia"             
## [159] "Senegal"                   "Serbia and Montenegro"    
## [161] "Seychelles"                "Sierra Leone"             
## [163] "Singapore"                 "Sint Maarten"             
## [165] "Slovenia"                  "Solomon Islands"          
## [167] "Somalia"                   "South Africa"             
## [169] "Spain"                     "Sri Lanka"                
## [171] "St. Pierre and Miquelon"   "Sudan"                    
## [173] "Sudan (former)"            "Suriname"                 
## [175] "Svalbard and Jan Mayen"    "Sweden"                   
## [177] "Syrian Arab Republic"      "Taiwan Province of China" 
## [179] "Tanzania, United Rep. of"  "Thailand"                 
## [181] "TimorLeste"                "Togo"                     
## [183] "Tokelau"                   "Tonga"                    
## [185] "Trinidad and Tobago"       "Tunisia"                  
## [187] "Turkey"                    "Turks and Caicos Is."     
## [189] "Tuvalu"                    "US Virgin Islands"        
## [191] "Ukraine"                   "Un. Sov. Soc. Rep."       
## [193] "United Arab Emirates"      "United Kingdom"           
## [195] "United States of America"  "Uruguay"                  
## [197] "Vanuatu"                   "Venezuela, Boliv Rep of"  
## [199] "Viet Nam"                  "Wallis and Futuna Is."    
## [201] "Western Sahara"            "Yemen"                    
## [203] "Yugoslavia SFR"            "Zanzibar"
```


7. Use `rename()` to rename the columns and make them easier to use. The new column names should be:  
+ country
+ commname
+ ASFIS_sciname
+ ASFIS_spcode
+ ISSCAAP_spgroup
+ ISSCAAP_spgroupname
+ FAO_area
+ unit


```r
fisheries1 <- fisheries %>% 
  rename(country = "Country", commname = "Common name", ASFIS_sciname = "ASFIS species name", ASFIS_spcode = "ASFIS species#", ISSCAAP_spgroup = "ISSCAAP group#", ISSCAAP_spgroupname = "ISSCAAP taxonomic group", FAO_name = "FAO major fishing area", unit = "Measure" )
colnames(fisheries1)
```

```
##  [1] "country"             "commname"            "ISSCAAP_spgroup"    
##  [4] "ISSCAAP_spgroupname" "ASFIS_spcode"        "ASFIS_sciname"      
##  [7] "FAO_name"            "unit"                "1950"               
## [10] "1951"                "1952"                "1953"               
## [13] "1954"                "1955"                "1956"               
## [16] "1957"                "1958"                "1959"               
## [19] "1960"                "1961"                "1962"               
## [22] "1963"                "1964"                "1965"               
## [25] "1966"                "1967"                "1968"               
## [28] "1969"                "1970"                "1971"               
## [31] "1972"                "1973"                "1974"               
## [34] "1975"                "1976"                "1977"               
## [37] "1978"                "1979"                "1980"               
## [40] "1981"                "1982"                "1983"               
## [43] "1984"                "1985"                "1986"               
## [46] "1987"                "1988"                "1989"               
## [49] "1990"                "1991"                "1992"               
## [52] "1993"                "1994"                "1995"               
## [55] "1996"                "1997"                "1998"               
## [58] "1999"                "2000"                "2001"               
## [61] "2002"                "2003"                "2004"               
## [64] "2005"                "2006"                "2007"               
## [67] "2008"                "2009"                "2010"               
## [70] "2011"                "2012"
```

8. Are these data tidy? Why or why not, and, how do you know? Use the appropriate pivot function to tidy the data. Remove the NA's. Put the tidy data frame into a new object `fisheries_tidy`.  


```r
fisheries_tidy <- fisheries1%>% 
  pivot_longer(-c("country", "commname" , "ASFIS_sciname" , "ASFIS_spcode", "ISSCAAP_spgroup", "ISSCAAP_spgroupname", "FAO_name", "unit"),
               names_to = "Year",
               values_to = "Catch",
               values_drop_na = TRUE)
fisheries_tidy
```

```
## # A tibble: 376,771 x 10
##    country commname ISSCAAP_spgroup ISSCAAP_spgroup<U+2026> ASFIS_spcode ASFIS_sciname
##    <fct>   <fct>              <dbl> <fct>            <fct>        <fct>        
##  1 Albania Angelsh<U+2026>              38 Sharks, rays, c<U+2026> 10903XXXXX   Squatinidae  
##  2 Albania Angelsh<U+2026>              38 Sharks, rays, c<U+2026> 10903XXXXX   Squatinidae  
##  3 Albania Angelsh<U+2026>              38 Sharks, rays, c<U+2026> 10903XXXXX   Squatinidae  
##  4 Albania Angelsh<U+2026>              38 Sharks, rays, c<U+2026> 10903XXXXX   Squatinidae  
##  5 Albania Angelsh<U+2026>              38 Sharks, rays, c<U+2026> 10903XXXXX   Squatinidae  
##  6 Albania Angelsh<U+2026>              38 Sharks, rays, c<U+2026> 10903XXXXX   Squatinidae  
##  7 Albania Angelsh<U+2026>              38 Sharks, rays, c<U+2026> 10903XXXXX   Squatinidae  
##  8 Albania Angelsh<U+2026>              38 Sharks, rays, c<U+2026> 10903XXXXX   Squatinidae  
##  9 Albania Angelsh<U+2026>              38 Sharks, rays, c<U+2026> 10903XXXXX   Squatinidae  
## 10 Albania Angelsh<U+2026>              38 Sharks, rays, c<U+2026> 10903XXXXX   Squatinidae  
## # <U+2026> with 376,761 more rows, and 4 more variables: FAO_name <dbl>, unit <fct>,
## #   Year <chr>, Catch <chr>
```


9. Refocus the data only to include country, ISSCAAP_spgroupname, ASFIS_spcode, ASFIS_sciname, year, and catch.

```r
fisheries_tidy2 <- fisheries_tidy %>% 
  select("country", "ISSCAAP_spgroupname", "ASFIS_spcode", "ASFIS_sciname", "Year", "Catch")
fisheries_tidy2
```

```
## # A tibble: 376,771 x 6
##    country ISSCAAP_spgroupname     ASFIS_spcode ASFIS_sciname Year  Catch
##    <fct>   <fct>                   <fct>        <fct>         <chr> <chr>
##  1 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1995  0 0  
##  2 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1996  53   
##  3 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1997  20   
##  4 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1998  31   
##  5 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   1999  30   
##  6 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2000  30   
##  7 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2001  16   
##  8 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2002  79   
##  9 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2003  1    
## 10 Albania Sharks, rays, chimaeras 10903XXXXX   Squatinidae   2004  4    
## # <U+2026> with 376,761 more rows
```


10. Re-check the classes of `fisheries_tidy2`. Notice that "catch" is shown as a character! This is a problem because we will want to treat it as a numeric. How will you deal with this?
**I have already set "Catch" as a numeric.**

```r
fisheries_tidy2$Catch <- as.numeric(fisheries_tidy2$Catch)
```

```
## Warning: NAs introduced by coercion
```

```r
lapply(fisheries_tidy2, class)
```

```
## $country
## [1] "factor"
## 
## $ISSCAAP_spgroupname
## [1] "factor"
## 
## $ASFIS_spcode
## [1] "factor"
## 
## $ASFIS_sciname
## [1] "factor"
## 
## $Year
## [1] "character"
## 
## $Catch
## [1] "numeric"
```


11. Based on the ASFIS_spcode, how many distinct taxa were caught as part of these data?

```r
nlevels(fisheries_tidy2$ASFIS_spcode)
```

```
## [1] 1553
```


12. Which country had the largest overall catch in the year 2000?

```r
fisheries_tidy2 %>%
  group_by(country) %>% 
  filter(Year=="2000") %>% 
  summarize(Catch = sum(Catch,na.rm =T)) %>% 
  arrange(desc(Catch))
```

```
## # A tibble: 193 x 2
##    country                     Catch
##    <fct>                       <dbl>
##  1 Peru                     10625010
##  2 Japan                     4921013
##  3 United States of America  4692229
##  4 Chile                     4297928
##  5 Indonesia                 3761769
##  6 Russian Federation        3678828
##  7 Thailand                  2795719
##  8 India                     2760632
##  9 Norway                    2698506
## 10 Iceland                   1982369
## # <U+2026> with 183 more rows
```

**Country with the largest overall catch in the year 2000 was Peru**

13. Which country caught the most sardines (_Sardina_) between the years 1990-2000?

```r
fisheries_tidy2 %>% 
  group_by(country) %>% 
   filter(str_detect(ASFIS_sciname, "Sardina")) %>% 
  filter(Year <="2000" & Year >="1990") %>% 
  summarize(Catch = sum(Catch, na.rm = T)) %>% 
   arrange(desc(Catch))                 
```

```
## # A tibble: 204 x 2
##    country              Catch
##    <fct>                <dbl>
##  1 Morocco            4785190
##  2 Spain              1425317
##  3 Russian Federation 1035139
##  4 Portugal            926318
##  5 Ukraine             784730
##  6 Italy               377907
##  7 Algeria             311733
##  8 Turkey              273565
##  9 France              263871
## 10 Denmark             242017
## # <U+2026> with 194 more rows
```
**Morocco was the country that caught the most amount between 1990-2000**

14. Which five countries caught the most cephalopods between 2008-2012?

```r
fisheries_tidy2 %>% 
  group_by(country) %>% 
   filter(str_detect(ISSCAAP_spgroupname, "Squids, cuttlefishes, octopuses")) %>% 
  filter(Year <="2012" & Year >="2008") %>% 
  summarize(Catch = sum(Catch, na.rm = T)) %>% 
   arrange(desc(Catch))  
```

```
## # A tibble: 204 x 2
##    country                    Catch
##    <fct>                      <dbl>
##  1 China                    4785139
##  2 Peru                     2274232
##  3 Korea, Republic of       1535454
##  4 Japan                    1394041
##  5 Chile                     723186
##  6 Indonesia                 684567
##  7 United States of America  613400
##  8 Thailand                  603529
##  9 Taiwan Province of China  593638
## 10 Argentina                 587238
## # <U+2026> with 194 more rows
```
**China caught the most cephalopods**

15. Given the top five countries from question 14 above, which species was the highest catch total? The lowest?

```r
fisheries_tidy2 %>% 
  filter(str_detect(ISSCAAP_spgroupname, "Squids")) %>% 
  filter(Year>=2008 & Year<=2012) %>% 
  group_by(ASFIS_sciname) %>% 
  summarize(catch_total=sum(Catch, na.rm=T)) %>% 
  arrange((catch_total))
```

```
## # A tibble: 31 x 2
##    ASFIS_sciname           catch_total
##    <fct>                         <dbl>
##  1 Todarodes filippovae              1
##  2 Martialia hyadesi                 4
##  3 Moroteuthis ingens              194
##  4 Loligo vulgaris                 398
##  5 Eledone cirrhosa                920
##  6 Loligo duvauceli               1843
##  7 Loligo forbesi                 2567
##  8 Todarodes sagittatus           5073
##  9 Illex coindetii               20209
## 10 Sepioteuthis lessoniana       28547
## # <U+2026> with 21 more rows
```
**The least was Todarodes filippovae. The most was Dosidicus gigas.**

16. In some cases, the taxonomy of the fish being caught is unclear. Make a new data frame called `coastal_fish` that shows the taxonomic composition of "Miscellaneous coastal fishes" within the ISSCAAP_spgroupname column.


```r
coastal_fish <- fisheries_tidy2 %>% 
  filter(ISSCAAP_spgroupname == 'Miscellaneous coastal fishes')
coastal_fish
```

```
## # A tibble: 69,821 x 6
##    country ISSCAAP_spgroupname          ASFIS_spcode ASFIS_sciname Year  Catch
##    <fct>   <fct>                        <fct>        <fct>         <chr> <dbl>
##  1 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1983    559
##  2 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1984    392
##  3 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1985    406
##  4 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1986    499
##  5 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1987    564
##  6 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1988    724
##  7 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1989    583
##  8 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1990    754
##  9 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1991    283
## 10 Albania Miscellaneous coastal fishes 1703926101   Boops boops   1992    196
## # <U+2026> with 69,811 more rows
```

17. Use the data to do at least one exploratory analysis of your choice. What can you learn?
**I chose to discover which countries caught the most shrimp & prawn in the year 1999 in descending order.**

```r
fisheries_tidy2 %>%
  filter(ISSCAAP_spgroupname == "Shrimps, prawns") %>%
  filter(Year == 1999) %>%
  group_by(country) %>%
  summarize(shrimp_prawns_catch = sum(Catch,na.rm=T)) %>% 
 arrange(desc(shrimp_prawns_catch))
```

```
## # A tibble: 115 x 2
##    country                  shrimp_prawns_catch
##    <fct>                                  <dbl>
##  1 India                                 336737
##  2 Indonesia                             235621
##  3 United States of America              137973
##  4 Canada                                120005
##  5 Viet Nam                               91500
##  6 Malaysia                               90474
##  7 Thailand                               84054
##  8 Greenland                              79178
##  9 Mexico                                 66491
## 10 Norway                                 63538
## # <U+2026> with 105 more rows
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.
