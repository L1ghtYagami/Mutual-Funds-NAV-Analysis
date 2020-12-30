# This file stores all the variales that are required in multiple files
mutual_fund_names <- c("Mirae", "SBI", "Axis")

# Specific Mutual funds (optional)
# Funds not yet invested into - c("Axis Multicap Fund")
mut_mir <- c("Mirae Asset Focused Fund Direct Plan Growth",
             "Mirae Asset Large Cap Fund - Direct Plan - Growth")
mut_sbi <- c("SBI Small Cap Fund - Direct Plan - Growth")
mut_axi <- c("Axis Small Cap Fund - Direct Plan - Growth",
             "Axis Midcap Fund - Direct Plan - Growth",
             "Axis Bluechip Fund - Direct Plan - Growth",
             "Axis Multicap Fund - Direct Plan - Growth")

mut_all <- c(mut_mir, mut_sbi, mut_axi)
mut_all_list <- list(mut_mir,  mut_sbi, mut_axi)
names(mut_all_list) <- mutual_fund_names

