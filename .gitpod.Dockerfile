FROM gitpod/workspace-full:latest

ENV ANDROID_HOME=/home/gitpod/android-sdk \
    SDK_NAME=sdk-tools-linux-4333796.zip

USER root
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install openjdk-8-jdk

USER gitpod
RUN mkdir -p ~/.android ${ANDROID_HOME} && \
    touch ~/.android/repositories.cfg && \
    cd ${ANDROID_HOME} && \
    wget https://dl.google.com/android/repository/${SDK_NAME} && \
    unzip ${SDK_NAME} && \
    rm -f ${SDK_NAME} && \
    yes | ${ANDROID_HOME}/tools/bin/sdkmanager --licenses

USER root
RUN apt-get -y purge openjdk-8-jdk && \
    apt-get clean
