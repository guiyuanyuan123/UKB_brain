for j in `cat /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/header2`;do
for i in `cat /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/header1`;do
awk '(NR>1){SNP=$3;A1=$6;A2=$4;N=$8;BETA=$9;P=$12}(NR==1){printf "SNP\tA1\tA2\tN\tBETA\tP"}{print SNP"\t"A1"\t"A2"\t"N"\t"BETA"\t"P}' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/${j}_linear/f.${i}.2.0.glm.linear > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${j}/${j}_${i}_clean1.txt;
~/tools/ldsc/munge_sumstats.py --sumstats /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${j}/${j}_${i}_clean1.txt --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${j}/${j}_${i}_clean;
~/tools/ldsc/ldsc.py --h2 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${j}/${j}_${i}_clean.sumstats.gz \
--ref-ld-chr  ~/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/  \
--w-ld-chr  ~/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ \
--out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${j}/${j}_${i}_clean_h2 ;

gunzip -c /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${j}/${j}_${i}_clean.sumstats.gz \
> /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${j}/${j}_${i}_clean;

awk 'NR==FNR{a[$1]=$5"\t"$6;next}{if($1 in a)print $1"\t"$2"\t"$3"\t"$4"\t"a[$1]}' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${j}/${j}_${i}_clean1.txt /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${j}/${j}_${i}_clean > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${j}/${j}_${i}_clean2;
awk 'NR==FNR{a[$2]=$0;next}{if($1 in a)print $0}' ~/measures/SDPR/reference/snpinfo_1kg_nohm3 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${j}/${j}_${i}_clean2 > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${j}/male_${j}_${i}_SDPR.txt;
done;done

#female
for j in `cat /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/header2`;do
for i in `cat /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/header1`;do
awk '(NR>1){SNP=$3;A1=$6;A2=$4;N=$8;BETA=$9;P=$12}(NR==1){printf "SNP\tA1\tA2\tN\tBETA\tP"}{print SNP"\t"A1"\t"A2"\t"N"\t"BETA"\t"P}' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/female/${j}_linear/f.${i}.2.0.glm.linear > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean1.txt;

~/tools/ldsc/munge_sumstats.py --sumstats /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean1.txt --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean;

~/tools/ldsc/ldsc.py --h2 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean.sumstats.gz --ref-ld-chr  ~/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/  --w-ld-chr  ~/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean_h2 ;
 
gunzip -c /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean.sumstats.gz > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean;

awk 'NR==FNR{a[$1]=$5"\t"$6;next}{if($1 in a)print $1"\t"$2"\t"$3"\t"$4"\t"a[$1]}' /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean1.txt /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean2;

awk 'NR==FNR{a[$2]=$0;next}{if($1 in a)print $0}' ~/measures/SDPR/reference/snpinfo_1kg_nohm3 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean2 > /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/female_${j}_${i}_SDPR.txt;
rm /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean2 /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/${j}/${j}_${i}_clean1.txt;
done;
done
