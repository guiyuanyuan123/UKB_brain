m=list.files("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/R2_differences/male")
dir_m=paste("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/R2_differences/male/",m,sep="")

f=list.files("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/R2_differences/female")
dir_f=paste("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/R2_differences/female/",f,sep="")

n=length(dir_m)

EUR <-read.table("EUR_confounder_3",stringsAsFactors = F,header=T)[,c(1:3,9,164:169,159,23,22,21,20)]
covar_male<- read.table("covar_m_7",stringsAsFactors = F,header=T)[,c(1,3:22)]
covar_female<- read.table("covar_f_7",stringsAsFactors = F,header=T)[,c(1,3:22)]

merge_m1<-merge(covar_male,EUR,by="FID")
merge_f1<-merge(covar_female,EUR,by="FID")

for (i in 1:n){
merge_m2 <- read.table(file=dir_m[i],stringsAsFactors = F,header=T)[,c(1,6)]
merge_m1 <- merge(merge_m2,merge_m1,by="FID")

merge_f2 <- read.table(file=dir_f[i],stringsAsFactors = F,header=T)[,c(1,6)]
merge_f1 <- merge(merge_f2,merge_f1,by="FID")
}

result_tbv=data.frame()
result_raw=data.frame()
result_height=data.frame()
result_confounder_7=data.frame()

for (i in 51:55){
k=i-49
tbv_male_1 <- lm(merge_m1[,i] ~ f.21003.2.0 + f.25010.2.0 + pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_m1)

tbv_male_2 <- lm(merge_m1[,i] ~ f.21003.2.0 + f.25010.2.0 + merge_m1[,k]+ pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_m1)

r2_male_1 <- summary(tbv_male_1)$r.squared
r2_male_2 <- summary(tbv_male_2)$r.squared
tbv_male_r2 <- r2_male_2 - r2_male_1

#female
tbv_female_1 <- lm(merge_f1[,i] ~ f.21003.2.0 + f.25010.2.0 + pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_f1)

tbv_female_2 <- lm(merge_f1[,i] ~ f.21003.2.0 + f.25010.2.0 + merge_f1[,k]+ pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_f1)

r2_female_1 <- summary(tbv_female_1)$r.squared
r2_female_2 <- summary(tbv_female_2)$r.squared
tbv_female_r2 <- r2_female_2 - r2_female_1
result_tbv <- rbind(result_tbv,cbind(colnames(merge_f1)[i],tbv_female_r2,tbv_male_r2))

#raw
k=i-44
raw_male_1 <- lm(merge_m1[,i] ~ f.21003.2.0 + pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_m1)

raw_male_2 <- lm(merge_m1[,i] ~ f.21003.2.0 + merge_m1[,k]+ pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_m1)

r2_male_1 <- summary(raw_male_1)$r.squared
r2_male_2 <- summary(raw_male_2)$r.squared
raw_male_r2 <- r2_male_2 - r2_male_1
#female
raw_female_1 <- lm(merge_f1[,i] ~ f.21003.2.0 + pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_f1)

raw_female_2 <- lm(merge_f1[,i] ~ f.21003.2.0 + merge_f1[,k]+ pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_f1)

r2_female_1 <- summary(raw_female_1)$r.squared
r2_female_2 <- summary(raw_female_2)$r.squared
raw_female_r2 <- r2_female_2 - r2_female_1

result_raw <- rbind(result_raw,cbind(colnames(merge_m1)[i],raw_female_r2,raw_male_r2))
#height
k=i-39
height_male_1 <- lm(merge_m1[,i] ~ f.21003.2.0 + f.50.0.0 + pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_m1)

height_male_2 <- lm(merge_m1[,i] ~ f.21003.2.0 + f.50.0.0 + merge_m1[,k]+ pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_m1)

r2_male_1 <- summary(height_male_1)$r.squared
r2_male_2 <- summary(height_male_2)$r.squared
height_male_r2 <- r2_male_2 - r2_male_1
#female
height_female_1 <- lm(merge_f1[,i] ~ f.21003.2.0 + f.50.0.0 + pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_f1)

height_female_2 <- lm(merge_f1[,i] ~ f.21003.2.0 + f.50.0.0 + merge_f1[,k]+ pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_f1)

r2_female_1 <- summary(height_female_1)$r.squared
r2_female_2 <- summary(height_female_2)$r.squared
height_female_r2 <- r2_female_2 - r2_female_1
result_height <- rbind(result_height,cbind(colnames(merge_m1)[i],height_female_r2,height_male_r2))

#confounder_7
k=i-34
confounder_7_male_1 <- lm(merge_m1[,i] ~ f.21003.2.0 + f.25010.2.0 + f.50.0.0 +f.54.2.0+f.25756.2.0+f.25757.2.0+f.25758.2.0+f.25759.2.0+pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_m1)

confounder_7_male_2 <- lm(merge_m1[,i] ~ merge_m1[,k] + f.21003.2.0 + f.25010.2.0 + f.50.0.0 +f.54.2.0+f.25756.2.0+f.25757.2.0+f.25758.2.0+f.25759.2.0+pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_m1)

r2_male_1 <- summary(confounder_7_male_1)$r.squared
r2_male_2 <- summary(confounder_7_male_2)$r.squared
confounder_7_male_r2 <- r2_male_2 - r2_male_1
#female
confounder_7_female_1 <- lm(merge_f1[,i] ~ f.21003.2.0 + f.25010.2.0 + f.50.0.0 +f.54.2.0+f.25756.2.0+f.25757.2.0+f.25758.2.0+f.25759.2.0+pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_f1)
confounder_7_female_2 <- lm(merge_f1[,i] ~ merge_f1[,k] + f.21003.2.0 + f.25010.2.0 + f.50.0.0 +f.54.2.0+f.25756.2.0+f.25757.2.0+f.25758.2.0+f.25759.2.0+pc1 + pc2 + pc3 +pc4+ pc5+ pc6+ pc7+ pc8+ pc9+ pc10+ pc11+ pc12+ pc13+ pc14+ pc15+ pc16+ pc17+ pc18+ pc19+ pc20, data=merge_f1)

r2_female_1 <- summary(confounder_7_female_1)$r.squared
r2_female_2 <- summary(confounder_7_female_2)$r.squared
confounder_7_female_r2 <- r2_female_2 - r2_female_1

result_confounder_7 <- rbind(result_confounder_7,cbind(colnames(merge_m1)[i],confounder_7_female_r2,confounder_7_male_r2))

}
write.table(result_tbv,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/R2_differences/R2_result_tbv",quote=F,row.names=F)
write.table(result_raw,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/R2_differences/R2_result_raw",quote=F,row.names=F)
write.table(result_height,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/R2_differences/R2_result_height",quote=F,row.names=F)
write.table(result_confounder_7,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/R2_differences/R2_result_confounder_7",quote=F,row.names=F)
                
