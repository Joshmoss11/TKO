setwd('/media/joshuamo/7CFE35B36F7B16AF/Documents/RNAP good run/for-Josh')
library(gplots)
library(pheatmap)
source('heatmap_functions.R')
setwd('/media/joshuamo/7CFE35B36F7B16AF/Documents/Cedar/Embryo/H3k4 data from alon 10-14')



d1 <- read.table("tss_heatmap1.txt", header=T,row.names=1)[1:30000,]
m1 <- as.matrix(d1)
rownames(m1) <- rownames(d1)
colnames(m1) <- colnames(d1)
m1[which(is.nan(m1),arr.ind=T)[,1],which(is.nan(m1),arr.ind=T)[,2]] <- 0

m1[which(is.nan(m1),arr.ind=T)[,1],which(is.nan(m1),arr.ind=T)[,2]] <- 0

#m1.filtered <- m1[!is.nan(m1[,1]),]
#m1.filtered <- m1.filtered[!is.nan(m1.filtered[,102]),]


km1 <- kmeans(m3,4)
m1.ordered <- m1[order(km1$cluster),]
m2.ordered <- m2[order(km1$cluster),]

heatmap.2(m1.ordered, col=hmcols,breaks=bk, Rowv= FALSE , Colv=FALSE, dendrogram="none", useRaster = TRUE, symkey=FALSE, symm=F, symbreaks=T, scale="none", trace="none", labRow=NA, labCol=NA,key=F)


d2 <- read.table("tss_heatmap2.txt", header=T,row.names=1)[1:30000,]
m2 <- as.matrix(d2)
rownames(m2) <- rownames(d2)
colnames(m2) <- colnames(d2)

#z-score transform whole matrix
# transform to zscore
num.samples <- 2
num.rows <- length(d1[,1])
cells.in.sample <- (length(colnames(d1)))/num.samples

for (i in 1:num.samples){ 
  idx <- (1+(i-1)*cells.in.sample):(i*cells.in.sample)
    mean.matrix <- mean(m1[,idx],na.rm=T)
    sd.matrix <- sd(m1[,idx],na.rm=T)
    m1[,idx] <-  (m1[,idx]-mean.matrix)/sd.matrix
}


heatmap.2(m2, col=hmcols,breaks=bk, Rowv= FALSE , Colv=FALSE, dendrogram="none", useRaster = TRUE, symkey=FALSE, symm=F, symbreaks=T, scale="none", trace="none", labRow=NA, labCol=NA,key=F)
km2 <- kmeans(m2,3)
m2.ordered <- m2[order(km2$cluster),]
heatmap.2(m2.ordered, col=hmcols,breaks=bk, Rowv= FALSE , Colv=FALSE, dendrogram="none", useRaster = TRUE, symkey=FALSE, symm=F, symbreaks=T, scale="none", trace="none", labRow=NA, labCol=NA,key=F)


m3 <- cbind(m1[,102:202],m2[,102:202])



# 
# d1 <- read.table("icm_peaks_heatmap.txt", header=T,row.names=1)
# #d1 <- d1[1:10000,]
# head(d1)
# #m1<- as.matrix( d1[,2:ncol(d1)])   # the first column is the TSS id,
# m1 <- as.matrix(d1)
# #rownames(m1)<- d1$Gene            # heatmap.2 works only on matrix, turn the dataframe to matrix, and                                                        # add the TSS id as the row name
# rownames(m1) <- rownames(d1)
# colnames(m1) <- colnames(d1)
# 
# m1<- log2(m1+1)
# #exam the data range
# range(m1)
# 
# hist(m1)    # histogram to look at distributions
# 
# bk = unique(c(seq(-0.1,3, length=100),seq(3,9.7,length=100)))
# 
# hmcols<- colorRampPalette(c("white","red"))(length(bk)-1)   
# 
# 
# # you can play around with the break points, 9.7 is the max of the matrix m1
# # if just use bk =  c(seq(-0.1,1, length=100),seq(1,12.5,length=100)) without the unique function
# # the pheatmap gave me error message:
# # Error in cut.default(x, breaks = breaks, include.lowest = T) : 
# # 'breaks' are not unique
# # It is caused by concatenating several seq() results together, which share the same boundaries.
# # try ?dist ?hclust
# 
# 
# png("icm_h3k4me3_peaks_heatmap.png", width=300, height = 800)     # width and height are in pixel 
# 
# heatmap.2(m1, col=hmcols, breaks = bk, Rowv= FALSE , Colv=FALSE, dendrogram="none", useRaster = TRUE, symkey=FALSE, symm=F, symbreaks=T, scale="none", trace="none", labRow=NA, labCol=NA)
# 
# hmcols<- colorRampPalette(c("white","red"))(100)   
# 
# pheatmap(m1, color=hmcols,  breaks= bk,  cluster_rows=FALSE, cluster_cols=FALSE, legend=FALSE, show_rownames=FALSE, show_colnames=FALSE)
# 
# dev.off()