

list.of.packages <- c("kableExtra","patchwork","sandwich","lmtest","corrplot","fastDummies",
                      "kableExtra","car","jtools","tidyquery","Hmisc","gridExtra",
                      "scales","reshape","hrbrthemes","GGally","viridis","iplots","MASS","epitools","fpp","fpp2"
                      ,"tidyverse","patchwork","lubridate","tsibble","feasts","forecast","sandwich","lmtest","nycflights13","blsR","rlang")

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
library(rlang)
library(fpp2)
library(fpp)
library(epitools)
library(tidyverse)
library(jtools)
library(magrittr)
library(ggplot2)
library(patchwork)
library(lmtest)
library(rstudioapi)
library(car)
library(kableExtra)
library(scales)
library(tidyquery)
library(Hmisc)
library(gridExtra)                              # Install & load scales
library(scales)
library(reshape)
library(GGally)
library(hrbrthemes)
library(GGally)
library(viridis)


library(tidyverse)
library(patchwork) 

library(lubridate)

library(tsibble)
library(feasts)
library(forecast)

library(sandwich)
library(lmtest)

library(nycflights13)
library(blsR)


get_my_wd <- function()
{
  current_doc <- getActiveDocumentContext()$path 
  current_path <- str_replace(str_replace(paste(gsub("(.*)/.*","\\1",current_doc),"")," ",""), " ","")
  return(current_path)
}

fileandpath <- function(filename)
{
  my_file <- paste(directory,"/",filename,sep="")
  return(my_file)
}
