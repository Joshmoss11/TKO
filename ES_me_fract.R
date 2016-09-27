options("scipen"=100, "digits"=4)
data.dir <- '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/alon_bg'
x <- read.table(file.path(data.dir,'GSE30202_BisSeq_ES_CpGmeth.tsv'),sep='\t',header=T)
x <- x[x[,3]>=10,]
y <- data.frame(chr = x[,1], start = x[,2], end = x[,2]+1, me = x[,4]/x[,3])
y <- y[!(y$chr %in% c('chrX','chrY','chrM')),]
write.table(y,file.path(data.dir,'GSE30202_BisSeq_ES_CpGmeth.bg'),sep='\t',col.names=F,row.names=F,quote=F)
