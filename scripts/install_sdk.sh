#! /usr/sh
# install_sdk.sh
# author: seung hee, lee
# description: clone and initialize Espressif esp-idf

cur_path=${PWD}
if [[ "$OSTYPE" == "darwin"* ]]; then
    project_path=$(dirname $(dirname $(realpath $0)))
else 
    project_path=$(dirname $(dirname $(realpath $BASH_SOURCE)))
fi

sdk_path=~/tools  # change to your own sdk path
if ! [ -d "${sdk_path}" ]; then
  mkdir ${sdk_path}
fi

esp_idf_path=${sdk_path}/esp-idf
esp_matter_path=${sdk_path}/esp-matter

# for Apple silicon
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:"/opt/homebrew/opt/openssl@3/lib/pkgconfig"
else 
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install \
      git g++ gcc cmake ninja-build ccache pkg-config wget flex bison gperf dfu-util unzip \
      libssl-dev libffi-dev libusb-1.0-0 libglib2.0-dev libavahi-client-dev \
      libdbus-1-dev libgirepository1.0-dev libcairo2-dev libreadline-dev \
      python3 python3-dev python3-pip python3-venv python3-setuptools npm \
      -y
fi

# install esp-idf
cd ${sdk_path}
git clone --recursive https://github.com/espressif/esp-idf.git esp-idf
cd ${esp_idf_path}
git fetch --all --tags
git checkout v5.1.1
git submodule update --init --recursive
bash ./install.sh

# create symbolic link
cd ${project_path}
if ! [ -d "${project_path}/sdk" ]; then
  mkdir ${project_path}/sdk
fi
ln -s ${esp_idf_path} ${project_path}/sdk/esp-idf

cd ${cur_path}