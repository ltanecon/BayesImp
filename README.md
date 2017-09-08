# BayesImp
The Bayesian Imputation Method

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

This R package includes the Bayesian imputation method introduced in the paper:

Tan, Li (2017), Imputing Top-Coded Income Data in Longitudinal Surveys, Working Papers.

## USAGE

Raw data containing top-coded income observations is first orginzed by `Format_Input.R` to create a formatted `data.frame` for further process. Example of output see: `SIPP1996Analytic.rda`

`GB2MLE.R` estimates the GB2 parameters for each wave of the formatted data. Example of output see: `Example_GB2_param.rda`

`Imputation_Method.R` generates the imputed income values from the Bayesian imputation method.


