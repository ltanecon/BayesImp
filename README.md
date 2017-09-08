# BayesImp
The Bayesian Imputation Method

##INSTALLATION GUIDE

Step 1: Install the dependent package [REBayes](https://cran.r-project.org/web/packages/REBayes/index.html)

Step 1-a: Install required system environment for package REBayes

•	Install software [Mosek](https://www.mosek.com/downloads/)
•	Obtain Mosek license ([free academic license available](https://license.mosek.com/academic/)) 
•	Install the R to Mosek interface package [Rmosek](http://rmosek.r-forge.r-project.org/)

Step 1-b: Install package [REBayes](https://cran.r-project.org/web/packages/REBayes/index.html) from CRAN

Step 2: Install package BayesImp from Github with the following R code:

    library(devtools)
    install_github("ltanecon/BayesImp")

##INTRODUCTION

This R package includes the Bayesian imputation method introduced in the paper:

Tan, Li (2017), Imputing Top-Coded Income Data in Longitudinal Surveys, Working Papers.

##USAGE

Raw data containing top-coded income observations is first orginzed by `Format_Input.R` to create a formatted `data.frame` for further process. 

Example:

    set.seed(1)
    df_processed <- Format_Input(id = rep(1:10,each=10), wave = rep(1:10,10), income = runif (100,1,10000), CPI = rep(1,100), weight = 1, bottom.threshold=1, top.threshold = runif(100,9000,10000)) 
    
    #Definition of the arguments:
    #id Vector of a unique longitudinal identifier for a survey unit across all waves.
    #wave	Vector of survey data collection waves.
    #income	Vector of income subject to income top-coding corrsponding to id and wave.
    #CPI	Vector of the CPI corrsponding to wave.
    #weight	Vector of survey weight corrsponding to id. If not provided, equal weight will be assigned for every survey unit.
    #bottom.threshold	
Vector of income bottom-coding threshold corrsponding to id and wave, or a single number if the threshold is the same across survey units and waves. If not provided, the default value is 1.
    #top.threshold	
Vector of income top-coding threshold corrsponding to id and wave, or a single number if the threshold is the same across survey units and waves.
    
Formatted data for the 1996 Analytic Sample used in Tan (2017): `SIPP1996Analytic.rda`

    
