FROM ubuntu:18.04

MAINTAINER lmagnien@gmail.com

RUN apt-get update
RUN apt-get upgrade -y

# Download and install wkhtmltopdf
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential xorg libssl-dev libxrender-dev wget gdebi
RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
RUN gdebi --n wkhtmltox_0.12.5-1.bionic_amd64.deb
ENTRYPOINT ["wkhtmltopdf"]

# Show the extended help
CMD ["-h"]