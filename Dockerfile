FROM machinerytool/osc_opensuse:leap

RUN zypper -n in jq

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/{check,in,out}
