library(ggplot2)
library (ggridges)
library(RColorBrewer)
library(reshape2)
library(ggthemes)
library(cowplot)
setwd("/Users/devangmehta/Dropbox/POST_DOC/PHOSPHITE/")
data<-read.csv("/Users/devangmehta/Dropbox/POST_DOC/PHOSPHITE/enzymeacti.csv",header = TRUE)
head(data)
data$group <- factor(data$group, levels=unique(data$group))

p1<-ggplot(data=data,mapping=aes(x=group,y=spac, group=group, fill=group))+geom_boxplot()+scale_fill_manual(values = c("grey","dodgerblue","#2ca25f"))
p1<-p1+theme(legend.position = "none")+labs(x = expression('Treatments'), y = expression('Specific Activity (mU/mg)'))+ggtitle("APase Activity")#+scale_x_discrete(labels=c("-Pi" = "No Phosphate", "+Pi" = "Phosphate",
                                                                                                                                           #"+Phi" = "Phosphite"))
p1

res.aov <- aov(spac ~ group, data = data)
# Summary of the analysis
summary(res.aov)
TukeyHSD(res.aov)

save_plot("apase.png",p1,base_aspect_ratio = 1)