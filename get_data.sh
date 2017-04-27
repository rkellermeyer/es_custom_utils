#!/bin/bash

indices=(54761-5eb4f9ffb3e7aa537dd412f279aeb74c 50461-92a92fe2da7e8cfd35cb0afcbfc992af hydrants-6ad7a7a44774f9dbc6d3d4dbfb33ba72 54594-24f9b2f14f3af2261c794e11e2fd18ba 54594-0009c0b81a282e8ffc23c4b08dbe525d 50461-5bc0c6d9eb47724e7582ab5d94313a4f)

for v in "${indices[@]}"
do
  elasticdump \
    --input=https://search-tg-test-es5-p4t7nxieufp4p6ynd445ah545i.us-east-1.es.amazonaws.com/$v \
    --output=http://localhost:9200/$v \
    --type=analyzer

  elasticdump \
    --input=https://search-tg-test-es5-p4t7nxieufp4p6ynd445ah545i.us-east-1.es.amazonaws.com/$v \
    --output=http://localhost:9200/$v \
    --type=mapping

  elasticdump \
    --input=https://search-tg-test-es5-p4t7nxieufp4p6ynd445ah545i.us-east-1.es.amazonaws.com/$v \
    --output=http://localhost:9200/$v \
    --awsAccessKeyId=AKIAIKPSB65GY2ETVGFQ \
    --awsSecretAccessKey=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 \
    --type=data
done
