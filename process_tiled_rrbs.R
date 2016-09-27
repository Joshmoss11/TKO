f <- '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/data/EStiled.txt'
x <- read.table(f,sep='\t')[,1:5]
#x.filt <- x[x[,5]>=10,]
x.filt <- x[!(x[,1] %in% c('chrX','chrY')),]
write.table(x.filt,f,sep='\t',col.names=F,row.names=F,quote=F)
