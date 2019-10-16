FROM python:3.7-stretch

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi && \
    apt-get update && apt-get install -y build-essential python-dev python3-dev
RUN pip install flask==0.10.1 uWSGI==2.0.18 requests==2.22.0 redis==3.3.11

EXPOSE 9090 9091
USER uwsgi

WORKDIR /app
COPY /app /app
COPY /cmd.sh /

CMD ["/cmd.sh"]