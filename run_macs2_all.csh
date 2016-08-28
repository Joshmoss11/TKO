#!/bin/csh
mkdir out
sbatch --output=out/icm_h3k4me3.out run_macs2.csh icm_h3k4me3 icm_wce
sbatch --output=out/e65_h3k4me3.out run_macs2.csh e65_h3k4me3 e65_wce
sbatch --output=out/tko_h3k4me3.out run_macs2.csh tko_h3k4me3 tko_wce
sbatch --output=out/esc_h3k4me3.out run_macs2.csh esc_h3k4me3 esc_wce
sbatch --output=out/tko_rnap.out run_macs2.csh tko_rnap tko_wce
sbatch --output=out/esc_rnap.out run_macs2.csh esc_rnap esc_wce
