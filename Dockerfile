FROM python:3.7

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.3/wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
RUN tar vxf wkhtmltox-0.12.3_linux-generic-amd64.tar.xz
RUN cp wkhtmltox/bin/wk* /usr/local/bin/

ADD . /app/

WORKDIR /app/

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements_dev.txt

RUN export WKHTMLTOPDF_BIN=/usr/local/bin/wkhtmltopdf

CMD ["/bin/bash", "-c", "while true; do sleep 10; done"]
