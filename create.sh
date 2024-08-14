#!/usr/bin/env bash

mkdir page

cat header.html cv.en.md > page/cv.en.html
cat header.html cv.de.md > page/cv.de.html

cp page/cv.en.html page/index.html
