# David Harter
# December 10, 2018
# Coursera, Developing Data Products
# Week 4 Project: Shiny App
#
# This is the ui.R file to control the server interface for the Shiny web
# app as part of the final project of the Developing Data Products course
# for Coursera.
#
# This web app will predict the horizontal distance and maximum height
# before landing of a projectile launched with a certain amount of
# force and at a certain angle.

library(shiny)
library(rsconnect)

shinyUI(pageWithSidebar(
    titlePanel("Trajectory Calculator"),
    sidebarLayout(
        mainPanel(plotOutput("trajectoryPlot")),
        sidebarPanel(
            sliderInput("velocity",
                h4("Velocity (in m/s):"),
                min = 0,
                max = 100,
                value = 50),
            sliderInput("angle",
                h4("Angle (in degrees)"),
                min = 0,
                max = 90,
                value = 45)
        )
    ),
    
    mainPanel(
        h4("Horizontal Distance (meters):"),
        textOutput("horizontal"),
        h4("Maximum Height (meters):"),
        textOutput("vertmax"),
        h4("Time in the Air (seconds):"),
        textOutput("finaltime")
    )
))