#!/bin/csh
#SBATCH --mem=5000
#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=2

if ($#argv != 2) then
    echo "Usage: $0 < name, fragment length>"
        exit 0
endif
set parent = /mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis
set data_dir = ${parent}/data_sorted_filt
set out_dir = ${parent}/bamCoverage_results
mkdir $out_dir
srun bamCoverage --bam $data_dir/${1}.bam --outFileName $out_dir/${1}.bg --outFileFormat bedgraph --binSize 100 --extendReads $2 --ignoreDuplicates
