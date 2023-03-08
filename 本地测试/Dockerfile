FROM mbiggs/r_ebimage
COPY . /usr/local/src/myscripts
WORKDIR /usr/local/src/myscripts


# # install curl and libcurl
# RUN apt update
# RUN apt-get install -y curl
# RUN apt-get -y install libcurl4-openssl-dev

# # install required R libraries
# RUN R -e "install.packages('BiocManager')"
# RUN R -e "BiocManager::install('EBImage')"
RUN R -e "install.packages('shiny')"
RUN R -e "install.packages('htmlwidgets')"
EXPOSE 3839
CMD ["Rscript", "ui.R"]