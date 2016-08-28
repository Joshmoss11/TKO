#!/bin/csh
#SBATCH --mem=5000
#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=2

if ($#argv != 1) then
    echo "Usage: $0 < name>"
        exit 0
endif
set parent = /mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis
set chrom_sizes = /mnt/lustre/hms-01/fs01/joshua.moss/genomes/mm9.chrom.sizes.1
set out_dir = ${parent}/BigWigs
mkdir $out_dir
set in_dir = ${parent}/bamCoverage_results
sort -k1,1 -k2,2n $in_dir/${1}.bg > $in_dir/${1}.sorted.bg
srun bedGraphToBigWig $in_dir/${1}.sorted.bg $chrom_sizes $out_dir/${1}.bw
