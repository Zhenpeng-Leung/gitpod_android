FROM gitpod/workspace-full

USER root
RUN apt-get update &&\
    apt-get -y install openjdk-8-jdk &&\
    apt-get -y upgrade

USER gitpod
# Install android SDK
ENV ANDROID_HOME=${HOME}/sdk/android
ENV PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools
ARG ANDROID_SDK_NAME=sdk-tools-linux-4333796.zip

RUN mkdir -p ${HOME}/.android ${ANDROID_HOME} &&\
    touch ${HOME}/.android/repositories.cfg &&\
    cd ${ANDROID_HOME} &&\
    wget -q https://dl.google.com/android/repository/${ANDROID_SDK_NAME} &&\
    unzip -q ${ANDROID_SDK_NAME} &&\
    rm -f ${ANDROID_SDK_NAME} &&\
    yes | sdkmanager --licenses &&\
    sdkmanager --update

USER root
RUN apt-get -y purge openjdk-8-jdk &&\
    apt-get -y autoremove && apt-get clean &&\
    rm -rf /var/cache/apt/* /var/lib/apt/lists/* /tmp/*
