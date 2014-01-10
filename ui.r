shinyUI(bootstrapPage(
  
  title = "flights dashboard",
  br(),
  
  fluidRow(
    column(10, offset = 1,
    chartOutput("myChart", "highcharts")
    )
  ),
  
  fluidRow(
    column(2, offset = 1,
      selectInput("variable", "Variable:",
       c("Cylinders" = "cyl",
         "Transmission" = "am",
         "Gears" = "gear"))
    ),
    column(4,
      chartOutput("myChart2", "highcharts")
    ),
    column(4,
           chartOutput("myChart3", "highcharts")
    )
  ), 
  hr(),  
  fluidRow(
    column(10, offset = 1,
      HTML("Shiny + rCharts dashboard example, code: https://github.com/reinholdsson/flights-dashboard")
    )
  )
))