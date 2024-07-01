FROM ubuntu:latest
RUN apt-get update && apt-get upgrade
RUN apt-get install apache2 -y
USER www-data
CMD ["whoami"]