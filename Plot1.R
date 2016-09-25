# read the rds files
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

# aggregateing the nei data frame according to year
aggregated_by_year <- with(nei, aggregate(Emissions, by = list(year), sum))
names(aggregated_by_year) <- c("year", "Emissions")

#plotting the graph into png file
png("Plot1.png", height = 480, width = 480)
with(aggregated_by_year, plot(year, Emissions, pch = 19, col = "blue", type = "b", main = "Total PM2.5 Emissions in USA"))
dev.off()
