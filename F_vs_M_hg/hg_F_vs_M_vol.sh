for i in `cat /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/header_vol`;do
/lustre/home/acct-clslh/clslh/gyy/tool/ldsc/ldsc.py \
--rg /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/inter/female_${i}_vol_munge.sumstats.gz,/lustre/home/acct-clslh/clslh/gyy/UKB/assoc_male/inter/male_${i}_vol_munge.sumstats.gz \
--ref-ld-chr /lustre/home/acct-clslh/clslh/gyy/zhaohan_rfmri/eur_w_ld_chr/ \
--w-ld-chr  /lustre/home/acct-clslh/clslh/gyy/zhaohan_rfmri/eur_w_ld_chr/ \
--out /lustre/home/acct-clslh/clslh/gyy/UKB/F_vs_M_hg/vol_F_M_${i}_hg;
done
