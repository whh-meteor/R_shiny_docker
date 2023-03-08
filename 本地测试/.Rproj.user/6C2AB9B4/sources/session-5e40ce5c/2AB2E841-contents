library("EBImage")

erodes <- function(path, thr) {
  shapes <- readImage(path)
  kern = makeBrush(thr, shape='diamond')
  shapes_erode= erode(shapes, kern) # 腐蚀
  shapes_dilate = dilate(shapes, kern) # 膨胀
  #display(combine(shapes,shapes_erode, shapes_dilate), 
  display(combine(shapes,shapes_erode), 
          all=TRUE,method = 'browser',nx = 3)
  
  
}

erodes("changemap.jpg",9)
