
# Map Colombian Population Using tmap

pacman::p_load(leaflet, glue, dplyr, sf, tmap, tmaptools, tidycensus, ggmap, htmltools,htmlwidgets)
pacman::p_load_gh(c("walkerke/tigris", "bhaskarvk/leaflet.extras"))


col<-read_shape("C:/Users/dsaav/Documents/Projects/R/maps/Shapes/Colombia States/depto.shp",as.sf = TRUE)

qtm(col,text.size = 1)

ttm()
tmap_last()

class(col)

popdepart<-read.csv(file.choose(),header = T,stringsAsFactors = F)
class(popdepart)


# Create leading zeros on DP column
popdepart$DP<- sprintf("%02d",popdepart$DP)

common_departments<-union(col$DPTO,popdepart$DP)
length(common_departments)==length(col$DPTO)

names(popdepart)[3]<-'Population'
popdepart<-popdepart[,-2]
dapart<-as.data.frame(popdepart)
dim(popdepart)
class(popdepart)


depart_joined<-tmaptools::append_data(col,popdepart,key.shp ='DPTO',key.data = 'DP' )

tm_shape(depart_joined)+tm_polygons(col='Population',id='NOMBRE_DPT', palette='Oranges')









