for i in `cat /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/header2`;do 
for j in `cat /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/header1`;do 
~/tools/plink --bfile /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/assoc/male/UKB_male --score /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/male/${i}/sdpr_male_${i}_${j}.txt 1 2 3 header --out male_${i}_${j};
sed -i 's/SCORE/SCORE_m_'${i}'_'${j}'/g' male_${i}_${j}.profile;
rm  male_${i}_${j}.log;
done;done
