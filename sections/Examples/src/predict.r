predict(data.lm, newdata=data_new)
# With prediction interval
predict(data.lm, newdata=data_new, interval="prediction", level=0.95) 
# Get response
predict(data.lm, newdata=data_new, type="response")