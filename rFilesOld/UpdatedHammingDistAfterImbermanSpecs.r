setwd("/home/zackymo/Desktop/NakedMoleRat/birth_data_zach_calcs_75_V1/")
threshFiles <- list.files(getwd(), pattern="*Thresholded", full.names=TRUE)
folderLength <- length(threshFiles)
hammingCount <- vector(mode="numeric", length=foldLength)

firstThresh <- read.table(threshFiles[1])
firstDf <- data.frame(firstThresh)

for (i in 2:folderLength){
  count <- 0
  iThresh <- read.table(threshFiles[i])
  iDf <- data.frame(iThresh)
  for (k in 1:(ncol(firstDf)-1)) {
    for (l in (k+1):ncol(firstDf)) {
      if (abs(firstDf[k,l] - iDf[k,l]) == 1){
        count <- count + 1
      } 
    }
  }
  hammingCount[i] = count
}

write.csv(hammingCount, file = "hammingCountThres75.csv") 