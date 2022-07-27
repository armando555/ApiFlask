FROM ubuntu:20.04

# update time zone
RUN apt-get update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/America/Bogota /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt update -y
# Install python
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y python3 python3-pip

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

#PASSING THE JTL FILES to the container
WORKDIR /usr/src/app

COPY . /usr/src/app

#Installing dependencies
RUN python3 -m pip install -r requirements.txt

#Install Uwsgi server
RUN pip install uwsgi

CMD [ "uwsgi", "uwsgi.ini" ]