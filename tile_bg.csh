#!/bin/csh
set t = '/mnt/lustre/hms-01/fs01/joshua.moss/genomes/100bp_tiles/mm9_100bp_tiles.txt'
set p = '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/in_vivo/meth_GSE34864'
set icm = ${p}/'GSM856544_ICM-BDF1-BDF1-5.bg'
set icm_t = ${p}/'GSM856544_ICM-BDF1-BDF1-5.100.bg'
set e65 = ${p}/'GSM856547_E65-BDF1-BDF1-2.bg'
set e65_t = ${p}/'GSM856547_E65-BDF1-BDF1-2.100.bg'
set e75 = ${p}/'GSM856550_E75-BDF1-BDF1-1.bg'
set e75_t = ${p}/'GSM856550_E75-BDF1-BDF1-1.100.bg'

bedtools map -null NA -a $t -b $icm -c 4 -o mean > ${icm_t}
awk '$4 != "NA"' FS='\t' $icm_t > ${icm_t}.filt
mv ${icm_t}.filt $icm_t

bedtools map -null NA -a $t -b $e65 -c 4 -o mean > ${e65_t}
awk '$4 != "NA"' FS='\t' $e65_t > ${e65_t}.filt
mv ${e65_t}.filt $e65_t

bedtools map -null NA -a $t -b $e75 -c 4 -o mean > ${e75_t}
awk '$4 != "NA"' FS='\t' $e75_t > ${e75_t}.filt
mv ${e75_t}.filt $e75_t


