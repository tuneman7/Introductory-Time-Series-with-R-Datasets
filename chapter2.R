list.of.packages <- c("rstudioapi","tidyverse")

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
library(rstudioapi)
library(tidyverse)
get_my_wd <- function()
{
  current_doc <- getActiveDocumentContext()$path 
  current_path <- str_replace(str_replace(paste(gsub("(.*)/.*","\\1",current_doc),"")," ",""), " ","")
  return(current_path)
}

directory <-get_my_wd()

r_file = paste(directory,"/functions.R",sep="")
print(get_my_wd())
print(r_file)

source(r_file)

print(fileandpath("Herald.dat"))

Herald.dat <- read.table(fileandpath("Herald.dat"), header = T)
attach (Herald.dat)

#We now use R to calculate the covariance for the Herald Square pairs in
#three different ways:
x <- Herald.dat$CO; y <- Herald.dat$Benzoa; n <- length(x)
sum((x - mean(x))*(y - mean(y))) / (n - 1)
mean((x - mean(x)) * (y - mean(y)))
cov(x, y)

#The correspondence between the R code above and the expectation defini-
#  tion of covariance should be noted:
#mean((x - mean(x))*(y - mean(y))) → E [(x − μx )(y − μy )]

