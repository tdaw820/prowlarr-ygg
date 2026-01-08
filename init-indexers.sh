#!/bin/bash

YGG="${YGG:-download}"
YGEGE_URL="${YGEGE_URL}"
if [ -z "$YGEGE_URL" ]; then
    echo "YGEGE_URL is not set"
    exit 1
fi

mkdir -p /config/Definitions/Custom/
cp /app/indexers/*.yml /config/Definitions/Custom/

chown -R abc:abc /config/Definitions/Custom
chmod -R 644 /config/Definitions/Custom/*.yml

if [ "$YGG" = "magnet" ]; then
    rm -f /config/Definitions/Custom/ygg-api-download.yml
else
    rm -f /config/Definitions/Custom/ygg-api-magnet.yml
fi

awk -v "var=$YGEGE_URL" '/links:/ && !x {print; print "  - " var; x=1; next} 1' ygege.yml > tmp && mv tmp ygege.yml


# Execute the original entrypoint with all arguments
exec /init-linuxserver "$@"
