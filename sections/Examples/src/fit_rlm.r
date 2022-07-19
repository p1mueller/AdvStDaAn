library("robustbase")
data.rlm <- lmrob(Y ~ x1 + x2, data=data)
summary(data.rlm) # print model summary and also outlier samples