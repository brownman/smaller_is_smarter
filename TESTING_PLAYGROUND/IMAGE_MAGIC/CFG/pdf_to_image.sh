for file in *.pdf; do convert -verbose -colorspace RGB -resize 800 -interlace none -density 300 -quality 80 "$file" "${file%%pdf}"jpg; done

