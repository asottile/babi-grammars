Groesse <- c(176, 166, 172, 184, 179, 170, 176)
Gewicht <- c(65, 55, 67, 82, 75, 65, 75)

cor(Gewicht, Groesse, method="pearson")
reg <- lm(Gewicht~Groesse)
summary(reg)

plot(Gewicht~Groesse)
abline(reg)
