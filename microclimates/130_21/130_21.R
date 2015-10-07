#clear all
rm(list=ls(all=T))
# R Implementation of an integration of the microclimate model of Warren Porter's Niche Mapper system 
# Michael Kearney November 2013

# This version uses the Australia Water Availability Project (AWAP) daily 5km climate
# layers for Australia for air temperature, relative humidity, rainfall and cloud cover
# and uses monthly soil moisture estimates (splined) and the Australia Soils database to
# obtain soil properties, including their change through time due to soil moisture.
# Humidity is only from 1971 onward. Cloud cover is only from 1990 onward (and is based
# on daily solar layers relative to clear sky calculations from NicheMapR).
# It also uses a global monthly soil moisture estimate from NOAA CPC Soil Moisture http://140.172.38.100/psd/thredds/catalog/Datasets/cpcsoil/catalog.html
# Aerosol attenuation can also be computed based on the Global Aerosol Data Set (GADS)
# Koepke, P., M. Hess, I. Schult, and E. P. Shettle. 1997. Global Aerosol Data Set. Max-Planck-Institut for Meteorologie, Hamburg
# by choosing the option 'rungads<-1' 

# required R packages
# raster
# sp
# ncdf
# XML
# dismo
# chron
# rgdal
# zoo
# RODBC
setwd("C:/git/Egernia")
spatial<-"c:/Australian Environment/" # place where climate input files are kept

############## location and climatic data  ###################################
sitemethod <- 0 # 0=specified single site long/lat, 1=place name search using geodis (needs internet)
longlat<-c(130,-21) #central plateau c(146.5666667,-41.85) Orford c(147.829971,-42.557127) 
loc <- "Mount Wellington, Tasmania" # type in a location here, used if option 1 is chosen above
timezone<-0 # if timezone=1 (needs internet), uses GNtimezone function in package geonames to correct to local time zone (excluding daylight saving correction)
rungads<-1 # use the Global Aerosol Database?
dailywind<-1 # use daily windspeed database?
terrain<-0 # include terrain (slope, aspect, horizon angles) (1) or not (0)?
soildata<-1 # include soil data for Australia (1) or not (0)?
snowmodel<-0 # run snow version? (slower!)
ystart <- 2000# start year for weather generator calibration dataset or AWAP database
yfinish <- 2000# end year for weather generator calibration dataset
nyears<-yfinish-ystart+1# integer, number of years for which to run the microclimate model, only for AWAP data (!!max 10 years!!)

############# soil properties ################################
# prevdir<-getwd()
# setwd('x:')
# cmd<-paste("R --no-save --args ",longlat[1]," ",longlat[2]," < extract.R",sep='')
# system(cmd)
# soilpro<-read.csv('data.csv')
# FC<-(7.561+1.176*soilpro$clay-0.009843*soilpro$clay^2+0.2132*soilpro$silt)/100
# PWP<-(-1.304+1.117*soilpro$clay-0.009309*soilpro$clay^2)/100
# setwd(prevdir)
# soil_depths<-c(5,15,30,60,100,200)
# plot(soilpro$clay~soil_depths,ylim=c(0,100),col='red',type='l')
# points(soilpro$sand~soil_depths,ylim=c(0,100),col='orange',type='l')
# points(soilpro$silt~soil_depths,ylim=c(0,100),col='grey',type='l')
# title(main=oznetsite)
# legend("topleft", inset=.05,
#        legend=round(soilpro[1,3:5],1),bty="n", 
#        horiz=TRUE, bg=NULL, cex=0.8)
# }

############# microclimate model parameters ################################
EC <- 0.0167238 # Eccenricity of the earth's orbit (current value 0.0167238, ranges between 0.0034 to 0.058)
RUF <- 0.004 # Roughness height (m), , e.g. sand is 0.05, grass may be 2.0, current allowed range: 0.001 (snow) - 2.0 cm.
# Next for parameters are segmented velocity profiles due to bushes, rocks etc. on the surface, IF NO EXPERIMENTAL WIND PROFILE DATA SET ALL THESE TO ZERO!
Z01 <- 0. # Top (1st) segment roughness height(m)
Z02 <- 0. # 2nd segment roughness height(m)
ZH1 <- 0. # Top of (1st) segment, height above surface(m)
ZH2 <- 0. # 2nd segment, height above surface(m)
SLE <- 0.96 # Substrate longwave IR emissivity (decimal %), typically close to 1
ERR <- 1.25 # Integrator error for soil temperature calculations
DEP <- c(0.,1.5,  3.5, 5.,  10,  15,  30.,  60.,  100.,  200.) # Soil nodes (cm) - keep spacing close near the surface, last value is where it is assumed that the soil temperature is at the annual mean air temperature
Thcond <- 3.0 # soil minerals thermal conductivity (W/mC)
Density <- 2640. # soil minerals density (kg/m3)
SpecHeat <- 820. # soil minerals specific heat (J/kg-K)
BulkDensity <- 2640. # soil bulk density (kg/m3)
cap<-1 # organic cap present on soil surface? (cap has lower conductivity - 0.2 W/mC - and higher specific heat 1920 J/kg-K)
SatWater <- 0.26 # volumetric water content at saturation (0.1 bar matric potential) (m3/m3)
Clay <- 22 # clay content for matric potential calculations (%)
SoilMoist <- 0 # fractional soil moisture (decimal %)
rainmult<-1 # rain multiplier for surface soil moisture (use to induce runoff), proportion
runmoist<-0 # run soil moisture model (0=no, 1=yes)?
SoilMoist_Init<-rep(0.2,10) # initial soil water content, m3/m3
evenrain<-1 # spread daily rainfall evenly across 24hrs (1) or one event at midnight (2)
maxpool<-10 # max depth for water pooling on the surface, mm (to account for runoff)
soiltype<-8
CampNormTbl9_1<-read.csv('../micro_australia/CampNormTbl9_1.csv')
fieldcap<-CampNormTbl9_1[soiltype,7] # field capacity, mm
wilting<-CampNormTbl9_1[soiltype,8]  # use value from digital atlas of Australian soils # wilting point, mm
PE<-CampNormTbl9_1[soiltype,4] 
KS<-CampNormTbl9_1[soiltype,6] 
BB<-CampNormTbl9_1[soiltype,5] 
BD<-2.640# Mg/m3, soil bulk density for soil moisture calcs
L<-c(0,0,8.18990859,7.991299442,7.796891252,7.420411664,7.059944542,6.385001059,5.768074989,4.816673431,4.0121088,1.833554792,0.946862989,0.635260544,0.804575,0.43525621,0.366052856,0,0)*10000
LAI<-0.1 # leaf area index, used to partition traspiration/evaporation from PET
REFL<-0.2 # soil reflectance (decimal %)
slope<-0. # slope (degrees, range 0-90)
aspect<-180. # aspect (degrees, 0 = North, range 0-360)
hori<-rep(0,24) # enter the horizon angles (degrees) so that they go from 0 degrees azimuth (north) clockwise in 15 degree intervals
PCTWET<-0. # percentage of surface area acting as a free water surface (%)
CMH2O <- 1. # precipitable cm H2O in air column, 0.1 = VERY DRY; 1.0 = MOIST AIR CONDITIONS; 2.0 = HUMID, TROPICAL CONDITIONS (note this is for the whole atmospheric profile, not just near the ground)  
TIMAXS <- c(1.0, 1.0, 0.0, 0.0)   # Time of Maximums for Air Wind RelHum Cloud (h), air & Wind max's relative to solar noon, humidity and cloud cover max's relative to sunrise          												
TIMINS <- c(0.0, 0.0, 1.0, 1.0)   # Time of Minimums for Air Wind RelHum Cloud (h), air & Wind min's relative to sunrise, humidity and cloud cover min's relative to solar noon
minshade<-0. # minimum available shade (%)
maxshade<-80. # maximum available shade (%)
runshade<-1. # run the model twice, once for each shade level (1) or just for the first shade level (0)?
manualshade<-1 # if using soildata, which includes shade, this will override the data from the database and force max shade to be the number specified above
Usrhyt <- 0.5# local height (cm) at which air temperature, relative humidity and wind speed calculatinos will be made 
rainwet<-1.5 # mm rain that causes soil to become 90% wet
snowtemp<-1.5 # temperature at which precipitation falls as snow (used for snow model)
snowdens<-0.4 # snow density (mg/m3)
snowmelt<-1 # proportion of calculated snowmelt that doesn't refreeze
undercatch<-1 # undercatch multipier for converting rainfall to snow
rainmelt<-0.013 # paramter in equation that melts snow with rainfall as a function of air tempwrite_input<-1 # write csv files of final input to working directory? 1=yes, 0=no.
warm<-0 # uniform warming of air temperature input to simulate climate change
loop<-0 # if doing multiple years, this shifts the starting year by the integer value
write_input<-1 # write csv files of final input to working directory? 1=yes, 0=no.

# run the model
curdir<-getwd()
setwd('../micro_australia/')
niche<-list(L=L,LAI=LAI,SoilMoist_Init=SoilMoist_Init,evenrain=evenrain,runmoist=runmoist,maxpool=maxpool,PE=PE,KS=KS,BB=BB,BD=BD,loop=loop,warm=warm,rainwet=rainwet,manualshade=manualshade,dailywind=dailywind,terrain=terrain,soildata=soildata,loc=loc,ystart=ystart,yfinish=yfinish,nyears=nyears,RUF=RUF,SLE=SLE,ERR=ERR,DEP=DEP,Thcond=Thcond,Density=Density,SpecHeat=SpecHeat,BulkDensity=BulkDensity,Clay=Clay,SatWater=SatWater,SoilMoist=SoilMoist,CMH2O=CMH2O,TIMAXS=TIMAXS,TIMINS=TIMINS,minshade=minshade,maxshade=maxshade,Usrhyt=Usrhyt,REFL=REFL,slope=slope,aspect=aspect,hori=hori,rungads=rungads,cap=cap,write_input=write_input,spatial=spatial,snowmodel=snowmodel,snowtemp=snowtemp,snowdens=snowdens,snowmelt=snowmelt,undercatch=undercatch,rainmelt=rainmelt,rainmult=rainmult,runshade=runshade)
source('NicheMapR_Setup_micro.R')
nicheout<-NicheMapR(niche)
setwd(curdir)


# get output
metout<-as.data.frame(nicheout$metout[1:(365*24*nyears),]) # above ground microclimatic conditions, min shade
shadmet<-as.data.frame(nicheout$shadmet[1:(365*24*nyears),]) # above ground microclimatic conditions, max shade
soil<-as.data.frame(nicheout$soil[1:(365*24*nyears),]) # soil temperatures, minimum shade
shadsoil<-as.data.frame(nicheout$shadsoil[1:(365*24*nyears),]) # soil temperatures, maximum shade
soilmoist<-as.data.frame(nicheout$soilmoist[1:(365*24*nyears),]) # soil water content, minimum shade
shadmoist<-as.data.frame(nicheout$shadmoist[1:(365*24*nyears),]) # soil water content, maximum shade
humid<-as.data.frame(nicheout$humid[1:(365*24*nyears),]) # soil humidity, minimum shade
shadhumid<-as.data.frame(nicheout$shadhumid[1:(365*24*nyears),]) # soil humidity, maximum shade
soilpot<-as.data.frame(nicheout$soilpot[1:(365*24*nyears),]) # soil water potential, minimum shade
shadpot<-as.data.frame(nicheout$shadpot[1:(365*24*nyears),]) # soil water potential, maximum shade
rainfall<-as.data.frame(nicheout$RAINFALL)
MAXSHADES<-as.data.frame(nicheout$MAXSHADES)
elev<-as.numeric(nicheout$ALTT)
REFL<-as.numeric(nicheout$REFL)
longlat<-as.matrix(nicheout$longlat)
fieldcap<-as.numeric(nicheout$fieldcap)
wilting<-0.11 # soil moisture at node 3 that means no food available
ectoin<-c(elev,REFL,as.numeric(longlat[1]),as.numeric(longlat[2]),fieldcap,wilting,ystart,yfinish)
longlat<-nicheout$longlat

setwd("C:/git/Egernia/microclimates/130_21")
write.csv(metout,'metout.csv')
write.csv(shadmet,'shadmet.csv')
write.csv(soil,'soil.csv')
write.csv(shadsoil,'shadsoil.csv')
write.csv(rainfall,'rainfall.csv')
write.csv(ectoin,'ectoin.csv')
write.csv(DEP,'DEP.csv')
write.csv(MAXSHADES,'MAXSHADES.csv')
setwd(curdir)

if(!require(geonames)){
  stop('package "geonames" is required.')
}
tzone<-paste("Etc/GMT-10",sep="") # doing it this way ignores daylight savings!

dates<-seq(ISOdate(ystart,1,1,tz=tzone)-3600*12, ISOdate((ystart+nyears),1,1,tz=tzone)-3600*13, by="hours") 
dates<-subset(dates, format(dates, "%m/%d")!= "02/29") # remove leap years
dates<-subset(dates, !duplicated(as.matrix(dates[2110:2120])))
dates<-unique(dates)
metout<-cbind(dates,metout)
shadmet<-cbind(dates,shadmet)
soil<-cbind(dates,soil)
shadsoil<-cbind(dates,shadsoil)
soilmoist<-cbind(dates,soilmoist)
shadmoist<-cbind(dates,shadmoist)
humid<-cbind(dates,humid)
shadhumid<-cbind(dates,shadhumid)
soilpot<-cbind(dates,soilpot)
shadpot<-cbind(dates,shadpot)

dates2<-seq(ISOdate(ystart,1,1,tz=tzone)-3600*12, ISOdate((ystart+nyears),1,1,tz=tzone)-3600*13, by="days") 
dates2<-subset(dates2, format(dates2, "%m/%d")!= "02/29") # remove leap years
rainfall<-as.data.frame(cbind(dates2,rainfall))
colnames(rainfall)<-c('dates','rainfall')



dstart<-as.POSIXct(as.Date('01/01/2000', "%d/%m/%Y"))-3600*11
dfinish<-as.POSIXct(as.Date('31/12/2000', "%d/%m/%Y"))-3600*10
plotsoilmoist<-subset(soilmoist,  soilmoist$dates > dstart & soilmoist$dates < dfinish )
plotshadmoist<-subset(shadmoist,  shadmoist$dates > dstart & shadmoist$dates < dfinish )
plothumid<-subset(humid,  humid$dates > dstart & humid$dates < dfinish )
plotsoilpot<-subset(soilpot,  soilpot$dates > dstart & soilpot$dates < dfinish )
plotsoil<-subset(soil,  soil$dates > dstart & soil$dates < dfinish )
plotmetout<-subset(metout,  metout$dates > dstart & metout$dates < dfinish )

plot(plotsoilmoist$dates, plotsoilmoist[,4]*100,type='l',col = "red",lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
plot(plotsoilmoist$dates, plotsoilmoist[,5]*100,type='l',col = 3,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotsoilmoist$dates, plotsoilmoist[,6]*100,type='l',col = 4,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotsoilmoist$dates, plotsoilmoist[,7]*100,type='l',col = 5,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotsoilmoist$dates, plotsoilmoist[,8]*100,type='l',col = 6,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotsoilmoist$dates, plotsoilmoist[,9]*100,type='l',col = 7,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotsoilmoist$dates, plotsoilmoist[,10]*100,type='l',col = 8,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotsoilmoist$dates, plotsoilmoist[,11]*100,type='l',col = 9,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotsoilmoist$dates, plotsoilmoist[,12]*100,type='l',col = 10,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotsoilmoist$dates, plotsoilmoist[,13]*100,type='l',col = 11,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(rainfall$rainfall~rainfall$dates,type='h',col='dark blue')
abline(11,0)

plot(plotshadmoist$dates, plotshadmoist[,4]*100,type='l',col = "red",lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
plot(plotshadmoist$dates, plotshadmoist[,5]*100,type='l',col = 3,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotshadmoist$dates, plotshadmoist[,6]*100,type='l',col = 4,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotshadmoist$dates, plotshadmoist[,7]*100,type='l',col = 5,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotshadmoist$dates, plotshadmoist[,8]*100,type='l',col = 6,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotshadmoist$dates, plotshadmoist[,9]*100,type='l',col = 7,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotshadmoist$dates, plotshadmoist[,10]*100,type='l',col = 8,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotshadmoist$dates, plotshadmoist[,11]*100,type='l',col = 9,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotshadmoist$dates, plotshadmoist[,12]*100,type='l',col = 10,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(plotshadmoist$dates, plotshadmoist[,13]*100,type='l',col = 11,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='moisture (% vol)',xlab='date')
points(rainfall$rainfall~rainfall$dates,type='h',col='dark blue')
abline(11,0)

plot(plothumid$dates, plothumid[,4]*100,type='l',col = "red",lty=1,ylim = c(0,100),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plothumid$dates, plothumid[,5]*100,type='l',col = 3,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plothumid$dates, plothumid[,6]*100,type='l',col = 4,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plothumid$dates, plothumid[,7]*100,type='l',col = 5,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plothumid$dates, plothumid[,8]*100,type='l',col = 6,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plothumid$dates, plothumid[,9]*100,type='l',col = 7,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plothumid$dates, plothumid[,10]*100,type='l',col = 8,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plothumid$dates, plothumid[,11]*100,type='l',col = 9,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plothumid$dates, plothumid[,12]*100,type='l',col = 10,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plothumid$dates, plothumid[,13]*100,type='l',col = 11,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')

plot(plotsoilpot$dates, plotsoilpot[,4],type='l',col = "red",lty=1,ylim = c(-5000,0),main=CampNormTbl9_1[soiltype,1],ylab='water potential (J/kg)',xlab='date')
points(plotsoilpot$dates, plotsoilpot[,5],type='l',col = 3,lty=1,ylim = c(-300,0),main=CampNormTbl9_1[soiltype,1],ylab='water potential (J/kg)',xlab='date')
points(plotsoilpot$dates, plotsoilpot[,6],type='l',col = 4,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoilpot$dates, plotsoilpot[,7],type='l',col = 5,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoilpot$dates, plotsoilpot[,8],type='l',col = 6,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoilpot$dates, plotsoilpot[,9],type='l',col = 7,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoilpot$dates, plotsoilpot[,10],type='l',col = 8,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoilpot$dates, plotsoilpot[,11],type='l',col = 9,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoilpot$dates, plotsoilpot[,12],type='l',col = 10,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoilpot$dates, plotsoilpot[,13],type='l',col = 11,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')

plot(plotsoil$dates, plotsoil[,4],type='l',col = "red",lty=1,ylim = c(-10,80),main=CampNormTbl9_1[soiltype,1],ylab='temperature (C)',xlab='date')
points(plotsoil$dates, plotsoil[,5],type='l',col = 3,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoil$dates, plotsoil[,6],type='l',col = 4,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoil$dates, plotsoil[,7],type='l',col = 5,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoil$dates, plotsoil[,8],type='l',col = 6,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoil$dates, plotsoil[,9],type='l',col = 7,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoil$dates, plotsoil[,10],type='l',col = 8,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoil$dates, plotsoil[,11],type='l',col = 9,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoil$dates, plotsoil[,12],type='l',col = 10,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')
points(plotsoil$dates, plotsoil[,13],type='l',col = 11,lty=1,ylim = c(0,50),main=CampNormTbl9_1[soiltype,1],ylab='relative humdity (%)',xlab='date')



plot(soilmoist$WC5cm~soilmoist$dates,type='l')