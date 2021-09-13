from statsmodels.stats.multitest import multipletests, _ecdf as ecdf, fdrcorrection as fdrcorrection0, fdrcorrection_twostage
import numpy as np
import pandas as pd

data=pd.read_csv("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_EUR_t_test",sep='\\s+',header=0) #header=None
pvals=data.values[:,1]
p_adj=multipletests(pvals,alpha=0.05,method='fdr_bh',is_sorted=False,returnsorted=False)[1:2]
p_adj_1=pd.DataFrame(list(p_adj))
tmp = [data,p_adj_1.stack()]
tmp_1 = pd.concat([s.reset_index(drop=True) for s in tmp], axis=1)
np.savetxt("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_EUR_t_test_BH",tmp_1,fmt='%s')

data=pd.read_csv("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_AFR_t_test",sep='\\s+',header=0) #header=None
pvals=data.values[:,1]
p_adj=multipletests(pvals,alpha=0.05,method='fdr_bh',is_sorted=False,returnsorted=False)[1:2]
p_adj_1=pd.DataFrame(list(p_adj))
tmp = [data,p_adj_1.stack()]
tmp_1 = pd.concat([s.reset_index(drop=True) for s in tmp], axis=1)
np.savetxt("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_AFR_t_test_BH",tmp_1,fmt='%s')

data=pd.read_csv("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_EAS_t_test",sep='\\s+',header=0) #header=None
pvals=data.values[:,1]
p_adj=multipletests(pvals,alpha=0.05,method='fdr_bh',is_sorted=False,returnsorted=False)[1:2]
p_adj_1=pd.DataFrame(list(p_adj))
tmp = [data,p_adj_1.stack()]
tmp_1 = pd.concat([s.reset_index(drop=True) for s in tmp], axis=1)
np.savetxt("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_EAS_t_test_BH",tmp_1,fmt='%s')

data=pd.read_csv("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_SAS_t_test",sep='\\s+',header=0) #header=None
pvals=data.values[:,1]
p_adj=multipletests(pvals,alpha=0.05,method='fdr_bh',is_sorted=False,returnsorted=False)[1:2]
p_adj_1=pd.DataFrame(list(p_adj))
tmp = [data,p_adj_1.stack()]
tmp_1 = pd.concat([s.reset_index(drop=True) for s in tmp], axis=1)
np.savetxt("/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/phenotype_sex-difference/raw/raw_SAS_t_test_BH",tmp_1,fmt='%s')
