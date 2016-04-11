#!/bin/bash

# export AWS_DEFAULT_PROFILE=euroclojure (or whatever is correct for you)

jekyll build
aws s3 sync _site/ s3://staging.euroclojure.org --delete

# redirects
touch _site/empty
for page in index sponsorship policies speakers speakers-2015 opportunity training cfp
do
  aws s3 cp _site/empty s3://staging.euroclojure.org/${page} --website-redirect /${page}.html
done
