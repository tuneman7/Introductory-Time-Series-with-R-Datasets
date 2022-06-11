

list.of.packages <- c("kableExtra","patchwork","sandwich","lmtest","stargazer","corrplot","fastDummies",
                      "kableExtra","car","jtools","tidyquery","jtools","hash","mcprofile","Hmisc","gridExtra",
                      "scales","reshape","hrbrthemes","GGally","viridis","iplots","MASS","epitools")

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
library(epitools)
library(tidyverse)
library(jtools)
library(magrittr)
library(ggplot2)
library(patchwork)
library(sandwich)
library(lmtest)
library(stargazer)
library(rstudioapi)
library(car)
library(kableExtra)
library(scales)
library(tidyquery)
library(jtools)
library(hash)
library(mcprofile)
library(Hmisc)
library(gridExtra)                              # Install & load scales
library(scales)
library(reshape)
library(GGally)
library(hrbrthemes)
library(GGally)
library(viridis)
#library(iplots)


get_my_wd <- function()
{
  current_doc <- getActiveDocumentContext()$path 
  current_path <- str_replace(str_replace(paste(gsub("(.*)/.*","\\1",current_doc),"")," ",""), " ","")
  return(current_path)
}

directory <-get_my_wd()
print(get_my_wd())
print(the_file)

fileandpath <- function(filename)
{
  my_file <- paste(directory,"/",filename,sep="")
  return(my_file)
}
