library(tidyverse)
library(shiny)
library(shinydashboard)

UC_admit <- readr::read_csv("data lab 7/UC_admit.csv")
UC_admit %>% 
  mutate_at(vars(Academic_Yr), as.factor) %>% 
  mutate_at(vars(Ethnicity), as.factor)

ui <- dashboardPage(
  dashboardHeader(title = "Ethnicities Data App"),
  dashboardSidebar("UC System"),
  dashboardBody(
    radioButtons("x", "Select Choice", choices = c("Academic_Yr", "Campus", "Category"), 
                 selected = "Category"),
    plotOutput("plot", width = "800px", height = "600px")
  ))

server <- function(input, output, session) { 
  output$plot <- renderPlot({
    ggplot(UC_admit, aes_string(x = "Ethnicity", y="FilteredCountFR", fill=input$x)) +
      geom_col(position = "dodge") + theme_light(base_size = 18)+ coord_flip()+
      labs(x = "Ethnicity",
           y = "Filtered Count FR") 
  })
  
  session$onSessionEnded(stopApp)
}

shinyApp(ui, server)