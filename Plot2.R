# read the rds files
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
 
#subset baltimore city data
baltimore <- nei[nei$fips == "24510", ]

# aggregating Baltimore city data frame according to year
bal_aggregated <- with(baltimore, aggregate(Emissions, by = list(year = year), sum))names(aggregated_by_year) <- c("year", "Emissions")
names(bal_aggregated)[2] = "Emissions"

#plotting the graph into png file
png("Plot2.png", height = 480, width = 480)
with(bal_aggregated, plot(year, Emissions, col = "red", pch = 19, type = "b", main = "Total PM2.5 Emissions in Baltimore City, Maryland", lwd = 2))
dev.off()
