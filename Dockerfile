FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

ENV HOME=/root
WORKDIR /root

# Install tzdata before git to avoid timezone selection.
RUN apt-get update && apt-get install -y tzdata sudo curl software-properties-common
ENV TZ=Asia/Tokyo

RUN sudo apt-add-repository -y ppa:fish-shell/release-3 && sudo apt-get install -y fish git

RUN curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

ADD . .

ENV XDG_CONFIG_HOME=$HOME/.config

# actual setup dotfile
RUN ./installer
