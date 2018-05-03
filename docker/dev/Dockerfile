FROM python:3
MAINTAINER Joe Nguyen <joe_nguyen@yahoo.com>
ENV PYTHONUNBBERED 1
WORKDIR /app
EXPOSE 8000
COPY ./requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt
ENTRYPOINT ["gunicorn","--bind","0.0.0.0:8000","api.server:app"]
COPY . /app