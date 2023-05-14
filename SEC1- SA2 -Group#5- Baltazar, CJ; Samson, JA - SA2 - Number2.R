#2. Test using Shapiro-Wilk normality test the Ethereum returns for trading data every five minutes, from August 7, 2015 to April 15, 2023.

f <- file.choose()
data <- read.csv(f)
returns <- diff(log(data$price), lag = 12)
shapiro.test(returns)
