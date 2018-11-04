FROM python:3.7

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wkhtmltopdf git
