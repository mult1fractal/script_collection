# in a r-docker
# docker run --rm -it -v $PWD:/input nanozoo/r_ggpubr:0.2.5--4b52011
## plot: 
#docker run --rm -it -v $PWD:/input nanozoo/r_ggplot2:0.1--6405f6d /bin/bash
#R 

install.packages("ggplot2")
install.packages("magrittr")
install.packages("cowplot")
install.packages("ggpubr")
install.packages("viridis")




# to install
#install.packages("reshape2")
#install.packages("viridis")
#install.packages("ggplot2")

#libs
library(ggpubr)
library(viridis)
library(reshape2)
library(ggplot2)
library(viridis)


# inputs
setwd ("/input")
dt <- read.csv(file = 'genus_plot.csv')
dt2 <- read.csv(file = 'phylum_plot.csv')
dt3 <- read.csv(file = 'species_plot.csv')
dt4 <- read.csv(file = 'class_plot.csv')


#balloon_melted <- melt(dt, id=c("Organism","Abundance"))

# Sizes just for png
#sizew <- ceiling(( ncol(dt) * 200 ) + 4 )
#sizeh <- ceiling(( nrow(dt) * 5 ) + 2 )

options(ggplot2.continuous.colour="viridis")

######################################
####Genus
######################################

##grouped: Case

plot <- ggplot(dt, aes(x = Sample_name, y = Organism)) +
facet_grid( ~ Case, scales = "free", space = "free") +
theme_light() +
theme(panel.border = element_blank()) + 
labs(y = element_blank(), x="sample") +
geom_point( aes(size=Abundance, colour=Abundance) ) +
scale_size_area(max_size=10) +
labs(size="Abundance\n[%]", colour="Abundance\n[%]") + 
theme(axis.text.x = element_text(angle = 45, hjust = 1))

svg("overview_genus_Case.svg", width = 20, height = 20)
print(plot)

dev.off()

##grouped: type (mother child)
plot <- ggplot(dt, aes(x = Sample_name, y = Organism)) +
facet_grid( ~ Type, scales = "free", space = "free") +
theme_light() +
theme(panel.border = element_blank()) + 
labs(y = element_blank(), x="sample") +
geom_point( aes(size=Abundance, colour=Abundance) ) +
scale_size_area(max_size=10) +
labs(size="Abundance\n[%]", colour="Abundance\n[%]") + 
theme(axis.text.x = element_text(angle = 45, hjust = 1))

svg("overview_genus_Type.svg", width = 20, height = 20)
print(plot)

dev.off()

##grouped: source (RE, VT..)
plot <- ggplot(dt, aes(x = Sample_name, y = Organism)) +
facet_grid( ~ Source, scales = "free", space = "free") +
theme_light() +
theme(panel.border = element_blank()) + 
labs(y = element_blank(), x="sample") +
geom_point( aes(size=Abundance, colour=Abundance) ) +
scale_size_area(max_size=10) +
labs(size="Abundance\n[%]", colour="Abundance\n[%]") + 
theme(axis.text.x = element_text(angle = 45, hjust = 1))

svg("overview_genus_Source.svg", width = 20, height = 20)
print(plot)

dev.off()
##############################################################

######################################
####Phylum
######################################

##grouped: Case

plot <- ggplot(dt2, aes(x = Sample_name, y = Organism)) +
facet_grid( ~ Case, scales = "free", space = "free") +
theme_light() +
theme(panel.border = element_blank()) + 
labs(y = element_blank(), x="sample") +
geom_point( aes(size=Abundance, colour=Abundance) ) +
scale_size_area(max_size=10) +
labs(size="Abundance\n[%]", colour="Abundance\n[%]") + 
theme(axis.text.x = element_text(angle = 45, hjust = 1))

svg("overview_phylum_Case.svg", width = 20, height = 20)
print(plot)

dev.off()

##grouped: type (mother child)
plot <- ggplot(dt2, aes(x = Sample_name, y = Organism)) +
facet_grid( ~ Type, scales = "free", space = "free") +
theme_light() +
theme(panel.border = element_blank()) + 
labs(y = element_blank(), x="sample") +
geom_point( aes(size=Abundance, colour=Abundance) ) +
scale_size_area(max_size=10) +
labs(size="Abundance\n[%]", colour="Abundance\n[%]") + 
theme(axis.text.x = element_text(angle = 45, hjust = 1))

svg("overview_phylum_Type.svg", width = 20, height = 20)
print(plot)

dev.off()

##grouped: source (RE, VT..)
plot <- ggplot(dt2, aes(x = Sample_name, y = Organism)) +
facet_grid( ~ Source, scales = "free", space = "free") +
theme_light() +
theme(panel.border = element_blank()) + 
labs(y = element_blank(), x="sample") +
geom_point( aes(size=Abundance, colour=Abundance) ) +
scale_size_area(max_size=10) +
labs(size="Abundance\n[%]", colour="Abundance\n[%]") + 
theme(axis.text.x = element_text(angle = 45, hjust = 1))

svg("overview_phylum_Source.svg", width = 20, height = 20)
print(plot)

dev.off()
##############################################################

######################################
####Species
######################################

##grouped: Case

plot <- ggplot(dt3, aes(x = Sample_name, y = Organism)) +
facet_grid( ~ Case, scales = "free", space = "free") +
theme_light() +
theme(panel.border = element_blank()) + 
labs(y = element_blank(), x="sample") +
geom_point( aes(size=Abundance, colour=Abundance) ) +
scale_size_area(max_size=10) +
labs(size="Abundance\n[%]", colour="Abundance\n[%]") + 
theme(axis.text.x = element_text(angle = 45, hjust = 1))

svg("overview_species_Case.svg", width = 20, height = 20)
print(plot)

dev.off()

##grouped: type (mother child)
plot <- ggplot(dt3, aes(x = Sample_name, y = Organism)) +
facet_grid( ~ Type, scales = "free", space = "free") +
theme_light() +
theme(panel.border = element_blank()) + 
labs(y = element_blank(), x="sample") +
geom_point( aes(size=Abundance, colour=Abundance) ) +
scale_size_area(max_size=10) +
labs(size="Abundance\n[%]", colour="Abundance\n[%]") + 
theme(axis.text.x = element_text(angle = 45, hjust = 1))

svg("overview_species_Type.svg", width = 20, height = 20)
print(plot)

dev.off()

##grouped: source (RE, VT..)
plot <- ggplot(dt3, aes(x = Sample_name, y = Organism)) +
facet_grid( ~ Source, scales = "free", space = "free") +
theme_light() +
theme(panel.border = element_blank()) + 
labs(y = element_blank(), x="sample") +
geom_point( aes(size=Abundance, colour=Abundance) ) +
scale_size_area(max_size=10) +
labs(size="Abundance\n[%]", colour="Abundance\n[%]") + 
theme(axis.text.x = element_text(angle = 45, hjust = 1))

svg("overview_species_Source.svg", width = 20, height = 20)
print(plot)

dev.off()
##############################################################

######################################
####Class
######################################

##grouped: Case

plot <- ggplot(dt4, aes(x = Sample_name, y = Organism)) +
facet_grid( ~ Case, scales = "free", space = "free") +
theme_light() +
theme(panel.border = element_blank()) + 
labs(y = element_blank(), x="sample") +
geom_point( aes(size=Abundance, colour=Abundance) ) +
scale_size_area(max_size=10) +
labs(size="Abundance\n[%]", colour="Abundance\n[%]") + 
theme(axis.text.x = element_text(angle = 45, hjust = 1))

svg("overview_class_Case.svg", width = 20, height = 20)
print(plot)

dev.off()

##grouped: type (mother child)
plot <- ggplot(dt4, aes(x = Sample_name, y = Organism)) +
facet_grid( ~ Type, scales = "free", space = "free") +
theme_light() +
theme(panel.border = element_blank()) + 
labs(y = element_blank(), x="sample") +
geom_point( aes(size=Abundance, colour=Abundance) ) +
scale_size_area(max_size=10) +
labs(size="Abundance\n[%]", colour="Abundance\n[%]") + 
theme(axis.text.x = element_text(angle = 45, hjust = 1))

svg("overview_class_Type.svg", width = 20, height = 20)
print(plot)

dev.off()

##grouped: source (RE, VT..)
plot <- ggplot(dt4, aes(x = Sample_name, y = Organism)) +
facet_grid( ~ Source, scales = "free", space = "free") +
theme_light() +
theme(panel.border = element_blank()) + 
labs(y = element_blank(), x="sample") +
geom_point( aes(size=Abundance, colour=Abundance) ) +
scale_size_area(max_size=10) +
labs(size="Abundance\n[%]", colour="Abundance\n[%]") + 
theme(axis.text.x = element_text(angle = 45, hjust = 1))

svg("overview_class_Source.svg", width = 20, height = 20)
print(plot)

dev.off()
##############################################################
