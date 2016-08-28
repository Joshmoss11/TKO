#!/bin/csh
sbatch --output=out/icm_h3k4me3_h.out run_heatmapper.csh icm_h3k4me3 e65_h3k4me3
sbatch --output=out/tko_h3k4me3_h.out run_heatmapper.csh tko_h3k4me3 esc_h3k4me3
sbatch --output=out/tko_rnap_h.out run_heatmapper.csh tko_rnap esc_rnap
