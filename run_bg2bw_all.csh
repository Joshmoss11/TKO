#!/bin/csh
foreach l(100 25 1000)
	sbatch --output=out/icm_h3k4me3_bw_${l}.out run_bg2bw.csh icm_h3k4me3_$l
	sbatch --output=out/e65_h3k4me3_bw_${l}.out run_bg2bw.csh e65_h3k4me3_$l
	sbatch --output=out/tko_h3k4me3_bw_${l}.out run_bg2bw.csh tko_h3k4me3_$l
	sbatch --output=out/esc_h3k4me3_bw_${l}.out run_bg2bw.csh esc_h3k4me3_$l
	sbatch --output=out/tko_rnap_bw_${l}.out run_bg2bw.csh tko_rnap_$l
	sbatch --output=out/esc_rnap_bw_${l}.out run_bg2bw.csh esc_rnap_$l
end
