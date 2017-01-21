
server <- function(input, output, session) {
    
    output$plot <- renderPlotly({
        df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2011_us_ag_exports.csv')
        df$text <- paste(df1$state, "<br />" , "Beef", df1$beef, "Dairy", df1$dairy, "<br />", "Corn", df1$corn, "Wheat",df1$wheat,"<br />","Fruits", df1$total.fruits,"Vegetables", df1$total.veggies)
       
        g1 <- list(
            scope = 'usa',
            projection = list(type = 'albers usa'),
            showlakes = TRUE,
            lakecolor = toRGB('white')
        )
        plot_ly(df1, z=df1$total.exports, locations =df1$code, type = 'choropleth', locationmode = 'USA-states', text = df1$text ) %>%
            layout(geo = g1,title = '2011 US Agriculture Exports by State') %>%
            colorbar(title = "Millions(USD)")
            
    })
    
    output$click <- renderPrint({
        d <- event_data("plotly_click")
        if (is.null(d)) "Click on a state to view the total exports in millions USD" else d
    })
    
    
}
