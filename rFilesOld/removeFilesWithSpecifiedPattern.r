otherFiles <- list.files(getwd(), pattern="*DateTime.txt", full.names = TRUE)
otherFiles1 <- list.files(getwd(), pattern="*NMRids.txt", full.names = TRUE)

file.remove(dir(  
  getwd(), 
  pattern = "*TimeSeconds.txt", 
  full.names = TRUE
))

#can also even create a pattern variable that is a vector of some sort and input the patterns in there
#create a loop that utilizes the pattern as a variable, then go to the next pattern 