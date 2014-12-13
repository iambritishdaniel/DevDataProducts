library(shiny)

shinyUI(fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),
  titlePanel(""),
  sidebarLayout(
    sidebarPanel(
      radioButtons("gender", label = h3("Gender"),
                   choices = list("Male" = "M", "Female" = "F")),
      numericInput("age", 
                   label = h3("Age"), 
                   value = 30),
      h3("Height"),
      fluidRow(
        column(3, numericInput("feet", "Feet", min = 3, max = 8, value = 5)),
        column(2),
        column(3, numericInput("inches", "Inches", min = 0, max = 11, value = 8))
      ),
      h3("Weight"),
      fluidRow(
        column(3, numericInput("lbs", "lbs", min = 50, max = 400, value = 150))      )
  ),
    mainPanel(
      h2("Basal Metabolic Rate Calculator"),
      p("Your Basal Metabolic Rate (BMR) is an approximation of the daily calories your body needs."),
      p("It is a useful guide when trying to lose weight: if you expend more calories than you take in each day then you will lose weight."),
      p("Enter your Gender, Age, Height, and Weight to see your BMR."),
      tags$b("BMR: "), 
      textOutput("bmr"),
      h4("Calculate Total Calorie Needs"),
      p("The BMR displayed above is a baseline, but even the most inactive individual will burn additional calories over their BMR by just doing normal bodily functions like laughing and smiling. For a better understanding of how many calories your body uses each day, you need to consider your activity level. To find out your total daily calorie needs or TDEE (total daily energy expenditure), lookup your activity level below:"),
      tags$ul(),
      tags$li(tags$b("Sedentary"), " (little or no exercise): ", textOutput("sedentaryBMR")),
      tags$li(tags$b("Lightly active"), " (easy exercise/sports 1-3 days/week): ", textOutput("lightBMR")),
      tags$li(tags$b("Moderately active"), " (moderate exercise/sports 3-5 days/week): ", textOutput("moderateBMR")),
      tags$li(tags$b("Very active"), " (hard exercise/sports 6-7 days a week): ", textOutput("veryBMR")),
      tags$li(tags$b("Extremely active"), " (very hard exercise/sports and physical job): ", textOutput("extremeBMR"))
    )
  )
))