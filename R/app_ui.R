#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
      h1("CentralDogma"),
      tabsetPanel(
        tabPanel(title = "DNA expression",
                 mod_module_DNA_PROTEIN_ui("module_DNA_PROTEIN_1")),
        tabPanel(title = "Amino Acid Abundance",
                 mod_module_AA_plot_ui("module_AA_plot_1"))
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "CentralDogma"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
