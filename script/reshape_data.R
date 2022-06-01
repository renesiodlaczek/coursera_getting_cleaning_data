### Optional: Reshaping the data into a longer format based on signal domain t and f

# Definition of a custom reshape function to be used for both signal domains separately
reshape_longer <- function(data, signal_domain, signal_domain_name) {
    
    # select only the columns for the given signal domain
    dat_aggregate <- data[c("subject", "activity", 
                            grep(paste0("^", signal_domain), names(data), value = TRUE))
                          ]
    
    # extract the original column names to be used later
    old_column_names <- grep(paste0("^", signal_domain), names(data), value = TRUE)
    
    # extract the new column names that will be used after the longer reshaping 
    new_column_names <- gsub(paste0("^", signal_domain, "\\-"), "", old_column_names)
    
    # do the reshaping into a longer format
    reshape(dat_aggregate, 
            varying = old_column_names, 
            v.names = new_column_names,
            timevar = "signal_domain", 
            times = signal_domain_name,
            idvar = c("activity", "subject"),
            direction = "long",
            new.row.names = 1:nrow(data),
            sep = "-"
    )
}

# Reshape both f and t columns separately
dat_tidy_f <- reshape_longer(dat_aggregate, "f", "frequency")
dat_tidy_t <- reshape_longer(dat_aggregate, "t", "time")

# As both datasets have unique columns the missing columns from the other 
# dataset need to be added
dat_tidy_f[setdiff(names(dat_tidy_t), names(dat_tidy_f))] <- NA
dat_tidy_t[setdiff(names(dat_tidy_f), names(dat_tidy_t))] <- NA

# Bind the two datasets together again into one dataset
dat_tidy <- rbind(dat_tidy_t, dat_tidy_f)
