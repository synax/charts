#!/bin/sh
set -ex

echo "Updating Bucket with new charts"
gsutil -m rsync -a public-read ${ARTIFACTS_URI}/ "gs://${BUCKET_URI}"
gsutil -m rsync -a public-read "gs://${BUCKET_URI}" ${ARTIFACTS_URI}

echo "Updating repo index with new charts"
helm repo index ${ARTIFACTS_URI} --url https://storage.googleapis.com/${BUCKET_URI}
# move new index to public folder for deployment
mv ${ARTIFACTS_URI}/index.yaml ${PUBLIC_URI}/index.yaml