# David Harter
# December 10, 2018
# Coursera, Developing Data Products
# Week 4 Project: Shiny App
#
# This is the server.R file to run the Shiny web app as part of the final
# project of the Developing Data Products course for Coursera.
#
# This web app will predict the horizontal distance and maximum height
# before landing of a projectile launched with a certain amount of
# force and at a certain angle.

library(shiny)
library(rsconnect)

shinyServer(
    function(input, output){
        output$horizontal <- renderText({ h_Distance(input$velocity, input$angle) })
        output$vertmax <- renderText({ v_Maximum(input$velocity, input$angle) })
        output$finaltime <- renderText({ finalTime(input$velocity, input$angle) })
        
        output$trajectoryPlot <- renderPlot({
            tfinal <- finalTime(input$velocity, input$angle)
            t <- seq(0, tfinal, length.out = 21)
            
            x <- input$velocity * cos(input$angle*pi/180) * t
            y <- input$velocity * sin(input$angle*pi/180) * t - 0.5 * 9.8 * t^2
            trajectory <- cbind(x, y)
            
            par(bg = "Light Green")
            plot(trajectory,
                 main = "Use the Sliders to Adjust Velocity and Angle",
                 xlab = "Horizontal Distance",
                 ylab = "Height",
                 xlim = c(0, 1000), ylim = c(0, 500),
                 pch = "O",
                 col = "Dark Blue")
        })
    }
)

h_Distance <- function (velocity, angle)
{
    horiz <- 2 * velocity^2 * sin(angle*pi/180) * cos(angle*pi/180)/9.8
    return(round(horiz, 1))
}

v_Maximum <- function(velocity, angle)
{
    ymax <- 0.5 * (velocity * sin(angle*pi/180))^2 / 9.8
    return(round(ymax, 1))
}

finalTime <- function(velocity, angle)
{
    finTime <- 2 * velocity * sin(angle*pi/180) / 9.8
    return(round(finTime, 1))
}