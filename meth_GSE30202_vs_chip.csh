#!/bin/csh
set me_f = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/alon_bg/GSE30202_BisSeq_ES_CpGmeth_100_noNA.bg'
set mm9_s = '/mnt/lustre/hms-01/fs01/joshua.moss/genomes/mm9.chrom.sizes'
set k4_f = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/bamCoverage_results/tko_h3k4me3_100.sorted.bg'
set k4_f_2 = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/alon_bg/TKO-H3K4me3.bedGraph'
set rnap_f_2 = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/alon_bg/TKO_RNAP2.bedgraph'
set out_dir = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/me_vs_chip'
set flank_f = ${out_dir}'/GSE30202_BisSeq_ES_CpGmeth_100_noNA.flank'
mkdir $out_dir
#bedtools slop -i $me_f -g $mm9_s -b 1000 > $flank_f
#bedtools map -c 4 -o max -null 0 -a $flank_f -b $k4_f > ${out_dir}'/k4_flank_GSE30202.bg'
bedtools map -c 4 -o max -null 0 -a $flank_f -b $k4_f_2 > ${out_dir}'/tko_k4_flank_GSE30202_2.bg'
bedtools map -c 4 -o max -null 0 -a $flank_f -b $rnap_f_2 > ${out_dir}'/tko_rnap_flank_GSE30202_2.bg'
