---
title: "Data Matrices"
author: "Joel Ledford"
date: "Winter 2020"
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
1. Combine a series of vectors into a data matrix.  
2. Name columns and rows in a data matrix.  
3. Select values and use summary functions in a data matrix.  
4. Explain the difference between a data matrix and a data frame.  

## Setup
At the beginning of each class, please make sure that you complete the following:  
1. Login to the lab computer.  
2. If you are using [Github Desktop][gd], download, install, and login to the program.  
3. Clone your repository to the desktop or somewhere convenient to access.  
4. Navigate to [GitHub][gh] and login.  
5. Go to the [class repository][BIS15], click the `Clone or download` button then `Download zip` to the desktop.  
6. Copy the files for today's lab from the class repository and paste them into your repository.  
7. Open today's lab in RStudio.

## Class Discussion Page  
+ [BIS15 Piazza](https://piazza.com/uc_davis/winter2020/bis015l/home)  

## Homework 1 Review  
Let's take a few minutes to compare solutions with your lab  partner. You should be especially mindful of alternate solutions; generally, the code that is the shortest in terms of lines is best. Make sure that your code is knitted and in your Github repository, please.  

## Data Matrix
Last time, you learned how to work with vectors. Today we will organize the vectors into a new type of data structure called a data matrix. Like vectors, data matrices are restricted to *data of the same type*. In the short example below, we will build a new data matrix using the matrix command.  

Box office earnings for Harry Potter movies (in millions!). Notice that these are separate vectors.

```r
Philosophers_Stone <- c(317.5, 657.1)
Chamber_of_Secrets <- c(261.9, 616.9)
Prisoner_of_Azkaban <- c(249.5, 547.1)
Goblet_of_Fire <- c(290.0, 606.8)
Order_of_the_Phoenix <- c(292.0, 647.8)
Half_Blood_Prince <- c(301.9, 632.4)
Deathly_Hallows_1 <- c(295.9, 664.3)
Deathly_Hallows_2 <- c(381.0, 960.5)
```

Create a new object called `box_office`. Here we are using the `c` command to combine the vectors into one.

```r
box_office <- c(Philosophers_Stone, Chamber_of_Secrets, Prisoner_of_Azkaban, Goblet_of_Fire, Order_of_the_Phoenix, Half_Blood_Prince, Deathly_Hallows_1, Deathly_Hallows_2)
box_office
```

```
##  [1] 317.5 657.1 261.9 616.9 249.5 547.1 290.0 606.8 292.0 647.8 301.9 632.4
## [13] 295.9 664.3 381.0 960.5
```

Create `harry_potter_matrix` using the `matrix()` command. We need to tell R how to organize the `box_office` vector using the `nrow` and `byrow` commands.

```r
harry_potter_matrix <- matrix(box_office, nrow = 8, byrow = T)
harry_potter_matrix
```

```
##       [,1]  [,2]
## [1,] 317.5 657.1
## [2,] 261.9 616.9
## [3,] 249.5 547.1
## [4,] 290.0 606.8
## [5,] 292.0 647.8
## [6,] 301.9 632.4
## [7,] 295.9 664.3
## [8,] 381.0 960.5
```

## Name the rows and columns
Vectors `region` and `titles`, used for naming.

```r
region <- c("US", "non-US")
titles <- c("Philosophers_Stone", "Chamber_of_Secrets", "Prisoner_of_Azkaban", "Goblet_of_Fire", "Order_of_the_Phoenix", "Half_Blood_Prince", "Deathly_Hallows_1", "Deathly_Hallows_2")
```

Name the columns using `colnames()` with the vector region.

```r
colnames(harry_potter_matrix) <- region
```

Name the rows using `rownames()` with the vector titles.

```r
rownames(harry_potter_matrix) <- titles
```

Print `harry_potter_matrix`.

```r
harry_potter_matrix
```

```
##                         US non-US
## Philosophers_Stone   317.5  657.1
## Chamber_of_Secrets   261.9  616.9
## Prisoner_of_Azkaban  249.5  547.1
## Goblet_of_Fire       290.0  606.8
## Order_of_the_Phoenix 292.0  647.8
## Half_Blood_Prince    301.9  632.4
## Deathly_Hallows_1    295.9  664.3
## Deathly_Hallows_2    381.0  960.5
```

## Using a data matrix
Once you have a data matrix, you can perform lots of different analyses. For example, you can calculate the total earnings of each movie.

```r
global <- rowSums(harry_potter_matrix)
global
```

```
##   Philosophers_Stone   Chamber_of_Secrets  Prisoner_of_Azkaban 
##                974.6                878.8                796.6 
##       Goblet_of_Fire Order_of_the_Phoenix    Half_Blood_Prince 
##                896.8                939.8                934.3 
##    Deathly_Hallows_1    Deathly_Hallows_2 
##                960.2               1341.5
```

And even add a new column to reflect this calculation. `cbind()` adds columns.

```r
all_harry_potter_matrix <- cbind(harry_potter_matrix, global)
all_harry_potter_matrix
```

```
##                         US non-US global
## Philosophers_Stone   317.5  657.1  974.6
## Chamber_of_Secrets   261.9  616.9  878.8
## Prisoner_of_Azkaban  249.5  547.1  796.6
## Goblet_of_Fire       290.0  606.8  896.8
## Order_of_the_Phoenix 292.0  647.8  939.8
## Half_Blood_Prince    301.9  632.4  934.3
## Deathly_Hallows_1    295.9  664.3  960.2
## Deathly_Hallows_2    381.0  960.5 1341.5
```

## Practice
1. What are the total earnings for each of the regions?  

```r
Total <- colSums (all_harry_potter_matrix)
Total
```

```
##     US non-US global 
## 2389.7 5332.9 7722.6
```

```r
All <- colSums(all_harry_potter_matrix)
```

2. Add this information to the data matrix. Hint: you are adding a row, not a column.  

```r
all_harry_potter_matrix <- rbind (all_harry_potter_matrix, Total)
all_harry_potter_matrix
```

```
##                          US non-US global
## Philosophers_Stone    317.5  657.1  974.6
## Chamber_of_Secrets    261.9  616.9  878.8
## Prisoner_of_Azkaban   249.5  547.1  796.6
## Goblet_of_Fire        290.0  606.8  896.8
## Order_of_the_Phoenix  292.0  647.8  939.8
## Half_Blood_Prince     301.9  632.4  934.3
## Deathly_Hallows_1     295.9  664.3  960.2
## Deathly_Hallows_2     381.0  960.5 1341.5
## Total                2389.7 5332.9 7722.6
```

```r
all_harry_potter_matrix <- rbind(all_harry_potter_matrix, All)
print(all_harry_potter_matrix)
```

```
##                          US non-US global
## Philosophers_Stone    317.5  657.1  974.6
## Chamber_of_Secrets    261.9  616.9  878.8
## Prisoner_of_Azkaban   249.5  547.1  796.6
## Goblet_of_Fire        290.0  606.8  896.8
## Order_of_the_Phoenix  292.0  647.8  939.8
## Half_Blood_Prince     301.9  632.4  934.3
## Deathly_Hallows_1     295.9  664.3  960.2
## Deathly_Hallows_2     381.0  960.5 1341.5
## Total                2389.7 5332.9 7722.6
## All                  2389.7 5332.9 7722.6
```

## Select elements in a data matrix
The same methods of selecting elements in a vector apply to data matrices. We use `[]`. The following selects the value in the first column, second row.

```r
all_harry_potter_matrix[1,2]
```

```
## [1] 657.1
```

```r
all_harry_potter_matrix
```

```
##                          US non-US global
## Philosophers_Stone    317.5  657.1  974.6
## Chamber_of_Secrets    261.9  616.9  878.8
## Prisoner_of_Azkaban   249.5  547.1  796.6
## Goblet_of_Fire        290.0  606.8  896.8
## Order_of_the_Phoenix  292.0  647.8  939.8
## Half_Blood_Prince     301.9  632.4  934.3
## Deathly_Hallows_1     295.9  664.3  960.2
## Deathly_Hallows_2     381.0  960.5 1341.5
## Total                2389.7 5332.9 7722.6
## All                  2389.7 5332.9 7722.6
```

Adding a colon `:` selects the specified elements in a column.  

```r
all_harry_potter_matrix[1:4]
```

```
## [1] 317.5 261.9 249.5 290.0
```

We can also select values in an entire row or column. This can be useful for calculations. Here we calculate the mean of the entire second column. 

```r
non_us_earnings <- all_harry_potter_matrix[ ,2]
mean(non_us_earnings)
```

```
## [1] 1599.87
```

## Practice
Below are data collected by three scientists (Jill, Steve, Susan in order) measuring temperatures of eight hot springs.

```r
spring_1 <- c(36.25, 35.40, 35.30)
spring_2 <- c(35.15, 35.35, 33.35)
spring_3 <- c(30.70, 29.65, 29.20)
spring_4 <- c(39.70, 40.05, 38.65)
spring_5 <- c(31.85, 31.40, 29.30)
spring_6 <- c(30.20, 30.65, 29.75)
spring_7 <- c(32.90, 32.50, 32.80)
spring_8 <- c(36.80, 36.45, 33.15)
```

1. Build a data matrix that has the springs as rows and the columns as scientists.  

```r
springs_cool <- c(spring_1, spring_2, spring_3, spring_4, spring_5, spring_6, spring_7, spring_8)
temp_hot_springs <- matrix(springs_cool, nrow= 8, byrow= T)
scientists <- c("Jill", "Steve", "Susan")
springs <- c("spring_1", "spring_2", "spring_3", "spring_4", "spring_5", "spring_6", "spring_7", "spring_8")
colnames(temp_hot_springs) <- scientists
rownames(temp_hot_springs) <- springs
temp_hot_springs
```

```
##           Jill Steve Susan
## spring_1 36.25 35.40 35.30
## spring_2 35.15 35.35 33.35
## spring_3 30.70 29.65 29.20
## spring_4 39.70 40.05 38.65
## spring_5 31.85 31.40 29.30
## spring_6 30.20 30.65 29.75
## spring_7 32.90 32.50 32.80
## spring_8 36.80 36.45 33.15
```

```r
Springs <- c(spring_1, spring_2, spring_3, spring_4, spring_5, spring_6, spring_7, spring_8)
Springs
```

```
##  [1] 36.25 35.40 35.30 35.15 35.35 33.35 30.70 29.65 29.20 39.70 40.05 38.65
## [13] 31.85 31.40 29.30 30.20 30.65 29.75 32.90 32.50 32.80 36.80 36.45 33.15
```

```r
temps_hot_springs <- matrix(Springs, nrow= 8, byrow = T)
temps_hot_springs
```

```
##       [,1]  [,2]  [,3]
## [1,] 36.25 35.40 35.30
## [2,] 35.15 35.35 33.35
## [3,] 30.70 29.65 29.20
## [4,] 39.70 40.05 38.65
## [5,] 31.85 31.40 29.30
## [6,] 30.20 30.65 29.75
## [7,] 32.90 32.50 32.80
## [8,] 36.80 36.45 33.15
```


Let's name the rows and columns. Start by making two new vectors with the names.

```r
scientists <- c("Jill", "Steve", "Susan")
springs <- c("Bluebell Spring", "Opal Spring", "Riverside Spring", "Too Hot Spring", "Mystery Spring", "Emerald Spring", "Black Spring", "Pearl Spring")
rownames(temp_hot_springs) <- springs
temp_hot_springs
```

```
##                   Jill Steve Susan
## Bluebell Spring  36.25 35.40 35.30
## Opal Spring      35.15 35.35 33.35
## Riverside Spring 30.70 29.65 29.20
## Too Hot Spring   39.70 40.05 38.65
## Mystery Spring   31.85 31.40 29.30
## Emerald Spring   30.20 30.65 29.75
## Black Spring     32.90 32.50 32.80
## Pearl Spring     36.80 36.45 33.15
```

2. Use `colnames()` and `rownames()` to name the columns and rows.  

```r
colnames(temp_hot_springs) <- scientists
rownames(temp_hot_springs) <- springs
temp_hot_springs
```

```
##                   Jill Steve Susan
## Bluebell Spring  36.25 35.40 35.30
## Opal Spring      35.15 35.35 33.35
## Riverside Spring 30.70 29.65 29.20
## Too Hot Spring   39.70 40.05 38.65
## Mystery Spring   31.85 31.40 29.30
## Emerald Spring   30.20 30.65 29.75
## Black Spring     32.90 32.50 32.80
## Pearl Spring     36.80 36.45 33.15
```

Calculate the mean temperature for each spring. Notice the command `rowMeans`.

```r
rowMeans(temp_hot_springs)
```

```
##  Bluebell Spring      Opal Spring Riverside Spring   Too Hot Spring 
##         35.65000         34.61667         29.85000         39.46667 
##   Mystery Spring   Emerald Spring     Black Spring     Pearl Spring 
##         30.85000         30.20000         32.73333         35.46667
```

```r
#mean_vector <- rowMeans(matrix, temp_hot_springs)
#mean_vector
```

3. Add `mean_vector` as a new column.  

```r
new_temp_springs <- cbind(temp_hot_springs, rowMeans(temp_hot_springs))
new_temp_springs
```

```
##                   Jill Steve Susan         
## Bluebell Spring  36.25 35.40 35.30 35.65000
## Opal Spring      35.15 35.35 33.35 34.61667
## Riverside Spring 30.70 29.65 29.20 29.85000
## Too Hot Spring   39.70 40.05 38.65 39.46667
## Mystery Spring   31.85 31.40 29.30 30.85000
## Emerald Spring   30.20 30.65 29.75 30.20000
## Black Spring     32.90 32.50 32.80 32.73333
## Pearl Spring     36.80 36.45 33.15 35.46667
```


## That's it, let's take a break!   

--> On to [part 2](https://jmledford3115.github.io/datascibiol/lab2_2.html)  

[gh]: www.github.com  
[gd]: https://desktop.github.com/
[BIS15]: https://github.com/jmledford3115/BIS15-W20-DataScienceBiologists
