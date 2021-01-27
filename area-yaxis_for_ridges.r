# in a r-docker
# docker run --rm -it -v $PWD:/input nanozoo/r_ggpubr:0.2.5--4b52011

install.packages("ggridges")

#libs
library(ggpubr)
library(viridis)
library(reshape2)
library(ggplot2)
library(viridis)
library(scales)

# inputs
setwd ("/input")
dt <- read.csv(file = 'all_dates_Germany.csv')


options(ggplot2.continuous.colour="viridis")

#geom_area (statistics -- counts entrys per date )
# as Date: erkennt columns als date + scale_x_date --> sets x axis as date



# testing
plot <- ggplot(dt, aes(x=as.Date(Date)), y = Region, group = Region, fill=Region) +
geom_area(stat = "count") + 
scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y")+
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
panel.background = element_blank(), axis.line = element_line(colour = "black"), text = element_text(size=12, face="bold"),)
#geom_area(aes(x = ..density..))
svg("ricc_covid_plot4.svg", width = 10, height = 2.2)
print(plot)
dev.off()