FROM machinerytool/osc_opensuse42.1

RUN zypper -n in jq

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/*
