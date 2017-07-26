#!/bin/sh

if [ -z "$OSC_USERNAME" ]; then
  echo "This tests needs valid OSC credentials. Please export OSC_USERNAME and OSC_PASSWORD"
  exit 1
fi

mkdir -p tmp
sh assets/out tmp <<EOF
{
  "params": {
     "from": "home:mmanno/restic",
     "build": {
       "repository": "openSUSE_Leap_42.1",
       "arch": "x86_64"
     },
     "commit": {
       "message": "new release",
     }
  },
  "source": {
    "api": "https://api.opensuse.org",
    "project": "home:mmanno",
    "package": "open-build-service-resource-test",
    "username": "$OSC_USERNAME",
    "password": "$OSC_PASSWORD"
  }
}
EOF
