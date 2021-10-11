#install pcalg
install.packages('BiocManager', repos = 'https://mirrors.tuna.tsinghua.edu.cn/CRAN')
options('BioC_mirror'='https://mirrors.tuna.tsinghua.edu.cn/bioconductor/')
BiocManager::install(c('graph','RBGL','Rgraphviz'))
install.packages('pcalg')
###
ERROR: dependency ‘fastICA’ is not available for package ‘pcalg’
Warning messages:
1: In .inet_warning(msg) : dependency ‘fastICA’ is not available
2: In .inet_warning(msg) :
  installation of package ‘pcalg’ had non-zero exit status
  
Warning message:
package ‘fastICA’ is not available (for R version 3.6.2) 
###
#Download the old sources from https://cran.r-project.org/src/contrib/Archive/fastICA/ then to install the package by: 
install.packages("~/tools/fastICA_1.2-2.tar.gz" repos = NULL, type="source")
install.packages('pcalg')
                                    
                                    
library('pcalg')                                    
bd<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/confounder/EUR_confounder_3",header=T)
pc.fit <- pc(suffStat=list(C = cor(bd[,2:169]), n = nrow(bd)),indepTest = gaussCItest, alpha=0.00000005, labels =colnames(bd[,2:169]), verbose = TRUE)

if (require(Rgraphviz)) {
      ## show estimated 
      par(mfrow=c(1,2))
      plot(pc.fit, main = "Estimated pc")
    }
dev.off()
result=as(pc.fit, "amat")
write.table(result,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/confounder/pcalg_result",quote=F)

#factor转成虚拟变量
library(useful)
library('pcalg')                                    
bd<-read.table("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/confounder/EUR_confounder_3",header=T)
c0=bd
c0$f.54.2.0=as.factor(c0$f.54.2.0)
c=cbind(bd[,-c(1,165)],build.x(~f.54.2.0 -1,data=c0,contrasts = F))
pc.fit <- pc(suffStat=list(C =cor(c),n=nrow(c)),indepTest = gaussCItest,alpha=0.00000005, labels =colnames(c), verbose = TRUE)
if (require(Rgraphviz)) {
      ## show estimated 
      par(mfrow=c(1,2))
      plot(pc.fit, main = "Estimated pc_dv")
    }
dev.off()
result=as(pc.fit, "amat")
write.table(result,"/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/confounder/pcalg_dv_result",quote=F)
