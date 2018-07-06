## TEXT ANALYSIS IN R WORKSHOP
## Center for Research Data and Digital Scholarship
## University of Colorado, Boulder

## N. Chardon, D. Dearth, N. Eichmann-Kalwara
## 29 Nov 2017

## Aims: 
## 1. Download large text dataset
## 2. Create workable version of text dataset through preprocessing
## 3. Develop basic understanding of text analysis with word clouds, frequency graphs, 
##    and co-occurence lists


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


# What text analyses are used in your field, by your colleagues, and by you? 




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # GETTING STARTED # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # Why Text Analysis? # # -------------------------------------------------------------------------

# Text Analysis: exploratory text mining method to 'macroscopically' read texts 

# Goal: find patterns and trends in a text or other unstructured data

# Such patterns and trends facilitate traditional close-readings and qualitative analysis of data


# # Why use R? # # ---------------------------------------------------------------------------------

# R, similar to Python, is increasingly used for a variety of methods beyond statistical analysis:

# computational social science

# digital humanities methods

# network analysis data visualization


# Can easily expand your methodological toolbelt in R

# Free, open-source, vibrant community of users and developers who use it that can provide support 


# # R REVIEW # # -----------------------------------------------------------------------------------

# Executing commands (i.e. telling R what you want it to do):

# 1. '>' is the prompt (i.e. "Hi I'm R, what do you want me to do now?")

# 2. Type code (i.e. "Hi I'm your new user, this is what I want you to do.") in Console or R Script

# 3. Hit 'enter' in Console or 'run' in Script

# Keyboard shortcut:	Ctrl+Enter (Windows) or	Command+Enter (Mac)


# # INSTALL & LOAD PACKAGES # # --------------------------------------------------------------------

install.packages('tm') #install package for text analysis

install.packages('wordcloud') #package for creating wordcloud

install.packages('ggplot2') #package for plotting in ggplot


library(tm) #load package into R's environment

library(wordcloud)

library(ggplot2)

library(RColorBrewer) #color palette


# # SET WORKING DIRECTORY # # ----------------------------------------------------------------------

setwd('~/Desktop/') #set working directory (MAC)

setwd('c:/Users/.../Desktop/') #WINDOWS: replace ... with your username


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 1. DATA # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # DATA # # --------------------------------------------------------------------------------------- 

# Download TWO text files from 'Text Analysis in R' workshop on OSF: https://osf.io/6jb9t/

# Save these files in a new folder named 'texts' on your Desktop (nothing else in this folder!)


# MAC: Name directory (= folder) with your downloaded texts

mydirectory <- file.path('~', 'Desktop', 'texts') 


# WINDOWS: Name directory (= folder) with your downloaded texts

mydirectory <- file.path('C:', 'texts') 

dir(mydirectory) #set this directory


# Load texts into R's environment

texts <- VCorpus(DirSource(mydirectory)) #pulls copora from directory source ('mydirectory')


# # LOOK AT DATA # # -------------------------------------------------------------------------------

# Check both Frankenstein and Romeo_Juliet texts

summary(texts) #summary of contents in 'texts'

inspect(texts[1]) #data on first element in 'texts' = Frankenstein


# Inspect the second element of 'texts' = Romeo & Juliet (HINT: use [2])
#
#


# Which text has more characters?
#
#


# Create separate object named 'frank' with Frankenstein text

frank <- texts[1] #extracts first element of 'texts' 


# Create separate object named 'juliet' with Romeo & Juliet text (HINT: use [2])
#
#




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 2. PREPROCESSING # #                

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# Purpose # ---------------------------------------------------------------------------------------

# Need to think of text as data, with not all data being equal in importance

# Necessary to identify patterns, without unimportant data or noise, to determine meaning of text 

# R reads every character as unique, so need to standardize 


# Remove punctuation # -----------------------------------------------------------------------------

# WHY:
# 1. Allows words to be read identically (ex: postcolonial vs. post-colonial)
# 2. Punctuation and other special characters only look like more words to your computer and R

frank1 <- tm_map(frank, removePunctuation) #remove all punctuation


# Create an object named 'juliet1' that has punctuation removed
#
#


# Convert to lower case # --------------------------------------------------------------------------

# WHY: allows words to be read identically (Mother vs. mother)


frank2 <- tm_map(frank1, content_transformer(tolower))


# Create an object named 'juliet2' that has only lower case words
#
#


# Stemming # ---------------------------------------------------------------------------------------

# WHY: allows words to read identically (educating vs. educated)


frank3 <- tm_map(frank2, stemDocument, 'english')


# Create an object named 'juliet3' that has stemmed words
#
#


# Remove white space # -----------------------------------------------------------------------------

# WHY: spacing can be unimportant in text


frank4 <- tm_map(frank3, stripWhitespace)


# Create an object named 'juliet4' that has no white spaces
#
#


# Remove numbers # ---------------------------------------------------------------------------------

# WHY: page numbers and Optical Character Recognition (OCR) errors introduce noise


frank5 <- tm_map(frank4, removeNumbers)


# Create an object named 'juliet5' that has numbers removed
#
#


# Remove stop words # ------------------------------------------------------------------------------

# WHY: common words in a language that are used more frequently than the important words


# Remove common words in English language

rem_words <- read.csv('stop-word-list.csv', header = F) #read .CSV file of common English words

rem_words <- as.vector(rem_words$V1) #tranform data frame column to character vector

rem_words <- gsub(' ', '', rem_words) #remove spaces within character vector

frank6 <- tm_map(frank5, removeWords, rem_words) #remove words within vector created above


# Create an object named 'juliet6' that has stop words removed (HINT: last line of code above)
#
#




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 3. TEXT ANALYSIS # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# Document Term Matrix (DTM) # ---------------------------------------------------------------------

# DTM: Mathematical matrix that describes frequency of terms and needed for text analysis functions

frank_dtm <- DocumentTermMatrix(frank6) #creates DTM for Frankenstein text


# Create a DTM called 'juliet_dtm' for Romeo & Juliet text
#
#


# Export DTM to .CSV file

write.csv(as.matrix(frank_dtm), file = 'frank_dtm.csv') #Matrix of frank_dtm written to .CSV file


# Export 'juliet_dtm' to .CSV file
#
#


# Look at both 'frank_dtm.csv' and 'juliet_dtm.csv' on your computer
#
#




# Word Frequencies # -------------------------------------------------------------------------------

# Identify 50 most frequent words in 'frank_dtm'

findFreqTerms(frank_dtm, lowfreq = 50) #words with frequency > 49


# Which words are used more than 100 times in 'juliet_dtm'?
#
#


# Create vector 'frank_freq' with word frequencies

frank_freq <- colSums(as.matrix(frank_dtm)) #sums frequency of each word


# Look for least and most frequently used words in Frankenstein

frank_ordered <- sort(frank_freq) #orders words in ascending frequency 

head(frank_ordered) #displays first 6 terms (= 6 least frequently used words)

tail(frank_ordered) #displays last 6 terms (= 6 most frequently used words)


# Create vector 'juliet_freq' and then 'juliet_ordered' with word frequencies
#
#


# Look for least and most frequently used words in Romeo & Juliet
#
#




# Word Clouds # ------------------------------------------------------------------------------------

# Words with specified lower frequency limit

wordcloud(names(frank_freq), frank_freq, #wordcloud of (names, from frank_freq vector)
          
          min.freq = 100) #with minimum frequency = 100


# Maximum number of words & non-random placement of words

wordcloud(names(frank_freq), frank_freq, 
          
          max.words = 50, random.order = F) #maximum number of words = 100, non-random order


# Word frequency by color

wordcloud(names(frank_freq), frank_freq, min.freq = 100, 
          
          colors = brewer.pal(8, 'Accent')) #colors from brewer palatte  (?brewer.pal for more)


# Create at least one word cloud with 'juliet_freq'
#
#




# Frequency Graphs # -------------------------------------------------------------------------------

# Create word frequencies data frames (DF) to use in frequency graphs

frank_DF <- data.frame(word = names(frank_freq), freq = frank_freq) #dataframe of word frequencies

frank_DF100 <- subset(frank_DF, freq > 100) #subset to words with frequency > 100


# Create 'juliet_DF' and then 'juliet_DF100' to contain words with frequency > 100 
#
#


# Plot word frequencies

ggplot(frank_DF100, #pull data from this DF
       
       aes(x = reorder(word, -freq), y = freq)) + #words in descending freq. order (x) by freq. (y)
  
  geom_bar(stat = 'identity') + #plot data as bars corresponding to y value (= freq.)
  
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + #x-axis text at 45º and flush with axis
  
  xlab('Word') + ylab('Frequency') #x- and y-axis labels


# Plot word frequencies using 'juliet_DF100' data frame
#
#




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # PREPROCESSING: REVISITED # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Are there words in your frequency graph of Frankenstein you think should be removed?
#
#


# Remove frequent insignificant words not included in stoplist

rem_words_expanded <- c('one', 'more', 'now', 'upon', 'only', 'every', 'even', 'shall')

frank7 <- tm_map(frank6, removeWords, rem_words_expanded) #remove more words from last preprocessed


# Create a new DTM called 'frank_dtm2' with 'frank7' (HINT: use the function DocumentTermMatrix() )
#
#


# Create a new frequency vector called 'frank_freq2' with 'frank_dtm2' 
# (HINT: use the function colSums(as.matrix()) )
#
#


# Create a new wordcloud with frank_freq2: What changed from your last one? 
# (HINT: Copy the code for one of the wordclourds above and change 'frank_freq' to 'frank_freq2')
#
#




# # PRACTICE # # -----------------------------------------------------------------------------------

# Create a vector of words you think should be removed from Romeo & Juliet not included in stoplist
#
#


# Create 'juliet7' with these words removed
#
#


# Create a new DTM called j'uliet_dtm2' with 'juliet7' (HINT: use function DocumentTermMatrix() )
#
#


# Create a new frequency vector called 'juliet_freq2' with 'juliet_dtm2' 
# (HINT: use the function colSums(as.matrix()) )
#
#


# Create a new wordcloud with 'juliet_freq2': What changed from your last one? 
# (HINT: Copy the code for one of the wordclourds above and change 'juliet_freq' to 'juliet_freq2')
#
#




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # REFERENCES # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# This workshop references the following resources:

# <https://rstudio-pubs-static.s3.amazonaws.com/265713_cbef910aee7642dc8b62996e38d2825d.html>

# <https://cran.r-project.org/web/packages/tm/vignettes/tm.pdf>




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # RESOURCES # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # CU BOULDER # #

# Center for Research Data and Digital Scholarship

# Hacky Hours: Wednesdays 4-6PM (Norlin E206)

# Events: < http://www.colorado.edu/crdds/events >

# Listserv: < https://lists.colorado.edu/sympa/subscribe/crdds-news >

# Workshop voiceovers and scripts: < https://osf.io/6jb9t/ >


# # TEXT ANALYSIS: ONLINE SUPPORT # #

# R-Bloggers, Intro to Text Analysis with R by Tal Galili (2016)
# <https://www.r-bloggers.com/intro-to-text-analysis-with-r/>

# Programming Historian: Basic Text Processing in R, by Taylor Arnold and Lauren Tilton
# <https://programminghistorian.org/lessons/basic-text-processing-in-r>


# # TEXT ANALYSIS: BOOKS & ARTICLES # #

# Matthew Jockers (2017), Text Analysis with R for Students of Literature.
# <http://www.matthewjockers.net/text-analysis-with-r-for-students-of-literature/>

# David Robinson and Julia Silge (2017), Text Mining with R. 
# <http://shop.oreilly.com/product/0636920067153.do>

# Monica Maceli (2016), Introduction to Text Mining with R for Information Professionals.
# <http://journal.code4lib.org/articles/11626>


# # R ONLINE SUPPORT # # 

# R Cheat Sheets:
# <https://www.rstudio.com/resources/cheatsheets/>

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
