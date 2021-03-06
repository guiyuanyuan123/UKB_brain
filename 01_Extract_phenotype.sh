#22027 #heterozygosity        22021 # kinship      22006 # Caucasian     21003 # age
#22001 # sex            21000 ethnic
/data2/huangdaoyi/UKB/ukbconv /data2/huangdaoyi/UKB/ukb44064.enc_ukb r -ibrain_selection.txt -ocleaned_brain_imageing_phenotype
head -n 2 cleaned_brain_imageing_phenotype.tab > 2

R
a<-read.table("2",header=T)
colnames(a)

awk '$12=="f.22027.0.0" || $12=="NA"' cleaned_brain_imageing_phenotype.tab |awk '$11=="0" || $11=="f.22021.0.0"'| awk '$10=="f.22006.0.0" || $10=="1"' > EUR_1
EUR_1<-read.table("EUR_1",header=T)
list<-which (rowSums(is.na(EUR_1[,-c(2:12)]))>160)
x_full <- EUR_1[-list,-c(2:6,10:12)]
dim(x_full) #22889   324
write.table(x_full,"EUR_2",quote=F,row.names=F)
 
#EUR:41/21523 age 全是3期；3/21523 的structures age二期，后面dti rsfmri是三期，统一用的二期
#41个age
test<-x_full[,c(1,grep(".2.0$",colnames(x_full)))]
instance2=which(rowSums(is.na(test))> 2)
instance2_2=test[instance2,]
write.table(instance2_2,"instance2",quote=F,row.names=F) #41 162

test<-x_full[,c(1,grep(".3.0$",colnames(x_full)))]
instance3=which(rowSums(is.na(test))> 2)
instance3_2=test[-instance3,] #839 162
write.table(instance3_2,"instance3",quote=F,row.names=F)
awk 'NR==FNR{a[$1]=$0;next}{if($1 in a)print $0}' instance2 instance3 |grep NA|wc -l #0
awk '{print $1}' instance2> header2

for i in `cat header2`;do echo -n '|| $1=='"$i"'';done
awk '{if($1==1042185|| $1==1081130|| $1==1145723|| $1==1177240|| $1==1205197|| $1==1243722|| $1==1366729|| $1==1390472|| $1==1637947|| $1==1743154|| $1==1754373|| $1==1781443|| $1==1886256|| $1==1958711|| $1==2044995|| $1==2287361|| $1==2343539|| $1==2387823|| $1==2479767|| $1==2556446|| $1==3183193|| $1==3400651|| $1==3661155|| $1==3817153|| $1==3895318|| $1==3906957|| $1==3920123|| $1==4135508|| $1==4138781|| $1==4240595|| $1==4259672|| $1==4324246|| $1==4413369|| $1==4543486|| $1==4566640|| $1==5062877|| $1==5514421|| $1==5800332|| $1==5880897|| $1==5892020|| $1==6020407){$2=$3};print}' EUR_2 > EUR_3
for i in {2..312};do j=$(expr ${i} "*" 2 "+" 1);echo "$j" >> 626;done
for i in `cat 626`;do j=$(expr ${i} "+" 1);echo -n 'if($'$i'!="NA"){$'$i'=$'$i'}if($'$i'=="NA" && $'$j'!="NA"){$'$i'=$'$j'}'>>626_1;done
vim 626_1
sh 626_1 #EUR_4
awk '{print $1,$2,$4,$5,$7,$9,$11,$13,$15,$17,$19,$21,$23,$25,$27,$29,$31,$33,$35,$37,$39,$41,$43,$45,$47,$49,$51,$53,$55,$57,$59,$61,$63,$65,$67,$69,$71,$73,$75,$77,$79,$81,$83,$85,$87,$89,$91,$93,$95,$97,$99,$101,$103,$105,$107,$109,$111,$113,$115,$117,$119,$121,$123,$125,$127,$129,$131,$133,$135,$137,$139,$141,$143,$145,$147,$149,$151,$153,$155,$157,$159,$161,$163,$165,$167,$169,$171,$173,$175,$177,$179,$181,$183,$185,$187,$189,$191,$193,$195,$197,$199,$201,$203,$205,$207,$209,$211,$213,$215,$217,$219,$221,$223,$225,$227,$229,$231,$233,$235,$237,$239,$241,$243,$245,$247,$249,$251,$253,$255,$257,$259,$261,$263,$265,$267,$269,$271,$273,$275,$277,$279,$281,$283,$285,$287,$289,$291,$293,$295,$297,$299,$301,$303,$305,$307,$309,$311,$313,$315,$317,$319,$321,$323,$325,$327,$329,$331,$333,$335,$337,$339,$341,$343,$345,$349,$351,$353,$355,$357,$359,$361,$363,$365,$367,$369,$371,$373,$375,$377,$379,$381,$383,$385,$387,$389,$391,$393,$395,$397,$399,$401,$403,$405,$407,$409,$411,$413,$415,$417,$419,$421,$423,$425,$427,$429,$431,$433,$435,$437,$439,$441,$443,$445,$447,$449,$451,$453,$455,$457,$459,$461,$463,$465,$467,$469,$471,$473,$475,$477,$479,$481,$483,$485,$487,$489,$491,$493,$495,$497,$499,$501,$503,$505,$507,$509,$511,$513,$515,$517,$519,$521,$523,$525,$527,$529,$531,$533,$535,$537,$539,$541,$543,$545,$547,$549,$551,$553,$555,$557,$559,$561,$563,$565,$567,$569,$571,$573,$575,$577,$579,$581,$583,$585,$587,$589,$591,$593,$595,$597,$599,$601,$603,$605,$607,$609,$611,$613,$615,$617,$619,$621,$623,$625}' EUR_4 > EUR_5 #347 f.25752.2.0

# extract impute data
awk '{print $1,$1}' EUR_5|awk '{FID=$1;IID=$2}(NR==1){print "FID IID"}{print FID,IID}' > fid_iid
sh 1_3.sh #改一下ref-first

#bfile
find . -name "*.bim" > ForMerge.list
sed -i 's/.bim//g' ForMerge.list
nohup /export/home/guiyuanyuan/tools/plink --merge-list ForMerge.list --out Merge &
for i in {1..22};do /export/home/guiyuanyuan/tools/plink --bfile ukb_imp_chr${i} --exclude Merge.missnp --make-bed --out ukb_imp_chr${i}_missnp ;done
rm ForMerge.list;find ./ -name "*missnp.bim" > ForMerge.list
sed -i 's/.bim//g' ForMerge.list
nohup /export/home/guiyuanyuan/tools/plink --merge-list ForMerge.list --out Merge_chrALL_brain_dup &
#去重复
awk '{print $1,$4}' Merge_chrALL_brain_dup.bim |sort|uniq -d > dup_snp
awk 'NR==FNR{a[$1" "$2]=$0;next}{if(!($1" "$4 in a))print $2}' dup_snp Merge_chrALL_brain_dup.bim > nodup_snp
/export/home/guiyuanyuan/tools/plink --bfile Merge_chrALL_brain_dup --extract nodup_snp --make-bed --out Merge_chrALL_brain
sh step2_qc.sh #redone qc

##extract rsfmri
awk 'NR>1{print $1"_"$347}' EUR_4 > 25752_bulk_file
mkdir bulk_txt;for i in `cat 25752_bulk_file`;do cp /data2/huangdaoyi/UKB/bulk/${i}.txt bulk_txt/ ;done
for i in `cat 25752_bulk_file`;do awk '{print '"${i}"',$0}' bulk_txt/${i}.txt >> rsfmri_25752_210;done
mv rsfmri_25752_210 2
cat header 2 > rsfmri_25752_210

#R pheno,  merge
a<-read.table("~/ancestry/EUR_5",header=T)
b<-read.table("~/ancestry/rsfmri_25752_210",header=T)
merge<-merge(a,b,by="f.eid")
c=merge[,c(1:24,175:313,25:174,314:523)]
write.table(c,"~/ancestry/EUR_6",quote=F,row.names=F)
d=c[,-c(2,3,4)]
write.table(d,"test",quote=F,row.names=F)
awk '{print $1,$0}' test > brain_pheno
vim brain_pheno #  #FID IID

#covar  sex是1,2还是1,0不影响回归结果
awk 'NR==FNR{a[$1]=$2" "$3;next}{if($1 in a)print $0,a[$1]}' ~/ancestry/EUR_6 Merge_brain_prune.eigenvec > covar_0
head -n 1 ~/UKB/brain_imaging/zhaohan_rfmri/covar > covar_header
cat covar_header covar_0 > covar_d_f
awk 'NR==FNR{a[$1]=$2" "$3" "$4;next}{if($1 in a)print $0,a[$1]}' ~/ancestry/EUR_6 Merge_brain_prune.eigenvec > covar_1
cat covar_header1 covar_1 > covar_vol

##linear vol的cor多一个，回归的header另写
(awk 'NR==FNR{a[$1]=$2" "$3;next}{if($1 in a)print $0,a[$1]}' EUR_5 Merge_brain_prune.eigenvec|awk '$24==1'|awk '{$NF="" ;print $0}' > covar_m_novbt_0
cat 1 covar_m_novbt_0 > covar_m_novbt
awk 'NR==FNR{a[$1]=$2" "$3" "$9;next}{if($1 in a)print $0,a[$1]}' EUR_5 Merge_brain_prune.eigenvec|awk '$24==1' > 2
a<-read.table("2")
b=a[,-24]
write.table(b,"covar_f_vbt_0",quote=F,row.names=F,col.names=F)  )

########################################################################################################################################################
awk '$12=="f.22027.0.0" || $12=="NA"' cleaned_brain_imageing_phenotype.tab |awk '$11=="0" || $11=="f.22021.0.0"'> raw
awk '$2=="4001" || $3=="4001" ||$4=="4001" || $2=="4002" || $3=="4002" ||$4=="4002" || $2=="f.21000.0.0"' raw > AFR_1
AFR_1 <- read.table("~/ancestry/AFR_1",header=T) #6430  332
list <-which(rowSums(is.na(AFR_1[,-c(2:12)])) > 160)
x_full<-AFR_1[-list,-c(2:6,10:12)]
dim(x_full) # 205 323
write.tab

awk '$2=="3001" || $3=="3001" ||$4=="3001" || $2=="3002" || $3=="3002" ||$4=="3002" || $2=="3003" || $3=="3003" ||$4=="3003"|| $2=="f.21000.0.0"' raw > SAS_1
SAS_1 <- read.table("~/ancestry/SAS_1",header=T) #6441
list <-which(rowSums(is.na(SAS_1[,-c(2:12)])) > 160)
x_full<-SAS_1[-list,-c(2:6,10:12)]
dim(x_full) #259 634

awk '$2=="5" || $3=="5" ||$4=="5" || $2=="f.21000.0.0"' raw > EAS_1
EAS_1<-read.table("~/ancestry/EAS_1",header=T) #1355
list <-which(rowSums(is.na(EAS_1[,-c(2:12)])) > 160)
x_full<-EAS_1[-list,-c(2:6,10:12)]
write.table(x_full,"~/ancestry/EAS_2",quote=F,row.names=F)



