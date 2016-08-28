#!/bin/csh
sbatch --output=icm_h3k4me3.out run_macs.csh icm_h3k4me3 icm_wce 119
sbatch --output=e65_h3k4me3.out run_macs.csh e65_h3k4me3 e65_wce 145
sbatch --output=tko_h3k4me3.out run_macs.csh tko_h3k4me3 tko_wce 86
sbatch --output=esc_h3k4me3.out run_macs.csh esc_h3k4me3 esc_wce 86
sbatch --output=tko_rnap.out run_macs.csh tko_rnap tko_wce 115
sbatch --output=esc_rnap.out run_macs.csh esc_rnap esc_wce 133
