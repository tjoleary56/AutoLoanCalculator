
library(shiny)

shinyUI(fluidPage(

  titlePanel("Auto Loan Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      p("Sticker Price"),
      numericInput(inputId = "sp", label=NULL, value = 0),
      p("Warranty"),
      numericInput(inputId = "w", label=NULL, value = 0),
      p("Gap Insurance"),
      numericInput(inputId = "gi", label=NULL, value = 0),
      p("State Sales Tax Rate"),
      numericInput(inputId = "tax", label=NULL, value = 0),
      p("Trade Value"),
      numericInput(inputId = "tradeval", label=NULL, value = 0),
      p("Trade Payoff"),
      numericInput(inputId = "tradepayoff", label=NULL, value = 0),
      p("Cash Down"),
      numericInput(inputId = "cashDown", label=NULL, value = 0),
      p("Contract Term"),
      numericInput(inputId = "contract", label=NULL, value = 0),
      p("APR Rate"),
      numericInput(inputId = "apr", label=NULL, value = 0),
      p("Enter Custom Field"),
      textInput(inputId = "c1t", label = NULL, value = "Custom Field 1"),
      numericInput(inputId = "c1v", label = NULL, value = 0),
      p("Enter Custom Field"),
      textInput(inputId = "c2t", label = NULL, value = "Custom Field 2"),
      numericInput(inputId = "c2v", label = NULL, value = 0),
      p("Enter Custom Field"),
      textInput(inputId = "c3t", label = NULL, value = "Custom Field 3"),
      numericInput(inputId = "c3v", label = NULL, value = 0),
      p("Enter Custom Field"),
      textInput(inputId = "c4t", label = NULL, value = "Custom Field 4"),
      numericInput(inputId = "c4v", label = NULL, value = 0)
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("Pricing", tableOutput("pricing")),
        tabPanel("Results", tableOutput("results"))
      )
    )
  )
))
