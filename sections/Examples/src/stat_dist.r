mold = matrix(c(.8,0.4,.2,.6),2)
while(T){
  m = mold %*% mold
  if(norm(mold-m, type="I") < 1e-9){
    break
  }
  mold <- m
}