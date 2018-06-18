pollutantmean <- function (directory, pollutant, id = 1:332){
  
 collected_data <- data.frame()
  
  file_paths <- as.character(list.files(path = directory, pattern = ".csv", full.names = TRUE))
 
 for (i in id) {
    monitor_data <- read.csv(file_paths[i], header = TRUE, sep = ",")
    collected_data <- rbind(monitor_data, collected_data)
 }
  
  Pollutant_data <- collected_data[,pollutant]
   
  mean(Pollutant_data, na.rm = TRUE)
}