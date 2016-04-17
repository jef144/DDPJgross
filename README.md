# DDPJgross
Shiny App Final course project DDP course
This Shiny app uses a linear model that is stored in RDS file format for purposes of efficiency.  In other words, 
there is no need to re-run the analysis for every invocation of the web app, and no need to copy data to the shiny server.

The code to create the stored model is simply:
fitwtAMCust<-lm(mpg ~ wt  +  factor(am) +   wt:factor(am) , data=mtcars)
saveRDS(fitwtAMCust, "fitwtAMCust.rds" )
