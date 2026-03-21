
library(shiny)
library(devtools)
devtools::install_github("StineGryt/SeabirdStudio")
library(SeabirdStudio)

ui <- fluidPage(

  titlePanel("Seabird Colony Comparison"),

  h4("Compare seabird community composition between sites"),

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

    ggplot2::ggplot(df, ggplot2::aes(
      x = reorder(species, prop),
      y = prop
    )) +
      ggplot2::geom_col(fill = "steelblue") +
      ggplot2::coord_flip() +
      ggplot2::labs(
        title = input$colony1,
        x = "Species",
        y = "Relative abundance"
      ) +
      ggplot2::theme_minimal()

  })

  output$plot2 <- renderPlot({

    df <- relative_abundance(seabird_counts, input$colony2)

    ggplot2::ggplot(df, ggplot2::aes(
      x = reorder(species, prop),
      y = prop
    )) +
      ggplot2::geom_col(fill = "darkgreen") +
      ggplot2::coord_flip() +
      ggplot2::labs(
        title = input$colony2,
        x = "Species",
        y = "Relative abundance"
      ) +
      ggplot2::theme_minimal()

  })

  output$similarity <- renderText({
    sim <- colony_similarity(seabird_counts, input$colony1, input$colony2)

    paste0(
      "Bray-Curtis similarity: ",
      round(sim, 3),
      " (0 = different, 1 = identical)"
    )
  })
}

shinyApp(ui, server)
