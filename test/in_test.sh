#!/bin/sh
sh assets/in tmp <<EOF
{
  "source": {
    "api": "https://api.opensuse.org",
    "project": "home:mmanno",
    "package": "restic"
  },
  "version": { "ref": "aaed545254abe96f500eefd5b2dd88cd" }
}
EOF
