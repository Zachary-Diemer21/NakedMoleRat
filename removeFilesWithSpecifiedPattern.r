otherFiles <- list.files("/home/zackymo/Desktop/birth_data_zach_calcs_50_V1", pattern="*DateTime.txt", full.names = TRUE)
otherFiles1 <- list.files("/home/zackymo/Desktop/birth_data_zach_calcs_50_V1", pattern="*NMRids.txt", full.names = TRUE)

file.remove(dir(  
  "/home/zackymo/Desktop/birth_data_zach_calcs_50_V1", 
  pattern = "*TimeSeconds.txt", 
  full.names = TRUE
))

#can also even create a pattern variable that is a vector of some sort and input the patterns in there
#create a loop that utilizes the pattern as a variable, then go to the next pattern 