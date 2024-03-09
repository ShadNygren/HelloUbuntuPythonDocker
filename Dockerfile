FROM ubuntu:22.04
RUN echo 'APT::Install-Suggests "0";' >> /etc/apt/apt.conf.d/00-docker
RUN echo 'APT::Install-Recommends "0";' >> /etc/apt/apt.conf.d/00-docker
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get install -y python3.10 \
  && rm -rf /var/lib/apt/lists/*
EXPOSE 9000
RUN useradd -ms /bin/bash apprunner
USER apprunner
CMD ["python","-m","http.server","-d","/proc/","9000"]
