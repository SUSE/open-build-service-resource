#!/bin/sh

# given a repo with
# 3|mmanno|2016-06-29 22:48:49|9a7f62a15c0db3cabf1d4f2bfa65bbf1|0.1.0|tar broken again.?|
# 2|mmanno|2016-06-29 22:02:07|aaed545254abe96f500eefd5b2dd88cd|0.1.0|fix debian build|
# 1|mmanno|2016-06-29 21:45:54|ecc717c47eee96e4cba5c274f0bad495|0.1.0|rename restic repo?|

LATEST="9a7f62a15c0db3cabf1d4f2bfa65bbf1"
BEFORE="aaed545254abe96f500eefd5b2dd88cd"

echo "expects single version if given can't be found: the last one $LATEST"
bash assets/check <<EOF
{
  "source": {
    "api": "https://api.opensuse.org",
    "project": "home:mmanno",
    "package": "restic"
  },
  "version": { "ref": "MISSING" }
}
EOF

echo "expects two version: [ $BEFORE, $LATEST ]"
bash assets/check <<EOF
{
  "source": {
    "api": "https://api.opensuse.org",
    "project": "home:mmanno",
    "package": "restic"
  },
  "version": { "ref": "$BEFORE" }
}
EOF

echo "expects single version if given the current one: $LATEST"
bash assets/check <<EOF
{
  "source": {
    "api": "https://api.opensuse.org",
    "project": "home:mmanno",
    "package": "restic"
  },
  "version": { "ref": "$LATEST" }
}
EOF

echo "expects single version if not given any: latest $LATEST"
bash assets/check <<EOF
{
  "source": {
    "api": "https://api.opensuse.org",
    "project": "home:mmanno",
    "package": "restic"
  }
}
EOF
