header=read.table("/lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/header_vol",header=F,stringsAsFactors = F)
a=list.files("/lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/txt/vol_txt")
dir=paste("/lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/txt/vol_txt/",a,sep="")
n=length(dir)
for (i in 1:n){
 txt<-read.table(file=dir[i],stringsAsFactors=F)[-1,]
 colnames(txt)<- c("SNP", "B.A1", "B.A2","N","Z")
 MHC<-read.table("/lustre/home/acct-clslh/clslh/gyy/UKB/snpinfo_1kg_nohm3",header=T,stringsAsFactors = F)[,c(2,4,5)]
 info <- merge(txt, MHC, by = "SNP")
 complement <- function(x) {
    switch (
        as.character(x),
        "A" = "T",
        "C" = "G",
        "T" = "A",
        "G" = "C",
        return(NA)
    )
}

info.match <- subset(info, A1 == B.A1 & A2 == B.A2)
# Identify SNPs that are complementary between base and target
info$C.A1 <- sapply(info$B.A1, complement)
info$C.A2 <- sapply(info$B.A2, complement)
info.complement <- subset(info, A1 == C.A1 & A2 == C.A2)
# Update the complementary alleles in the txt file
complement.snps <- txt$SNP %in% info.complement$SNP
txt[complement.snps,]$B.A1 <-
    sapply(txt[complement.snps,]$B.A1, complement)
txt[complement.snps,]$B.A2 <-
    sapply(txt[complement.snps,]$B.A2, complement)


# identify SNPs that need recoding
txt$Z <- as.numeric(txt$Z)

info.recode <- subset(info, A1 == B.A2 & A2 == B.A1)
# Update the recode SNPs
recode.snps <- txt$SNP %in% info.recode$SNP
tmp <- txt[recode.snps,]$B.A1
txt[recode.snps,]$B.A1 <- txt[recode.snps,]$B.A2
txt[recode.snps,]$B.A2 <- tmp

recode.beta <- txt$Z %in% info.recode$Z
txt[recode.beta,]$Z <- txt[recode.beta,]$Z * (-1)


# identify SNPs that need recoding & complement
info.crecode <- subset(info, A1 == C.A2 & A2 == C.A1)
# Update the recode + strand flip SNPs
com.snps <- txt$SNP %in% info.crecode$SNP
tmp <- txt[com.snps,]$B.A1
txt[com.snps,]$B.A1 <- sapply(txt[com.snps,]$B.A2, complement)
txt[com.snps,]$B.A2 <- sapply(tmp, complement)
com.beta <- txt$Z %in% info.crecode$Z
txt[com.beta,]$Z <- txt[com.beta,]$Z *(-1)

fin.snp  <-txt[(txt$SNP %in% info.match$SNP |
                txt$SNP %in% info.complement$SNP |
                txt$SNP %in% info.recode$SNP |
                txt$SNP %in% info.crecode$SNP),]
colnames(fin.snp)<- c("SNP", "A1", "A2","N","Z")
file=paste("/lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/inter/vol_inter_",a[i],sep="")
write.table(fin.snp,file,quote = F,row.names = F,sep="\t")
}

