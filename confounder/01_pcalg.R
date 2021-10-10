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

pc.fit <- pc(list(C = cor(iris[,1:4]), n = nrow(iris)),indepTest = gaussCItest, ## indep.test: partial correlations
             alpha=0.01, labels =colnames(iris), verbose = TRUE))

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
c=cbind(iris[,1:3],build.x(~age+site -1,data=c,contrasts = F))
...
