#!/bin/bash

YGG="${YGG:-download}"

mkdir -p /config/Definitions/Custom/
cp /app/indexers/*.yml /config/Definitions/Custom/

chown -R abc:abc /config/Definitions/Custom
chmod -R 644 /config/Definitions/Custom/*.yml

if [ "$YGG" = "magnet" ]; then
    rm -f /config/Definitions/Custom/ygg-api-download.yml
else
    rm -f /config/Definitions/Custom/ygg-api-magnet.yml
fi

# Execute the original entrypoint with all arguments
exec /init-linuxserver "$@"
