FROM python:2.7-onbuild
MAINTAINER Stefan Verhoeven <s.verhoeven@esciencecenter.nl>
EXPOSE 5000

# Install docker client
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates && \
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
echo 'deb https://apt.dockerproject.org/repo debian-jessie main' > /etc/apt/sources.list.d/docker.list && \
apt-get update && apt-get install -y docker-engine && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cp settings.docker.cfg settings.cfg

CMD ["python", "onebuttoncompute.py"]
