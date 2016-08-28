#!/bin/csh
sbatch --output=icm_h3k4me3_cov.out run_bamCoverage.csh icm_h3k4me3 290
sbatch --output=e65_h3k4me3_cov.out run_bamCoverage.csh e65_h3k4me3 290
sbatch --output=tko_h3k4me3_cov.out run_bamCoverage.csh tko_h3k4me3 172
sbatch --output=esc_h3k4me3_cov.out run_bamCoverage.csh esc_h3k4me3 172
sbatch --output=tko_rnap_cov.out run_bamCoverage.csh tko_rnap 265
sbatch --output=esc_rnap_cov.out run_bamCoverage.csh esc_rnap 265
