library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("1974 Auto Emission Prediction"),
    sidebarPanel(
      sliderInput('carWeight', 'Automobile Weight LBS', 4 , min = 3 , max = 7 , step = .2     ),
      radioButtons("TransType", "Transmission Type", c( "Manual" = 0, "Automatic" = 1 )) 
      #,submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'), 
      #h4('You entered'),
      #verbatimTextOutput("carWeight"),
      #textOutput("TransType"),
      h4('Predicted miles/gallon '),
      verbatimTextOutput("MPGPrediction"),
      h4('Predicted CO2 grams/km'),
      verbatimTextOutput("CO2Prediction"),
      h4('Usage'),
      helpText("This utility predicts mileage and CO2 emissions based on a linear model applied to the Motor Trend 
                dataset of cars available in 1974.  The model is based on vehicle weight, type of transmission, and 
                and Interaction between those two variables.")
    )
  )
)