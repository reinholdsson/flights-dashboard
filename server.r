library(hflights)
library(data.table)
library(rCharts)

add_theme <- function(p, xlab = NULL, ylab = NULL, height = 400, width = 600) {
  p$chart(
    height = height,
    width = width,
    backgroundColor = "#fff",
    style = list(
      color = "#333",
      font = "12px Helvetica,Arial"
    ),
    marginTop = 90,
    spacingRight = 50,
    spacingLeft = 25,
    spacingBottom = 30,
    replace = F
  )
  
  p$tooltip(style = list(
    color = '#333',
    font = '12px Helvetica,Arial'
  ))
  
  p$colors("#1860A8","#ea7613", "#3F7C20", "#F06078", "#F0C000", "#903060", "#F09000","#55BF3B", "#DF5353")
  #p$colors("#000000")
  
  p$legend(
    verticalAlign = "top",
    align = "center",
    borderColor = "#fff",
    itemStyle = list(
      color = "#555",
      font = "12px Helvetica,Arial"
    ),
    y = 40
  )
  
  p$xAxis(title = list(text = xlab), lineWidth = 0, gridLineWidth = 0, minorTickLength = 0, tickLength = 0, labels = list(style = list(color = '#333', font = '12px Helvetica,Arial')))
  p$yAxis(title = list(text = ylab), lineWidth = 0, gridLineWidth = 0, minorTickLength = 0, tickLength = 0, labels = list(style = list(color = '#333', font = '12px Helvetica,Arial')))
  p$plotOptions(column = list(shadow = F))
  p$exporting(enabled = T)
  return(p)
}

# Data
d <- as.data.table(hflights)

shinyServer(function(input, output) {
  output$myChart <- renderChart({
    h1 <- Highcharts$new()
    h1$chart(type = "scatter")
    h1$series(data = c(1, 3, 2, 4, 5, 4, 6, 2, 3, 5, NA), dashStyle = "longdash")
    h1$series(data = c(NA, 4, 1, 3, 4, 2, 9, 1, 2, 3, 4), dashStyle = "shortdot")
    h1$addParams(dom = "myChart")
    h1 <- add_theme(h1, xlab = "test x", ylab = "test y", height = 400, width = 1200)
    return(h1)
  })
  
  output$myChart2 <- renderChart({
    h1 <- Highcharts$new()
    h1$chart(type = "column")
    h1$series(data = c(1, 3, 2, 4, 5, 4, 6, 2, 3, 5, NA), dashStyle = "longdash")
    h1$series(data = c(NA, 4, 1, 3, 4, 2, 9, 1, 2, 3, 4), dashStyle = "shortdot")
    h1$addParams(dom = "myChart2")
    h1 <- add_theme(h1, xlab = "test x", ylab = "test y", height = 300, width = 450)
    return(h1)
  })
  
  output$myChart3 <- renderChart({
    h1 <- Highcharts$new()
    h1$chart(type = "column")
    h1$series(data = c(1, 3, 2, 4, 5, 4, 6, 2, 3, 5, NA), dashStyle = "longdash")
    h1$series(data = c(NA, 4, 1, 3, 4, 2, 9, 1, 2, 3, 4), dashStyle = "shortdot")
    h1$addParams(dom = "myChart3")
    h1 <- add_theme(h1, xlab = "test x", ylab = "test y", height = 300, width = 450)
    return(h1)
  })
})