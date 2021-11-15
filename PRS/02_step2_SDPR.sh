export LD_LIBRARY_PATH=~/tools/SDPR/MKL/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=~/tools/SDPR/gsl/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=~/tools/anaconda3/lib/:$LD_LIBRARY_PATH
for i in {1..22};do
~/tools/SDPR/SDPR -mcmc -ref_dir ~/measures/SDPR/reference/ref/ \
-ss /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/raw/female_raw_25021_SDPR.txt \
-chr ${i} -out /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/raw/female_raw_${i}_25021.txt \
-a 0.1 -N 11834 \
-n_threads 3;
done

cat /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/raw/female_raw_*_25021.txt| \
awk '(NR>1){SNP=$1;A1=$2;beta=$3}(NR==1){print "SNP    A1   beta"}(NR>1 && $1!="SNP"){print SNP"\t"A1"\t"beta}' \
> /data1/tmp/wangzhaobin/UKB/gyy_ukb/UKB_vol/PRS/159/female/raw/female_raw_25021.txt;


#clslh
export LD_LIBRARY_PATH=/lustre/home/acct-clslh/clslh/gyy/tool/SDPR/gsl/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/lustre/home/acct-clslh/clslh/gyy/tool/SDPR/MKL/lib:$LD_LIBRARY_PATH

for i in {1..4};do
/lustre/home/acct-clslh/clslh/gyy/tool/SDPR/SDPR -mcmc -ref_dir /lustre/home/acct-clslh/clslh/gyy/SDPR/ref/ \
-ss /lustre/home/acct-clslh/clslh/gyy/SDPR/male/raw/male_raw_25021_SDPR.txt \
-a 0.1 -N 11055 -chr ${i} -n_threads 3 \
-out /lustre/home/acct-clslh/clslh/gyy/SDPR/male/raw/male_raw_${i}_25021.txt ;
done
