library(tidyverse)
library(statsr)


bandit_posterior(data = data.frame(machine = 1, outcome = "W"))

# playing Machine 1 twice, first winning and then losing
bandit_posterior(data = data.frame(machine = c(1,1), outcome = c("W","L")))

# Initiate the two plays on Machine 1
data1 <- data.frame(machine = c(1), outcome = c("W"))
data2 <- data.frame(machine = c(1), outcome = c("L"))

# Use piping and bandit_posterior to calculuate the posterior probabilities after each play
bandit_posterior(data1) %>% 
  bandit_posterior(data2, prior = .)

bandit_posterior(data1)
bandit_posterior(data2, prior = c(0.6,0.4))

# M1 and M2 being "good" 
# after playing Machine 1 twice and winning both times
# and then playing Machine 2 three times with 2 wins then 1 loss.
M1_data <- data.frame(machine = c(1,1), outcome = c("W","W"))
M2_data <- data.frame(machine = c(2,2,2), outcome = c("W","W","L"))

bandit_posterior(M1_data) %>%
  bandit_posterior(M2_data, prior = .)

# play M2 first then play M1
bandit_posterior(M2_data) %>%
  bandit_posterior(M1_data, prior = .)






