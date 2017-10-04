# BayesImp
The Bayesian Imputation Method (Preliminary Version)

## INSTALLATION GUIDE

Step 1: Install the dependent package [REBayes](https://cran.r-project.org/web/packages/REBayes/index.html)

Step 1-a: Install required system environment for package REBayes

•	Install software [Mosek](https://www.mosek.com/downloads/)
•	Obtain Mosek license ([free academic license available](https://license.mosek.com/academic/)) 
•	Install the R to Mosek interface package [Rmosek](http://rmosek.r-forge.r-project.org/)

Step 1-b: Install package [REBayes](https://cran.r-project.org/web/packages/REBayes/index.html) from CRAN

Step 2: Install package BayesImp from Github with the following R code:

    library(devtools)
    install_github("ltanecon/BayesImp")

## INTRODUCTION

In this R package, I focus on imputing top-coded income observations in longitudinal surveys. The standard approaches of imputation method in the literature originates from cross-sectional applications, in which top-coded observations are handled with a wave-by-wave basis. Although the standard approaches are frequently employed to impute the top-coded observations in longitudinal data applications, they are not designed to handle the extra dimension of complexity presented in longitudinal data, in which the same individual is tracked across periods. Ignoring this extra information available in sample will lead to many unfavorable consequences, including over-prediction of income volatility within individual. 

I develop two new imputation methods to tackle this problem. First, I show that the quality of imputed income values for top earners in longitudinal surveys can be improved significantly by incorporating information from multiple time periods into the imputation process in a simple way, which I refer to as rank-based method. The additional model complexity introduced by the rank-based method is very modest compared to the standard approaches, but the imputation accuracy is considerably improved both at the distributional and individual level. With the 1996 SIPP data, I show the rank-based method can reduce Root Mean Squared Error (RMSE) by 9% to 40% relative to the standard approaches. Moreover, I further improve on the rank-based method by developing an innovative, Bayesian-based method, which works even better empirically. It closely recovers the distributions of income levels and volatility, and at the same time has better imputation accuracy at the individual level: it reduces RMSE by 19% to 46% relative to the standard approaches. 

For more details, see my job market paper: 

Tan, Li (2017), Imputing Top-Coded Income Data in Longitudinal Surveys, Working Paper. [(link)](http://litaneconomics.com/Job_Market_Paper.pdf)

## USAGE

1. Input raw longitudinal information into a `data.frame` with `Format_Input.R`.

2. Generate imputed income values with `Imputation_Method.R`.




