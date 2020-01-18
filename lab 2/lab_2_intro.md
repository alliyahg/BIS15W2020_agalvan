---
title: "Lab 2: Data Matrices & Data Frames"
author: "Joel Ledford"
date: "Winter 2020"
output: 
  ioslides_presentation: 
    keep_md: yes
---



## Setup
1. Login to the lab computer.  
2. Open Github Desktop (it should be pre-installed) and login.  
3. Clone your repository to the desktop or somewhere convenient to access.  
4. Navigate to github.com and login.  
5. Go to the class repository `BIS15-W20-DataScienceBiologists`, click the `Clone or download` button then `Download zip` to the desktop.  
6. Copy the files for today's lab from the class repository and paste them into **your** repository.  
7. Open today's lab in RStudio.  

## Homework
- Take 5 minutes or so to double check that your homework is complete and uploaded.
- Suggestion: have a lab partner have a look at your repository. 
- Have a look at Lily's solution.  



```r
b <- sum(new_blackjack)
r <- sum(new_roulette)
if (b < r) {print("roulette")} 
if (r < b) {print("blackjack")}
```

```
## [1] "blackjack"
```

## Branches
- I add comments to your code using a new branch in github.  
- You see this as a `pull request`.  
- You can decide whether or not to accept the changes.  

## Mini-Review from last time
1. What is the association between `R` and `R Studio`?  
2. What is the association between `github.com` and `GitHub Desktop`?  
3. What is an `object` in R? 
4. Which two `classes` of data do you think will be used most?
5. What is a `vector` in R?  

## Vectors
- I think of vectors as rows in a spreadsheet.  
- R makes guesses on the class of data in a vector, but may be wrong.  

```r
new_vector <- c(2, 4, 6) #what if these were sample numbers?
class(new_vector)
```

```
## [1] "numeric"
```


```r
new_vector <- as.factor(new_vector)
class(new_vector)
```

```
## [1] "factor"
```

## Last Logistics
- BIS 098 is P/NP.  
- If you want BIS15L, please see me for a CRN.  
