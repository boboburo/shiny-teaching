#General
install.packages("dplyr")
install.packages("ggplot2")

#For creating of slides
install.packages("formatR")  #needed in RMarkdown docs - the presentation
#For presentation - lets try out NINJA - uses remark.js
#https://github.com/yihui/xaringan
devtools::install_github('yihui/xaringan')

#For shiny
install.packages("shiny")
#install.packages("shinydashboard")

#For htmlwidgets part
install.packages("devtools")
install.packages("DT")
install.packages("leaflet")
install.packages("ggmap") #Grabbing co-ordinates from Google Maps
devtools::install_github("bwlewis/rthreejs")

#Some widgets
#Some crosstalk
install.packages("htmltools")
devtools::install_github("rstudio/crosstalk")
devtools::install_github("hadley/lazyeval",dependencies=T)
devtools::install_github("jcheng5/d3scatter")
devtools::install_github("timelyportfolio/parcoords")
devtools::install_github("ropensci/plotly")


