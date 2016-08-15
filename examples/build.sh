#!/bin/bash
set -e
sed -i "s|<username>|$OSC_USERNAME|g" /root/.oscrc
sed -i "s|<password>|$OSC_PASSWORD|g" /root/.oscrc

pushd osc-resource/home:mmanno/restic 1> /dev/null

  if [ -f test ]; then
    osc rm test
    osc commit -m 'remove test'
  fi

  touch test
  ls -la

  osc log --xml | tee

popd 1> /dev/null

cp -a osc-resource/home:mmanno/restic/. osc-updated/
