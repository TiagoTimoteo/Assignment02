###Install packages

install.packages("BiocManager")
install.packages("readr")
install.packages("ggplot2")
BiocManager::install("pcaMethods")
BiocManager::install("LEA")
library(pcaMethods)
library(LEA)
library(readr)
library(ggfortify)

###Loading data
simdata_snp <- LEA::read.geno("~/Desktop/Assignement_2/simdata.geno")

rownames(simdata_snp)<-c('HEBF1','HEBGu1','HECHS1','HECHS3','HECHS4','HECHS12','HEGu2B','HEIR03',
                         'HEIR05','HEKY06','HEKY12','HEKY51','HENJ31','HENY05','HENY09','HENY20',
                         'HENY29','HETB01','HETB1N','IRO03HE','JXIR01HE','JXIR02HE','KYHE02')
View(simdata_snp)

#load indfile
individual_region<- read.csv("~/Desktop/Assignement_2/SeaHorse.indfile", sep=",")
View(individual_region) 

individual_region_noOut<- read.csv("~/Desktop/Assignement_2/Seahorse_semOutliers", sep=",")

#transform geno to dataframe
simdata_df <-as.data.frame(simdata_snp, chr = NULL, digits = NULL, include.mapunit = TRUE)
View(simdata_df)

#Calculate PCA
SeahorsePCA <- prcomp(simdata_df, scale. = TRUE)

#PCA plot
autoplot(SeahorsePCA, data = individual_region , colour ='região')

#######PCA sem outlierls
#identificar os outliers
autoplot(SeahorsePCA, data = individual_region , colour ='região',
         shape = FALSE, label.size = 3)

#outliers - HEBF1  e HECHS3

#remover outliers para melhor vizualização do plot de PCA
simdata_df_NaoOutliers <- simdata_df[-c(1,4), ]
View(simdata_df_NaoOutliers)

#Calculate PCA
SeaHorse_nOutPCA <- prcomp(simdata_df_NaoOutliers, scale. = FALSE)

# PCA plot 
autoplot(SeaHorse_nOutPCA, data = individual_region_noOut, colour= 'região')




