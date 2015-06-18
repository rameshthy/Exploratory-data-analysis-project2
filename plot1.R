## -------Get the data from the source and unzip the package--------

# if(!file.exists("./Data")){dir.create("./Data")}
# fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
# file<-"./Data/exdata_data_NEI_data.zip"
# download.file(fileUrl,file,method="curl")
# unzip(zipfile=file,exdir="./Data")



# # Load the NEI & SCC data frames.
NEI <- readRDS("./Data/summarySCC_PM25.rds")
SCC <- readRDS("./Data/Source_Classification_Code.rds")

# Aggregate by sum the total emissions by year
aggTotals <- aggregate(Emissions ~ year,NEI, sum)

png("plot1.png",width=480,height=480,units="px",bg="transparent")

barplot(
        (aggTotals$Emissions)/10^6,
        names.arg=aggTotals$year,
        xlab="Year",
        ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions From All US Sources"
)

dev.off()