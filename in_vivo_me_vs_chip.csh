#!/bin/csh
set me_e65_f = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/in_vivo/meth_GSE34864/GSM856547_E65-BDF1-BDF1-2.100.bg'
set me_e75_f = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/in_vivo/meth_GSE34864/GSM856550_E75-BDF1-BDF1-1.100.bg'
set mm9_s = '/mnt/lustre/hms-01/fs01/joshua.moss/genomes/mm9.chrom.sizes'
set k4_icm_f = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/in_vivo/h3k4me3/bam_files/F1797-icm-h3k4me3-b1.bg'
set k4_e65_f = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/in_vivo/h3k4me3/bam_files/F1797-e65-h3k4me3-b1.bg'
set out_dir = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/rrbs_vs_chip'
set flank_e65_f = ${out_dir}'/e65_100.flank'
set flank_e75_f = ${out_dir}'/e75_100.flank'
mkdir $out_dir
bedtools slop -i $me_e65_f -g $mm9_s -b 1000 > $flank_e65_f
bedtools slop -i $me_e75_f -g $mm9_s -b 1000 > $flank_e75_f
#bedtools map -c 4 -o max -null 0 -a $flank_f -b $k4_f > ${out_dir}'/k4_flank_GSE30202.bg'
bedtools map -c 4 -o max -null 0 -a $flank_e65_f -b $k4_icm_f > ${out_dir}'/icm_k4_flank_rrbs_e65.bg'
bedtools map -c 4 -o max -null 0 -a $flank_e65_f -b $k4_e65_f > ${out_dir}'/e65_k4_flank_rrbs_e65.bg'
bedtools map -c 4 -o max -null 0 -a $flank_e75_f -b $k4_icm_f > ${out_dir}'/icm_k4_flank_rrbs_e75.bg'
bedtools map -c 4 -o max -null 0 -a $flank_e75_f -b $k4_e65_f > ${out_dir}'/e65_k4_flank_rrbs_e75.bg'
