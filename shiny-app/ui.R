library(EBImage)
library(shiny)
library(jpeg)
shinyUI(navbarPage("Image Processing",
               
                   
                   
                   tabPanel("Image Filtering",
                            fluidPage(
                              sidebarLayout(
                                 position = "right",
                                sidebarPanel(
                                  textInput("url", label = h6("Enter Image URL"), value = ""),
                                  
                                  sliderInput("lps", label = h6("Low-Pass Filter size"),min = 1, max = 50, value = 21),
                                  sliderInput("hps", label = h6("High-Pass Filter size"),min = 1, max = 20, value = 10),
                                  checkboxGroupInput("filt",label = h6("Filter Type"), choices = list("Low-Pass Filter" = 1, "High-Pass Filter" = 2)),              
                                  checkboxGroupInput("Save1", label = h6(""), choices = list("Save"=1))
                                ),
                                
                                mainPanel(
                                  imageOutput("img3")
                                ))
                            )),
                   
                   tabPanel("Morphing",
                            fluidPage(
                              sidebarLayout(
                                position = "right",
                                sidebarPanel(
                                  sliderInput("mm", label = h6("Magnitude"),min = 1, max = 50, value = 21),                              
                                  checkboxGroupInput("morph",label = h6("Morphological Operators"), choices = list("Erode" = 1, "Dilate" = 2)),              
                                  checkboxGroupInput("Save2", label = h6(""), choices = list("Save"=1))
                                ),
                                
                                mainPanel(
                                  imageOutput("img4")
                                ))
                            ))
                   
                   
                   
                   
                   
))





