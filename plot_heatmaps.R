#mat.dir <- '/mnt/lustre/hms-01/fs01/joshua.moss/cedar/embryo/tko_analysis/heatmapper_results'
mat.dir <- '~/tko_analysis'
tko.k4.f <- file.path(mat.dir,'tko_h3k4me3_matrix.tab')
tko.k4 <- as.matrix(read.table(tko.k4.f,header=F,skip=2,nrows=-1))

rotate <- function(x) t(apply(x, 2, rev))

library(RColorBrewer)
#bk = c(seq(-0.1,3, length=100),seq(3.1,387.2,length=100))

tko.k4.p <- tko.k4; tko.k4.p[tko.k4>30] <- 30
bk = c(seq(0,30,length=100))
hmcols<- colorRampPalette(c("white","red"))(length(bk)-1)
png(file.path(mat.dir,"tko_k4_heatmap.png"), width=300, height = 800)
image(rotate(tko.k4.p),useRaster = TRUE,axes=F,col=hmcols,breaks=bk)
dev.off()



png("tko_k4_heatmap.png", width=300, height = 800)
heatmap(tko.k4[nrow(tko.k4):1,],scale='none',Rowv=NA,Colv=NA,col=hmcols,breaks=bk)
dev.off()

library(gplots)
png("tko_k4_heatmap.png", width=300, height = 800)
bk = unique(c(seq(-0.1,3, length=100),seq(3,9.7,length=100)))
hmcols<- colorRampPalette(c("red","while"))(length(bk)-1)
heatmap.2(tko.k4, col=hmcols,breaks=bk, Rowv= FALSE , Colv=FALSE, dendrogram="none", useRaster = TRUE, symkey=FALSE, symm=F, symbreaks=T, scale="none", trace="none", labRow=NA, labCol=NA,key=F)
dev.off()
