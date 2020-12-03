#!/usr/bin/env Rscript

####################################################################################
# Practical session 6: intro to R
# claire.vandiedonck@u-paris.fr
###################################################################################

## Some very simple examples
2+2
exp(-2)
log(100,base=10)
?exp

## Managing your session
sessionInfo()
getwd()
#setwd()

## Assigning data into R objects, using and reading tem
x <- 2
y <- x+3
s <- "this is a string of characters"
x
y
x+x
x^y
x<-4
y
y<-x+3
y

#Managing objects in your R Session
ls()
rm(y)
ls()

#Saving your session, data and history
save(x,file="x.RData")
save.image(file="AllMyData.RData")
savehistory(file="MyHistory.Rhistory")
#load("x.RData")
#load("AllMyData.RData")

#Classes of R objects
x <- c(3,7,1,2)
x<2
x==2
class(x)
class(s)
as.numeric(x<2)

# Vectors
a <- c()
a
weight <- c(60, 72, 57, 90, 95, 72)
weight
4:10
seq(4,10)
seq(2,10,2)
rep(4,2)

rep(seq(4,10,2))
c(rep(1,4),rep(2,4))
c(5,s)
class(c(5,s))
length(1:10)
length(weight)
str(weight)

size <- c(1.75, 1.8, 1.65, 1.9, 1.74, 1.91)
size^2
bmi <- weight/size^2 
bmi

sort(size)
mean(size)
sd(size)
median(size)
min(size)
max(size)
range(size)
summary(size)

size[1]
size[2]
size[6]
size[c(2,6)]
size[c(6,2)]
min(size[c(6,2)])

names(size)
names(size) <- c("Fabien","Pierre","Sandrine","Claire","Bruno","Delphine")
size
str(size)

# Matrices
myData <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3, byrow = TRUE)
myData
myData <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3, byrow = FALSE)
myData

myData[1,2]
myData[2,1]
myData[,1]
myData[2,]
myData[,2:3]
dim(myData[,2:3])

dim(myData)
class(myData)
class(myData[,1]) 
str(myData)
nrow(myData)
ncol(myData)
length(myData[1,])
length(myData[,1])

myData2 <- cbind(weight, size, bmi)
myData2
myData3 <- rbind(weight, size, bmi)
myData3
#         Fabien   Pierre Sandrine   Claire    Bruno Delphine
#weight 60.00000 72.00000 57.00000 90.00000 95.00000  72.0000
#size    1.75000  1.80000  1.65000  1.90000  1.74000   1.9100
#bmi    19.59184 22.22222 20.93664 24.93075 31.37799  19.7363

myData2*2
summary(myData2)
mean(myData2)
mean(myData2[,1])

#dataframes
myDataf <- data.frame(weight, size, bmi)
myDataf
class(myDataf)
str(myDataf)
dim(myDataf)

class(myData2)
class(as.data.frame(myData2))
d <- as.data.frame(matrix(NA,2,3))
d
dim(d)
str(d)

myDataf[,2]
myDataf[,"size"]
myDataf$size

gender <- c("Man","Man","Woman","Woman","Man","Woman")
gender
myDataf$sex <- gender
myDataf$sex
myDataf
str(myDataf)

which ( myDataf$sex == "Woman") 
myDataf [ which ( myDataf$sex == "Woman") , ] 
str(myDataf [ which ( myDataf$sex == "Woman") , ])
which ( myDataf$sex != "Man")
which (! myDataf$sex == "Man")

grep("Wom", myDataf$sex)
grep("Woman", myDataf$sex)
myDataf [grep("Woman", myDataf$sex), ] 
grep("a", row.names(myDataf))
myDataf [grep("a", row.names(myDataf)),]

WomenDataf <- subset(myDataf, gender== "Woman")
WomenDataf

filteredData <- myDataf [ which ( myDataf$sex == "Woman" & myDataf$weight < 80 & myDataf$bmi > 20), ]
filteredData
subset( myDataf, sex == "Woman" & weight < 80 & bmi > 20)

#merging dataframes
myDataf$index <- 1:6
myDataf
OtherData <- data.frame(c(1:5, 7),rep(c("right-handed","left-handed"),3))
names(OtherData) <- c("ID","handedness")
OtherData
myMergedDataf <- merge(myDataf, OtherData, by.x="index", by.y="ID", all.x=T, all.y=T, sort=F)
myMergedDataf

#some basic graphs
plot(myDataf$weight~myDataf$size)  
boxplot(myDataf$weight)
boxplot(myDataf$weight~myDataf$sex) 
a <- rnorm(1000) 
hist(a, breaks=20) 

# reading a text file into RData
temperatures <- read.table("Temperatures.txt", sep="\t", header=T, stringsAsFactors=F)
temperatures
str(temperatures)
temperatures <- read.table("Temperatures.txt", sep="\t", header=T)
str(temperatures)
levels(temperatures$Month)

# save a dataframe as a text file in the working directory
write.table(myDataf, file="bmi_data.txt", sep="\t" , quote=F, col.names=T)



