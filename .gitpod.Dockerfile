FROM gitpod/workspace-full:latest

ENV ANDROID_HOME=/home/gitpod/android-sdk \
    SDK_NAME=sdk-tools-linux-4333796.zip

USER root

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y autoremove && apt-get clean

USER gitpod

RUN mkdir -p ~/.android ~/android-sdk && \
    touch ~/.android/repositories.cfg && \
    cd ${ANDROID_HOME} && \
    wget https://dl.google.com/android/repository/${SDK_NAME} && \
    unzip ${SDK_NAME} && \
    rm -f ${SDK_NAME} && \
    which java
