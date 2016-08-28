mat.dir <- '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/heatmapper_results'
tko.k4.f <- file.path(mat.dir,'tko_h3k4me3_matrix.tab')
tko.k4 <- as.matrix(read.table(tko.k4.f,header=F,skip=2))

bk = c(seq(-0.1,3, length=100),seq(3.1,10,length=100))
hmcols<- colorRampPalette(c("white","red"))(length(bk)-1)
png("tko_k4_heatmap.png", width=300, height = 800)
heatmap(tko.k4[nrow(tko.k4):1,],scale='none',Rowv=NA,Colv=NA,col=hmcols,breaks=bk)
dev.off()

library(gplots)
png("tko_k4_heatmap.png", width=300, height = 800)
bk = unique(c(seq(-0.1,3, length=100),seq(3,9.7,length=100)))
hmcols<- colorRampPalette(c("red","while"))(length(bk)-1)
heatmap.2(tko.k4, col=hmcols,breaks=bk, Rowv= FALSE , Colv=FALSE, dendrogram="none", useRaster = TRUE, symkey=FALSE, symm=F, symbreaks=T, scale="none", trace="none", labRow=NA, labCol=NA,key=F)
dev.off()
