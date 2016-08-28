#!/bin/csh
#SBATCH --mem=5000
#SBATCH --time=2:00:00
#SBATCH --cpus-per-task=2

if ($#argv != 2) then
    echo "Usage: $0 < name 1, name 2>"
        exit 0
endif
# peaks for the first input will be used
set parent = /mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis
set peaks_dir = ${parent}/peaks_macs
set bw_dir = ${parent}/BigWigs
set out_dir = ${parent}/heatmapper_results
mkdir $out_dir
srun computeMatrix reference-point --regionsFileName ${peaks_dir}/${1}_peaks.broadPeak --scoreFileName $bw_dir/${1}.bw --beforeRegionStartLength 2500 --afterRegionStartLength 2500 --binSize 100 --outFileName $out_dir/${1}.matrix --outFileNameMatrix $out_dir/${1}_matrix.tab --sortRegions descend --outFileSortedRegions $out_dir/${1}_sorted_regions.bed --referencePoint center --missingDataAsZero

srun plotHeatmap --matrixFile $out_dir/${1}.matrix --outFileName $out_dir/${1}.png --sortRegions no --refPointLabel Peak --regionsLabel Peaks

srun computeMatrix reference-point --regionsFileName $out_dir/${1}_sorted_regions.bed --scoreFileName $bw_dir/${2}.bw --beforeRegionStartLength 2500 --afterRegionStartLength 2500 --binSize 100 --outFileName $out_dir/${2}.matrix --outFileNameMatrix $out_dir/${2}_matrix.tab --sortRegions no --referencePoint center --missingDataAsZero

srun plotHeatmap --matrixFile $out_dir/${2}.matrix --outFileName $out_dir/${2}.png --sortRegions no --refPointLabel Peak --regionsLabel Peaks
