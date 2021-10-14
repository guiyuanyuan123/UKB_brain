library(infotheo)
library('pcalg')    
X=read.table("EUR_confounder_3",header=T)
y=X[,c(3,165,2,4:164,166:169)]
new= discretize(y[,c(3:168)],disc="equalwidth",20)
new2=cbind(y[,1:2],new)

nlev<-sapply(new2,function(x){
  temp<-factor(x)
  length(levels(temp))
})
V <- colnames(new2)
suffStat <- list(dm = new2, nlev = nlev, adaptDF = FALSE)
pc.fit <- pc(suffStat,
           indepTest = disCItest, alpha = 0.000005, labels = V, verbose = TRUE)
pc.fit          
if (require(Rgraphviz)) {
    plot(pc.fit)
}
dev.off()
