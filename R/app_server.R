#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  mod_module_AA_plot_server("module_AA_plot_1")
  mod_module_DNA_PROTEIN_server("module_DNA_PROTEIN_1")
}
