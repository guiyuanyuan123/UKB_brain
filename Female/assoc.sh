awk '$5==2' ../Merge_brain.fam > female
/lustre/home/acct-clslh/clslh/gyy/tool/plink --bfile ../Merge_brain --keep female --make-bed --out UKB_female

split -d -a 1 -l 16 header_vol header_vol_

#assoc_vol_0.sh
for i in `cat header_vol_0`;do
/lustre/home/acct-clslh/clslh/gyy/tool/plink2 --bfile /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/UKB_female \
--pheno /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/brain_pheno --pheno-name ${i} \
--linear hide-covar --covar /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/covar_vol \
--out /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/raw --threads 5 --memory 35840 --covar-variance-standardize;

awk '!/'NA'/' /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/raw.${i}.glm.linear > /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/${i}.glm.linear;
rm /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/raw.${i}.glm.linear;
awk '(NR>1){SNP=$3;A1=$6;A2=$4;N=$8;Z=$9/$10}(NR==1){printf "SNP\tA1\tA2\tN\tZ"}{print SNP"\t"A1"\t"A2"\t"N"\t"Z}' /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/female_linear/${i}.glm.linear > /lustre/home/acct-clslh/clslh/gyy/UKB/assoc_female/txt/vol_txt/${i}.txt
done

vol_mismatch.R     #自己翻SNP和mismatch snp (ldsc不会自动处理)
hg_vol_inter.sh    #ldsc munge不行，总报错，只能自己gzip
hg_vol_all.sh      #不和1kg_ ..合并
