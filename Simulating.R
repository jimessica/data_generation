# Step 1: Simulate initial sample of 900 observations from a normal distribution
initial_sample <- rnorm(900, mean = 1, sd = 1)

# Repeat the first 100 observations to create the final 100 observations
repeated_obs <- initial_sample[1:100]
full_sample <- c(initial_sample, repeated_obs)

# Step 2: Change half of the negative values to positive
negative_obs <- which(full_sample < 0)
num_to_change <- length(negative_obs) / 2
sample_obs <- sample(negative_obs, num_to_change)
full_sample[sample_obs] <- abs(full_sample[sample_obs])

# Step 3: Change the decimal place on values between 1 and 1.1
one_obs <- which(full_sample >= 1 & full_sample <= 1.1)
full_sample[one_obs] <- full_sample[one_obs] - 1


# Step 4: Calculate the mean of the cleaned dataset
mean_cleaned_data <- mean(full_sample)
mean_cleaned_data

# Step 5: Check if the mean is greater than 0
mean_greater_than_zero <- mean_cleaned_data > 0
mean_greater_than_zero