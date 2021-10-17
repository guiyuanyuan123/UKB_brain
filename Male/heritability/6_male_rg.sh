for i in {1..158};do awk 'NR>"'${i}'"' ../../../../header_vol > header_vol_${i};done
for i in {2..158};do echo 'for i in `cat header_vol_'${i}'`;do' > ${i};done
for i in `cat header_vol_1`;do echo '/export/home/guiyuanyuan/tools/ldsc/ldsc.py --rg /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/confounder_7_inter/confounder_7_vol_inter_'${i}'.gz,/data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/confounder_7_inter/confounder_7_vol_inter_${i}.gz --ref-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --w-ld-chr /export/home/guiyuanyuan/ABCD_ADHD/abcd_ksad01/input_loose/all_sample/impute_data/keep_EUR/LDSC/ADHD/LD_eur/eur_w_ld_chr/ --out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/heritability/male/confounder_7_male_rg/confounder_7_'${i}'_${i}_inter_male_rg;done' > ${i}_rg.sh;done
rm paste1;for i in {2..158};do echo "cat ${i}" >> paste1;done
rm paste2;for i in `cat header_vol_1`;do echo ''${i}'_rg.sh > conf7_m_'${i}'_rg.sh' >> paste2;done
paste paste1 paste2 > paste.sh
sh paste.sh
#female
cp -r ../../male/code/m_rg/ .
for i in `cat ../../../../header_vol`;do mv conf7_m_${i}_rg.sh conf7_f_${i}_rg.sh;done
