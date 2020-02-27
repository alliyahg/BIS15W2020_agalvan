

library(tidyverse)
library(shiny)
library(shinydashboard)

UC_admit <- readr::read_csv("data lab 7/UC_admit.csv")
UC_admit %>% 
  mutate_at(vars(Academic_Yr), as.factor) %>% 
  mutate_at(vars(Ethnicity), as.factor)

ui <- dashboardPage(
  dashboardHeader(title = "Ethnicity Data App"),
  dashboardSidebar("UC System"),
  dashboardBody(
    selectInput("x", "Select Fill", choices = c("Campus", "Category", "Ethnicity"), 
                selected = "Ethnicity"), 
    plotOutput("plot", width = "600px", height = "400px"))
)

server <- function(input, output, session) { 
  output$plot <- renderPlot({
    UC_admit %>% 
      filter(Ethnicity != "All") %>% 
      ggplot(aes_string(x = "Academic_Yr", y = "FilteredCountFR", fill = input$x))+ theme(axis.text.x = element_text(angle = 60, hjust = 1))+ geom_bar(stat = "identity") + labs(x = "Academic Year",
                                                                                                                                                                                 y = "Filtered Count FR") 
    
  })
  session$onSessionEnded(stopApp)
  
}

shinyApp(ui, server)