## INTRO TO R WORKSHOP
## Center for Research Data and Digital Scholarship
## University of Colorado, Boulder

## N. Chardon
## 20 Sept / 10 Oct 2017

## Aims: 
## 1. Install R and RStudio
## 2. Understand R & its interface
## 3. Create objects
## 4. Practice basic functions to explore a data frame 
## 5. Check data frame with basic functions
## 6. Manipulate data frame
## 7. Save data files for future use 
## 8. Read in text and numeric data files 
## 9. Write organized scripts

## Using this script:
## 1. The symbol '#' denotes comments. 
##    If in the same line as a command, these comments describe what the command executes.
## 2. All sections labeled 'PRACTICE' are meant to be completed on your own. 
## 3. The corresponding voiceover to this script is available on OSF (https://osf.io/6jb9t/)

## Disclaimer: This script was written by Nathalie Chardon and reflects her coding style. 
## The University of Colorado, Boulder takes no responsibility for the content.




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 1. INSTALL R AND RSTUDIO # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # DOWNLOAD R # # ---------------------------------------------------------------------------------

# Visit < https://cran.r-project.org/ >

# Choose your operating system (OS)

# Download base R package file (.exe for PC and .dmg for Mac)

# If prompted: 'run' don't 'save' file

# Follow any remaining prompts


# # DOWNLOAD R STUDIO # # --------------------------------------------------------------------------

# Visit < https://www.rstudio.com/products/rstudio/download/ >

# Download free version for your OS

# Follow prompts

# Open RStudio and load this [attached] script




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # WELCOME! # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# Introduce yourself to your neighbor(s)


# How is R used in your field and amongst your colleagues? 


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 2. UNDERSTAND R AND ITS USER INTERFACE # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # WHAT IS R? # # ---------------------------------------------------------------------------------

# 1. Open source programming language first released in 1997 with several updates released each year

# 2. Software environment for statistical computing and graphics

# 3. Interpreted language typically accessed through command-line interpreter

# 4. Widely used for statistics, data mining, and developing statistical software

# 5. Used across a variety of fields in the sciences and humanities

# 6. Allows user to create and distribute new functions and packages

# 7. Different editors available (e.g., RStudio, TinnR)


# # WHAT IS A SCRIPT? # # --------------------------------------------------------------------------

# Text file (.R) with executable written code and user comments 


# # GETTING STARTED # # ----------------------------------------------------------------------------

# Open RStudio

# Set preferences: Tools --> Preferences (Windows) or RStudio --> Preferences (Mac)

# General: restore most recent

# Code: 
# Editing: tab width, matching parens/quotes
# Display: show margin column (< 100)

# Appearance: option to change font, size, theme

# Pane layout: source, console, environment, files/plots/etc.

# Git/SVN: option to enable version control


# Keyboard shortcuts: Tools --> Keyboard Shortcuts


# # CONSOLE # # ------------------------------------------------------------------------------------

# Current version is listed 

# Executing commands (i.e. telling R what you want it to do):

# 1. '>' is the prompt (i.e. "Hi I'm R, what do you want me to do now?")

# 2. Type code (i.e. "Hi I'm your new user, this is what I want you to do.") in Console or R Script

# 3. Hit 'enter' in Console or 'run' in Script

# Keyboard shortcut:	Ctrl+Enter (Windows) or	Command+Enter (Mac)

# CAUTION: This will run the line you're on until the called function is over, so if your 
# function is incomplete then R will run until it encounters a stopping point. Another option
# is to highlight the section you want to run and then using the keyboard shortcut.


# Calculations: R can be used as a calculator

4 + 5 #execute this command in both the Console and Script

4 * 
  5 #execute this command from the Source Script (i.e. here) with the keyboard shortcut

# NOTE: R is running the operation (multiplying) over two lines with the keyboard shortcut.


# Functions: R can execute pre-defined functions (arguments in parentheses) that return a value

sum(4, 5) #sums numbers

sum 4, 5 #Why does this not work?


print('I am a new R user and this is my first text output!') #prints text


# Use 'up' arrow to retrieve last function

# Common mistake: unfinished command --> '+' indicates unfinished command --> fix or 'Esc' to exit


# Not sure what a function does?

?prod


# # PRACTICE: Some calculations # # ----------------------------------------------------------------

# Using operators

3 * 4 - 2 #10

12 / 6

2 ^ 4


# Using functions

sum(1:10) #sums numbers in a sequence from 1 to 10

prod(2, 5) #multiplies numbers

sqrt(25) #square root

round(198.5894503, digits=4) #rounds number to specified digits

signif(198.5894503, digits=4) #gives number to specified total digits in scientific notation

abs(-103) #absolute value

cos(pi) #cosine of number in radians

rep('hello', 3) #repeats a specified object a specified number of times

rep('gruezi', 3) #repeat function

k <- seq(0, 20, 4) #sequence function: from, to, by


# Write 3 calculations with operators and 3 with functions and write answer as comment with '#'
#
#




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 3. DATA, OBJECTS, VECTORS, LISTS, MATRICES, DFs, ARRAYS # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # DATA # # ---------------------------------------------------------------------------------------

# Why digitize? 
#
#
# --> Allows analyses with computer program


# What is a data structure? 
#
#
# --> A certain way to organize digital data so it can be efficiently used


# # OBJECTS # # ------------------------------------------------------------------------------------

# Object: data structure with attributes of a certain class 

# Assigment operator: assigns objects on the right to objects on left

# Resulting objects stored in R's memory (the 'Environment')

# Keyboard shortcut: Alt+- (Windows) or	Option+- (Mac)


# Create two objects: 

a <- 4 #what is being assigned to what?

b <- 5


# Look at your objects:

a #run (i.e. execute) this

b #run this


# These objects a and b are now stored in R's memory, so we can use them: 

a + b

sum(a, b)


# NOTE! R is case sensitive, and objects cannot be named with spaces or existing functions.
# You can see this by running 'A' or 'B', which do not exist.


# # PRACTICE: Objects # #

# Change a to a different number, then re-add to b. What happens? (Hint: need to re-run a)
#
#

# Create a new object with the sum of a and b and look at it
#
#


# # VECTORS # # ------------------------------------------------------------------------------------

# Vector: sequence of data elements of same basic type

# Combine our existing objects:

myvector <- a, b #Does this work?

myvector <- c(a, b) #need c() function to concatenate elements


# Can also create vector with text data:

y <- 'bonjour' #need quotation marks for words

c <- c('ciao', 'gruezi') #still need to use c() to combine elements

mytextvector <- c(y, c) #what does this vector contain?


# # PRACTICE: Vectors # #

# Create a new vector with your two existing vectors
#
#

# Create 3 new objects and create a new vector with them
#
#


# # LISTS # # --------------------------------------------------------------------------------------

# List: contains sequence of data (numeric AND text; can contain other lists)


mylist <- list(myvector, mytextvector) #list created maintaining original data type and allocation

# Now, look at this list: how is this different than a vector?
#
#


class(mylist) #class of ll

length(mylist) #length of ll


# # PRACTICE: Lists # #

# Create your own list with 3 vectors
#
#


# What class is your list? 
#
#


# How long is your list?
#
#


# NOTE: We discuss indexing of dataframes below, but with lists are indexed with:

mylist[2] #[ ] to return a list with data in it

mylist[[2]] #[[ ]] to return the actual data


# # MATRICES # # -----------------------------------------------------------------------------------

# Matrix: data in 2D rectangular layout (numeric OR text)

# matrix() fills in elements vertically by column

numbs <- seq(1, 100, 5) #create a vector for matrix

mm1 <- matrix(data = numbs, ncol=2) #specify columns

mm2 <- matrix(data = numbs, nrow=2) #specify rows

mm3 <- matrix(data = numbs, nrow=2, byrow=TRUE) #fill elements horizontally by row


# # PRACTICE: Matrices # #

# Create 2 matrices of different dimensions with the same data
#
#


# # DATAFRAMES # # ---------------------------------------------------------------------------------

# Dataframe (DF): list of vectors of equal length (numeric AND text)

# EXAMPLE: 

data(mtcars)

head(mtcars) #first six rows of DF

# What do the rows and columns represent? 
#
#
# --> Recorded observations (rows) for specified variables (columns)


# Open mtcars from Environment to see full dataframe


# Why can this not be a matrix?
#
#
# --> Contains both text and numeric data


# # ARRAYS # # -------------------------------------------------------------------------------------

# Array: an object with more than 2D (numeric and text)

# EXAMPLE: If car models are tested every year for the same variables, could make array




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 10 MINUTE BREAK # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 




# # BUILDING A DATAFRAME # # -----------------------------------------------------------------------

# We will build a DF here to explore what that is. Generally you'd simply load your data into R, 
# which will read it as a data frame (or a list, but this gets complicated).

# Create a vector of colors of 5 clothes you're wearing and look at it

mycolors <- c('red', 'black', 'blue', 'blue', 'white') #replace these with your clothes' colors


# Indexing in 1D

mycolors[2] #the 2 represents = 


# Create vector with your preference for each color 

myprefs <- c(2, 3, 1, 1, 4) 


# Ask your neighbor for their preferences 

yourprefs <- c(3, 1, 2, 2, 4) 


# Create DF out of your three vectors

mydf <- data.frame(colors = mycolors, 
                   preference = myprefs, 
                   preference_neighbor = yourprefs) #combines 3 vectors with these column names


# Now, look at dd: how did R know to match your preference to a certain color?
#
#


# Indexing in 2D

# I. Using brackets: R thinks in [ROWS, COLUMNS]

mydf[2,1] #this is =


# II. Using $ : element name (i.e. column names of our DF)

mydf$colors[2] #this is =


# What color is in the 5th row? Color =
#
#


# Change column names

colnames(mydf) <- c('colors', 'pref', 'pref_neighb')


# Now, look at mydf: what changed? Change =
#
#


# ADD TO DF # --------------------------------------------------------------------------------------

# I. Add new vector to exisiting DF

mydf$clothes <- c('hat', 'pants', 'scarf', 'socks') #clothes you are wearing in 'mycolors'

# ERROR: what happened? Error because = 


# Now, add a vector as dd$clothes that works
#
#
mydf$clothes <- c('hat', 'pants', 'scarf', 'socks', 'shoes')


# II. First create vector then add as new column

# Is your neighbor wearing clothes in those colors (yes=1, no=0)?

clothes_neighb <- c(1, 0, 1, 1, 0) 

mydf <- cbind(mydf, clothes_neighb) #combine existing DF with vector to add as new Column


# Now, look at mydf. What changed? Change = 
#
#


# REMOVE FROM DF # ---------------------------------------------------------------------------------

# Use [ ] to index rows and columns in DF
# Remember that R thinks in [ROWS, COLUMNS]

mydf_shorter <- mydf[-5,] #delete 5th row from mydf

mydf_smaller <- mydf[,-3] #delete 3rd column from mydf

# NOTE: We are creating a NEW DF that is subsetted, in order to not overwrite the original one.




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 4. EXPLORE DATAFRAME WITH BASIC FUNCTIONS # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # PRACTICE: Dataframe dimensions # #

dim(mydf) #rows, columns = 

nrow(mydf) #number of rows = 

ncol(mydf) #number of columns =


# # PRACTICE: Dataframe structure # #

str(mydf) #columns are numeric, character, or factor = 


# Numerical: numerical values (continuous, discrete, integers, etc.)

is.numeric(mydf$pref) #numeric =

is.numeric(mydf$clothes) #numeric =


# Factor: variables that have limited number of different values

levels(mydf$colors) #number of categories in the factor variable 'color' =

is.character(mydf$colors) #character = 


# Character: an object made up of string values

mydf$colors <- as.character(mydf$colors) #change to character for future analysis/adding data to DF

is.character(mydf$colors) #character? = 


# Now, check structure of dataframe again: what changed? Change = 
#
#


# # ADVANCED PRACTICE: Be aware of any numeric variables as factor! # #

mydf$clothes_neighb <- as.factor(mydf$clothes_neighb) #make 'pref_clothes' variable a factor variable

str(mydf$clothes_neighb) #check structure of this column

mydf$clothes_altered <- as.numeric(mydf$clothes_neighb) #factor LEVEL, not orginal numeric value, assigned

mydf$clothes_altered_correct <- as.numeric(as.character(mydf$clothes_neighb)) #correct tranformation




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 5. CHECK DATA WITH BASIC FUNCTIONS # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # PRACTICE: Checking data # # 

# Summary function

summary(mydf) #of every column

summary(mydf$pref) #of one column


# Data maximum

max(mydf$pref)


# Data minimum

min(mydf$pref)


# What is the minimum, maximum, and mean of your neighbor's preferences?
#
#


# Data range

range(mydf$pref)


# Unique entries

unique(mydf$colors) #lists all unique entries

length(unique(mydf$colors)) #number of unique entries


# What are the unique entries for your clothes?
#
#


# How many different unique entries does your clothes column have?
#
#


# Sort data

sort(mydf$pref) #sorts by increasing numeric order

mydf_rev <- mydf[order(mydf$pref),] #orders the entire mydf by 'pref' 





# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 6. DF MANIPULATION # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # NA VALUES # # ----------------------------------------------------------------------------------

# What if you don't have a preference for a color in 'mycolors'?

mydf$no_pref <- c('NA', 3, 1, 1, 'NA') #insert 'NA' for color you don't have a preference for


# Calculate mean of your new preferences

mean(mydf$no_pref) #ERROR: 'argument is not numeric or logical'

# Check structure of your DF
#
#


# Change character to numeric

mydf$no_pref <- as.numeric(mydf$no_pref) #NAs introduced, ok because we know we have 'NA' values


# Try calculating mean again
#
#


#Why is mean NA? 
#
#
# --> R can't do math with 'NA' values

mean(mydf$no_pref, na.rm=T) #tell R to remove 'NA' values for purposes of calculation


# Locate your 'NA' values

which(is.na(mydf$no_pref)) #where are your 'NA' values = 


# # PRACTICE: NA values # #

# How many NA values do you have in no_pref?
#
#



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 7. SAVE / EXPORT DATA # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # SAVE # # ---------------------------------------------------------------------------------------

# Save DF created in R: useful for future use, email to collaborators, etc.

save(mydf, file='~/Desktop/mydf.RData') #saves DF as .RData in Desktop

# NOTE: The content behind the last / will be the new file.


# WORKING DIRECTORY

# Set a directory to prevent re-typing path every time

# Once set, no need to type 'Desktop' as above 

# Use 'tab' key for options after each '/'

setwd('/PATH') #full path (insert PATH for your computer)

setwd('~/PATH') #abbreviated path with '~' (insert PATH for your computer)


# # EXPORT # # -------------------------------------------------------------------------------------

# Export DF to Excel: useful for publication tables, collaborators that don't use R, etc. 

install.packages('openxlsx') #install the corresponding R package (do this only once)

library(openxlsx) #need to load package into environment for every new R session


write.xlsx(mydf, file='mydf.xlsx') #export DF as .XLSX file

write.csv(mydf, file='mydf.csv') #or export DF as .CSV file



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 8. READ IN DATA # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# Load .CSV file: use this type of file whenever possible

data_C <- read.csv('mydf.csv')

# NOTE: The content behind the last / is the file to be read in to R.


# Load .XLSX file: use for files with multiple sheets

data_X <- read.xlsx('mydf.xlsx', sheet=1) #this file only has 1 sheet


# Load .RData file: use for data frames already created in R

load('mydf.RData') #DF with original name, not this file name, is now in R's environment


# # PRACTICE: Read in data # #

# Set your working directory to one of your folders containing a .CSV or .XLSX data file.
#
#

# Create an object (in this case, dataframe) with your data file. 
#
#




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 9. WRITING SCRIPTS # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # PRACTICE: Organizing your script # # 

# Initialize each script with general information (e.g., project, name, date, aims, generated DFs)

# Clear R's memory at beginning of script: rm(list=ls())

# Write descriptive comments using '#' that are useful to YOU

# Split code into manageable sections and limit length of text line

# Use '_' instead of spaces

# Only keep relevant code in main body of script

# Dedicate a folder within each project folder on computer for corresponding R scripts

# Cite R in your work:

citation() 


# SAVING:

# Save .RData files in ONE place (e.g. 'project_name_YEAR/r_data/first_df.RData')

# Save generated DFs in one place (e.g. 'project_name_YEAR/results/first_df.xlsx')

# Save scripts in one place (e.g. 'project_name_YEAR/scripts/first_script.R')




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

# Data Carpentry
# Parts of this workshop reference the following lesson: 
# < http://www.datacarpentry.org/R-genomics/01-intro-to-R.html >

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