for i in `cat ../header2`;do 
awk '$2-$3>0' R2_result_${i} > ${i}_pos_zscore;
awk '$2-$3<0' R2_result_${i} > ${i}_neg_zscore;
done
