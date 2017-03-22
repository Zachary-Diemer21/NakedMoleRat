setwd("/home/zackymo/Desktop/scrap")
#setwd("/home/zackymo/Desktop/NakedMoleRat/birth_data_zach_calcs_50_V1/")
threshFiles <- list.files(getwd(), pattern="*Thresholded", full.names=TRUE)
#rm(list = ls())
foldLength <- length(threshFiles)
#foldLengthMinOne <- length(threshFiles)-1 #foldLengthMinOne
#count <- 0
#df <- data.frame(rawData)
#dfLengthMinOne <- ncol(df)-1

#create an empty vector of foldLength 
hammingCount <- vector(mode="numeric", length=foldLength)
#calculate number of threshold files 
firstThresh = read.table(threshFiles[1])
firstDf <- data.frame(firstThresh)

for (i in 2:foldLength){
  count <- 0
  iThresh = read.table(threshFiles[i])
  iDf <- data.frame(iThresh)
    for (k in 1:(ncol(firstDf)-1)) {
      for (l in (k+1):ncol(firstDf)) {
        if (abs(firstDf[k,l] - iDf[k,l]) == 1){
          count = count + 1
          #thresholded[i,j] = thresholded[j,i] = 1
          #must put the total count into a vector of the total number of weeks 
        }#Do we need an else? maybe to control input to make sure we dont get anything other than zero 
      }
    }
  hammingCount[i] = count
}

hc <- data.frame(hammingCount)

#Plotting attempt 1
p <- qplot(hp, mpg, data=mtcars, shape=am, color=am, 
           facets=gear~cyl, main="Scatterplots of MPG vs. Horsepower",
           xlab="Horsepower", ylab="Miles per Gallon")

plot <- qplot(,hammingCount)

ggplot(data=dat, aes(x=time, y=total_bill, group=1)) +
  geom_line() +
  geom_point()

nrow(hc)

count(hc)

ggplot(aes(x=hammingcount[]))
"""
  
  for(i in 1:foldLengthMinOne){
    iThresh = read.table(threshFiles[i])
    iDf <- data.frame(iThresh)
    for (j in (i+1):length(threshFiles)){
      jThresh = read.table(threshFiles[j])
      jDf <- data.frame(jThresh)
      for (k in 1:(ncol(iDf)-1)) {
        for (l in (k+1):ncol(iDf)) {
          if (abs(iDf[k,l] - jDf[k,l]) == 1){
            count = count + 1
            #thresholded[i,j] = thresholded[j,i] = 1
            #must put the total count into a vector of the total number of weeks 
          }
          else {
            
          }
        }
      }
    }
  }
"""
