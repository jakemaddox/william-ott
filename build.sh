#!/bin/bash
build_site() {
  echo '<head>'
  echo -e '\t<meta name="viewport" content="width=device-width, initial-scale=1.0">'
  echo -e '\t<link rel="stylesheet" href="../fonts/cantarell.css">'
  echo -e '\t<link rel="stylesheet" href="../style.css">'
}

mkdir -p _site
cp style.css _site
cp -r fonts _site

for i in sources/*; do
  name=$(echo $i | sed 's/sources\///' | sed 's/.html//')
  mkdir -p _site/$name
  cp sources/$name.html _site/$name/index.html
done
