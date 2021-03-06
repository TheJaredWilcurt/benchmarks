set terminal pngcairo size 1280,900
set output 'compression-still-CATEGORY.png'


y1 = LOWER; y2 = UPPER;
x1 = 0
x2 = NUMBER


set ytics 0.1
set grid ytics back
set grid xtics back
set key bottom right


set xlabel "images, sorted for each algorithm from best to worst relative compression"
set ylabel "relative size, compared to PNG (ImageMagick 6.8.9-9 convert -quality 95)"
set title  "Lossless image compression comparison, corpus: CATEGORY (NUMBER images)"


plot [x1:x2][y1:y2]\
'<sort -n results/*still.JP2.CATEGORY' using ($0):($1) with lines lw 3  lc rgb "#000088"  title "JPEG 2000",\
'<sort -n results/*still.JXR.CATEGORY' using ($0):($1) with lines lw 3  lc rgb "#888800"  title "JXR (no alpha!)",\
'<sort -n results/*still.JPEG.CATEGORY' using ($0):($1) with lines lw 3  lc rgb "#FFFF00" title "JPEG (lossy! no alpha!)",\
'<sort -n results/*still.PNG-Adam7.CATEGORY' using ($0):($1) with lines lw 2 lc rgb "#00FF00" dt 3 title "PNG, Adam7",\
'<sort -n results/*still.PNG.CATEGORY' using ($0):($1) with lines lw 3  lc rgb "#008800" dt 3 title "PNG (reference)",\
'<sort -n results/*still.optiPNG-Adam7.CATEGORY' using ($0):($1) with lines lw 2 lc rgb "#00FF00" dt 2 title "PNG, Adam7, optipng",\
'<sort -n results/*still.optiPNG.CATEGORY' using ($0):($1) with lines lw 2 lc rgb "#008800" dt 2 title "PNG, optipng",\
'<sort -n results/*still.zopfliPNG.CATEGORY' using ($0):($1) with lines lw 3 lc rgb "#008800" dt 1 title "PNG, zopflipng",\
'<sort -n results/*still.BPG.CATEGORY' using ($0):($1) with lines lw 2  lc rgb "#AA00AA" lt 1 title "BPG",\
'<sort -n results/*still.WebP.CATEGORY' using ($0):($1) with lines lw 3 lc rgb "#00AAAA" lt 1 title "WebP (stable)",\
'<sort -n results/*still.WebP2.CATEGORY' using ($0):($1) with lines lw 2 lc rgb "#00AAFF" dt 2 title "WebP (dev)",\
'<sort -n results/*still.FLIF.CATEGORY' using ($0):($1) with lines lw 3 lc rgb "#880000" lt 1 title "FLIF",\
'<sort -n results/*still.FLIF-n.CATEGORY' using ($0):($1) with lines lw 3 lc rgb "#DD2200" lt 1 title "FLIF -n"
