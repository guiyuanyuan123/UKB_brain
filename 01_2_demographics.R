id_41 <- read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/header2", stringsAsFactors = F)
dem<-read.table("~/UKB/demographics.tab",header=T)
a<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/ancestry_difference/EUR_5",header=T)[,1:3]
EUR=merge(a,dem,by="f.eid")
b=EUR
#houshold
x1<- b$f.eid %in% id_41$V1
b[x1,]$f.738.2.0 <- b[x1,]$f.738.3.0
x2<- b$f.eid %in% b[is.na(b$f.738.2.0),]$f.eid
b[x2,]$f.738.2.0 <- b[x2,]$f.738.0.0

#EA
b[x1,]$f.6138.2.0 <- b[x1,]$f.6138.3.0
x2<- b$f.eid %in% b[is.na(b$f.6138.2.0),]$f.eid
b[x2,]$f.6138.2.0 <- b[x2,]$f.6138.0.0

c=b[which(b$f.738.2.0!="-3" & b$f.738.2.0!="-1" & b$f.6138.2.0!="-3" &b$f.6138.2.0!="-7"),c(1:4,7,24)]
#TDI 无na，只有0.0期
d=na.omit(c)

x3<- d$f.eid %in% d[d$f.6138.2.0!="1",]$f.eid
d[x3,]$f.6138.2.0 <- 0
#
write.table(d,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/demographics/EUR_dem",quote=F,row.names=F)

###########
#library(nonrandom)
#library(tableone)
#stable=CreateTableOne(vars=c("f.21003.0.0","f.189.0.0","f.738.2.0","f.6138.2.0"),strata="f.22001.0.0",data=df,factorVars=c("f.738.2.0","f.6138.2.0"))
