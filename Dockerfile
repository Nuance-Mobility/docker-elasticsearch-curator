FROM        nuancemobility/ubuntu-base:16.10
MAINTAINER  sspcm <mobility-sspcm@nuance.com>

COPY        elasticsearch-curator.py    /etc/cron.hourly/

RUN         curl -O https://bootstrap.pypa.io/get-pip.py && \
            python get-pip.py && \
            pip install --quiet elasticsearch-curator==3.3.0 && \
            chmod a+x /etc/cron.hourly/elasticsearch-curator.py && \
            touch /var/log/curator

COPY        crontab     /etc/crontab

VOLUME      /config

COPY        supervisor  /etc/supervisor/conf.d
