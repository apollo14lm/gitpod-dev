FROM gitpod/workspace-full:latest

USER root

# AWS CLI
ARG AWS_FILE="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
RUN curl -sL "$AWS_FILE" -o "/tmp/awscliv2.zip" \
  && unzip -qq /tmp/awscliv2.zip -d /tmp \
  && sudo /tmp/aws/install \
  && rm -rf /tmp/*

# Android SDK Command line tools
ENV JAVA_HOME=/home/gitpod/.sdkman/candidates/java/current
ENV ANDROID_SDK_ROOT=/opt/android
ENV ANDROID_HOME=${ANDROID_SDK_ROOT}
ENV ANDROID_NDK_HOME=${ANDROID_SDK_ROOT}/ndk/20.1.5948944
ARG ANDROID_FILE="commandlinetools-linux-8512546_latest.zip"
ENV PATH=${ANDROID_HOME}/cmdline-tools/tools/bin:${ANDROID_HOME}/platform-tools:${PATH}

RUN mkdir ${ANDROID_SDK_ROOT} \
  && mkdir ${ANDROID_SDK_ROOT}/cmdline-tools \
  && curl -sL "https://dl.google.com/android/repository/$ANDROID_FILE" -o /tmp/$ANDROID_FILE \
  && unzip -qq /tmp/$ANDROID_FILE -d /opt/android/cmdline-tools \
  && mv /opt/android/cmdline-tools/cmdline-tools /opt/android/cmdline-tools/tools \
  && yes | sdkmanager --licenses \
  && yes | sdkmanager \
  "platforms;android-31" \
  "build-tools;30.0.3" \
  "build-tools;31.0.0" \
  && yes | sdkmanager --uninstall "emulator" \
  && rm -rf /tmp/*

USER gitpod