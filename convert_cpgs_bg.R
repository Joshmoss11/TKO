convert_cpgs_bg <- function(cpgs.f,bg.f){
	x <- read.table(cpgs.f,sep='\t',header=F)
	x <- x[x[,3]>=10,]
	x[,5] <- x[,4]/x[,3]
	x <- data.frame(chr=x[,1],start=x[,2],end=(x[,2]+1),me=x[,5])
	x <- x[!(x[,1] %in% c('chrX','chrY')),]
	write.table(x,bg.f,sep='\t',col.names=F,row.names=F,quote=F)
}
cpgs.dir <- '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/in_vivo/meth_GSE34864'
cpgs.f <- file.path(cpgs.dir,'GSM856544_ICM-BDF1-BDF1-5.cpgs.txt')
bg.f <- file.path(cpgs.dir,'GSM856544_ICM-BDF1-BDF1-5.bg')
convert_cpgs_bg(cpgs.f,bg.f)

cpgs.f <- file.path(cpgs.dir,'GSM856547_E65-BDF1-BDF1-2.cpgs.txt')
bg.f <- file.path(cpgs.dir,'GSM856547_E65-BDF1-BDF1-2.bg')
convert_cpgs_bg(cpgs.f,bg.f)

cpgs.f <- file.path(cpgs.dir,'GSM856550_E75-BDF1-BDF1-1.cpgs.txt')
bg.f <- file.path(cpgs.dir,'GSM856550_E75-BDF1-BDF1-1.bg')
convert_cpgs_bg(cpgs.f,bg.f)
