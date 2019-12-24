FROM gitpod/workspace-full:latest

USER root
RUN apt-get update && \
    apt-get -y install openjdk-8-jdk && \
    apt-get -y upgrade && \
    apt-get -y clean && \
    rm -rf /var/cache/apt/*

USER gitpod
# Install android SDK
ENV ANDROID_HOME=/home/gitpod/sdk/android
ENV ANDROID_SDK_NAME=sdk-tools-linux-4333796.zip
ENV PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools
RUN mkdir -p ~/.android ${ANDROID_HOME} && \
    touch ~/.android/repositories.cfg && \
    cd ${ANDROID_HOME} && \
    wget -q https://dl.google.com/android/repository/${ANDROID_SDK_NAME} && \
    unzip -q ${ANDROID_SDK_NAME} && \
    rm -f ${ANDROID_SDK_NAME} && \
    yes | sdkmanager --licenses && \
    sdkmanager --update
    
