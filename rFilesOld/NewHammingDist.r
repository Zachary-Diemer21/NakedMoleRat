setwd("/home/zackymo/Desktop/NakedMoleRat/birth_data_zach_calcs_50_V1/")
threshFiles <- list.files(getwd(), pattern="*Thresholded", full.names=TRUE)
foldLength <- length(threshFiles)
hammingCount <- vector(mode="numeric", length=foldLength)

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

