#https://developer.gnome.org/pango/stable/PangoMarkupFormat.html

fortune=`fortune`; 
#printf %s "<span foreground='blue' size='x-large'>$fortune</span> <i>:)</i>!" | 

echo "$fortune" |  xcowsay  --image /tmp/monkey.jpeg --cow-size=rms $* 


