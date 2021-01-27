# in a r-docker
# docker run --rm -it -v $PWD:/input nanozoo/r_ggpubr:0.2.5--4b52011


install.packages("ggplot2")
install.packages("magrittr")
install.packages("cowplot")
install.packages("ggpubr")
install.packages("viridis")

library(ggpubr)
library(viridis)

#docker
setwd ("/input")

# my data

input  <- read.delim("phylum.csv", row.names = 1, sep = ",")
input2 <- read.delim("class.csv", row.names = 1, sep = ",")
input3 <- read.delim("species.csv", row.names = 1, sep = ",")
input4 <- read.delim("genus.csv", row.names = 1, sep = ",")

#sorting data
data <- input[,sort(names(input))]
data2 <- input2[,sort(names(input2))]
data3 <- input3[,sort(names(input3))]
data4 <- input4[,sort(names(input4))]

svg("phylum.svg", height = 8, width = 8)
#png("phylum.png", height = 1000, width = 800, units = "px", pointsize = 12 )
plot <-	ggballoonplot(data, fill = "value") +
  	scale_fill_viridis_c(option = "D")
	ggpar(plot, legend.title = "Abundance\nin [%]",
	xlab = "Samples", ylab = "Phylum")
dev.off()

pdf("class.pdf")
#png("class.png", height = 1000, width = 800, units = "px", pointsize = 12 )
plot <-	ggballoonplot(data2, fill = "value") +
  	scale_fill_viridis_c(option = "D")
	ggpar(plot, legend.title = "Abundance\nin [%]",
	xlab ="Samples", ylab = "Class")
dev.off()

svg("genus.png", height = 30, width = 8)
#png("species.png", height = 1200, width = 800, units = "px", pointsize = 12 )
plot <-	ggballoonplot(data4, fill = "value") +
  	scale_fill_viridis_c(option = "D")
	ggpar(plot, legend.title = "Abundance\nin [%]",
	xlab ="Samples", ylab = "Genus")
dev.off()

pdf("species.pdf", height = 20, width = 8)
#png("species.png", height = 1200, width = 800, units = "px", pointsize = 12 )
plot <-	ggballoonplot(data3, fill = "value") +
  	scale_fill_viridis_c(option = "D")
	ggpar(plot, legend.title = "Abundance\nin [%]",
	xlab ="Samples", ylab = "Species")
dev.off()

print("Done")

# Docs
# https://www.rdocumentation.org/packages/ggpubr/versions/0.2.2/topics/ggballoonplot
# https://rpkgs.datanovia.com/ggpubr/reference/ggpar.html
