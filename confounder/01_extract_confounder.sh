#25010 #TBV
50 #standing height
54 #site
25756 #scan position x
25757 #scan position Y
25758 #scan position z
25759 #scan table pos 
#25925 #scaling


awk 'NR==FNR{a[$1]=$2"\t"$3;next}{if($1 in a)print $0}' ../EUR_5 confounder.tab|awk '{print $1"\t" $2"\t" $3"\t" $4"\t" $5"\t"$8"\t" $9"\t" $10"\t" $11"\t" $12"\t" $13"\t" $14"\t" $15"\t" $16"\t" $17"\t" $18"\t" $19}' > EUR_confounder_1
awk 'NR==FNR{a[$1]=$0;next}{if(!($1 in a))print $0}' ../header2 EUR_confounder_1 > remove_41
awk 'NR==FNR{a[$1]=$0;next}{if($1 in a)print $0}' ../header2 EUR_confounder_1 > 41

a<-read.table("41",header=F)
b=a[,c(1,5,7,9,11,13,15,17)]
write.table(b,"41_1",quote=F,row.names=F)
grep -w 'NA' 41_1|head

bd<-read.table("remove_41",header=T)
c=bd[,c(1,grep('.2.0$',colnames(bd)))]
write.table(c,"remove_41_1",quote=F,row.names=F)
grep -w 'NA' remove_41_1|wc -l  #663    standing height 2期有663个人没测； 8个0期没有，1，3期不全。41个人3期有。  全用0期吧，8个人用2期
###
 a<-read.table("41",header=F)
 b=a[,c(1,2,7,9,11,13,15,17)]
 
 write.table(b,"41_1",quote=F,row.names=F,col.names=F)
 bd<-read.table("remove_41",header=T)
 colnames(bd)[c(1,2,7,9,11,13,15,17)]
 c=bd[,c(1,2,4,6,8,10,12,14,16)]    #
 write.table(c,"remove_41_0",quote=F,row.names=F)
 ###
awk '{if($2!="NA"){$2=$2}if($2=="NA" && $3!="NA"){$2=$3};print}' remove_41_0 > 1
a<-read.table("1",header=T)
b=a[,-3]
write.table(b,"remove_41_1",quote=F,row.names=F)
cat remove_41_1 41_1 > EUR_confounder_2
awk 'NR==FNR{a[$1]=$2" "$4" "$6" "$7" "$8" "$9;next}{if($1 in a)print $0,a[$1]}' EUR_confounder_2 ../EUR_5 > EUR_confounder_3



