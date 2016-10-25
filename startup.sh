#!/bin/bash

elasticsearch="${ELASTICSEARCH:-elasticsearch}"

mongo-connector --auto-commit-interval=0 \
		--continue-on-error \
		--stdout \
  --main $MONGO \
  --target-url ${elasticsearch}:9200 \
  --doc-manager elastic2_doc_manager \
  --admin-username $MONGO_USERNAME \
  --password $MONGO_PASSWORD \
  -n sails.productparent \
  -v

