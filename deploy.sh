#!/usr/bin/env sh

set -e

npm run build

git init

git add -A

git commit -m 'new deployment'

git push -f git@github.com:BarrySang/vue-js-dictionary.git master:gh-pages

cd -