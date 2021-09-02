for i in `cat /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/header_vol_0`;do
#male gz
gzip -c /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_all_autosomal/all_tbv_vol_male_${i} > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_all_autosomal/tbv_vol_all_${i}.sumstats.gz

gzip -c /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_inter/inter_tbv_vol_male_${i} > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_inter/tbv_vol_inter_${i}.sumstats.gz
#male h2
/export/home/guiyuanyuan/tools/ldsc/ldsc.py \
--h2 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_all_autosomal/tbv_vol_all_${i}.sumstats.gz \
--ref-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ \
--w-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ \
--out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_all_autosomal/tbv_${i}_h2;

/export/home/guiyuanyuan/tools/ldsc/ldsc.py \
--h2 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_inter/tbv_vol_inter_${i}.sumstats.gz \
--ref-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ \
--w-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ \
--out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_inter/tbv_${i}_h2;

#female gz
gzip -c /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/tbv_all_autosomal/all_tbv_vol_female_${i} > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/tbv_all_autosomal/tbv_vol_all_${i}.sumstats.gz

gzip -c /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/tbv_inter/inter_tbv_vol_female_${i} > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/tbv_inter/tbv_vol_inter_${i}.sumstats.gz
#female h2
/export/home/guiyuanyuan/tools/ldsc/ldsc.py \
--h2 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/tbv_all_autosomal/tbv_vol_all_${i}.sumstats.gz \
--ref-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ \
--w-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ \
--out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/tbv_all_autosomal/tbv_${i}_h2;

/export/home/guiyuanyuan/tools/ldsc/ldsc.py \
--h2 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/tbv_inter/tbv_vol_inter_${i}.sumstats.gz \
--ref-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ \
--w-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ \
--out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/tbv_inter/tbv_${i}_h2;

#hg
/export/home/guiyuanyuan/tools/ldsc/ldsc.py \
--rg /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_inter/tbv_vol_inter_${i}.sumstats.gz,/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/female/tbv_inter/tbv_vol_inter_${i}.sumstats.gz \
--ref-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ \
--w-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ \
--out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/hg/tbv_rg/tbv_${i}_inter_hg;
done 
