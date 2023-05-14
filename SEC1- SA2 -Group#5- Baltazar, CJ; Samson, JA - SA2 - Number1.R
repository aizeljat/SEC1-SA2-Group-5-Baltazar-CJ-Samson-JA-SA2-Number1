#1. Find out which probability distribution function best fits 
#Bitcoin’s returns for trading data every minute, from January 1, 2012 to April 15, 2023, for Bitcoin quoted in United States dollars or the BTC/USD pair.

x <- file.choose()
data <- read.csv(x)
returns <- diff(log(data$price))
hist(returns, breaks = 50, main = "Bitcoin Returns")
  
library(MASS)
function.normal <- fitdistr(returns, densfun = "normal")
function.t <- fitdistr(returns, densfun = "t")
function.ged <- fitdistr(returns, densfun = "ged")
function.laplace <- fitdistr(returns, densfun = "laplace")

prob.normal <- AIC(function.normal)
prob.t <- AIC(function.t)
prob.ged <- AIC(function.ged)

prob.laplace <- AIC(function.laplace)
prob_values <- c(prob.normal, prob.t, prob.ged, prob.laplace)

prob_distributions <- c("Normal", "Student's t", "GED", "Laplace")

AIC_table <- data.frame(prob_distributions, prob_values)
AIC_table