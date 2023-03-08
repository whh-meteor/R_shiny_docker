# get shiny server and R from the rocker project
FROM rocker/shiny-verse:4.0.5

# system libraries
# Try to only install system libraries you actually need
# Package Manager is a good resource to help discover system deps
RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libssl-dev 
    
RUN apt-get update && \
    apt-get install -y default-libmysqlclient-dev
    
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
   libfftw3-dev \
   gcc && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
RUN apt update
RUN apt-get install -y curl
RUN apt-get -y install libcurl4-openssl-dev 
    
# install R packages required 
RUN R -e 'install.packages(c("DBI","tidyverse", "shiny", "plotly","googleCloudStorageR","shinyWidgets","BiocManager"), \
            repos="https://packagemanager.rstudio.com/cran/__linux__/focal/2021-04-23"\
          )'
          
RUN R -e "install.packages('RMySQL', repos='http://cran.rstudio.com/', version='0.10.21', dependencies=TRUE)"

RUN R -e "install.packages('jpeg', dependencies=TRUE)"



# install required R libraries https://stackoverflow.com/questions/70991621/installing-r-package-decipher-in-a-docker-image https://gist.github.com/zoevanhavre/ed78a14db3a8763e15457f04764b40e6

RUN Rscript -e 'requireNamespace("BiocManager"); BiocManager::install();' \
&& Rscript -e 'requireNamespace("BiocManager"); BiocManager::install("EBImage")' 

# copy the app directory into the image

COPY ./shiny-app/* /srv/shiny-server/
# 给该文件放开最大权限
RUN chmod -R 777 /srv/shiny-server
RUN chmod -R 777 /srv
# RUN mkdir -p /srv/shiny-server/tmpdata

# run app
CMD ["/usr/bin/shiny-server"]