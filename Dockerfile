FROM ubuntu:bionic as baseos
LABEL original_config_by "faithfulst3ward <faithfulst3ward@protonmail.com>"
LABEL maintainer "Dmitry Biliuba <dmitry.biliuba@gmail.com>"
#
WORKDIR /app
#
RUN  sed -i -e 's/^deb-src/#deb-src/' /etc/apt/sources.list \
	&& export DEBIAN_FRONTEND=noninteractive \
	&& apt-get update \
	&& apt-get upgrade -y --no-install-recommends \
	&& apt-get install -y --no-install-recommends \
	bash \
	ca-certificates \
	curl \
	p7zip-full
#
RUN apt-get autoremove -y \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc   
#
RUN curl -L https://c2.hak5.org/download/community --output c2.zip \
	&& 7z e c2.zip -o/tmp/c2 \
	&& mv /tmp/c2/*_amd64_linux /app/c2_linux \
	&& rm c2.zip \
	&& rm -r /tmp/c2
#
CMD  ./c2_linux ${C2_PARAMETERS}
#
EXPOSE 2022 8080
