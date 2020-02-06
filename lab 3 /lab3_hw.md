---
title: "Lab 3 Homework"
author: "Alliyah Galvan"
date: "Winter 2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---



## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run.  

## Load the tidyverse

```r
library(tidyverse)
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

## Data
For the homework, we will use data about vertebrate home range sizes. The data are in the class folder, but the reference is below.  

**Database of vertebrate home range sizes.**  
Reference: Tamburello N, Cote IM, Dulvy NK (2015) Energy and the scaling of animal space use. The American Naturalist 186(2):196-211. http://dx.doi.org/10.1086/682070.  
Data: http://datadryad.org/resource/doi:10.5061/dryad.q5j65/1  

1. Load the data into a new object called `homerange`.  

```r
homerange <- readr::read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")
```

```
## Parsed with column specification:
## cols(
##   .default = col_character(),
##   mean.mass.g = col_double(),
##   log10.mass = col_double(),
##   mean.hra.m2 = col_double(),
##   log10.hra = col_double(),
##   preymass = col_double(),
##   log10.preymass = col_double(),
##   PPMR = col_double()
## )
```

```
## See spec(...) for full column specifications.
```

2. Use `spec()` to see the full details of the columns.  

```r
spec(homerange)
```

```
## cols(
##   taxon = col_character(),
##   common.name = col_character(),
##   class = col_character(),
##   order = col_character(),
##   family = col_character(),
##   genus = col_character(),
##   species = col_character(),
##   primarymethod = col_character(),
##   N = col_character(),
##   mean.mass.g = col_double(),
##   log10.mass = col_double(),
##   alternative.mass.reference = col_character(),
##   mean.hra.m2 = col_double(),
##   log10.hra = col_double(),
##   hra.reference = col_character(),
##   realm = col_character(),
##   thermoregulation = col_character(),
##   locomotion = col_character(),
##   trophic.guild = col_character(),
##   dimension = col_character(),
##   preymass = col_double(),
##   log10.preymass = col_double(),
##   PPMR = col_double(),
##   prey.size.reference = col_character()
## )
```

3. Explore the data. Show the dimensions, column names, classes for each variable, and a statistical summary. Keep these as separate code chunks.  


```r
dim(homerange)
```

```
## [1] 569  24
```


```r
colnames(homerange)
```

```
##  [1] "taxon"                      "common.name"               
##  [3] "class"                      "order"                     
##  [5] "family"                     "genus"                     
##  [7] "species"                    "primarymethod"             
##  [9] "N"                          "mean.mass.g"               
## [11] "log10.mass"                 "alternative.mass.reference"
## [13] "mean.hra.m2"                "log10.hra"                 
## [15] "hra.reference"              "realm"                     
## [17] "thermoregulation"           "locomotion"                
## [19] "trophic.guild"              "dimension"                 
## [21] "preymass"                   "log10.preymass"            
## [23] "PPMR"                       "prey.size.reference"
```


```r
lapply(homerange, class)
```

```
## $taxon
## [1] "character"
## 
## $common.name
## [1] "character"
## 
## $class
## [1] "character"
## 
## $order
## [1] "character"
## 
## $family
## [1] "character"
## 
## $genus
## [1] "character"
## 
## $species
## [1] "character"
## 
## $primarymethod
## [1] "character"
## 
## $N
## [1] "character"
## 
## $mean.mass.g
## [1] "numeric"
## 
## $log10.mass
## [1] "numeric"
## 
## $alternative.mass.reference
## [1] "character"
## 
## $mean.hra.m2
## [1] "numeric"
## 
## $log10.hra
## [1] "numeric"
## 
## $hra.reference
## [1] "character"
## 
## $realm
## [1] "character"
## 
## $thermoregulation
## [1] "character"
## 
## $locomotion
## [1] "character"
## 
## $trophic.guild
## [1] "character"
## 
## $dimension
## [1] "character"
## 
## $preymass
## [1] "numeric"
## 
## $log10.preymass
## [1] "numeric"
## 
## $PPMR
## [1] "numeric"
## 
## $prey.size.reference
## [1] "character"
```


```r
summary(homerange)
```

```
##     taxon           common.name           class              order          
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##     family             genus             species          primarymethod     
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##       N              mean.mass.g        log10.mass     
##  Length:569         Min.   :      0   Min.   :-0.6576  
##  Class :character   1st Qu.:     50   1st Qu.: 1.6990  
##  Mode  :character   Median :    330   Median : 2.5185  
##                     Mean   :  34602   Mean   : 2.5947  
##                     3rd Qu.:   2150   3rd Qu.: 3.3324  
##                     Max.   :4000000   Max.   : 6.6021  
##                                                        
##  alternative.mass.reference  mean.hra.m2          log10.hra     
##  Length:569                 Min.   :0.000e+00   Min.   :-1.523  
##  Class :character           1st Qu.:4.500e+03   1st Qu.: 3.653  
##  Mode  :character           Median :3.934e+04   Median : 4.595  
##                             Mean   :2.146e+07   Mean   : 4.709  
##                             3rd Qu.:1.038e+06   3rd Qu.: 6.016  
##                             Max.   :3.551e+09   Max.   : 9.550  
##                                                                 
##  hra.reference         realm           thermoregulation    locomotion       
##  Length:569         Length:569         Length:569         Length:569        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##                                                                             
##  trophic.guild       dimension            preymass         log10.preymass   
##  Length:569         Length:569         Min.   :     0.67   Min.   :-0.1739  
##  Class :character   Class :character   1st Qu.:    20.02   1st Qu.: 1.3014  
##  Mode  :character   Mode  :character   Median :    53.75   Median : 1.7304  
##                                        Mean   :  3989.88   Mean   : 2.0188  
##                                        3rd Qu.:   363.35   3rd Qu.: 2.5603  
##                                        Max.   :130233.20   Max.   : 5.1147  
##                                        NA's   :502         NA's   :502      
##       PPMR         prey.size.reference
##  Min.   :  0.380   Length:569         
##  1st Qu.:  3.315   Class :character   
##  Median :  7.190   Mode  :character   
##  Mean   : 31.752                      
##  3rd Qu.: 15.966                      
##  Max.   :530.000                      
##  NA's   :502
```

4. Are there NA's in your data? Show the code that you would use to verify this, please.  


```r
anyNA(homerange)
```

```
## [1] TRUE
```
**Yes there are NAs present.**

5. Change the class of the variables `taxon` and `order` to factors and display their levels.  


```r
homerange$taxon <- as.factor(homerange$taxon)
levels(homerange$taxon)
```

```
## [1] "birds"         "lake fishes"   "lizards"       "mammals"      
## [5] "marine fishes" "river fishes"  "snakes"        "tortoises"    
## [9] "turtles"
```


```r
homerange$order <- as.factor(homerange$order)
levels(homerange$order)
```

```
##  [1] "accipitriformes"         "afrosoricida"           
##  [3] "anguilliformes"          "anseriformes"           
##  [5] "apterygiformes"          "artiodactyla"           
##  [7] "caprimulgiformes"        "carnivora"              
##  [9] "charadriiformes"         "columbidormes"          
## [11] "columbiformes"           "coraciiformes"          
## [13] "cuculiformes"            "cypriniformes"          
## [15] "dasyuromorpha"           "dasyuromorpia"          
## [17] "didelphimorphia"         "diprodontia"            
## [19] "diprotodontia"           "erinaceomorpha"         
## [21] "esociformes"             "falconiformes"          
## [23] "gadiformes"              "galliformes"            
## [25] "gruiformes"              "lagomorpha"             
## [27] "macroscelidea"           "monotrematae"           
## [29] "passeriformes"           "pelecaniformes"         
## [31] "peramelemorphia"         "perciformes"            
## [33] "perissodactyla"          "piciformes"             
## [35] "pilosa"                  "proboscidea"            
## [37] "psittaciformes"          "rheiformes"             
## [39] "roden"                   "rodentia"               
## [41] "salmoniformes"           "scorpaeniformes"        
## [43] "siluriformes"            "soricomorpha"           
## [45] "squamata"                "strigiformes"           
## [47] "struthioniformes"        "syngnathiformes"        
## [49] "testudines"              "tetraodontiformes<U+00A0>"
## [51] "tinamiformes"
```

6. Make a new dataframe `deer` that is limited to the mean mass, log10 mass, family, genus, and species of deer in the database. The family for deer is cervidae. Arrange the data in descending order by log10 mass. Which is the largest deer?  


```r
deer <- data.frame(homerange) %>% 
  select(mean.mass.g, log10.mass, family, genus, species)%>%
  filter(family == "cervidae") %>% 
  arrange(desc(log10.mass))
deer
```

```
##    mean.mass.g log10.mass   family      genus     species
## 1    307227.44    5.48746 cervidae      alces       alces
## 2    234757.78    5.37062 cervidae     cervus     elaphus
## 3    102058.69    5.00885 cervidae   rangifer    tarandus
## 4     87884.04    4.94391 cervidae odocoileus virginianus
## 5     71449.63    4.85400 cervidae       dama        dama
## 6     62823.19    4.79812 cervidae       axis        axis
## 7     53864.17    4.73130 cervidae odocoileus    hemionus
## 8     35000.16    4.54407 cervidae ozotoceros bezoarticus
## 9     29450.32    4.46909 cervidae     cervus      nippon
## 10    24050.27    4.38112 cervidae  capreolus   capreolus
## 11    13499.88    4.13033 cervidae  muntiacus     reevesi
## 12     7499.98    3.87506 cervidae       pudu        puda
```
**The largest deer is the Alces Alces at an average 307227.44 grams.**

7. As measured by the data, which snake species has the smallest homerange? Show all of your work, please. Look this species up online and tell me about it!  


```r
smallest <- homerange %>% 
  filter(taxon == "snakes") %>% 
  arrange(mean.hra.m2)
smallest
```

```
## # A tibble: 41 x 24
##    taxon common.name class order family genus species primarymethod N    
##    <fct> <chr>       <chr> <fct> <chr>  <chr> <chr>   <chr>         <chr>
##  1 snak<U+2026> namaqua dw<U+2026> rept<U+2026> squa<U+2026> viper<U+2026> bitis schnei<U+2026> telemetry     11   
##  2 snak<U+2026> eastern wo<U+2026> rept<U+2026> squa<U+2026> colub<U+2026> carp<U+2026> viridis radiotag      10   
##  3 snak<U+2026> butlers ga<U+2026> rept<U+2026> squa<U+2026> colub<U+2026> tham<U+2026> butleri mark-recaptu<U+2026> 1    
##  4 snak<U+2026> western wo<U+2026> rept<U+2026> squa<U+2026> colub<U+2026> carp<U+2026> vermis  radiotag      1    
##  5 snak<U+2026> snubnosed <U+2026> rept<U+2026> squa<U+2026> viper<U+2026> vipe<U+2026> latast<U+2026> telemetry     7    
##  6 snak<U+2026> chinese pi<U+2026> rept<U+2026> squa<U+2026> viper<U+2026> gloy<U+2026> shedao<U+2026> telemetry     16   
##  7 snak<U+2026> ringneck s<U+2026> rept<U+2026> squa<U+2026> colub<U+2026> diad<U+2026> puncta<U+2026> mark-recaptu<U+2026> <NA> 
##  8 snak<U+2026> cottonmouth rept<U+2026> squa<U+2026> viper<U+2026> agki<U+2026> pisciv<U+2026> telemetry     15   
##  9 snak<U+2026> redbacked <U+2026> rept<U+2026> squa<U+2026> colub<U+2026> ooca<U+2026> rufodo<U+2026> telemetry     21   
## 10 snak<U+2026> gopher sna<U+2026> rept<U+2026> squa<U+2026> colub<U+2026> pitu<U+2026> cateni<U+2026> telemetry     4    
## # <U+2026> with 31 more rows, and 15 more variables: mean.mass.g <dbl>,
## #   log10.mass <dbl>, alternative.mass.reference <chr>, mean.hra.m2 <dbl>,
## #   log10.hra <dbl>, hra.reference <chr>, realm <chr>, thermoregulation <chr>,
## #   locomotion <chr>, trophic.guild <chr>, dimension <chr>, preymass <dbl>,
## #   log10.preymass <dbl>, PPMR <dbl>, prey.size.reference <chr>
```
**The Namaqua dwarf Adder also known as Bitis Schneideri has the smallest homerange. According to the African Snakebite Institute, this is the smallest adder in the world at an average length of 20cm. Females produce around 3-7 offspring, each measuring 11-13 cm in length. It is preyed upon by many animals, however, the largest threat comes from habitat destruction and illegal pet trading practices. The Namaqua Dwarf Adder is mainly active in the early evenings and at night and its venom is midly cytotoxic which causes pain and swelling. Luckily antivenom is not required once bit (it's also not effective).**

8. You suspect that homerange and mass are correlated in birds. We need a ratio that facilitates exploration of this prediction. First, build a new dataframe called `hra_ratio` that is limited to genus, species, mean.mass.g, log10.mass, log10.hra. Arrange it in ascending order by mean mass in grams.  

```r
hra_ratio <- data.frame(homerange) %>% 
  filter(taxon == "birds") %>% 
  select(genus, species, mean.mass.g, log10.mass, log10.hra)%>%
  arrange(mean.mass.g)
hra_ratio
```

```
##                  genus         species mean.mass.g log10.mass log10.hra
## 1              regulus         regulus        5.15  0.7118072  4.298853
## 2              regulus    ignicapillus        5.30  0.7242759  4.217484
## 3         phylloscopus         bonelli        7.50  0.8750613  4.544068
## 4           aegithalos        caudatus        8.00  0.9030900  4.623249
## 5                vireo    atricapillus        8.50  0.9294189  4.175319
## 6            setophaga        magnolia        8.60  0.9344985  3.862390
## 7              certhia      familiaris        8.77  0.9429996  4.672098
## 8               sylvia          undata        8.80  0.9444827  3.447158
## 9            setophaga       ruticilla        9.00  0.9542425  3.288359
## 10           setophaga          virens        9.00  0.9542425  3.811237
## 11            wilsonia      canadensis        9.30  0.9684829  4.005057
## 12           setophaga        petechia        9.50  0.9777236  3.230367
## 13         troglodytes     troglodytes        9.50  0.9777236  4.005057
## 14           setophaga    pensylvanica        9.60  0.9822712  3.783209
## 15           setophaga           fusca        9.70  0.9867717  3.721061
## 16           cisticola        juncidis        9.80  0.9912261  4.158362
## 17          geothylpis         trichas        9.80  0.9912261  3.721061
## 18           empidonax         minimus        9.90  0.9956352  3.250569
## 19               vireo           belli       10.00  1.0000000  4.069515
## 20               parus    carolinensis       10.10  1.0043214  4.175319
## 21              sylvia           sarda       10.50  1.0211893  3.518514
## 22             serinus         serinus       10.70  1.0293838  4.000000
## 23           hippolais      polyglotta       11.00  1.0413927  4.477121
## 24               parus    atricapillus       11.00  1.0413927  4.163420
## 25               parus       palustris       11.00  1.0413927  4.355305
## 26          thryomanes        bewickiI       11.00  1.0413927  3.686298
## 27         troglodytes           aedon       11.20  1.0492180  3.607117
## 28  geothlypis<U+00A0>    philadelphia       11.30  1.0530784  3.885871
## 29               vireo         griseus       11.40  1.0569049  3.125631
## 30            spizella       passerina       12.20  1.0863598  4.487931
## 31           empidonax        wrightii       12.30  1.0899051  4.198182
## 32           muscicapa         striata       12.80  1.1072100  4.000000
## 33            contopus          virens       13.80  1.1398791  4.643746
## 34           setophaga       kirtlandi       14.00  1.1461280  4.531396
## 35           passerina          cyanea       14.30  1.1553360  3.022090
## 36             chamaea        fasciata       14.80  1.1702617  3.510207
## 37         phoenicurus     phoenicurus       15.21  1.1821292  3.653213
## 38        protonotaria          citrea       16.10  1.2068259  4.175319
## 39            saxicola         rubetra       16.48  1.2169572  3.863323
## 40               parus       inornatus       16.60  1.2201081  4.385268
## 41          ammodramus      savannarum       16.70  1.2227165  4.038481
## 42           motacilla           flava       17.50  1.2430380  4.005057
## 43               vireo       olivaceus       17.60  1.2455127  3.862390
## 44            spizella         arborea       18.10  1.2576786  4.230366
## 45               sitta        europaea       18.30  1.2624511  4.322219
## 46         thryothorus    ludovicianus       18.50  1.2671717  3.084240
## 47             seiurus    aurocapillus       18.90  1.2764618  4.005057
## 48           motacilla            alba       21.22  1.3267454  5.894870
## 49           fringilla         coelebs       23.25  1.3664230  4.623249
## 50            oenanthe        oenanthe       25.20  1.4014005  4.186901
## 51             icteria          virens       27.00  1.4313638  3.125631
## 52             lululla         arborea       30.00  1.4771213  4.918871
## 53             laniuis        collurio       30.00  1.4771213  4.198182
## 54              sialia          sialis       30.80  1.4885507  4.005057
## 55               habia          rubica       32.80  1.5158738  4.686298
## 56              lanius         senator       35.00  1.5440680  4.903090
## 57               habia      fuscicauda       37.70  1.5763414  4.783208
## 58                jynx       torquilla       38.00  1.5797836  6.016239
## 59            tyrannus        tyrannus       40.40  1.6063814  4.923087
## 60           phytotoma       raimondii       42.00  1.6232493  4.489958
## 61              lanius           minor       44.22  1.6456187  5.803321
## 62              pipilo          fuscus       44.70  1.6503075  4.413297
## 63              pipilo          aberti       46.30  1.6655810  4.209177
## 64         scardafella            inca       47.70  1.6785184  3.413296
## 65         caprimulgus       europaeus       48.00  1.6812412  5.894870
## 66             laniuis    ludovicianus       48.10  1.6821451  4.878959
## 67               mimus     polyglottos       50.10  1.6998377  3.607117
## 68            picoides          medius       59.00  1.7708520  5.150756
## 69          glaucidium      passerinum       61.32  1.7876021  6.096910
## 70            picoides     tridactylus       65.65  1.8172347  5.544068
## 71               upupa           epops       67.00  1.8260748  7.098990
## 72          ixobrychus          exilis       67.00  1.8260748  4.986772
## 73           sturnella           magna       89.00  1.9493900  4.482178
## 74           sturnella        neglecta       89.00  1.9493900  4.482178
## 75            coracias        garrulus      103.00  2.0128372  6.000000
## 76            picoides        leucotos      109.25  2.0384214  6.724816
## 77               falco      sparverius      112.00  2.0492180  6.151185
## 78            aegolius        funereus      119.00  2.0755470  6.496930
## 79               picus           canus      124.50  2.0951694  6.655292
## 80             cuculus         canorus      128.00  2.1072100  7.585009
## 81           nucifraga   caryocatactes      130.00  2.1139434  5.121665
## 82        streptopelia          turtur      140.33  2.1471505  7.803355
## 83           accipiter        striatus      141.00  2.1492191  5.998052
## 84             columba        palumbus      150.00  2.1760913  6.404834
## 85            clamator      glandarius      151.50  2.1804126  7.098990
## 86              athene          noctua      156.50  2.1945143  5.698970
## 87        scenopoeetes    dentirostris      158.00  2.1986571  4.977724
## 88                crex            crex      165.00  2.2174839  4.633468
## 89               picus         viridis      186.67  2.2710745  6.267172
## 90               falco     tinnunculus      200.00  2.3010300  6.477121
## 91                asio            otus      252.00  2.4014005  7.292699
## 92              rallus         elegans      266.00  2.4248816  4.643453
## 93           dryocopus         martius      277.37  2.4430595  6.544068
## 94                tyto            alba      285.00  2.4548449  6.176091
## 95           geococcyx   californianus      300.00  2.4771213  5.740363
## 96              circus        pygargus      315.50  2.4989994  8.303153
## 97              perdix          perdix      381.50  2.5814945  4.792392
## 98              bonasa         bonasia      410.00  2.6127839  5.012837
## 99         neopmorphus      radiolosus      433.00  2.6364879  5.698101
## 100          accipiter        cooperii      469.00  2.6711728  6.352972
## 101           aramides           wolfi      506.00  2.7041505  4.954243
## 102              strix           aluco      519.00  2.7151674  5.552586
## 103         haematopus      ostralegus      521.00  2.7168377  6.390935
## 104             circus         cyaneus      521.00  2.7168377  6.401605
## 105            lagopus         lagopus      620.00  2.7923917  4.413297
## 106        nothoprocta          ornata      622.00  2.7937904  4.385268
## 107           daptrius      americanus      625.00  2.7958800  5.823474
## 108              buteo        lineatus      626.00  2.7965743  5.805774
## 109              falco       biarmicus      675.00  2.8293038  7.698970
## 110               anas        strepera      719.00  2.8567289  7.661926
## 111              falco       mexicanus      721.00  2.8579353  7.411257
## 112              falco      peregrinus      781.50  2.8929290  8.187126
## 113          accipiter           nisus      807.00  2.9068735  6.851258
## 114              buteo           buteo      846.00  2.9273704  7.701050
## 115        typmanuchus cupido pinnatus      900.00  2.9542425  7.080266
## 116           botaurus       stellaris      900.00  2.9542425  5.285557
## 117              buteo       swainsoni      971.00  2.9872192  6.391734
## 118         hieraaetus        pennatus      975.00  2.9890046  8.069298
## 119          accipiter        gentilis      978.00  2.9903389  7.602060
## 120             milvus          milvus     1033.70  3.0143945  7.292810
## 121        dendragapus        obscurus     1050.00  3.0211893  4.230366
## 122           caracara        cheriway     1125.00  3.0511525  8.382017
## 123              buteo     jamaicensis     1126.00  3.0515384  6.628306
## 124             tetrao          tetrix     1139.00  3.0565237  6.295567
## 125             corvus           corax     1410.00  3.1492191  7.447158
## 126               bubo     virginianus     1510.00  3.1789769  6.327276
## 127          carduelis       cannabina     1550.00  3.1903317  6.496930
## 128          circaetus        gallicus     1699.00  3.2301934  7.894870
## 129       centrocercus    urophasianus     1750.00  3.2430380  7.259073
## 130             nyctea       scandiaca     1920.00  3.2833012  6.693477
## 131           strigops     habroptilus     1941.00  3.2880255  5.290035
## 132         hieraaetus       fasciatus     2049.00  3.3115420  7.292699
## 133               bubo            bubo     2191.00  3.3406424  7.204120
## 134           neophron    percnopterus     2203.00  3.3430145  7.803252
## 135            apteryx       australis     2320.00  3.3654880  5.666424
## 136             tetrao       urogallus     2936.00  3.4677561  6.740363
## 137             aquila      chrysaetos     3000.00  3.4771213  7.440122
## 138               rhea         pennata    15000.00  4.1760913  7.378034
## 139               rhea       americana    25000.00  4.3979400  6.389166
## 140           struthio         camelus    88250.00  4.9457147  7.925828
```


9. Replace the existing `hra_ratio` dataframe with a new dataframe that adds a column calculating the ratio of log 10 hra to log 10 mass. Call it `hra.mass.ratio`. Arrange it in descending order by mean mass in grams. 


```r
new_hra_ratio <- data.frame(hra_ratio) %>% 
  mutate (hra.mass.ratio=log10.hra/log10.mass) %>% 
  arrange (desc(mean.mass.g))
new_hra_ratio
```

```
##                  genus         species mean.mass.g log10.mass log10.hra
## 1             struthio         camelus    88250.00  4.9457147  7.925828
## 2                 rhea       americana    25000.00  4.3979400  6.389166
## 3                 rhea         pennata    15000.00  4.1760913  7.378034
## 4               aquila      chrysaetos     3000.00  3.4771213  7.440122
## 5               tetrao       urogallus     2936.00  3.4677561  6.740363
## 6              apteryx       australis     2320.00  3.3654880  5.666424
## 7             neophron    percnopterus     2203.00  3.3430145  7.803252
## 8                 bubo            bubo     2191.00  3.3406424  7.204120
## 9           hieraaetus       fasciatus     2049.00  3.3115420  7.292699
## 10            strigops     habroptilus     1941.00  3.2880255  5.290035
## 11              nyctea       scandiaca     1920.00  3.2833012  6.693477
## 12        centrocercus    urophasianus     1750.00  3.2430380  7.259073
## 13           circaetus        gallicus     1699.00  3.2301934  7.894870
## 14           carduelis       cannabina     1550.00  3.1903317  6.496930
## 15                bubo     virginianus     1510.00  3.1789769  6.327276
## 16              corvus           corax     1410.00  3.1492191  7.447158
## 17              tetrao          tetrix     1139.00  3.0565237  6.295567
## 18               buteo     jamaicensis     1126.00  3.0515384  6.628306
## 19            caracara        cheriway     1125.00  3.0511525  8.382017
## 20         dendragapus        obscurus     1050.00  3.0211893  4.230366
## 21              milvus          milvus     1033.70  3.0143945  7.292810
## 22           accipiter        gentilis      978.00  2.9903389  7.602060
## 23          hieraaetus        pennatus      975.00  2.9890046  8.069298
## 24               buteo       swainsoni      971.00  2.9872192  6.391734
## 25         typmanuchus cupido pinnatus      900.00  2.9542425  7.080266
## 26            botaurus       stellaris      900.00  2.9542425  5.285557
## 27               buteo           buteo      846.00  2.9273704  7.701050
## 28           accipiter           nisus      807.00  2.9068735  6.851258
## 29               falco      peregrinus      781.50  2.8929290  8.187126
## 30               falco       mexicanus      721.00  2.8579353  7.411257
## 31                anas        strepera      719.00  2.8567289  7.661926
## 32               falco       biarmicus      675.00  2.8293038  7.698970
## 33               buteo        lineatus      626.00  2.7965743  5.805774
## 34            daptrius      americanus      625.00  2.7958800  5.823474
## 35         nothoprocta          ornata      622.00  2.7937904  4.385268
## 36             lagopus         lagopus      620.00  2.7923917  4.413297
## 37          haematopus      ostralegus      521.00  2.7168377  6.390935
## 38              circus         cyaneus      521.00  2.7168377  6.401605
## 39               strix           aluco      519.00  2.7151674  5.552586
## 40            aramides           wolfi      506.00  2.7041505  4.954243
## 41           accipiter        cooperii      469.00  2.6711728  6.352972
## 42         neopmorphus      radiolosus      433.00  2.6364879  5.698101
## 43              bonasa         bonasia      410.00  2.6127839  5.012837
## 44              perdix          perdix      381.50  2.5814945  4.792392
## 45              circus        pygargus      315.50  2.4989994  8.303153
## 46           geococcyx   californianus      300.00  2.4771213  5.740363
## 47                tyto            alba      285.00  2.4548449  6.176091
## 48           dryocopus         martius      277.37  2.4430595  6.544068
## 49              rallus         elegans      266.00  2.4248816  4.643453
## 50                asio            otus      252.00  2.4014005  7.292699
## 51               falco     tinnunculus      200.00  2.3010300  6.477121
## 52               picus         viridis      186.67  2.2710745  6.267172
## 53                crex            crex      165.00  2.2174839  4.633468
## 54        scenopoeetes    dentirostris      158.00  2.1986571  4.977724
## 55              athene          noctua      156.50  2.1945143  5.698970
## 56            clamator      glandarius      151.50  2.1804126  7.098990
## 57             columba        palumbus      150.00  2.1760913  6.404834
## 58           accipiter        striatus      141.00  2.1492191  5.998052
## 59        streptopelia          turtur      140.33  2.1471505  7.803355
## 60           nucifraga   caryocatactes      130.00  2.1139434  5.121665
## 61             cuculus         canorus      128.00  2.1072100  7.585009
## 62               picus           canus      124.50  2.0951694  6.655292
## 63            aegolius        funereus      119.00  2.0755470  6.496930
## 64               falco      sparverius      112.00  2.0492180  6.151185
## 65            picoides        leucotos      109.25  2.0384214  6.724816
## 66            coracias        garrulus      103.00  2.0128372  6.000000
## 67           sturnella           magna       89.00  1.9493900  4.482178
## 68           sturnella        neglecta       89.00  1.9493900  4.482178
## 69               upupa           epops       67.00  1.8260748  7.098990
## 70          ixobrychus          exilis       67.00  1.8260748  4.986772
## 71            picoides     tridactylus       65.65  1.8172347  5.544068
## 72          glaucidium      passerinum       61.32  1.7876021  6.096910
## 73            picoides          medius       59.00  1.7708520  5.150756
## 74               mimus     polyglottos       50.10  1.6998377  3.607117
## 75             laniuis    ludovicianus       48.10  1.6821451  4.878959
## 76         caprimulgus       europaeus       48.00  1.6812412  5.894870
## 77         scardafella            inca       47.70  1.6785184  3.413296
## 78              pipilo          aberti       46.30  1.6655810  4.209177
## 79              pipilo          fuscus       44.70  1.6503075  4.413297
## 80              lanius           minor       44.22  1.6456187  5.803321
## 81           phytotoma       raimondii       42.00  1.6232493  4.489958
## 82            tyrannus        tyrannus       40.40  1.6063814  4.923087
## 83                jynx       torquilla       38.00  1.5797836  6.016239
## 84               habia      fuscicauda       37.70  1.5763414  4.783208
## 85              lanius         senator       35.00  1.5440680  4.903090
## 86               habia          rubica       32.80  1.5158738  4.686298
## 87              sialia          sialis       30.80  1.4885507  4.005057
## 88             lululla         arborea       30.00  1.4771213  4.918871
## 89             laniuis        collurio       30.00  1.4771213  4.198182
## 90             icteria          virens       27.00  1.4313638  3.125631
## 91            oenanthe        oenanthe       25.20  1.4014005  4.186901
## 92           fringilla         coelebs       23.25  1.3664230  4.623249
## 93           motacilla            alba       21.22  1.3267454  5.894870
## 94             seiurus    aurocapillus       18.90  1.2764618  4.005057
## 95         thryothorus    ludovicianus       18.50  1.2671717  3.084240
## 96               sitta        europaea       18.30  1.2624511  4.322219
## 97            spizella         arborea       18.10  1.2576786  4.230366
## 98               vireo       olivaceus       17.60  1.2455127  3.862390
## 99           motacilla           flava       17.50  1.2430380  4.005057
## 100         ammodramus      savannarum       16.70  1.2227165  4.038481
## 101              parus       inornatus       16.60  1.2201081  4.385268
## 102           saxicola         rubetra       16.48  1.2169572  3.863323
## 103       protonotaria          citrea       16.10  1.2068259  4.175319
## 104        phoenicurus     phoenicurus       15.21  1.1821292  3.653213
## 105            chamaea        fasciata       14.80  1.1702617  3.510207
## 106          passerina          cyanea       14.30  1.1553360  3.022090
## 107          setophaga       kirtlandi       14.00  1.1461280  4.531396
## 108           contopus          virens       13.80  1.1398791  4.643746
## 109          muscicapa         striata       12.80  1.1072100  4.000000
## 110          empidonax        wrightii       12.30  1.0899051  4.198182
## 111           spizella       passerina       12.20  1.0863598  4.487931
## 112              vireo         griseus       11.40  1.0569049  3.125631
## 113 geothlypis<U+00A0>    philadelphia       11.30  1.0530784  3.885871
## 114        troglodytes           aedon       11.20  1.0492180  3.607117
## 115          hippolais      polyglotta       11.00  1.0413927  4.477121
## 116              parus    atricapillus       11.00  1.0413927  4.163420
## 117              parus       palustris       11.00  1.0413927  4.355305
## 118         thryomanes        bewickiI       11.00  1.0413927  3.686298
## 119            serinus         serinus       10.70  1.0293838  4.000000
## 120             sylvia           sarda       10.50  1.0211893  3.518514
## 121              parus    carolinensis       10.10  1.0043214  4.175319
## 122              vireo           belli       10.00  1.0000000  4.069515
## 123          empidonax         minimus        9.90  0.9956352  3.250569
## 124          cisticola        juncidis        9.80  0.9912261  4.158362
## 125         geothylpis         trichas        9.80  0.9912261  3.721061
## 126          setophaga           fusca        9.70  0.9867717  3.721061
## 127          setophaga    pensylvanica        9.60  0.9822712  3.783209
## 128          setophaga        petechia        9.50  0.9777236  3.230367
## 129        troglodytes     troglodytes        9.50  0.9777236  4.005057
## 130           wilsonia      canadensis        9.30  0.9684829  4.005057
## 131          setophaga       ruticilla        9.00  0.9542425  3.288359
## 132          setophaga          virens        9.00  0.9542425  3.811237
## 133             sylvia          undata        8.80  0.9444827  3.447158
## 134            certhia      familiaris        8.77  0.9429996  4.672098
## 135          setophaga        magnolia        8.60  0.9344985  3.862390
## 136              vireo    atricapillus        8.50  0.9294189  4.175319
## 137         aegithalos        caudatus        8.00  0.9030900  4.623249
## 138       phylloscopus         bonelli        7.50  0.8750613  4.544068
## 139            regulus    ignicapillus        5.30  0.7242759  4.217484
## 140            regulus         regulus        5.15  0.7118072  4.298853
##     hra.mass.ratio
## 1         1.602565
## 2         1.452763
## 3         1.766732
## 4         2.139736
## 5         1.943725
## 6         1.683686
## 7         2.334196
## 8         2.156507
## 9         2.202206
## 10        1.608879
## 11        2.038642
## 12        2.238356
## 13        2.444086
## 14        2.036443
## 15        1.990350
## 16        2.364763
## 17        2.059715
## 18        2.172120
## 19        2.747164
## 20        1.400232
## 21        2.419328
## 22        2.542207
## 23        2.699661
## 24        2.139694
## 25        2.396643
## 26        1.789141
## 27        2.630706
## 28        2.356917
## 29        2.830047
## 30        2.593221
## 31        2.682063
## 32        2.721154
## 33        2.076031
## 34        2.082877
## 35        1.569648
## 36        1.580472
## 37        2.352343
## 38        2.356271
## 39        2.045025
## 40        1.832088
## 41        2.378346
## 42        2.161247
## 43        1.918581
## 44        1.856441
## 45        3.322591
## 46        2.317352
## 47        2.515878
## 48        2.678636
## 49        1.914919
## 50        3.036852
## 51        2.814879
## 52        2.759562
## 53        2.089516
## 54        2.263984
## 55        2.596916
## 56        3.255801
## 57        2.943274
## 58        2.790805
## 59        3.634284
## 60        2.422801
## 61        3.599551
## 62        3.176494
## 63        3.130225
## 64        3.001723
## 65        3.299031
## 66        2.980867
## 67        2.299272
## 68        2.299272
## 69        3.887568
## 70        2.730869
## 71        3.050827
## 72        3.410664
## 73        2.908632
## 74        2.122036
## 75        2.900439
## 76        3.506260
## 77        2.033517
## 78        2.527152
## 79        2.674227
## 80        3.526528
## 81        2.766031
## 82        3.064707
## 83        3.808268
## 84        3.034373
## 85        3.175436
## 86        3.091483
## 87        2.690575
## 88        3.330039
## 89        2.842138
## 90        2.183673
## 91        2.987655
## 92        3.383469
## 93        4.443105
## 94        3.137624
## 95        2.433956
## 96        3.423673
## 97        3.363631
## 98        3.101044
## 99        3.221991
## 100       3.302876
## 101       3.594164
## 102       3.174576
## 103       3.459753
## 104       3.090366
## 105       2.999506
## 106       2.615767
## 107       3.953656
## 108       4.073894
## 109       3.612684
## 110       3.851878
## 111       4.131164
## 112       2.957344
## 113       3.690011
## 114       3.437910
## 115       4.299167
## 116       3.997934
## 117       4.182193
## 118       3.539777
## 119       3.885820
## 120       3.445506
## 121       4.157353
## 122       4.069515
## 123       3.264819
## 124       4.195171
## 125       3.753998
## 126       3.770944
## 127       3.851491
## 128       3.303968
## 129       4.096308
## 130       4.135393
## 131       3.446041
## 132       3.993992
## 133       3.649784
## 134       4.954507
## 135       4.133115
## 136       4.492397
## 137       5.119367
## 138       5.192857
## 139       5.823035
## 140       6.039350
```

10. What is the lowest mass for birds with a `hra.mass.ratio` greater than or equal to 4.0?


```r
new_hra_ratio %>% 
  filter(hra.mass.ratio >=4.0) %>% 
  arrange(mean.mass.g)
```

```
##           genus      species mean.mass.g log10.mass log10.hra hra.mass.ratio
## 1       regulus      regulus        5.15  0.7118072  4.298853       6.039350
## 2       regulus ignicapillus        5.30  0.7242759  4.217484       5.823035
## 3  phylloscopus      bonelli        7.50  0.8750613  4.544068       5.192857
## 4    aegithalos     caudatus        8.00  0.9030900  4.623249       5.119367
## 5         vireo atricapillus        8.50  0.9294189  4.175319       4.492397
## 6     setophaga     magnolia        8.60  0.9344985  3.862390       4.133115
## 7       certhia   familiaris        8.77  0.9429996  4.672098       4.954507
## 8      wilsonia   canadensis        9.30  0.9684829  4.005057       4.135393
## 9   troglodytes  troglodytes        9.50  0.9777236  4.005057       4.096308
## 10    cisticola     juncidis        9.80  0.9912261  4.158362       4.195171
## 11        vireo        belli       10.00  1.0000000  4.069515       4.069515
## 12        parus carolinensis       10.10  1.0043214  4.175319       4.157353
## 13    hippolais   polyglotta       11.00  1.0413927  4.477121       4.299167
## 14        parus    palustris       11.00  1.0413927  4.355305       4.182193
## 15     spizella    passerina       12.20  1.0863598  4.487931       4.131164
## 16     contopus       virens       13.80  1.1398791  4.643746       4.073894
## 17    motacilla         alba       21.22  1.3267454  5.894870       4.443105
```
**The lowest mass in grams is from the bird Regulus regulus.**

11. Do a search online; what is the common name of the bird from #10 above? Place a link in your markdown file that takes us to a webpage with information on its biology.  

**For #10 the common name for Regulus regulus is the "Goldcrest". More information about this bird can be found [here](https://en.wikipedia.org/wiki/Goldcrest).**

12. What is the `hra.mass.ratio` for an ostrich? Show your work, please.  


```r
homerange %>% 
  filter(taxon == "birds" & common.name == "ostrich") %>% 
  mutate(hra.mass.ratio=log10.hra/log10.mass) %>% 
  select(taxon, common.name,log10.hra, log10.mass, hra.mass.ratio )
```

```
## # A tibble: 1 x 5
##   taxon common.name log10.hra log10.mass hra.mass.ratio
##   <fct> <chr>           <dbl>      <dbl>          <dbl>
## 1 birds ostrich          7.93       4.95           1.60
```

## Push your final code to GitHub!
Please be sure that you have check the `keep md` file in the knit preferences.  
