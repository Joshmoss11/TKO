#!/bin/csh
sbatch --output=icm_h3k4me3_bw.out run_bg2bw.csh icm_h3k4me3
sbatch --output=e65_h3k4me3_bw.out run_bg2bw.csh e65_h3k4me3
sbatch --output=tko_h3k4me3_bw.out run_bg2bw.csh tko_h3k4me3
sbatch --output=esc_h3k4me3_bw.out run_bg2bw.csh esc_h3k4me3
sbatch --output=tko_rnap_bw.out run_bg2bw.csh tko_rnap
sbatch --output=esc_rnap_bw.out run_bg2bw.csh esc_rnap
