# Fonts

`page/style.css` includes CSS for Molengo, but it's easily swappable.

## Molengo

[Check Molengo here](https://gwfh.mranftl.com/fonts/molengo?subsets=latin), download and unzip to page/fonts/.

## FontAwesome

[Download here](https://fontawesome.com/download) and unzip to somewhere.

Copy the needed files:
```sh
pagedir=~/somewhere/cv/page
mkdir -p $pagedir/js

# go to the folder with the fontaweseome folder inside
# change to fontawesome folder
cd fontawesome-free-*-web

# copy files
for f in brands solid; do
  cp "js/$f.min.js" "$pagedir/js/$f.js"
done
```

# remarks and build

There are some

    <div class="pagebreak"></div>

exactly where they are need to be to have a good looking print style. It's not relevant for browsers, only for printing. I couldn't figure out a way to get this consistent for different browsers.

I'm also misusing some elements to get a better docx version:

- blockquote (\>) is used for the date range bevore the project title.

In `header.html` the title is hard coded.

Create the final html with this (this is the same as `create.sh`):

```sh
cat header.html cv.en.md > page/cv.en.html
cat header.html cv.de.md > page/cv.de.html
cp page/cv.en.html page/index.html
```

# Word docx

To create docx format do the following:

```
pandoc --reference-doc=docx-reference.docx -o cv.en.docx cv.en.md
pandoc --reference-doc=docx-reference.docx -o cv.de.docx cv.de.md
```

Modify the templates in the files as needed and save as docx-reference.docx. Don't forget header/footer and select every single used style to use the same font.

After creating the file, the following things still needs fixing:

1. Profile picture: select picture, "Picture Format" -> "Position" -> "With text wrapping" top/right
2. Profile picture: Height and width = 1"
3. Profile picture: remove alt text of picture
4. Insert page breaks as needed
