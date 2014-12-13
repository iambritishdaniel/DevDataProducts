library(shiny)

shinyServer(function(input, output) {
  
  output$bmr <- renderText({
    ht <- getHeight(input$feet, input$inches)
    htMetric = convertHeightToMetric(ht)
    wtMetric = convertWeightToMetric(input$lbs)
    calculateBMR(
      input$gender, 
      input$age, 
      htMetric,
      wtMetric,
      1)
  })

  output$sedentaryBMR <- renderText({
    ht <- getHeight(input$feet, input$inches)
    htMetric = convertHeightToMetric(ht)
    wtMetric = convertWeightToMetric(input$lbs)
    calculateBMR(
      input$gender, 
      input$age, 
      htMetric,
      wtMetric,
      1.2)
  })

  output$lightBMR <- renderText({
    ht <- getHeight(input$feet, input$inches)
    htMetric = convertHeightToMetric(ht)
    wtMetric = convertWeightToMetric(input$lbs)
    calculateBMR(
      input$gender, 
      input$age, 
      htMetric,
      wtMetric,
      1.375)
  })

  output$moderateBMR <- renderText({
    ht <- getHeight(input$feet, input$inches)
    htMetric = convertHeightToMetric(ht)
    wtMetric = convertWeightToMetric(input$lbs)
    calculateBMR(
      input$gender, 
      input$age, 
      htMetric,
      wtMetric,
      1.55)
  })
  
  output$veryBMR <- renderText({
    ht <- getHeight(input$feet, input$inches)
    htMetric = convertHeightToMetric(ht)
    wtMetric = convertWeightToMetric(input$lbs)
    calculateBMR(
      input$gender, 
      input$age, 
      htMetric,
      wtMetric,
      1.725)
  })
  
  output$extremeBMR <- renderText({
    ht <- getHeight(input$feet, input$inches)
    htMetric = convertHeightToMetric(ht)
    wtMetric = convertWeightToMetric(input$lbs)
    calculateBMR(
      input$gender, 
      input$age, 
      htMetric,
      wtMetric,
      1.9)
  })

  getHeight <- function(feet, inches) {
    (feet * 12) + inches
  }
  
  convertHeightToMetric <- function(height) {
    height / 0.393700787402
  }
  
  convertWeightToMetric <- function(weight) {
    weight / 2.20462262185
  }
  
  calculateBMR <- function(gender, age, height, weight, factor) {
    bmr <- (10 * weight) + (6.25 * height) - (5 * age)
    if (gender == "M") 
      bmr <- bmr + 5
    else
      bmr <- bmr - 161
    round(bmr * factor)
  }
})