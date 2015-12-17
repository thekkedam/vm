#!/bin/bash

rm -rf _site
rm -rf .sass-cache

#bundle exec jekyll build
#bundle exec htmlproof ./_site --disable-external

#rm -rf tmp

bundle exec jekyll serve --trace
