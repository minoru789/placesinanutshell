install.packages('ggmap')
install.packages('leaflet')
library(ggmap)
library(leaflet)
load('restaurantes')
foodIcon <- makeIcon(
  iconUrl = "https://image.flaticon.com/icons/png/512/184/184567.png",
  iconWidth = 30, iconHeight = 30,
  iconAnchorX = 0, iconAnchorY = 0)
beerIcon <- makeIcon(
  iconUrl = 'https://image.flaticon.com/icons/svg/202/202127.svg',
  iconWidth = 30, iconHeight = 30,
  iconAnchorX = 0, iconAnchorY = 0)
)
map <- leaflet()
map <- addTiles(map)
map <- addMarkers(map, restaurantes$lon, restaurantes$lat, 
        icon = foodIcon, label = restaurantes$restaurante, 
        popup = paste0('<center><b>',restaurantes$restaurante,'</center></b>',
        paste('<b>Endereço:</b>' ,restaurantes$endereco, restaurantes$numero),
        paste('<br><b>Telefone:</b>', restaurantes$telefone),
        paste('<br><b>Descrição:</b>', restaurantes$descricao)))
map <- addMarkers(map, bares$lon, bares$lat, 
        icon = beerIcon, label = bares$bar, 
        popup = paste0('<center><b>',bares$bar,'</center></b>',
        paste('<b>Endereço:</b>' ,bares$endereco, bares$numero),
        paste('<br><b>Descrição:</b>', bares$descricao)))
map
  