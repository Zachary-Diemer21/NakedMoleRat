#Do not know if this works yet, we shall see, but this version of code works with multiple 
#data files in a particular folder 

stateFiles <- list.files("/home/zackymo/Desktop/birth_data_zach_calcs", pattern="*state.txt", full.names=TRUE)
thres <- .5

for(file in stateFiles){
  rawData = read.table(file)
  df <- data.frame(rawData)
  incidence <- matrix(rep(0, ncol(df)*ncol(df)), nrow=ncol(df))
  thresholded <- matrix(rep(0, ncol(df)*ncol(df)), nrow=ncol(df)) 
  
  #Set the diagonal = to constants due to the fact that both are symmetric matrices 
  diag(incidence) <- nrow(df)
  diag(thresholded) <- 1
  
  #Describe for loop here 
  for (i in 1:(ncol(df)-1)) {
    for (j in (i+1):ncol(df)) {
      incidence[i,j] = incidence[j,i] = sum(df[,i] == df[,j])
      if(incidence[i,j]/nrow(df) >= thres){
        thresholded[i,j] = thresholded[j,i] = 1
      }#should these conditions be reversed for effiency? How can I check that? 
      else{
        thresholded[i,j] = thresholded[j,i] = 0
      }
    }
  }
  #Data preparation for output file - transposing matrices 
  tincidence <- t(incidence) 
  tthresholded <- t(thresholded)
  
  #Manipulating the fileName to be able to create a new file w/ a meaningful file name
  #I may be able to split by / then edit the paste below f[1] + f[2] + f[3] + f[4] + f[5]
  f <- strsplit(file, split='.', fixed=TRUE)
  f <- unlist(f)
  
  #This will not work -> because you end up 
  #Setting the current directory for the output files to be placed, and never 
  #setwd("/home/zackymo/Desktop/birth_data1_out_files")
  
  #Creating the various output files 
  write(tincidence, file = paste(f[1],"toInc", sep = ""),
        ncolumns = ncol(df),
        sep = " ") 
  
  write(tthresholded, file = paste(f[1],"toThresholded", sep = ""),
        ncolumns = ncol(df),
        sep = " ") 
  
  #An example of using the console as a loading bar or a log so to speak 
  f[1]
}



