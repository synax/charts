#!/bin/sh
set -ex

echo "Packaging all charts"

for D in stable/*; do
    if [ -d "${D}" ]; then
        helm package "${D}" -d ${ARTIFACTS_URI}
    fi
done
