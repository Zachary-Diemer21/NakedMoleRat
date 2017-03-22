#THIS MOFO WORKS LIKE A CHARM

stateFiles <- list.files("/home/zackymo/Desktop/birth_data1", pattern="*state.txt", full.names=TRUE)

for(file in stateFiles){
  rawData = read.table(file)
  df <- data.frame(rawData)
  incidence <- matrix(rep(0, ncol(df)*ncol(df)), nrow=ncol(df))
  thresholded <- matrix(rep(0, ncol(df)*ncol(df)), nrow=ncol(df)) 
  diag(incidence) <- nrow(df)
  for (i in 1:(ncol(df)-1)) {
    for (j in (i+1):ncol(df)) {
      incidence[i,j] = incidence[j,i] = sum(df[,i] == df[,j])#sum adds up all the trues for a given column, then inputs it into the matrix
    }
  }
  tincidence <- t(incidence) 
  f <- strsplit(file, split='.', fixed=TRUE)
  f <- unlist(f)
  write(tincidence, file = paste(f[1],"toInc", sep = ""),
        ncolumns = ncol(df),
        sep = " ") 
}



