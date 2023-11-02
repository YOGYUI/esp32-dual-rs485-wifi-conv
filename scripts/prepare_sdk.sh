#! /usr/sh
# prepare_sdk.sh
# author: seung hee, lee
# purpose: prepare sdk environment (idf.py)

cur_path=${PWD}
if [[ "$OSTYPE" == "darwin"* ]]; then
    project_path=$(dirname $(dirname $(realpath $0)))
else 
    project_path=$(dirname $(dirname $(realpath $BASH_SOURCE)))
fi

sdk_path=~/tools  # change to your own sdk path
esp_idf_path=${sdk_path}/esp-idf

source ${esp_idf_path}/export.sh
export IDF_CCACHE_ENABLE=1

cd ${cur_path}