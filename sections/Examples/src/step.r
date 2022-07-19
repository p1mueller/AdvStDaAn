step(
    data.lm, 
    direction="both", 
    scope=list(upper=~ x1 + x2 + x3 + x4, lower=~ 1),
)