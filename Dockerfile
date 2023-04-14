FROM ubuntu:latest

LABEL "repository"="https://github.com/chee2e/trivy-test"
LABEL "maintainer"="chee2e <pinkc47@naver.com>"

# update and install packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# copy app files
COPY app.py /app/
COPY requirements.txt /app/

# install app dependencies
WORKDIR /app
RUN pip3 install -r requirements.txt

# expose port and start app
EXPOSE 8000
CMD ["python3", "app.py"]
