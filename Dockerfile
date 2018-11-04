FROM python:3.7 as builder

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wkhtmltopdf git

COPY --from=builder /bin/wkhtmltopdf /bin/wkhtmltopdf
