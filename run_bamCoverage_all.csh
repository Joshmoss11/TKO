#!/bin/csh
foreach l (100 25 1000)
	sbatch --output=out/icm_h3k4me3_cov_${l}.out run_bamCoverage.csh icm_h3k4me3 290 $l
	sbatch --output=out/e65_h3k4me3_cov_${l}.out run_bamCoverage.csh e65_h3k4me3 290 $l
	sbatch --output=out/tko_h3k4me3_cov_${l}.out run_bamCoverage.csh tko_h3k4me3 172 $l
	sbatch --output=out/esc_h3k4me3_cov_${l}.out run_bamCoverage.csh esc_h3k4me3 172 $l
	sbatch --output=out/tko_rnap_cov_${l}.out run_bamCoverage.csh tko_rnap 265 $l
	sbatch --output=out/esc_rnap_cov_${l}.out run_bamCoverage.csh esc_rnap 265 $l
end
