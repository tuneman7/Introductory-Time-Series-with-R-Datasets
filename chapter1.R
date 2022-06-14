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

the_file = paste(directory,"/functions.R",sep="")
print(get_my_wd())
print(the_file)


source(the_file)



data("AirPassengers")
AP <-AirPassengers
AP
class(AP)
start(AP); end(AP); frequency(AP)

plot(AP, ylab = "Passengers (1000's)")

layout(1:2)
plot(aggregate(AP))
boxplot(AP ~ cycle(AP))

#www <- "http://www.massey.ac.nZ/~pscowper/ts/Maine.dat"
directory <-get_my_wd()

the_file = paste(directory,"/Maine.dat",sep="")
Maine.month <- read.table(the_file, header=TRUE)
attach(Maine.month)
class(Maine.month)
Maine.month.ts <- ts(unemploy, start = c(1996, 1), freq = 12)
Maine.annual.ts <- aggregate(Maine.month.ts)/12

layout(1:2)
plot(Maine.month.ts, ylab= "unemployed (%)")
plot(Maine.annual.ts, ylab= "unemployed (%)")
Maine.Feb <- window(Maine.month.ts, start = c(1996,2), freq = TRUE)
Maine.Aug <- window(Maine.month.ts, start = c(1996,8), freq = TRUE)
Feb.ratio <- mean(Maine.Feb) / mean(Maine.month.ts)
Aug.ratio <- mean(Maine.Aug) / mean(Maine.month.ts)
Feb.ratio
Aug.ratio


the_file = paste(directory,"/USunemp.dat",sep="")
Maine.month <- read.table(the_file, header=TRUE)

US.month <- read.table(the_file, header=TRUE)
attach(US.month)
US.month.ts <- ts(USun, start=c(1996,1), end=c(2006,10), freq = 12)
plot(US.month.ts, ylab = "unemployed (%)")

the_file = paste(directory,"/cbe.dat",sep="")
CBE <- read.table(the_file, header = T)
CBE[1:4, ]
class(CBE)

Elec.ts <- ts(CBE[, 3], start = 1958, freq = 12)
Beer.ts <- ts(CBE[, 2], start = 1958, freq = 12)
Choc.ts <- ts(CBE[, 1], start = 1958, freq = 12)
plot(cbind(Elec.ts, Beer.ts, Choc.ts))


AP.elec <- ts.intersect(AP, Elec.ts)
start(AP.elec)
end(AP.elec)
AP.elec[1:3, ]
AP <- AP.elec[,1]; Elec <- AP.elec[,2]
layout(1:2)
plot(AP, main = "", ylab = "Air passengers / 1000's")
plot(Elec, main = "", ylab = "Electricity production / MkWh")
plot(as.vector(AP), as.vector(Elec),
       xlab = "Air passengers / 1000's",
       ylab = "Electricity production / MWh")
abline(reg = lm(Elec ~ AP))
cor(AP, Elec)


layout (1:2)

the_file = paste(directory,"/pounds_nz.dat",sep="")
Z <- read.table(the_file, header = T)
Z[1:4,]
Z.ts <- ts(Z, st = 1991, fr = 4)
plot(Z.ts, xlab = "time / years",
         ylab = "Quarterly exchange rate in $NZ / pound")
Z.92.96 <- window(Z.ts, start = c(1992, 1), end = c(1996, 1))
Z.ts <- ts(Z, st = 1991, fr = 4)
Z.96.98 <- window(Z.ts, start = c(1996, 1), end = c(1998, 1))
layout (1:2)
plot(Z.92.96, ylab = "Exchange rate in $NZ/pound",
         xlab = "Time (years)" )
plot(Z.96.98, ylab = "Exchange rate in $NZ/pound",
         xlab = "Time (years)" )


Global <- scan("~/w271_stuff/Introductory-Time-Series-with-R-Datasets/global.dat")
Global.ts <- ts(Global, st = c(1856, 1), end = c(2005, 12),
                    fr = 12)
Global.annual <- aggregate(Global.ts, FUN = mean)
plot(Global.ts)
plot(Global.annual)



plot(stl(Elec.ts,s.window=8))
plot(decompose(Elec.ts))
Elec.decom <- decompose(Elec.ts, type = "mult")
 plot(Elec.decom)
 Trend <- Elec.decom$trend
 Seasonal <- Elec.decom$seasonal
 ts.plot(cbind(Trend, Trend * Seasonal), lty = 1:2)
 
 