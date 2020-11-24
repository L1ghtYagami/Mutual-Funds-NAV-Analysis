# Load libraries


# Source files from which to import some common names
source("./Utils/config.R")

# Specific Mutual funds (optional)
# Funds not yet invested into - c("Axis Multicap Fund")
mut_mir <- c("Mirae Asset Focused Fund Direct Plan Growth",
             "Mirae Asset Large Cap Fund - Direct Plan - Growth")
mut_sbi <- c("SBI Small Cap Fund - Direct Plan - Growth")
mut_axi <- c("Axis Midcap Fund - Direct Plan - Growth",
             "Axis Bluechip Fund - Direct Plan - Growth",
             "Axis Multicap Fund - Direct Plan - Growth")

mut_all <- c(mut_mir, mut_sbi, mut_axi)

for (mutual_fund in mutual_fund_names) {
    data <- read.csv(paste("./Data/Pre-processed/", mutual_fund, '.csv',
                           sep = ''))
    data <- data[data$Scheme.Name %in% mut_all,]
    write.csv(data, paste("./Data/Filtered Data/", mutual_fund, '.csv',
                          sep = ''))
}
