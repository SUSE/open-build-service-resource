#!/bin/sh
mkdir -p tmp
sh assets/in tmp <<EOF
{
  "source": {
    "api": "https://api.opensuse.org",
    "project": "home:mmanno",
    "package": "open-build-service-resource-test"
  },
  "version": { "ref": "c103972f7e6df0a98fca5e94e1f32520" }
}
EOF
