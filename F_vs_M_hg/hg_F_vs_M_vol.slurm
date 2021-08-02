#!/bin/bash

#SBATCH -J vol_hg
#SBATCH -p small
#SBATCH --mail-type=all
#SBATCH --mail-user=2180860670@qq.com
#SBATCH -o %j.out
#SBATCH -e %j.err
#SBATCH -n 3
#SBATCH -N 1
module load miniconda3/4.6.14-gcc-4.8.5 
source activate ldsc
bash /lustre/home/acct-clslh/clslh/gyy/UKB/F_vs_M_hg/hg_F_vs_M_vol.sh
conda deactivate
