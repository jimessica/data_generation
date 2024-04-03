#### Preamble ####
# Purpose: Simulates 
# Author: Jessica Im
# Date: 3 April 2024
# Contact: jessica.im@mail.utoronto.ca
# License: MIT

#### Workspace ####
set.seed(250)
library(tidyverse)

#### Simulate Data ####
## Step 1: Simulate initial sample of 900 observations from a normal distribution
initial_sample <- 
  tibble(
    obs_value = rnorm(900, mean = 1, sd = 1)
  )

# Repeat the first 100 observations to create the final 100 observations
repeated_obs <- 
  tibble(
    obs_value = initial_sample$obs_value[1:100]
  )

full_sample <- 
  bind_rows(initial_sample, repeated_obs)


## Step 2: Change half of the negative values to positive
# Step 2.1: Select negative observations
negative_obs <- 
  full_sample$obs_value[full_sample$obs_value < 0]
#Step 2.2: Randomly select half of negative_obs
num_to_change <- 
  sample(negative_obs, size = length(negative_obs) / 2)
#Step2.3: Change num_to_change to positive values
full_sample <- full_sample |>
  mutate(obs_value = ifelse(obs_value %in% num_to_change, abs(obs_value), obs_value))


## Step 3: Change the decimal place on values between 1 and 1.1
#Step 3.1: Select the numbers between 1 and 1.1
one_obs <- 
  full_sample |>
  filter(obs_value >= 1 & obs_value <= 1.1)
#Step 3.2: Move the decimal in one_obs
full_sample <-
  full_sample |>
  mutate(obs_value = ifelse(obs_value %in% one_obs$obs_value, (obs_value - 1), obs_value))


## Step 4: Calculate the mean of the cleaned dataset
mean_cleaned_data <- mean(full_sample$obs_value)
mean_cleaned_data

