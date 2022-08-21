FROM ubuntu:22.04

ENV FLUTTER_URL=https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.0.5-stable.tar.xz

# Install packages for flutter plus curl and git
RUN apt-get update && apt-get install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev curl git

# User setup (do not run as root)
RUN useradd -ms /bin/bash flutteruser
USER flutteruser
WORKDIR /home/flutteruser

# Download and install flutter sdk
RUN curl -o flutter.tar.xz $FLUTTER_URL

RUN tar xf flutter.tar.xz -C /home/flutteruser && rm flutter.tar.xz

ENV PATH="${PATH}:/home/flutteruser/flutter/bin"

RUN flutter config --no-analytics && flutter precache && flutter update-packages

ENTRYPOINT ["flutter"]
