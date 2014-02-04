tab <- read.csv(file="/home/artur/Downloads/code/data1.csv", header=TRUE, sep=",", dec=".")
attach(tab)
tab

x1 <- X[Group==1]
x2 <- X[Group==2]

library(graphics)
n <- length(x1)
p <- mean(x1)
k <- seq(0, n, by = 1)
plot (k, dbinom(k, n, p), type = "l", ylab = "probability",
      main = "Binominal distribution")

plot (k/n, dbinom(k, n, p), type = "l", ylab = "probability",
      main = "Binominal distribution")

library(binom)
b1 <- binom.confint(sum(x1), n, conf.level = 0.95, methods = "exact")
b2 <- binom.confint(sum(x2), n, conf.level = 0.95, methods = "exact")

margin.table(table(x1, x2))

chisq.test(x1, x2)

fisher.test(x1, x2)

