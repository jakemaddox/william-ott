#!/bin/bash
build_site() {
  echo '<!DOCTYPE html>'
  echo '<head>'
  head -n 1 sources/$name.html
  echo -e '\t<meta name="viewport" content="width=device-width, initial-scale=1.0">'
  echo -e '\t<link rel="stylesheet" href="../fonts/cantarell.css">'
  echo -e '\t<link rel="stylesheet" href="../style.css">'
  echo '</head>'
  echo '<body>'
  echo -e '\t<main>'
  sed 's/^/\t\t/' sources/$name.html >/tmp/index.html
  tail -n+3 /tmp/index.html
  echo -e '\t</main>'
  echo '</body>'
}

mkdir -p _site
cp style.css _site
cp -r fonts _site

for i in sources/*; do
  name=$(echo $i | sed 's/sources\///' | sed 's/.html//')
  mkdir -p _site/$name
  build_site >_site/$name/index.html
done
