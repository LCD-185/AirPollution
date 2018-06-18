complete <- function (directory, id = 1:332){
  
  #Collect data in one fram
  collected_data <- data.frame()
  cnames <- c("id", "nobs")
  nobs <- c()
  
  
  file_paths <- as.character(list.files(path = directory, pattern = ".csv", full.names = TRUE))
  
  for (i in id) {1
    #read the file and store in monitor_dat
    monitor_data <- read.csv(file_paths[i], header = TRUE, sep = ",")
    #add this monitor to the collected data
    collected_data <- rbind(monitor_data, collected_data)
    #complete data is a matrix of only the complete rows of data
    complete_data <- monitor_data[complete.cases(monitor_data),]
    #this is a vector of the number of completed observations
    nobs <- c(nobs, nrow(complete_data))
    

  }
  
  
  
  results <- data.frame(id, nobs)
  print(results)
  
  
  
}