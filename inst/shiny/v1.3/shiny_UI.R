##----------------------------------------------------------------------------##
## Custom functions.
##----------------------------------------------------------------------------##
cerebroBox <- function(
  title,
  content,
  collapsible = TRUE,
  collapsed = FALSE
) {
  box(
    title = title,
    status = "primary",
    solidHeader = TRUE,
    width = 12,
    collapsible = collapsible,
    collapsed = collapsed,
    content
  )
}

cerebroInfoButton <- function(id, ...) {
  actionButton(
    inputId = id,
    label = "info",
    icon = NULL,
    class = "btn-xs",
    title = "Show additional information for this panel.",
    ...
  )
}

boxTitle <- function(title) {
  p(title, style = "padding-right: 5px; display: inline")
}

##----------------------------------------------------------------------------##
## Load UI content for each tab.
##----------------------------------------------------------------------------##
source(paste0(Cerebro.options[["cerebro_root"]], "/shiny/v1.3/load_data/UI.R"), local = TRUE)
source(paste0(Cerebro.options[["cerebro_root"]], "/shiny/v1.3/overview/UI.R"), local = TRUE)
source(paste0(Cerebro.options[["cerebro_root"]], "/shiny/v1.3/groups/UI.R"), local = TRUE)
source(paste0(Cerebro.options[["cerebro_root"]], "/shiny/v1.3/marker_genes/UI.R"), local = TRUE)
source(paste0(Cerebro.options[["cerebro_root"]], "/shiny/v1.3/gene_expression/UI.R"), local = TRUE)
source(paste0(Cerebro.options[["cerebro_root"]], "/shiny/v1.3/gene_id_conversion/UI.R"), local = TRUE)
source(paste0(Cerebro.options[["cerebro_root"]], "/shiny/v1.3/color_management/UI.R"), local = TRUE)
source(paste0(Cerebro.options[["cerebro_root"]], "/shiny/v1.3/about/UI.R"), local = TRUE)

##----------------------------------------------------------------------------##
## Create dashboard with different tabs.
##----------------------------------------------------------------------------##
ui <- dashboardPage(
  title = "Cerebro",
  dashboardHeader(
    title = span("Cerebro ", style = "color: white; font-size: 28px; font-weight: bold")
  ),
  dashboardSidebar(
    tags$head(tags$style(HTML(".content-wrapper {overflow-x: scroll;}"))),
    sidebarMenu(
      id = "sidebar",
      menuItem("Data info", tabName = "loadData", icon = icon("info"), selected = TRUE),
      menuItem("Main", tabName = "overview", icon = icon("home")),
      menuItem("Groups", tabName = "groups", icon = icon("layer-group")),
      menuItem("Marker genes", tabName = "markerGenes", icon = icon("list-alt")),
      menuItem("Gene expression", tabName = "geneExpression", icon = icon("signal")),
      menuItem("Gene ID conversion", tabName = "geneIdConversion", icon = icon("barcode")),
      menuItem("Color management", tabName = "color_management", icon = icon("palette")),
      menuItem("About", tabName = "about", icon = icon("at"))
    )
  ),
  dashboardBody(
    shinyjs::useShinyjs(),
    tags$script(HTML('$("body").addClass("fixed");')),
    tabItems(
      tab_load_data,
      tab_overview,
      tab_groups,
      tab_marker_genes,
      tab_gene_expression,
      tab_gene_id_conversion,
      tab_color_management,
      tab_about
    )
  )
)

ui <- shinymanager::secure_app(ui)
