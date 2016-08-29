#!/bin/csh
set me_f = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/data/J1_2_cut5_100bp.bedGraph'
set mm9_s = '/mnt/lustre/hms-01/fs01/joshua.moss/genomes/mm9.chrom.sizes'
set k4_f = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/bamCoverage_results/tko_h3k4me3_25.sorted.bg'
set out_dir = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/me_vs_chip'
set flank_f = ${out_dir}'/J1_2_cut5_100bp.flank'
mkdir $out_dir
bedtools slop -i $me_f -g $mm9_s -b 1000 > $flank_f
bedtools map -c 4 -o max -null 0 -a $flank_f -b $k4_f > ${out_dir}'/k4_flank.bg'
