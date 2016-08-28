#!/bin/csh
sbatch --output=icm_h3k4me3.out run_macs2.csh icm_h3k4me3 icm_wce
sbatch --output=e65_h3k4me3.out run_macs2.csh e65_h3k4me3 e65_wce
sbatch --output=tko_h3k4me3.out run_macs2.csh tko_h3k4me3 tko_wce
sbatch --output=esc_h3k4me3.out run_macs2.csh esc_h3k4me3 esc_wce
sbatch --output=tko_rnap.out run_macs2.csh tko_rnap tko_wce
sbatch --output=esc_rnap.out run_macs2.csh esc_rnap esc_wce
