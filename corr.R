corr <- function (directory, threshold=0) {
  
  #calculate the correlation between sulfate and nitrate for monitors where
  #the number of observed cases is greater then the threshold. 

  #initalise Variables
  collected_data <- data.frame()
  nobs <- c()
  id <- 1:332
  index_monitors_greater_than_threshold <- c()
  corrolation <- c()
  
  #find my files
  file_paths <- as.character(list.files(path = directory, pattern = ".csv", full.names = TRUE))
  
  for (i in id) {
    #read the file and store in monitor_dat
    monitor_data <- read.csv(file_paths[i], header = TRUE, sep = ",")
    #add this monitor to the collected data
    #collected_data <- rbind(monitor_data, collected_data)
    #complete data is a matrix of only the complete rows of data
    complete_data <- monitor_data[complete.cases(monitor_data),]
    #this is a vector of the number of completed observations
    nobs <- c(nobs, nrow(complete_data))
    
      if (nobs[i] > threshold){
        
        corrolation <- c(corrolation, cor(complete_data$sulfate, complete_data$nitrate))
      
      }
    
  }
  
  #results <- data.frame(id, nobs)
  corrolation
  

  
 
    
}

