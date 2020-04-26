library(ggplot2)
library (ggridges)
library(RColorBrewer)
library(reshape2)
library(ggthemes)
library(cowplot)
library(readxl)
library(viridis)
theme_set(theme_cowplot())
setwd("/home/devang/Dropbox/POST_DOC/PHOSPHITE/PhosphateAnalysis")
data<-read_xlsx("/home/devang/Dropbox/POST_DOC/PHOSPHITE/PhosphateAnalysis/20200106_TP.xlsx", sheet=7, col_names = TRUE)
data
datalong<-melt(data=data,
               id.vars = "Compartment",
               variable.name="treatment",
               value.name="percent"
               )

head(datalong)
datalong$Compartment<-factor(datalong$Compartment, levels=c("undefined","extracellular","cytosol","plasma membrane","peroxisome",
                                                            "vacuole","plastid","mitochondrion","golgi","endoplasmic reticulum","nucleus,cytosol","nucleus"))
levels(datalong$Compartment)
head(datalong)
# I can add more tones to this palette :

#colorcount=length(unique(datalong$Compartment))
#getPalette=colorRampPalette(brewer.pal(11,"Spectral"))
#getPalette

p<-ggplot(data=datalong,mapping=aes(x=treatment, y=percent,fill=Compartment))+geom_bar(stat="identity",color='white')+scale_fill_viridis_d(option="viridis")#scale_fill_manual(values=getPalette(colorcount))
p<-p+theme(panel.border = element_rect(fill=NA),
           legend.position = "none",
           rect = element_rect(fill = "transparent"),
           plot.subtitle = element_text(vjust = 1), 
           plot.caption = element_text(vjust = 1))+labs(x = expression('Treatment'), 
                                                          y = expression("Proportion of proteins per compartment (%)"),
                                                          title = "Total Proteome")


p

data1<-read_xlsx("/home/devang/Dropbox/POST_DOC/PHOSPHITE/PhosphateAnalysis/20200106_Phosphorylation.xlsx", sheet=9, col_names = TRUE)
data1
datalong1<-melt(data=data1,
               id.vars = "Compartment",
               variable.name="treatment",
               value.name="percent"
)

head(datalong1)
datalong1$Compartment<-factor(datalong$Compartment, levels=c("undefined","extracellular","cytosol","plasma membrane","peroxisome",
                                                            "vacuole","plastid","mitochondrion","golgi","endoplasmic reticulum","nucleus,cytosol","nucleus"))
levels(datalong1$Compartment)
head(datalong1)
# I can add more tones to this palette :

#colorcount=length(unique(datalong$Compartment))
#getPalette=colorRampPalette(brewer.pal(11,"Spectral"))
#getPalette

p1<-ggplot(data=datalong1,mapping=aes(x=treatment, y=percent,fill=Compartment))+geom_bar(stat="identity",color='white')+scale_fill_viridis_d(option = "viridis")#scale_fill_manual(values=getPalette(colorcount))
p1<-p1+theme(panel.border = element_rect(fill=NA),
             rect = element_rect(fill = "transparent"),
             plot.subtitle = element_text(vjust = 1), 
             plot.caption = element_text(vjust = 1))+labs(x = expression('Treatment'), 
                                                        y = expression("Proportion of proteins per compartment (%)"),
                                                        title = "Phosphoproteome")


p1


plot<-plot_grid(p,p1,rel_widths = c(1,1.5))
plot
save_plot("SUBA.png",plot,base_height = 6, base_width = 10)