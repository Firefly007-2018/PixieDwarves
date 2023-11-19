#source("https://bioconductor.org/biocLite.R")
#biocLite("edgeR")
library(edgeR)

### 
# Quick MDS scale of the dataset

rm(list = ls())


TS <- read.csv(file.choose(), row.names = 1, header = T)
head(TS)# Input variable names
TS <- TS[,1:15]

Treat <- factor(substring(colnames(TS),1,3))
Treat
Treat <- relevel(Treat, ref = "Pin") #setting TS as the control treatment; all treatment are compared to the control
Treat
Tissue <- factor(substring(colnames(TS),5,6))
Tissue
Rep <- factor(substring(colnames(TS),11,11))
Rep
#design1 <- model.matrix(~0+Treat+Tissue)
design1 <- model.matrix(~0+Treat)

YZdata <- TS

rownames(design1) <- names(YZdata)
design1

#design1 <- model.matrix(~Treat + Transgenic)
# experimental design; loop here when the BCV test show erratic plot; ie is blocking (or interaction design is appropriate?)
#design1 <- model.matrix(~0+Treat, YZdata) # CRD design; Treat as single factor ANOVA
#design2 <- model.matrix(~0+Tissue + Treat, YZdata) # for all; no interaction. ~ RCBD design; Tissue as block; and we are not interested in the Tissue per se but rather its correction
#design3 <- model.matrix(~Tissue + Treat + Tissue*Treat, YZdata) # inlcudes test of interaction; Tissue x Treatment

# reinterpret dataset for program
y <- DGEList(counts=YZdata, group=Treat) 
y <- calcNormFactors(y) # normalize according to library abundance bias; ie larger libraries tends to 'drown out' smaller libraries; this introduces huge bias
cpmdata <- cpm(y)
#write.csv(cpmdata, "PixieProject.round2_CPMreads.csv")
y <- estimateDisp(y, design1, robust = T)
y <- estimateGLMCommonDisp(y, design1)
y <- estimateGLMTrendedDisp(y, design1)
y <- estimateGLMTagwiseDisp(y, design1) # see the plotBCV results
#y <- estimateExonGenewiseDisp(y)

# estimate pattern
# no filter
colnames(y$counts)
dimbefore <- nrow(y)
tis <- "Shoot"
plotMDS(y[, 1:15], col =c(factor(Treat)),
        main=paste(tis,"transcriptome; filtered", dimbefore, "genes"),cex = 0.8, cex.sub=0.8) 

plotBCV(y,cex = 0.8, cex.sub=0.8,main=paste(tis,"transcriptome; filtered", dimbefore, "genes"))  

#####
#generic filter

dim(y)
y$samples
keep <- rowSums(cpm(y[,1:16]) >= 1 ) >= 9  
keep <- rowMeans(cpm(y[,1:3]) >= 1) | rowMeans(cpm(y[,4:6]) >= 1) | rowMeans(cpm(y[,7:9]) >= 1) | rowMeans(cpm(y[,10:12]) >= 1)| rowMeans(cpm(y[,13:15]) >= 1) >=1
#keep <- rowMeans(cpm(y[,1:2]) >= 1) | rowMeans(cpm(y[,3:5]) >= 1) | rowMeans(cpm(y[,6:8]) >= 1) | rowMeans(cpm(y[,9:11]) >= 1)| rowMeans(cpm(y[,12:14]) >= 1) >=1


#rowSums(cpm(y[1:3,1:3]) >= 1) >=3

table(keep) # true is all 0
y2 <- y[keep, , keep.lib.sizes=FALSE]
zer <- nrow(y) - nrow(y2)
dimafter <- nrow(y2)
#keep <- rowSums(cpm(y2) > 1 ) >= 23 
#table(keep) # false contains the filtered data 7911 
#y2 <- y2[keep, , keep.lib.sizes=FALSE]
#dimafter <- nrow(y2)

#cpm2less <- dimbefore - zer - dimafter 


plotMDS(y2[,1:15], col =c(factor(Treat)) , pch=points(factor(Treat)), main=paste(tis,"PIXIE PRoject 2019; After Filter", dimafter), 
        cex = 0.8, cex.sub=0.8)  
dim(y2)
plotBCV(y2,main=paste(tis,"PIXIE PRoject 2019; After Filter", dimafter))


barplot(y[,1:16]$samples$lib.size*1e-6, names=colnames(y[,1:16]$counts), ylab="Library size (millions)", cex.names = 0.5)
barplot(y$samples$lib.size*1e-6, names=colnames(y$counts), ylab="Library size (millions)", cex.names = 0.5)



###
library(ggplot2)
library(reshape2)
yy <- as.data.frame(y$counts[,1:15])
dat_melt <- melt(yy)
ggplot(dat_melt, aes(x=log2(value))) + geom_histogram() + facet_wrap(~ variable) + ggtitle(paste("freq dist",nrow(y),"genes"))

yy <- as.data.frame(y2$counts[,1:15])
dat_melt <- melt(yy)
ggplot(dat_melt, aes(x=log2(value))) + geom_histogram() + facet_wrap(~ variable) + ggtitle(paste("filtered:freq dist",nrow(y2),"genes"))


#yyy <- hist(log2(yy$`10aRt`))


#################
#y <- y2


#design1 <- model.matrix(~0+Treat+Tissue)
design1 <- model.matrix(~0+Treat)
design1
fit <- glmFit(y, design1, robust=T)
colnames(design1)
#Px1.Pin -1,1,0,0,0,0,0,0,0,0,0,0
#PxL.Px1 0,-1,0,1,0,0,0,0,0,0,0,0
#PxM.Px1 0,-1,0,0,1,0,0,0,0,0,0,0
#PxM.PxL 0,0,0,-1,1,0,0,0,0,0,0,0
#PxS.Pin -1,0,0,0,0,1,0,0,0,0,0,0
#PxS.PxL 0,0,0,-1,0,1,0,0,0,0,0,0
PixvsPin <- makeContrasts(TreatPix-TreatPin, levels=design1)
DiavsPin <- makeContrasts(TreatDia-TreatPin, levels=design1)
GiavsPin <- makeContrasts(TreatGia-TreatPin, levels=design1)
TiavsPin <- makeContrasts(TreatTia-TreatPin, levels=design1)

test <- "PixvsPin"
tis
lrt <- glmLRT(fit, contrast= PixvsPin )
topTags(lrt)
FDR <- p.adjust(lrt$table$PValue, method="BH")
sum(FDR < 0.05) # if high number, then the treatments should be analyzed per group (ie Tissue)
head(all.PixvsPin <- cbind(lrt$table, FDR))
#write.csv(all.DiavsPin, file=paste(tis,test,".DEG_FDRtable.summary.csv",sep = ""))
#######################
summary(de <- decideTestsDGE(lrt, adjust.method = "BH", p.value = 0.05, lfc = log2(1.5))) # keep in mind the contrast previously made
# lfc  0.5849625

detags <- rownames(y) [as.logical(de)] 
de <- data.frame(de)
down <- sum(de=="-1")
up <- sum(de=="1")

plotSmear(lrt, de.tags=detags, main=paste(tis,test,":",up+down ,
          "DEGenes;",up,"up-reg genes,",down,
          "down-reg genes", "(fdr< 0.05, 1.5XFC)"), cex=1.1)
abline(h=c(-0.1375035,0.1375035), col="blue")

#------------------------------
test <- "DiavsPin"
tis
lrt <- glmLRT(fit, contrast= DiavsPin)
topTags(lrt)
FDR <- p.adjust(lrt$table$PValue, method="BH")
sum(FDR < 0.05) # if high number, then the treatments should be analyzed per group (ie Tissue)
head(all.DiavsPin <- cbind(lrt$table, FDR))
#write.csv(all.DiavsPin, file=paste(tis,test,".DEG_FDRtable.summary.csv",sep = ""))
#######################
summary(de <- decideTestsDGE(lrt, adjust.method = "BH", p.value = 0.05, lfc = log2(1.1))) # keep in mind the contrast previously made
# lfc  0.5849625

detags <- rownames(y) [as.logical(de)] 
de <- data.frame(de)
down <- sum(de=="-1")
up <- sum(de=="1")

plotSmear(lrt, de.tags=detags, main=paste(tis,test,":",up+down ,
                                          "DEGenes;",up,"up-reg genes,",down,
                                          "down-reg genes", "(fdr< 0.01, 1.1XFC)"), cex=1.1)
abline(h=c(-0.1375035,0.1375035), col="blue")

#--------------------
test <- "GiavsPin"
tis
lrt <- glmLRT(fit, contrast= GiavsPin)
topTags(lrt)
FDR <- p.adjust(lrt$table$PValue, method="BH")
sum(FDR < 0.05) # if high number, then the treatments should be analyzed per group (ie Tissue)
head(all.GiavsPin <- cbind(lrt$table, FDR))
#write.csv(all.DiavsPin, file=paste(tis,test,".DEG_FDRtable.summary.csv",sep = ""))
#######################
summary(de <- decideTestsDGE(lrt, adjust.method = "BH", p.value = 0.05, lfc = log2(1.1))) # keep in mind the contrast previously made
# lfc  0.5849625

detags <- rownames(y) [as.logical(de)] 
de <- data.frame(de)
down <- sum(de=="-1")
up <- sum(de=="1")

plotSmear(lrt, de.tags=detags, main=paste(tis,test,":",up+down ,
                                          "DEGenes;",up,"up-reg genes,",down,
                                          "down-reg genes", "(fdr< 0.01, 1.1XFC)"), cex=1.1)
abline(h=c(-0.1375035,0.1375035), col="blue")

#--------------------
test <- "TiavsPin"
tis
lrt <- glmLRT(fit, contrast= TiavsPin)
topTags(lrt)
FDR <- p.adjust(lrt$table$PValue, method="BH")
sum(FDR < 0.05) # if high number, then the treatments should be analyzed per group (ie Tissue)
head(all.TiavsPin <- cbind(lrt$table, FDR))
#write.csv(all.DiavsPin, file=paste(tis,test,".DEG_FDRtable.summary.csv",sep = ""))
#######################
summary(de <- decideTestsDGE(lrt, adjust.method = "BH", p.value = 0.05, lfc = log2(1.1))) # keep in mind the contrast previously made
# lfc  0.5849625

detags <- rownames(y) [as.logical(de)] 
de <- data.frame(de)
down <- sum(de=="-1")
up <- sum(de=="1")

plotSmear(lrt, de.tags=detags, main=paste(tis,test,":",up+down ,
                                          "DEGenes;",up,"up-reg genes,",down,
                                          "down-reg genes", "(fdr< 0.01, 1.1XFC)"), cex=1.1)
abline(h=c(-0.1375035,0.1375035), col="blue")

#--------------------
all.PixvsPin
all.DiavsPin
all.GiavsPin
all.TiavsPin


# absolute FC
count.PixvsPin <- table(tab.PixvsPin <- (all.PixvsPin$FDR <= 0.05 & abs(all.PixvsPin$logFC) >= abs(log2(1.5)))) [2]
count.DiavsPin <- table(tab.DiavsPin <- (all.DiavsPin$FDR <= 0.05 & abs(all.DiavsPin$logFC) >= abs(log2(1.5)))) [2]
count.GiavsPin <- table(tab.GiavsPin <- (all.GiavsPin$FDR <= 0.05 & abs(all.GiavsPin$logFC) >= abs(log2(1.5)))) [2]
count.TiavsPin <- table(tab.TiavsPin <- (all.TiavsPin$FDR <= 0.05 & abs(all.TiavsPin$logFC) >= abs(log2(1.5)))) [2]




#--
#source("https://bioconductor.org/biocLite.R")
#biocLite("limma")
library(limma)
fin <- cbind(tab.PixvsPin, tab.DiavsPin,tab.GiavsPin,tab.TiavsPin)
ve <- vennCounts(fin)
ve
vennDiagram(ve)

vennDiagram(ve,
            names=c(paste("Pixie vs Pinot:", count.PixvsPin),
                    paste("Dena vs Pinot:", count.DiavsPin),
                    paste("Gina vs Pinot:", count.GiavsPin),
                    paste("Tina vs Pinot:", count.TiavsPin)),
            circle.col = c("green","red", "blue", "yellow"))
title("Pinot vs its three dwarf mutant progenies")

##


all <- cbind(tab.PixvsPin, tab.DiavsPin, tab.GiavsPin, tab.TiavsPin, all.PixvsPin, all.DiavsPin,all.GiavsPin, all.TiavsPin)
dim(all)
write.csv(all, "Alldummy.FDRtable.csv")

all <- cbind(tab.PixvsPin, tab.DiavsPin, tab.GiavsPin, tab.TiavsPin)
