#out1.R
df=read.table("EUR_5",header=T)
eid=list()
IDPs=data.frame()
for (i in 5:163){
mad1=mad(df[,i],constant = 1)
med=median(df[,i])
id = df[df[,i]> med + 7 *mad1 | df[,i]< med - 7 *mad1,1]
IDP = cbind(colnames(df[df[,i]> med + 7 *mad1 | df[,i]< med - 7 *mad1,])[i],length(id))
eid=append(eid,id)
IDPs=rbind(IDPs,IDP)
}

lr <- data.frame(matrix(unlist(eid), nrow=length(eid), byrow=T),stringsAsFactors=FALSE)
names(lr)="eid"
library(tidyfst)
eid1=count_dt(lr,eid) %>% filter_dt(n>0)
write.table(eid1,"7mad_eid_out",quote=F,row.names=F)
write.table(IDPs,"7mad_IDPs_out",quote=F,row.names=F,col.names=F)
#out1.sh
awk 'NR>1 && $2>7' 7mad_eid_out > 0.05_7mad_eid_out
awk 'NR==FNR{a[$1]=$0;next}{if(!($1 in a))print $0}' 0.05_7mad_eid_out EUR_5 > 7mad_EUR_5_re0.05_outliers
#out2.R
df=read.table("7mad_EUR_5_re0.05_outliers",header=T)
eid=list()
IDPs=data.frame()

for (i in 5:163){
mad1=mad(df[,i],constant = 1)
mean=mean(df[,i])
med=median(df[,i])
df[df[,i] > med + 7 *mad1 |df[,i] < med - 7 *mad1,i] <-med

id = df[df[,i]> med + 7 *mad1 | df[,i]< med - 7 *mad1,1]
IDP = cbind(colnames(df[df[,i]> med + 7 *mad1 | df[,i]< med - 7 *mad1,])[i],length(id))
eid=append(eid,id)
IDPs=rbind(IDPs,IDP)
}
write.table(df,"EUR_reoutlier_7mad",quote=F,row.names=F)
lr <- data.frame(matrix(unlist(eid), nrow=length(eid), byrow=T),stringsAsFactors=FALSE)
names(lr)="eid"
library(tidyfst)
eid1=count_dt(lr,eid) %>% filter_dt(n>0)
write.table(eid1,"7mad_re0.05_eid_out",quote=F,row.names=F)
write.table(IDPs,"7mad_re0.05_IDPs_out",quote=F,row.names=F,col.names=F)
