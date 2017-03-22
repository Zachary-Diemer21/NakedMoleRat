
#Attempt to read in two files 

#Accoring to the data we only have one day 

rawData = read.table("5-14-2014streamW636PPstate.txt")
#stateMat = matrix(rawData) #DEF DONT DO - creates a matrix with the data, but do not do, may be faster and better to work with the read.table data
#and when you do this it messes with the data for some reason
#nrow(rawData) #outputs how many rows are in the data 
#ncol(rawData) #outputs how many columns are in the data 
#head(rawData) #outputs the first few observations of the data file 
#colnames = names(rawData) #the column names in R 
df <- data.frame(rawData) #creates a dataframe with the raw data this was much nicer 
#rats = ncol(rawData)
#instances = nrow(rawData)
#table(count)
#FALSE  TRUE
#4139  2392
#c = table(count)
#c[2][1] outputs True and the amount
#as.numeric(c[2][1]) outputs the number

#Look into how to create a random sample of a large dataset

#AdjacencyMat = matrix(rep(0, rats), nrow = rats, ncol = rats) #This worked like a charm

#need to figure out how to move along columns //what if I set col equal to 1
#for(instance in instances)#for(r = 0; r <= n; r++) --- may no longer need this line
#rat = 0
#r = 0
incidence <- matrix(rep(0, ncol(df)*ncol(df)), nrow=ncol(df)) #rep(...) sets up the initial data that will go into the matrix, 
#so it creates an n x n matrix with all zeros 
diag(incidence) <- nrow(df) #this sets the diagonal = to the constant amount of rows in the file this way you dont have to record the 1 = 1 6531 times
for (i in 1:(ncol(df)-1)) { #this goes from cols 1 - 58 because j will will end up comparing 2 - 59 
  for (j in (i+1):ncol(df)) {
    incidence[i,j] = incidence[j,i] = sum(df[,i] == df[,j])#sum adds up all the trues for a given column, then inputs it into the matrix
    incidence[]
  }
}

#Can we detect when an animal was born? that is the biggest question 3 days before birth, the day of the birth, and the day after birth. Will our metrics detect 
#this behavior
#now creating a thresholded matrix => if individual instance (2392) divided by totnum of instances (/6531) is >= 50 put a 1 [(2392/6531) >= 50% put a 1]
#there should be another variable created called threshold and in this case, threshold would = 50 
tincidence <- t(incidence) #this was what was recommended by R documentation to do before writing a matrix to
#a new data file, however, this may not be necessary because our matrix is symmeteric t() -> transposes the matrix 

write(tincidence, file = "outputFile.txt",
      ncolumns = ncol(df),
      sep = " ") #this works and creates a new outputFile.txt into the NakedMoleRat folder 

outputFile.txt.rename(from = "/home/zackymo/Desktop/NakedMoleRat/outputFile.txt",
               to = "/home/zackymo/Desktop/outputFile.txt")
#This will copy the original file over to a new location, then delete the original file
#outputFile.txt.copy would keep both 

allFiles <- list.files("/home/zackymo/Desktop/birth_data", pattern="^*state.txt", full.names=TRUE)
#ldf <- lapply(filenames, read.csv)
#res <- lapply(ldf, summary)
#names(res) <- substr(filenames, 6, 30)
#for (i in 1:length(res))
#assign(paste(paste("df", i, sep=""), "summary", sep="."), res[[i]])

stateFiles <- list.files("/home/zackymo/Desktop/birth_data", pattern="*state.txt", full.names=TRUE)
      