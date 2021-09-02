#for i in `cat header_vol_0`;do
#awk '(NR>1){SNP=$3;A1=$6;A2=$4;N=$8;Z=$9/$10;P=$12}(NR==1){printf "SNP\tA1\tA2\tN\tZ\tP"}{print SNP"\t"A1"\t"A2"\t"N"\t"Z"\t"P}' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/tbv_linear/${i}.glm.linear > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/tbv_txt/${i}.txt;
#done


#remove ambiguous SNPs
for i in `cat /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/header_vol`;do
/export/home/guiyuanyuan/tools/ldsc/munge_sumstats.py --sumstats /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/tbv_txt/${i}.txt --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_munge/tbv_male_${i};
gunzip -c /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_munge/tbv_male_${i}.sumstats.gz > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_munge/txt/tbv_vol_male_${i};

Rscript /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_inter_mismatch.R;
Rscript /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_mismatch.R;
#rm /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/tbv_munge/txt/tbv_vol_male_${i};
done
