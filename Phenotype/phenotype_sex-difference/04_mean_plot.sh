for i in `cat test`;do awk '$5-0.05 <0 && $4=="'${i}'_m"' raw_${i}_t_test_BH > ${i}_m_higher;done
for i in `cat test`;do awk '$5-0.05 <0 && $4=="'${i}'_f"' raw_${i}_t_test_BH > ${i}_f_higher;done
for i in `cat test`;do awk 'NR==FNR{a[$1]=$0;next}{if($1 in a)print $0}' ${i}_m_higher ${i}_residual_mean|awk '{print $1,$2,"'${i}'_male"}' > 1;awk 'NR==FNR{a[$1]=$0;next}{if($1 in a)print $0}' ${i}_m_higher ${i}_residual_mean|awk '{print $3,$4,"'${i}'_female"}' >> 1;sort -gk1 1 >2;cat header 2 > mean_mh${i};rm 1 2;done
for i in `cat test`;do awk 'NR==FNR{a[$1]=$0;next}{if($1 in a)print $0}' ${i}_f_higher ${i}_residual_mean|awk '{print $1,$2,"'${i}'_male"}' > 1;awk 'NR==FNR{a[$1]=$0;next}{if($1 in a)print

