#For building the Flask Base Image
FROM ubuntu:18.04
WORKDIR /usr/src/app
#Install python
RUN apt-get update
RUN apt-get install python3-flask --assume-yes
RUN apt-get install python3-pip --assume-yes
RUN pip3 install virtualenv
#Copy in the necessary files
COPY . .
#Install the necessary libraries
RUN apt-get install libpq-dev --assume-yes
RUN pip3 install -r requirements.txt
#Configure it to run flaskENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
WORKDIR /usr/src/app/
#Expose the necessary port
EXPOSE 5000

#Make the command that runs on start
CMD python3 hello.py


