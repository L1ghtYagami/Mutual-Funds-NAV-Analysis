# Source files from which to import some common names
source("./Utils/config.R")

# Define a function that extracts data from the website of Association of Mutual
# Funds in India
extract_data <- function(date_from, date_to) {
    # Mirae - mir, SBI - sbi, Axis - axi
    url_mir <- paste("http://portal.amfiindia.com/DownloadNAVHistoryReport_Po.aspx?",
                     "mf=45&tp=1&frmdt=", date_from, "&todt=", date_to, sep='')
    url_sbi <- paste("http://portal.amfiindia.com/DownloadNAVHistoryReport_Po.aspx?",
                     "mf=22&tp=1&frmdt=", date_from, "&todt=", date_to, sep='')
    url_axi <- paste("http://portal.amfiindia.com/DownloadNAVHistoryReport_Po.aspx?",
                     "mf=53&tp=1&frmdt=", date_from, "&todt=", date_to, sep='')

    url_all <- c(url_mir, url_sbi, url_axi)
    names(url_all) <- mutual_fund_names
    keep_columns <- c("Scheme.Name", "Net.Asset.Value", "Date")

    for (i in 1:length(url_all)) {
        download.file(url_all[i], paste("./Data/Raw/", names(url_all)[i], ".csv", sep = ''))
        data <- read.csv(paste("./Data/Raw/", names(url_all)[i], ".csv", sep = ''), sep = ';')
        data <- data[complete.cases(data[, keep_columns]),  keep_columns]
        write.csv(data, paste("./Data/Pre-processed/", names(url_all)[i], ".csv", sep = ''),
                  row.names = FALSE)
    }
}

date_from <- "01-Jan-2014"
date_to <- "31-Dec-2020"

extract_data(date_from = date_from, date_to = date_to)


