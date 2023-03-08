library(EBImage)
library(shiny)

shinyServer(function(input, output) {
  
  output$text <- renderText({
    # web image
    #download.file(input$url,"1.jpeg",mode = "wb")
    #native image
    img <- readImage(input$url)
    writeImage(img, "img.jpeg", quality=100)
    "Image:"
  })
  
   
  
   
  
  output$img3 <- renderImage({
    oi2 <- readImage("img.jpeg")
    if (input$lps>1){
      if (input$lps %% 2 == 0 ){
        lps <- input$lps + 1
      }
      else {
        lps <- input$lps
      }
    }
    else {
      lps <- input$lps
    }
    
    flo <- makeBrush(lps, shape="disc", step=FALSE)^2
    flo <- flo/sum(flo)
    fhi <- matrix(1, nc=3, nr=3)
    fhi[2,2] = -input$hps
    
    if (is.null(input$filt)){
      oi2 <- oi2
    }
    else if (input$filt == 1){
      oi2 <- filter2(oi2, flo)
    }
    else if (input$filt == 2){
      oi2 <- filter2(oi2, fhi)
    }
    
    if (is.null(input$Save1)){
      oi2 <- oi2
    }
    else {
      writeImage(oi2, "img.jpeg", quality=100)
    }
    writeImage(oi2, "img2.jpeg", quality=100)
    
    filename <- normalizePath(file.path('./',paste0('img2','.jpeg')))
    list(src = filename)
  }, deleteFile = FALSE)
  
  output$img4 <- renderImage({
    oi2 <- readImage("img.jpeg")
    if (input$mm>1){
      if (input$mm %% 2 == 0 ){
        mm <- input$mm + 1
      }
      else {
        mm <- input$mm
      }
    }
    else {
      mm <- input$mm
    }
    
    kern <- makeBrush(mm, shape="diamond")^2
    
    if (is.null(input$morph)){
      oi2 <- oi2
    }
    else if (input$morph == 1){
      oi2 <-  erode(oi2, kern)
    }
    else if (input$morph == 2){
      oi2 <- dilate(oi2, kern)
    }
    
    if (is.null(input$Save1)){
      oi2 <- oi2
    }
    else {
      writeImage(oi2, "img.jpeg", quality=100)
    }
    writeImage(oi2, "img2.jpeg", quality=100)
    
    filename <- normalizePath(file.path('./',paste0('img2','.jpeg')))
    list(src = filename)
  }, deleteFile = FALSE)
  
  
})