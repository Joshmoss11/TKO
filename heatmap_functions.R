#functions for heatmapping

#z-score transform by row
zscore.per.row <- function(matrix,num.samples){
  num.rows <- length(matrix[,1])
  cells.in.sample <- (length(colnames(matrix)))/num.samples
  
  for (i in 1:num.samples){ 
    idx <- (1+(i-1)*cells.in.sample):(i*cells.in.sample)
    for (j in 1:num.rows){
      mean.row <- mean(matrix[j,idx],na.rm=T)
      sd.row <- sd(matrix[j,idx],na.rm=T)
      matrix[j,idx] <-  (matrix[j,idx]-mean.row)/sd.row
    }    
  }
  return(matrix)
}

#z-score transform whole matrix
zscore.matrix <- function(matrix,num.samples){
  num.rows <- length(matrix[,1])
  cells.in.sample <- (length(colnames(d1)))/num.samples
  
  for (i in 1:num.samples){ 
    idx <- (1+(i-1)*cells.in.sample):(i*cells.in.sample)
    mean.matrix <- mean(m1[,idx],na.rm=T)
    sd.matrix <- sd(m1[,idx],na.rm=T)
    m1[,idx] <-  (m1[,idx]-mean.matrix)/sd.matrix
  }
  return(matrix)
}

# plot two heatmaps side by side
heatmap.sbs <- function(m1,m2,bk1=c(0,3),bk2=c(0,1),draw.img=F,img.name='heatmap_sbs.png'){
source('heatmap.3.R')

if (draw.img==T){
  png(img.name, width=300, height = 800)     # width and height are in pixel 
}
#par(mfrow=c(1,2))
layout(matrix(c(1,2), 1, 2, byrow = TRUE),widths=c(4,4),heights=c(20,20),respect=FALSE)
par(mar=c(0,0,0,0)+0.0)
bk = seq(bk1[1],bk1[2], length=100)
hmcols<- colorRampPalette(c("white","red"),bias=1)(length(bk)-1)   
heatmap.3(m1, col=hmcols,breaks=bk, Rowv= FALSE , Colv=FALSE, dendrogram="none", useRaster = TRUE, symkey=FALSE, symm=F, symbreaks=T, scale="none", trace="none", labRow=NA, labCol=NA,key=F)

bk = seq(bk2[1],bk2[2], length=100)
hmcols<- colorRampPalette(c("white","red"),bias=1)(length(bk)-1)   
heatmap.3(m2, col=hmcols,breaks=bk, Rowv= FALSE , Colv=FALSE, dendrogram="none", useRaster = TRUE, symkey=FALSE, symm=F, symbreaks=T, scale="none", trace="none", labRow=NA, labCol=NA,key=F)
dev.off()
}