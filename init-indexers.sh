#!/bin/bash

mkdir -p /config/Definitions/Custom/
cp /app/indexers/*.yml /config/Definitions/Custom/

chown -R abc:abc /config/Definitions/Custom
chmod -R 644 /config/Definitions/Custom/*.yml

# Execute the original entrypoint with all arguments
exec /init-linuxserver "$@"
