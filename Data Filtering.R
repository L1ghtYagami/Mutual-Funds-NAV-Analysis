# Source files from which to import some common names
source("./Utils/config.R")

# Define a function that loads and filters the data
# funds_filter is the vector of all mutual funds whose data you want
filter_data <- function(funds_filter) {
    for (mutual_fund in mutual_fund_names) {
        data <- read.csv(paste("./Data/Pre-processed/", mutual_fund, '.csv',
                               sep = ''))
        data <- data[data$Scheme.Name %in% funds_filter,]
        write.csv(data, paste("./Data/Filtered Data/", mutual_fund, '.csv',
                              sep = ''), row.names = FALSE)
    }
}

filter_data(funds_filter = mut_all)
