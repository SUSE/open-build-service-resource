FROM opensuse/leap

RUN zypper -v -n in osc build sudo obs-service-download_files obs-service-recompress \
    obs-service-set_version obs-service-source_validator obs-service-tar_scm \
    obs-service-verify_file obs-service-format_spec_file python-packaging jq

ADD assets/ /opt/resource/
RUN chmod +x /opt/resource/{check,in,out}
