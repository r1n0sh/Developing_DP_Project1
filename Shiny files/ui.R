library(shiny)
library(plotly)

ui <- fluidPage(
    titlePanel("2011 U.S Agriculture exports data"),
    sidebarLayout(
        sidebarPanel(
            em("In the text output, the 3rd column represents the alphabetical rank of selected state and 4th column prints the exports in million USD")
        ),
    mainPanel(
        plotlyOutput("plot"),
        verbatimTextOutput("click")
    )
    )
    
)