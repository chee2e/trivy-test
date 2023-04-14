FROM node:erbium-buster-slim

LABEL "repository"="https://github.com/chee2e/trivy-test"
LABEL "maintainer"="chee2e <pinkc47@naver.com>"

RUN set -eux ; \
    apt-get update -y; \
    apt-get install --no-install-recommends -y \
    tzdata; \
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime; \
    mkdir /html; \
    npm install -g http-server; \
    apt-get install -y vim

ADD ./index.html /html

WORKDIR /html
EXPOSE 80

CMD ["http-server", "-p80", "./"]
