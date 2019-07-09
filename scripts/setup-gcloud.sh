#!/bin/sh
set -ex

# gcloud version || true
# if [ ! -d "$HOME/google-cloud-sdk/bin" ]; then rm -rf $HOME/google-cloud-sdk;
#     export CLOUDSDK_CORE_DISABLE_PROMPTS=1
#     curl https://sdk.cloud.google.com | bash
# fi
# #source $HOME/google-cloud-sdk/path.bash.inc
# gcloud version

openssl aes-256-cbc -K $encrypted_20037bf0d9f5_key -iv $encrypted_20037bf0d9f5_iv -in service.json.enc -out service.json -d

gcloud auth activate-service-account --key-file=service.json
