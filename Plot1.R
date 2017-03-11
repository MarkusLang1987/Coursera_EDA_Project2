
#### Loading Packages and Data

library(dplyr)
library(ggplot2)

NEI <- readRDS("~/Assignment_2/summarySCC_PM25.rds")
SCC <- readRDS("~/Assignment_2/Source_Classification_Code.rds")

#### Group and summarise the Dataset

Emissions <- NEI %>%
    group_by(year) %>%
    summarise(SumEmissions = sum(Emissions))

### Kg to tons

Emissions$SumEmissions <- Emissions$SumEmissions / 1000


### Creating the Plot

png("plot1.png")

barplot(Emissions$SumEmissions, names.arg=Emissions$year,
        main="Total Emissions of PM'[2.5]' in tons",
        xlab="Year",
        ylab="Emissions")

dev.off()