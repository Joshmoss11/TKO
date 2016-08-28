#!/bin/csh
#SBATCH --mem=5000
#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=2

if ($#argv != 3) then
    echo "Usage: $0 < name, wce_name, shiftsize>"
        exit 0
endif
set parent = /mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis
mkdir ${parent}/peaks_macs
cd ${parent}/peaks_macs
srun macs -t ${parent}/data_sorted_filt/${1}.bam -c ${parent}/data_sorted_filt/${2}.bam -g mm -n ${1} --nomodel --shiftsize $3
