
#### Loading Packages and Data

library(dplyr)
library(ggplot2)

NEI <- readRDS("~/Assignment_2/summarySCC_PM25.rds")
SCC <- readRDS("~/Assignment_2/Source_Classification_Code.rds")


### Subset SCC DAtaset for the relevant sector and reduce it to one variable

CCLS <- SCC[SCC$EI.Sector == "Fuel Comb - Comm/Institutional - Coal", ]
CCLS <- CCLS["SCC"]

#### Match the two Datasets

EmissionsFromCoal <- NEI[NEI$SCC %in% CCLS$SCC, ]

### Building the plot

png("plot4.png")

ggplot(EmissionsFromCoal, aes(factor(year), Emissions)) + 
    geom_bar(stat="identity") + 
    xlab("Year") +
    ylab("Coal Emissions") +
    labs(title = expression("Coal in US from 1999 - 2008"))

dev.off()
