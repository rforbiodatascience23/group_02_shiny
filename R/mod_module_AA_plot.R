#' module_AA_plot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#'
#' @importFrom ggplot2 theme
#' @import CentralDogma

mod_module_AA_plot_ui <- function(id){
  ns <- NS(id)
  tagList(sidebarLayout(
    sidebarPanel(
      textAreaInput(
        inputId = ns("peptide"),
        label = "Peptide sequence",
        width = 300,
        height = 100,
        placeholder = "Insert peptide sequence"
      )
    ),
    mainPanel(
      plotOutput(
        outputId = ns("abundance")
      )
    )
  )

  )
}

#' module_AA_plot Server Functions
#'
#' @noRd
mod_module_AA_plot_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$abundance <- renderPlot({
      if(input$peptide == ""){
        NULL
      } else{
        input$peptide |>
          CentralDogma::plot_amino_acid_counts() +
          ggplot2::theme(legend.position = "none")
      }
    })

  })
}

## To be copied in the UI
# mod_module_AA_plot_ui("module_AA_plot_1")

## To be copied in the server
# mod_module_AA_plot_server("module_AA_plot_1")
