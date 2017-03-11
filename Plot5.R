
#### Loading Packages and Data

library(dplyr)
library(ggplot2)

NEI <- readRDS("~/Assignment_2/summarySCC_PM25.rds")
SCC <- readRDS("~/Assignment_2/Source_Classification_Code.rds")


### Subset SCC DAtaset for Vehicles and reduce it to one variable

MV <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
MVs <- SCC[SCC$EI.Sector %in% MV, ]
MotorVecs <- MVs["SCC"] 

#### Match the two Datasets and subset it to baltimore state

emissionsfromMotorVecs <- NEI[NEI$SCC %in% MVs$SCC & NEI$fips == "24510", ]

### Building the plot

png("plot5.png")

ggplot(emissionsfromMotorVecs, aes(factor(year), Emissions)) + 
    geom_bar(stat="identity") + 
    xlab("Year") +
    ylab("Emissions (Cars)") +
    labs(title = expression("Emissions from Vehicles 1999 - 2008 in Baltimore"))


dev.off()