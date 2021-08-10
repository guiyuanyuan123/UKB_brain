#for i in `cat /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/header_vol`;do
#gzip -c /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/inter/vol_inter_${i}.txt > /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/inter/female_${i}_vol_munge.sumstats.gz
#/lustre/home/acct-clslh/clslh/gyy/tool/ldsc/ldsc.py --h2 /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_male/inter/male_${i}_vol_munge.sumstats.gz \
#--ref-ld-chr /lustre/home/acct-clslh/clslh/gyy/zhaohan_rfmri/eur_w_ld_chr/ \ 
#--w-ld-chr  /lustre/home/acct-clslh/clslh/gyy/zhaohan_rfmri/eur_w_ld_chr/ \
#--out /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_male/inter/male_${i}_heritability
#done

for i in `cat /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/header_vol_0`;do
#male gz
gzip -c /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/all_autosomal/vol_all_${i}.txt > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/all_autosomal/vol_all_${i}.sumstats.gz

gzip -c /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/inter/vol_inter_${i}.txt > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/inter/vol_inter_${i}.sumstats.gz
#male h2
/export/home/guiyuanyuan/tools/ldsc/ldsc.py --h2 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/all_autosomal/vol_all_${i}.sumstats.gz --ref-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --w-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/all_autosomal/${i}_h2;

/export/home/guiyuanyuan/tools/ldsc/ldsc.py --h2 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/inter/vol_inter_${i}.sumstats.gz --ref-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --w-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/inter/${i}_h2;

#female gz
gzip -c /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/all_autosomal/vol_all_${i}.txt > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/all_autosomal/vol_all_${i}.sumstats.gz

gzip -c /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/inter/vol_inter_${i}.txt > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/inter/vol_inter_${i}.sumstats.gz
#female h2
/export/home/guiyuanyuan/tools/ldsc/ldsc.py --h2 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/all_autosomal/vol_all_${i}.sumstats.gz --ref-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --w-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/all_autosomal/${i}_h2;

/export/home/guiyuanyuan/tools/ldsc/ldsc.py --h2 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/inter/vol_inter_${i}.sumstats.gz --ref-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --w-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/inter/${i}_h2;

#hg
/export/home/guiyuanyuan/tools/ldsc/ldsc.py --rg /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/inter/vol_inter_${i}.sumstats.gz,/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/inter/vol_inter_${i}.sumstats.gz --ref-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --w-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/hg/${i}_inter_hg;
done
