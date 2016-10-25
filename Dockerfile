#This will prepare a elasticsearch node with mongo-connector enabled

FROM python:3.4.3
MAINTAINER hbd@github

ENV DEBIAN_FRONTEND noninteractive

# Installing Mongo Connector which will connect MongoDB and Elasticsearch
RUN pip install mongo-connector==2.4.1
RUN pip install elastic2-doc-manager

COPY startup.sh /tmp/

COPY mongo /usr/bin/
RUN chmod a+x /usr/bin/mongo

VOLUME /data

# Sample usage when no commands is given outside
CMD ["/bin/bash", "/tmp/startup.sh"]
