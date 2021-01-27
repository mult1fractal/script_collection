# in a r-docker
# docker run --rm -it -v $PWD:/input nanozoo/r_ggpubr:0.2.5--4b52011

install.packages("ggridges")

#libs
library(ggpubr)
library(viridis)
library(reshape2)
library(ggplot2)
library(viridis)
library(ggridges)
library(scales)

# inputs
setwd ("/input")
dt <- read.csv(file = 'all_dates.csv')


options(ggplot2.continuous.colour="viridis")

# group: gruppiring von Region -alles zu einer kurve
# scale: distannce between plots
# size: 
# rel_min_height  tailing of lines until end of plot
# as Date: erkennt columns als date + scale_x_date --> sets x axis as date


plot <- ggplot(dt, aes(x = as.Date(Date) , y = Region, group = Region )) + 
    geom_density_ridges(fill = "#00AFBB", rel_min_height = 0.01, scale = 5, size = 0.3) +
    coord_cartesian(clip = "off") + # to avoid clipping of the very top of the top ridgeline
    scale_x_date(date_breaks = "1 month", date_labels =  "%b %Y") +
    theme_ridges()
svg("ricc_covid_plot.svg", width = 20, height = 3.5)
print(plot)
dev.off()

# eu 
# ger
