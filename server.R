library(shiny)

#diabetesRisk <- function(glucose) glucose / 200  

predictedMPG <- function(carWT, autoTrans)     {  
   #Load lm model previously saved
   #ModelFit was created like this:
   #  fitwtAMCust<-lm(mpg ~ wt  +  factor(am) +   wt*factor(am) , data=mtcars)
   #  saveRDS(fitwtAMCust, "fitwtAMCust.rds" )
   modelFit <- readRDS("fitwtAMCust.rds")
   if (predict(modelFit, newdata = data.frame(wt=carWT, am=factor(autoTrans))) < 0) {0}
      else predict(modelFit, newdata = data.frame(wt=carWT, am=factor(autoTrans)))
}

shinyServer(
  function(input, output) {
    output$carWeight <- renderText({input$carWeight}) 
    output$TransType <- renderText(  
      { if (input$TransType == 0) { "Manual"  }  else {"Automatic"}} 
    
    ) 
    output$MPGPrediction <- renderText({predictedMPG(input$carWeight, input$TransType)})
    output$CO2Prediction <- renderText({5457/predictedMPG(input$carWeight, input$TransType)})
  }
)