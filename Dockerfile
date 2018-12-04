FROM ubuntu:18.04

MAINTAINER lmagnien@gmail.com

RUN apt-get update
RUN apt-get upgrade -y

# Download and install wkhtmltopdf
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential xorg libssl-dev libxrender-dev wget gdebi
RUN wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.bionic_amd64.deb
RUN gdebi --n wkhtmltox_0.12.5-1.bionic_amd64.deb

RUN wget -O "Open Sans.zip" "https://www.fontsquirrel.com/fonts/download/open-sans" \ 
	&& unzip -u "Open Sans.zip" -d /root/.fonts \
	&& rm -f "Open Sans.zip" \
	&& fc-cache -f

ENTRYPOINT ["wkhtmltopdf"]

# Show the extended help
CMD ["-h"]
