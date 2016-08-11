#!/bin/sh

if [ -z "$OSC_USERNAME" ]; then
  echo "This tests needs valid OSC credentials. Please export OSC_USERNAME and OSC_PASSWORD"
  exit 1
fi

mkdir -p tmp
sh assets/out tmp <<EOF
{
  "params": {
     "remove_files": ["test.tmp", "build-stamp"],
     "build": {
       "resource": "."
       "repository": "openSUSE_Leap_42.1",
       "arch": "x86_64"
     },
     "commit": {
       "message": "new release",
       "add_files": ["*.tgz"]
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
