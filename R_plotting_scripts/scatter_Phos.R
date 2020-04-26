library(ggplot2)
library (ggridges)
library(RColorBrewer)
library(reshape2)
library(ggthemes)
library(cowplot)
data<-read.csv("/Users/devangmehta/Dropbox/POST_DOC/PHOSPHITE/Spreadsheets/All_NET_Phos.csv",header = TRUE)
head(data)
data2<-read.csv("/Users/devangmehta/Dropbox/POST_DOC/PHOSPHITE/Spreadsheets/All_Prot.csv",header = TRUE)
head(data2)

p1<-ggplot(data=data,mapping=aes(x=NET_FC_Pi,y=NET_FC_Phi))+geom_hline(yintercept=0,colour="gray60",alpha=0.7)+geom_vline(xintercept = 0,colour="gray70")+geom_point(color="dodgerblue")+scale_x_continuous(limits=c(-10,10))+scale_y_continuous(limit=c(-10,10))
p1

p1<-p1 + theme(panel.border = element_rect(fill=NA),
               rect = element_rect(fill = "transparent"),
               plot.subtitle = element_text(vjust = 1), 
               plot.caption = element_text(vjust = 1), 
               axis.line = element_line(colour = "gray70"),
               axis.ticks = element_line(colour = "gray70"))+labs(x = expression('Phosphate Log'[2]*'FC'), y = expression('Phosphite Log'[2]*'FC'))

p2<-ggplot(data=data2,mapping=aes(x=FC_Pi,y=FC_Phi))+geom_hline(yintercept=0,colour="gray60",alpha=0.7)+geom_vline(xintercept = 0,colour="gray70")+geom_point(color="red")+scale_x_continuous(limits=c(-10,10))+scale_y_continuous(limit=c(-10,10))

p2<-p2 + theme(panel.border = element_rect(fill=NA),
               rect = element_rect(fill = "transparent"),
               plot.subtitle = element_text(vjust = 1), 
               plot.caption = element_text(vjust = 1), 
               axis.line = element_line(colour = "gray70"),
               axis.ticks = element_line(colour = "gray70"))+labs(x = expression('Phosphate Log'[2]*'FC'), y = expression('Phosphite Log'[2]*'FC'))

p3<-plot_grid(p2,p1,align="h")
p3
save_plot("scatter.png",p3,base_aspect_ratio = 2,base_height = 4)