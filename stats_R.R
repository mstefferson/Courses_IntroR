## STATISTICS IN R WORKSHOP
## Center for Research Data and Digital Scholarship
## University of Colorado, Boulder

## N. Chardon
## 2 Nov / 8 Nov 2017

## Aims: 
## 1. Explore raw data to identify research questions and corresponding hypotheses
## 2. Identify and execute appropriate statistical tests for (1)
## 3. Check if assumptions of tests in (2) are met
## 4. Visualize and interpret results


## Using this script:
## 1. The symbol '#' denotes comments. 
##    If in the same line as a command, these comments describe what the command executes.
## 2. All sections labeled 'PRACTICE' are meant to be completed on your own. 
## 3. The corresponding voiceover to this script is available on OSF: https://osf.io/6jb9t/


## Disclaimer: This script was written by Nathalie Chardon and reflects her coding style. 
## The University of Colorado, Boulder takes no responsibility for the content.




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # WELCOME! # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# Introduce yourself to your neighbor(s)


# What statistical tests are used in your field, by your colleagues, and by you? 




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # GETTING STARTED # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # R REVIEW # # -----------------------------------------------------------------------------------

# Executing commands (i.e. telling R what you want it to do):

# 1. '>' is the prompt (i.e. "Hi I'm R, what do you want me to do now?")

# 2. Type code (i.e. "Hi I'm your new user, this is what I want you to do.") in Console or R Script

# 3. Hit 'enter' in Console or 'run' in Script

# Keyboard shortcut:	Ctrl+Enter (Windows) or	Command+Enter (Mac)


# # INSTALL PACKAGES & LOAD DATA # # ---------------------------------------------------------------

install.packages('car') #install package needed later on

library(car) #load package into R's environment

data(mtcars) #bring mtcars dataset into environment




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 1. RAW DATA # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # DATA # # --------------------------------------------------------------------------------------- 

# What is in your data? 

head(mtcars) #displays first 6 rows of dataframe

?mtcars #documentation for this data, useful to create for own data as separate text file

summary(mtcars) #statistical summary of each column


# How is your data organized? 

colnames(mtcars) #column names

str(mtcars) #structure: make sure your numeric variables are numeric! 

dim(mtcars) #rows, columns


# # WHAT TO TEST # # -------------------------------------------------------------------------------

# What is a question you could answer with this sample data?
#
#

# EX1: Does transmission type (am) affect miles/gallon (mpg)? 

# EX2: Does horsepower (hp) affect 1/4 mile time (qsec)?


# NOTE: Best practice is, of course, to decide on your research questions prior to data collection.


# # HYPOTHESES # # ---------------------------------------------------------------------------------

# Null hypothesis (H_0): statement you expect to prove false (e.g. no effects)

# Alternative hypothesis (H_A): opposite from H_0, what you expect to happen (e.g. effects)


# What are you corresponding hypotheses (H_0 and H_A) to your question? 
#
#


# What are your hypotheses (H_0 and H_A) for EX1 and EX2?
#
#

# H1_0: Manual and automatic transmission cars have the same mpg.

# H1_A: Manual transmission cars have higher mpg.


# H2_0: Horsepower does not influence acceleration (1/4 mile time).

# H2_A: Cars with higher horsepower accelerate (have a lower 1/4 mile time) faster.


# Why set a specific null hypothesis? 

# Statistical testing = hypothesis testing

# Designed to reject, or not reject, a null hypothesis based on the data.

# They do not allow you to find evidence for, just evidence AGAINST, a statement.




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 2. STATISTICAL TESTS # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# INTERPRETING STATISTICAL TESTS: P-VALUE # --------------------------------------------------------

# Probability of observing an effect given that H_0 is TRUE = observing an effect when there
# is actually no effect (false positive: Type I error). 

# We want this probability to be very low, and 5% chance is accepted in many fields.

# Significance level (alpha) is what you decide this probablity should be.

# EX: If p-value = 0.05, there is only a 5% chance your statistical test found an effect even though 
# there is none. If we set alpha = 0.05, we can REJECT H_0, as we found evidence AGAINST it.


# WHICH TEST TO USE? # -----------------------------------------------------------------------------

# For EX1 and EX2, define the independent variable, dependent variable, and variable type for each. 
# EX1: Does transmission type (am) affect miles/gallon (mpg)? 
# EX2: Does horsepower (hp) affect 1/4 mile time (qsec)?
#

# EX1

# independent variable, type (numerical continuous or discrete counts) =  transmission

# dependent variable, type =  mpg


# EX2

# independent variable, type = horsepower

# dependent variable, type = 1/4 mile time


# WILCOXON-MANN-WHITNEY TEST # ---------------------------------------------------------------------

# H_0 to test: sample means of dependent variable are equal

# Independent variable = 2 independent groups

# Dependent variable = numerical continuous

# Which of the two examples can we test with this?
#
#


# Perform a Wilcoxon-Mann-Whitney test:

wil_test <- wilcox.test(mtcars$am, mtcars$mpg) #x, y (independent, dependent variable)

# NOTE: Use additional argument (paired = TRUE) if your observations are paired (ex: before-after).


# Call wil_test to see what the probability of this result is, if H_0 were true?
#
#


# Will you reject H_0? Why or why not?
#
#


# YOUR WILCOXON-MANN-WHITNEY TEST # ----------------------------------------------------------------

# Establish hypotheses for another relationship in mtcars
# HINT: Look for categorical and numeric variables with ?mtcars
#
#

# H_0: 

# H_A:


# Create an object with a Wilcoxon-Mann-Whitney test testing this relationship
#
#


# Call your model object to decide if you reject your H_0
#
#

# reject? = 


# SIMPLE LINEAR REGRESSION # -----------------------------------------------------------------------

# H_0 to test: slope of dependent variable is 0 (there is no relationship between x and y)

# Independent variable = numerical continuous

# Dependent variable = numerical continuous

# Which of the two examples can we test with this?
#
#


# Perform a simple linear regression: 

lm(qsec ~ hp, data = mtcars) #linear model fit of (y ~ x, data = your dataframe)

# What does this output tell you?
#
#

# Intercept = 

# Slope of regression line =

# y = b + mx -->


# Store model as an object for interpretation with summary()

mod <- lm(qsec ~ hp, data = mtcars)

summ_mod <- summary(mod) #create object of model summary (this object is a list)


# Look at summ_mod. What does the second line of 'Coefficients' tell you?
#
#

# t value: estimate / std. error (used to find p-value) 

# Pr(>|t|): p-value for the t-test of H_0 (coefficient estimate or slope = 0) 
# --> Proportion of sample t distribution greater than t value, relative to 'null distribution'
# that has no effects.


# Do you reject H_0?
# Yes!
#


# YOUR SIMPLE LINEAR REGRESSION # ------------------------------------------------------------------

# Establish a H_0 for another relationship in mtcars
# HINT: Look for numeric continuous variables
#
# mpg vs wt 

# H_0: 


# Create an object with a linear regression model testing this relationship
#
#

mymod <- lm(mpg ~ wt, data = mtcars)

my_summ_mod <- summary(mymod)

# pairs(mtcars)

# mymod <- lm(qsec ~ wt, data = mtcars)

my_summ_mod <- summary(mymod)
# Look at your model object and write out the equation of the modeled slope
#
#

# y = b + mx
# y = mymod$coefficients[1] + mymod$coefficients[2] * x

# Call summary() on your model object to decide if you reject your H_0
#
#

# reject? = 


# PRACTICE # ---------------------------------------------------------------------------------------

# Visit <https://feliperego.github.io/blog/2015/10/23/Interpreting-Model-Output-In-R> 
# and <https://stats.idre.ucla.edu/sas/output/regression-analysis/>
# to interpret and understand other model outputs.


# EXTRACTING MODEL ELEMENTS

# Coefficients

summ_mod$coefficients #all coefficients

summ_mod$coefficients[2,1] #row 2, column 1 of coefficients (= estimate for hp)

# Extract the standard error and p-value of hp, and the estimate for the intercept
#
#

summ_mod$coefficients[2,2] #standard error of hp

summ_mod$coefficients[2,4] #p-value of hp

summ_mod$coefficients[1,1] #estimate for intercept


# Residuals

summ_mod$residuals


# R-squared and adjusted r-squared 

summ_mod$r.squared #r squared

summ_mod$adj.r.squared #adjusted r squared


# NOTE: Some elements in summ_mod contain just one value, others contain a longer vector or matrix. 
# This means that individual values can either be extracted by calling that list element (with $), 
# or by indexing a position within a list element(with $ and [])


# Practice extracting other elements from summ_mod
# HINT: run str(summ_mod) to check what else this list contains
#
#




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 3. ASSUMPTIONS # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# WILCOXON-MANN-WHITNEY TEST VS. T-TEST # ----------------------------------------------------------

# WILCOXON-MANN-WHITNEY TEST: is non-parametric (does not assume a certain data distribution).

# T-TEST: assumes a normal distribution of your dependent variable.


# Check if mpg from EX1 is normally distributed:

hist(mtcars$mpg, breaks = 10) #histogram of mpg with 10 splits (or 'bins')

# NOTE: Q-Q plots (discussed below) are a better way to check normality because histograms can look
# drastically different depending on the number of bins used.

# Could you use a t-test to determine if manual vs. automatic transmission cars have different mpg?
#
#


# YOUR WILCOXON-MANN-WHITNEY TEST ASSUMPTIONS # ----------------------------------------------------

# Check if your dependent variable from your test is normally distributed with a histogram as above
#
#


# THREE BASIC ASSUMPTIONS OF LINEAR REGRESSION # ---------------------------------------------------

# 1. LINEAR RELATIONSHIP between x and y

plot(qsec ~ hp, data = mtcars) 

# Is this relationship linear?
#
#


# 2. Residuals have normal distribution & are independent and identically distributed

# IID: independent & identically distributed

# Residual = y - sample mean of y

# Residual standard error = average amount that residuals deviate from regression line


# Create object with residual values

res_mod <- resid(mod) #model residuals


# Check for NORMALITY with a probability (= quantile or Q-Q) plot

qqnorm(res_mod, main = 'Normal Q-Q plot of residuals') #plots residual quantiles ~ normal quantiles

# NOTE: Quantiles = percentile under which the data falls (EX: 0.25 quantile = 25th percentile = 
# 25% of the data lies below this point, which is -1 for a normal distribution)

qqline(res_mod) #reference line for normal distribution (deviations from line = non-normal)

# Do residuals follow a NORMAL distribution?
#
#

# NOTE: Another data characteristic we can see here is that there are few data at the lowest and 
# upper quantiles, which affects these quantiles. 


# Check for INDEPENDENCE

plot(res_mod ~ mtcars$hp, main = 'Residuals of qsec ~ hp') #plots residuals ~ independent variable

# Are residuals INDEPENDENT of explanatory variable?
# HINT: Is there a random or non-random clustering of the residuals across x-variable?
#
#


# Check for IDENTICALLY DISTRIBUTED residuals (homoscedasticity)

plot(qsec ~ hp, data = mtcars, main = 'qsec ~ hp') #plots raw data

abline(mod) #add fitted linear regression line

# Are the residuals EQUALLY DISTRIBUTED across the regression line?
# HINT: Look at the distance from each point to the line (= residual).
#
#

# SYNTHESIS: Does the model qsec ~ hp meet the basic assumptions of simple linear regression?
#
#


# YOUR SIMPLE LINEAR REGRESSION ASSUMPTIONS # ------------------------------------------------------

# 1. LINEARITY: Plot your y ~ x to check if the relationship is linear
#
#
qqline(res_mod)

# 2. Residuals have a) NORMAL DISTRIBUTION & are b) INDEPENDENT and c) IDENTICALLY DISTRIBUTED
# Create an object of your residuals 
#
#


# 2.a) NORMAL DISTRIBUTION: Create a qq plot & qqline of your residuals to check normality
#
#
qqnorm(res_mod, main = 'Normal Q-Q plot of residuals') #plots residual quantiles ~ normal quantiles
qqline(res_mod)

# 2.b) INDEPENDENCE: Plot (residuals ~ x variable) to check for residual independence from x
#
#

plot( res_mod ~ hp, data = mtcars )
# 2.c) IDENTICAL DISTRIBUTION: Plot (y ~ x) and add your regression line to check distance to line 
# for each data point
#
#


# SYNTHESIS: Does your model meet the basic assumptions of simple linear regression?
#
#


# PRACTICE # ---------------------------------------------------------------------------------------

# # 3rd ASSUMPTION of linear regression # #

# 3. Little to no multicollinearity (high correlation) in the independent variables

# Visit <https://www.statmethods.net/stats/rdiagnostics.html> for examples on how to check this


# # LINEAR REGRESSION VS. NON-PARAMETRIC TESTS # #

# SIMPLE LINEAR REGRESSION: assumes normal distribution of dependent variable

# NON-PARAMETRIC CORRELATION: non-parametric distribution of dependent variable 

# cor.test(x1, x2) #test correlation between variable 1 and variable 2


# SIMPLE LOGISTIC REGRESSION: categorical dependent variable & no normal distribution of residuals

# glm(y ~ x, data = your dataframe) #generalized linear model fit

# NOTES: 

# a) Still need to check assumptions! 
# <http://www.statisticssolutions.com/assumptions-of-logistic-regression/>

# b) Y must be factor variable (can convert with as.factor() )


# # OTHER STATISTICAL TESTS # #

# Visit <https://stats.idre.ucla.edu/other/mult-pkg/whatstat/> to understand what statistical
# tests to use with other combinations of dependent and independent variables. 

# Click on the 'R' link for a certain test to see example R code.




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# # 4. VISUALIZATION # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# WILCOXON-MANN-WHITNEY TEST # ---------------------------------------------------------------------

# Create subset data frames corresponding to the groups compared

man_tran <- mtcars[which(mtcars$am == 0),] #subset of am = 0 (need "," because extracting all rows)

aut_tran <- mtcars[which(mtcars$am == 1),] #subset of am = 1


# Create color for each group 

man_col <- rgb(0.1,0.1,0.1,0.5) #vector of (red, blue, green, alpha = transparency) between 0 and 1

aut_col <- rgb(1,0,0,0.4)

# NOTE: Can also specify this within histogram function instead of creating separate objects.


# Plot distributions of each group

hist(man_tran$mpg, #mpg of manual transmission group
     
     main = 'Histogram of MPG of manual and automatic transmission cars', #plot title
     
     xlab = 'Miles per gallon', #x-axis title
     
     xlim = c(10, 35), #create plotting space to encompass all data
     
     col = man_col) #color

hist(aut_tran$mpg, breaks = 10, #mpg of automatic transmission group
     
     add = TRUE, #adds this histogram to previous one
     
     col = aut_col)


# Why do we need to adjust the breaks in the second histogram?
# HINT: Run the code above without the 'breaks' argument.
#
#


# Add legend to last plot

legend('topright', #legend position (topright, bottomright, bottomleft, topleft)
       
       legend = c('manual', 'automatic'), #legend text
       
       pch = c(15,15), col = c(man_col, aut_col)) #symbol and color (needs to be in same order!)
       
       
# Add more descriptive legend to last plot

pval_wil <- round(wil_test$p.value, digits = 15) #round to specified (15) digits

legend('topright', #legend position (topright, bottomright, bottomleft, topleft)
       
       legend = c('manual', 'automatic',
                  
                  #paste text in quotations and extract text from other objects:
                  paste('p-value = ', pval_wil)), #concatenate strings separated by commas

       pch = c(15, 15, 15), col = c(man_col, aut_col, 'white')) #symbol and color

# NOTES: a) Third symbol invisible as p-value doesn't have a color.

# b) Legend only overwriting because it is larger than the first.

# c) Explain what statistical test you used in figure legend.


# SIMPLE LINEAR REGRESSION # -----------------------------------------------------------------------

# Review: add title, x-axis and y-axis labels to this plot
#
#

plot(qsec ~ hp, data = mtcars)


# Review: add regression line to plot

abline(mod)


# Add legend summarizing statistical results

int_mod <- round(summ_mod$coefficients[1,1], digits=2) #intercept value

est_mod <- round(summ_mod$coefficients[2,1], digits=2) #estimate value

pval_mod <- round(summ_mod$coefficients[2,4], digits=5) #p-value

r_mod <- summ_mod$adj.r.squared #adjusted r-squared = 0.48

legend('topright',
       
       legend = c(paste('y = ', int_mod, '+', est_mod, 'x'), #y = b + mx
                  
                  paste('p-value = ', pval_mod), #p-value
                  
                  expression(paste(r^2, ' = 0.48')))) #expression for mathematical text or symbols
         

# R-squared: how well model (in this case, regression) fits the data (0 = no fit, 1 = perfect fit)
# --> % of variation in y described by variation in x

# Adjusted r-squared: adjusts r-squared based on number of variables, important because r-squared
# increases with increasing number of variables


# PRACTICE # ---------------------------------------------------------------------------------------

# # YOUR HISTOGRAM FOR WILCOXON-MANN-WHITNEY TEST # #

# Follow example above to create a histogram illustrating your test results:

# Subset your data
#

# Create color vectors for each independent variable group
#

# Plot distribution of each group in one figure with hist() 
# HINT: Don't forget to add argument (add = TRUE) & set bin sizes to be equal between each group
#

# Add a basic legend
#

# Add a legend that describes your statistical result
# HINT: First create an object with your p-value that then you can insert using paste()
#


# # YOUR SCATTERPLOT FOR YOUR SIMPLE LINEAR REGRESSION TEST # #

# Follow example above to create a plot illustrating your linear regression results:

# Plot your data and give your plot a title and axes labels
#

# Add your linear regression line to your plot with abline()
#

# Add legend summarizing your statistical results
# HINT: First create objects with intercept, estimate, p-value, and r-squared values
#




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # REFERENCES # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# Ryan E. Langendorf and Katherine Lawry provided insightful comments and suggestions.

# Parts of this workshop reference University of Virgina, Laerd Statistics, idre, and Khan Academy:
# <http://data.library.virginia.edu/understanding-q-q-plots/>
# <https://statistics.laerd.com/statistical-guides/hypothesis-testing-3.php>
# <https://stats.idre.ucla.edu/other/mult-pkg/whatstat/>
# <https://www.khanacademy.org/math/ap-statistics/bivariate-data-ap/assessing-fit-least-squares-regression/v/r-squared-or-coefficient-of-determination>




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # RESOURCES # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # CU BOULDER # #

# Center for Research Data and Digital Scholarship
# Hacky Hours: Wednesdays 4-6PM (Norlin E206)
# Events: < http://www.colorado.edu/crdds/events >
# Listserv: < https://lists.colorado.edu/sympa/subscribe/crdds-news >
# Workshop voiceovers and scripts: < https://osf.io/6jb9t/ >

# Laboratory for Interdisciplinary Statistical Analysis
# <http://www.colorado.edu/lab/lisa/resources>


# # ONLINE SUPPORT # # 

# R Cheat Sheets:
# <https://www.rstudio.com/resources/cheatsheets/>

# Data Carpentry
# <http://www.datacarpentry.org/R-ecology-lesson/04-visualization-ggplot2.html>

# R manuals by CRAN
# <https://cran.r-project.org/manuals.html>

# Basic Reference Card
# <https://cran.r-project.org/doc/contrib/Short-refcard.pdf>

# R for Beginners (Emmanuel Paradis)
# <https://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf>

# The R Guide (W. J. Owen)
# <https://cran.r-project.org/doc/contrib/Owen-TheRGuide.pdf>

# An Introduction to R (Longhow Lam)
# <https://cran.r-project.org/doc/contrib/Lam-IntroductionToR_LHL.pdf>

# Cookbook for R
# <http://www.cookbook-r.com/>

# Advanced R (Hadley Wickham)
# <http://adv-r.had.co.nz/>

# rseek: search most online R documentation and discussion forums
# <http://rseek.org/>

# The R Inferno: useful for trouble shooting errors
# <http://www.burns-stat.com/documents/books/the-r-inferno/>

# Google: endless blogs, posted Q & A, tutorials, references guides where you're often
# directed to sites such as Stackoverflow, Crossvalidated, and the R-help mailing list.


# # ONLINE TUTORIALS # #

# YouTube R channel
# <https://www.youtube.com/user/TheLearnR>

# R Programming in Coursera
# <https://www.coursera.org/learn/r-programming>

# Various R videos
# <http://jeromyanglim.blogspot.co.uk/2010/05/videos-on-data-analysis-with-r.html>



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
