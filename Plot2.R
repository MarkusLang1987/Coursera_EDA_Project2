#### Loading Packages and Data

library(dplyr)
library(ggplot2)

NEI <- readRDS("~/Assignment_2/summarySCC_PM25.rds")
SCC <- readRDS("~/Assignment_2/Source_Classification_Code.rds")

### Subset the Data

NEIBaltimore <- NEI[NEI$fips == "24510", ]


#### Group and summarise the Dataset

Emissions <- NEIBaltimore %>%
    group_by(year) %>%
    summarise(SumEmissions = sum(Emissions))


### Creating the Plot

png("plot2.png")

barplot(Emissions$SumEmissions, names.arg=Emissions$year,
        main="Total Emissions of PM'[2.5]' in kg in Baltimore",
        xlab="Year",
        ylab="Emissions")

dev.off()