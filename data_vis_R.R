## DATA VISUALIZATION IN R WORKSHOP
## Center for Research Data and Digital Scholarship
## University of Colorado, Boulder

## N. Chardon
## 11 Oct 2017

## Aims: 
## 1. Consider what is sensible to plot
## 2. Practice making figures with base package
## 3. Practice making figures with lattice package
## 4. Practice making figures with ggplot2 package
## 5. Save figures in different formats


## Using this script:
## 1. The symbol '#' denotes comments. 
##    If in the same line as a command, these comments describe what the command executes.
## 2. All sections labeled 'PRACTICE' are meant to be completed on your own. 
## 3. The corresponding voiceover to this script is available on OSF (https://osf.io/6jb9t/)

## Disclaimer: This script was written by Nathalie Chardon and reflects her coding style. 
## The University of Colorado, Boulder takes no responsibility for the content.




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # WELCOME! # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# Introduce yourself to your neighbor(s)


# What kinds of graphics are used in your field and created by your colleagues? 




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # GETTING STARTED # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # INSTALL & LOAD PACKAGES # # ---------------------------------------------------------------------

# lattice package

install.packages('lattice') #only run this once to store package to hard drive

library(lattice)


# ggplot2 package

install.packages('ggplot2') #only run this once to store package to hard drive

library(ggplot2)


# # LOAD DATA # # ----------------------------------------------------------------------------------

data(mtcars)




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 1. WHAT TO PLOT # # 

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


# # QUESTIONS # # -----------------------------------------------------------------------------------

# What are some questions you could answer with this data?
#
#

# EX1: Does cylinder (cyl) number affect miles/gallen (mpg)? 

# EX2: Does horsepower (hp) affect 1/4 mile time (qsec)?


# Think about sensible relationships between your data before plotting.




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # 2. BASE # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # DISTRIBUTION OF DATA: HISTOGRAMS # # ------------------------------------------------------------

hist(mtcars$mpg) #create histogram

hist(mtcars$mpg, breaks=20) #define splits


# Create histograms of horsepower and 1/4 mile time with different splits
#
#


# Plot aesthetics

hist(mtcars$mpg, 
     
     main = 'Histogram of miles/gallon', #title (note the quotation marks)
     
     xlab = 'Miles/gallon', #x axis label
     
     col = 'lightblue') #color fill

# NOTE: These aesthetics commands are the same in other plot types. 
# Each subsequent command MUST follow a comma. 


# Change the plot aesthetics of your horsepower or 1/4 mile time histograms
#
#


# # DATA RELATIONSHIPS: SCATTERPLOTS # # -----------------------------------------------------------

plot(qsec ~ hp, data = mtcars) #dependent variable ~ independent variable, data = your DF


# Adding regression line to plot

lin_mod <- lm(qsec ~ hp, data = mtcars) #linear model for relationship that looks promising

summary(lin_mod) #check model output for significance, r-squared, etc.

abline(lin_mod) #adds regression line to current plot (usually only sensible if p-value < 0.05)


# Aesthetics: plot point color, symbol, and size

plot(qsec ~ hp, data = mtcars, 
     
     col = 'violet', #changes color, default = 'black'
     
     pch = 18, #changes symbol, default = 1
     
     cex = 1.5) #changes point size, default = 1


# Aesthetics: regression line color, type, and width

abline(lin_mod, #adds regression line to current plot
       
       col = 'blue', #changes color, default = 'black'
       
       lty = 4, #changes line type, default = 1
       
       lwd = 1.5) #changes line width, default = 1


# Create a scatterplot with one of your relationships of interest
#
#


# Add title, x- and y-axis labels, and change the color, symbol, and size of your points
#
#

# Add a regression line to your plot
#
#


# # DATA RELATIONSHIPS: BOXPLOTS # # ---------------------------------------------------------------

# Boxplots: better with discrete or categorical measurements in independent variables

boxplot(mpg ~ cyl, data = mtcars)


# # SETTING DEFAULT GRAPHICAL PARAMTERS # # --------------------------------------------------------

# NOTE: These settings can also be specified within a plotting function to affect only that plot.

# Aesthetics
par(cex = 2, #changes size of plotting text and symbols
    
    cex.axis = 1.2, #changes axis text size
    
    cex.lab = 1.4, #changes label text size
    
    cex.main = 1.3, #changes text title size
    
    col = 'violet', #changes plotting color
    
    col.axis = 'grey', #changes axes colors
    
    col.lab = 'darkblue', #changes x and y label colors
    
    col.main = 'darkblue', #changes title color
    
    bg = 'grey') #changes background color

# NOTE: The default axis and label size in R is too small for publication figures.

# Run one of your plots above and notice how it has changed according to the par settings


# Multi-panel plots

par(mfrow = c(2, 2), #rows, columns for your panels
    
    mar = c(4.5, 5, 2, 0.5)) #defines width for lower, left, upper, and right margins

# NOTE: Multi-panel plot with default margin settings will have too much white space. 

# Run 4 of your plots above and notice how they'll create a panel


# Return to default graphical parameters

dev.off() #turns off device and clears plots


# # PRACTICE 1 # # ---------------------------------------------------------------------------------

# Set the default parameters to create a 2 row panel plot.
# HINT: This plot will have the rows, columns = 2,1.
#
#

# Create a scatterplot and boxplot for two different data relationships
#
#

# Add titles and axes labels, and use the aesthetic commands above to change other plot aspects.
# Go to <http://www.statmethods.net/advgraphs/parameters.html> for list of all par options
#
#

# TIP 1: Modify and use the function mtext() to add labels to your panels

mtext('A', 3, adj=0, cex=1.5) #run ?mtext for further arguments to this function


# TIP 2: Plotting multiple boxplots for the same variable

boxplot(mpg ~ cyl, data = mtcars[which(mtcars$am == 0),], #data subsetted by transmission type
        
        main = 'Effect of cylinder number and transmission type on MGP', #title
        
        xlab = 'Number of cylinders', #x-axis label
        
        ylab = 'Miles per gallon', #y-axis label 
        
        ylim = range(mtcars$mpg), #set y-axis limits with range of data for adequate plotting space
        
        boxwex = 0.1) #set box width
        
boxplot(mpg ~ cyl, data = mtcars[which(mtcars$am == 1),], #data subsetted by transmission type
        
        add = T, #adds to current boxplot
        
        col = 'grey', #specify different color for new gear number
        
        boxwex = .1, #same box width as above
        
        at = c(1.2, 2.2, 3.2), #draw boxes at specified 1:n
        
        axes = F) #don't draw new axes


# TIP 3: Adding legends

legend('topright', #location of legend
       
       legend = c('Automatic Transmission', 'Manual Transmission'), #legend text
       
       pch = c(0, 15), #symbols to match text above
       
       col = c('black', 'grey')) #colors to match symbols and text above

# NOTE: The order of legend text, symbol, and color must match!


# # PLOT ACTIONS # # -------------------------------------------------------------------------------

# Zoom plot to separate window


# Export plot manually 


# Export plot with commands

setwd('~/Desktop/') #set working directory to folder of your choice

setwd('c:/Users/.../Desktop/') #Windows: replace ... with your username


pdf('fig1.pdf') #function AND file extension indicates in what format to save plot in

boxplot(mpg ~ cyl, data = mtcars) #create plot

dev.off() #indicates that you are done plotting


# Other formats: replace 'pdf' line of code above with one of the following...

png('fig1.png') #saves plot as PNG

jpeg('fig1.png') #saves plot as JPEG

postscript('fig1.eps') #saves pot as EPS

# NOTE: PDF and EPS are vectorized, whereas PNG and JPEG are rasterized. 
# Vectorized images: created out of many paths, so quality is higher
# Raster images: created out of pixels, so quality is lower


# Save one of your plots with commands
#
#



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # LATTICE # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # ONE VARIABLE PLOTS # # -------------------------------------------------------------------------

densityplot(~ mpg, data = mtcars) #displays density of data points


# # TWO VARIABLE PLOTS # # -------------------------------------------------------------------------

dotplot(rownames(mtcars) ~ mpg, data = mtcars) #dotplot to visualize all observations

# NOTE: Need to give your data rows names for the above to work, but can use any y variable here.


# # THREE+ VARIABLE PLOTS # # ----------------------------------------------------------------------

# All relationships 

splom(mtcars) #scatterplot matrix


# Trellis graphs: display relationships between variables conditioned on one or more variables

xyplot(mpg ~ cyl | am, data = mtcars) #plots relationship x ~ y | based on another variable

# Plot effect of transmission type on MPG, split by number of cylinders
#
#


xyplot(mpg ~ cyl | am, groups = carb, data = mtcars) #additionally split by groups

# Plot effect of cylinder on MPG, split by carburetor and transmission in different colors
#
#


# # PLOT AESTHETICS # # ----------------------------------------------------------------------------

# Modified with update()

trell_plot <- xyplot(mpg ~ cyl | am, groups = carb, data = mtcars) #create plot object


# Run the following and notice how your plot changes

update(trell_plot, 
       
       main = 'Effect of cylinder and carburetors on MPG by transmission type', #add title
       
       ylab = 'Cylinders', xlab = 'Miles per Gallon',
       
       auto.key = T) #add legend


update(trell_plot, 
       
       auto.key = list(space = 'right')) #add legend right of plot


update(trell_plot, 
       
       auto.key = list(title = 'Carburetors', #add legend title
                       
                       cex = 0.5)) #change legend size


# Choose any one of your plots and:
# 1. Add a title, x and y axes labels, and a legend;
# 2. Then save it as a PDF or JPEG
#
#
#
       
                        

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# # GGPLOT2 # # 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 


# # Grammar of Graphics: build graphs from a few necessary components # # --------------------------
# 1. data set (data)
# 2. aesthetics that represent data (aes)
# 3. visual marks to represent data points (geoms)
# (4. coordinate system)

# NOTE: ggplot() does not have defaults, so everything must be specified somewhere.


# 1. Create a plot with DATA and 2. AES

myplot <- ggplot(data = mtcars, aes(x = hp, y = mpg)) #saving as object facilitates adding layers

# Look at myplot: what do you notice?


# 3. Add GEOM layer

myplot + #plus symbol at end of line for new layer below
  
  geom_point() #plot data as points


# Create a ggplot to illustrate one of your relationships of interest 
#
#


# # PLOT AESTHETICS: DATA POINTS # # ---------------------------------------------------------------

# Color of data points

myplot +
  
  geom_point(color = 'blue', #adds color to points
             
             size = 4) #increases size of points


# Transparency to avoid overplotting

myplot +
  
  geom_point(alpha = 0.5) #adds transparency to points
             

# Conditioning on a third variable

myplot +
  
  geom_point( aes(color = cyl) ) #color by another variable with aes()

myplot +
  
  geom_point( aes(size = cyl) ) #size of points by another variable


# Enlarge the points of myplot and condition the data points on cylinder by color to make myplot2
# HINT: all arguments go inside geom_point()
#
#


# # PLOT AESTHETICS: LABELS # # --------------------------------------------------------------------

myplot2 +
  
  ggtitle('Effect of horsepower on MPG by cylinder') +
  
  xlab('Horsepower') + 
  
  ylab('Miles per Gallon')


# OR indicate all labels at once: 

myplot2 +
  
  labs(title = 'Effect of horsepower on MPG by cylinder', #title
       
       x = 'Horsepower', y = 'Miles per Gallon') #x and y axes labels


# Create an object myplot3 with the above plot
#
#


# # PLOT AESTHETICS: LEGEND # # --------------------------------------------------------------------

# Remove legend

myplot3 +
  
  theme(legend.position = 'none') #no legends


# Edit legend

myplot3 +
  
  theme(legend.position = 'left') + #can be 'bottom', 'top', 'left' or 'right'
  
  labs(color = 'Cylinder') #change legend title
  
  
# # PRACTICE 2 # # ---------------------------------------------------------------------------------

# Change legend colors to discrete: need to change variable to factor (numeric gives gradient)

ggplot(data = mtcars, aes(x = hp, y = mpg, 
                          
                          group = factor(cyl), #change variable to factor
                          
                          colour = factor(cyl))) + #specify color with grouping variable used above
  
  geom_point() #no need to specify anything here
  

# # PLOT THEMES # # --------------------------------------------------------------------------------

# Default themes

myplot3 +
  
  theme_classic()

myplot3 +
  
  theme_bw()


# Customize your own theme

mytheme <- theme(axis.text.x = element_text(colour = 'black', size = 25), #x axis text size
                 
                 axis.text.y = element_text(colour = 'black', size = 25), #y axis text size
                 
                 axis.title.x = element_text(size = 28), #x axis label size
                 
                 axis.title.y = element_text(size = 28), #x axis label size
                 
                 plot.title = element_text(size = 30, #title size
                                           
                                           hjust = 0.5)) #align title to center
                 
myplot3 + mytheme #plot now has specified theme


# Create your own theme
#
#

# Create an object myplot4 with myplot3 and your new theme
#
#


# # PRACTICE # # -----------------------------------------------------------------------------------

# Set a plot theme for all plots

theme_set(theme_classic()) #sets theme for future plots

myplot3 #this now plots with set theme

# NOTE: Once theme is set, there is no neat way to return to ggplot default graphical parameters


# # SAVE PLOT # # ----------------------------------------------------------------------------------

ggsave(myplot4, #plot to be saved
       
       file='hpVmpg.pdf') #can save in many other image formats (e.g. .eps, .jpeg, .png)

# Save one of your plots to the Desktop
#
#


#NOTE: Set your working directory again if changed

setwd('~/Desktop/') #set working directory to folder of your choice

setwd('c:/Users/.../Desktop/') #Windows: replace ... with your username




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

# Parts of this workshop reference Quick-R, Statmethod, and Data Carpentry: 
# <http://www.statmethods.net/graphs/index.html> 
# <http://www.statmethods.net/advgraphs/trellis.html>
# <http://www.datacarpentry.org/R-ecology-lesson/04-visualization-ggplot2.html>

# Graphical Parameters cheatsheet
# <http://www.statmethods.net/advgraphs/parameters.html>

# Data Visualization with ggplot2 Cheat Sheet:
# <https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf>

# Other Cheat Sheets:
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
