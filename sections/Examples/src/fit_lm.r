data.lm <- lm(Y ~ ., data=data) # Fit model with all variables
data.lm2 <- lm(Y ~ x1 + x2, data=data) # Fit model with variable Volume
summary(data.lm) # Print summary of model
coef(data.lm) # Get coefficients