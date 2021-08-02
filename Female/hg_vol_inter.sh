for i in `cat /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/header_vol`;do

gzip -c /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/inter/vol_inter_${i}.txt > /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/inter/female_${i}_vol_munge.sumstats.gz


/lustre/home/acct-clslh/clslh/gyy/tool/ldsc/ldsc.py --h2 /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_male/inter/male_${i}_vol_munge.sumstats.gz \
--ref-ld-chr /lustre/home/acct-clslh/clslh/gyy/zhaohan_rfmri/eur_w_ld_chr/ \ 
--w-ld-chr  /lustre/home/acct-clslh/clslh/gyy/zhaohan_rfmri/eur_w_ld_chr/ \
--out /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_male/inter/male_${i}_heritability

done
