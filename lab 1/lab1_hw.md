---
title: "Lab 1 Homework"
author: "Alliyah Galvan"
date: "Winter 2020"
output:
  html_document: 
    keep_md: yes
    theme: spacelab
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code, keep track of your versions using git, and push your final work to our [GitHub repository](https://github.com/FRS417-DataScienceBiologists). I will randomly select a few examples of student work at the start of each session to use as examples so be sure that your code is working to the best of your ability.  

1. Navigate to the R console and calculate the following expressions.  
  + 5 - 3 * 2  
  + 8 / 2 ** 2  

```r
  + 5 - 3 * 2  
```

```
## [1] -1
```

```r
  + 8 / 2 ** 2
```

```
## [1] 2
```
  
2. Did any of the results in #1 surprise you? Write two programs that calculate each expression such that the result for the first example is 4 and the second example is 16.  

 + 2 + 2**1
 + 7 + 3**2

```r
 + 2 + 2**1
```

```
## [1] 4
```

```r
 + 7 + 3**2
```

```
## [1] 16
```
  

3. Make a new object `pi` as 3.14159265359.  

```r
pi <- 3.1459265359
```

4. Is `pi` an integer or numeric? Why? Show your code.  

```r
class(pi)
```

```
## [1] "numeric"
```

5. You have decided to use your new analytical powers in R to become a professional gambler. Here are your winnings and losses this week. Note that you don't gamble on the weekends!  

```r
blackjack <- c(140, -20, 70, -120, 240, NA, NA)
roulette <- c(60, 50, 120, -300, 10, NA, NA)
anyNA(blackjack)
```

```
## [1] TRUE
```

```r
anyNA(roulette)
```

```
## [1] TRUE
```

a. Build a new vector called `days` for the days of the week. 

```r
days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
```


We will use `days` to name the elements in the poker and roulette vectors.

```r
names(blackjack) <- days
names(roulette) <- days
```

b. Calculate how much you won or lost in blackjack over the week.  

```r
sum(blackjack[1:5])
```

```
## [1] 310
```


c. What is your interpretation of this result? What do you need to do to address the problem? Recalculate how much you won or lost in blackjack over the week.  

My interpretation is that I won 310. I needed to use brackets within the parentheses

d. Calculate how much you won or lost in roulette over the week.  

```r
sum(roulette[1:5])
```

```
## [1] -60
```


e. Build a `total_week` vector to show how much you lost or won on each day over the week. Which days seem lucky or unlucky for you?

Monday, Wednesday, and Fridays were lucky for me. Thursdays were unlucky for me. Tuesday requires more information.

```r
total_week <- c(blackjack, roulette)
total_week>=0
```

```
##    Monday   Tuesday Wednesday  Thursday    Friday      <NA>      <NA>    Monday 
##      TRUE     FALSE      TRUE     FALSE      TRUE        NA        NA      TRUE 
##   Tuesday Wednesday  Thursday    Friday      <NA>      <NA> 
##      TRUE      TRUE     FALSE      TRUE        NA        NA
```


f. Should you stick to blackjack or roulette? Write a program that verifies this below.  

I should stick to blackjack, even though I had luckier days while playing roulette.

```r
sum(blackjack[1:5]) > sum(roulette[1:5])
```

```
## [1] TRUE
```


## Push your final code to GitHub
