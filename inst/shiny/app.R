
library(shiny)
library(devtools)
devtools::install_github("StineGryt/SeabirdStudio")
library(SeabirdStudio)

ui <- fluidPage(

  titlePanel("Seabird Colony Comparison"),

  sidebarLayout(
    sidebarPanel(
      selectInput(
        "colony1",
        "Select Colony 1",
        choices = sort(unique(seabird_counts$colony))
      ),
      selectInput(
        "colony2",
        "Select Colony 2",
        choices = sort(unique(seabird_counts$colony)),
        selected = sort(unique(seabird_counts$colony))[2]
      )
    ),

    mainPanel(
      plotOutput("plot1"),
      plotOutput("plot2"),
      textOutput("similarity")
    )
  )
)

server <- function(input, output) {

  output$plot1 <- renderPlot({
    df <- relative_abundance(seabird_counts, input$colony1)

    barplot(
      df$prop,
      names.arg = df$species,
      las = 2,
      main = input$colony1
    )
  })

  output$plot2 <- renderPlot({
    df <- relative_abundance(seabird_counts, input$colony2)

    barplot(
      df$prop,
      names.arg = df$species,
      las = 2,
      main = input$colony2
    )
  })

  output$similarity <- renderText({
    sim <- colony_similarity(seabird_counts, input$colony1, input$colony2)

    paste("Similarity (Bray-Curtis):", round(sim, 3))
  })
}

shinyApp(ui, server)
