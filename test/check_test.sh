#!/bin/sh

# given a repo with
# 3|mmanno|2016-06-29 22:48:49|9a7f62a15c0db3cabf1d4f2bfa65bbf1|0.1.0|tar broken again.?|
# 2|mmanno|2016-06-29 22:02:07|aaed545254abe96f500eefd5b2dd88cd|0.1.0|fix debian build|
# 1|mmanno|2016-06-29 21:45:54|ecc717c47eee96e4cba5c274f0bad495|0.1.0|rename restic repo?|

echo "expects single version if given can't be found: the last one 9a7f62a15c0db3cabf1d4f2bfa65bbf1"
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

echo "expects two version: [ aaed545254abe96f500eefd5b2dd88cd, 9a7f62a15c0db3cabf1d4f2bfa65bbf1 ]"
bash assets/check <<EOF
{
  "source": {
    "api": "https://api.opensuse.org",
    "project": "home:mmanno",
    "package": "restic"
  },
  "version": { "ref": "aaed545254abe96f500eefd5b2dd88cd" }
}
EOF

echo "expects single version if given the current one: 9a7f62a15c0db3cabf1d4f2bfa65bbf1"
bash assets/check <<EOF
{
  "source": {
    "api": "https://api.opensuse.org",
    "project": "home:mmanno",
    "package": "restic"
  },
  "version": { "ref": "97f62a15c0db3cabf1d4f2bfa65bbf1" }
}
EOF

echo "expects single version if not given any: latest 9a7f62a15c0db3cabf1d4f2bfa65bbf1"
bash assets/check <<EOF
{
  "source": {
    "api": "https://api.opensuse.org",
    "project": "home:mmanno",
    "package": "restic"
  }
}
EOF
