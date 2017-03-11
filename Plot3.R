
#### Loading Packages and Data

library(dplyr)
library(ggplot2)

NEI <- readRDS("~/Assignment_2/summarySCC_PM25.rds")
SCC <- readRDS("~/Assignment_2/Source_Classification_Code.rds")

### Subset the Data

NEIBaltimore <- NEI[NEI$fips == "24510", ]


### Creating the Plot 


png("plot3.png")

ggplot(data = NEIBaltimore, aes(x = factor(year), y = Emissions)) +
    geom_bar(stat="identity") + 
    facet_grid(.~type) +
    xlab("Year") + 
    ylab("Emissions") +
    labs(title = expression("PM Emissions in Baltimore - 1999 - 2008 by Source Type"))

dev.off()