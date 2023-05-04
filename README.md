# .dotfiles
System font:
Liberation Mono

Terminal font
Liberation Mono Bold

install requirements.txt:
xargs sudo apt-get install -y < requirement.txt


Establecer configuracion de resolucion:

* cvt 1368 768 60 (resolucion y tasa de refresco custom)

* te sale algo como esto:
  * 1768x768 59.89 Hz (CVT) hsync: 47.79 kHz; pclk: 110.50 MHz
Modeline "1768x768_60.00"  110.50  1768 1864 2040 2312  768 771 781 798 -hsync +vsync

* tirar en la terminal xrandr. Te sale algo como:
  * Screen 0: minimum 8 x 8, current 1368 x 768, maximum 16384 x 16384
DVI-I-0 connected primary 1368x768+0+0 (normal left inverted right x axis y axis) 0mm x 0mm
   1024x768      60.00 +

* Crear el archivo xorg.conf:
  * sudo touch /etc/X11/xorg.conf

* Editarlo y agregar:

Section "Monitor"
	Indetifier "VGA-1"
	Modeline "1768x768_60.00"  110.50  1768 1864 2040 2312  768 771 781 798 -hsync +vsync
- hsync +vsync
	Option   "PreferredMode" "1368x768_60.00
EndSection

* Remplazar las secciones segun correponda con los que nos tiró cvt y xrandr:

Section "Monitor"
	Indetifier "VGA-1"
	Modeline "1768x768_60.00"  110.50  1768 1864 2040 2312  768 771 781 798 -hsync +vsync
- hsync +vsync
	Option   "PreferredMode" "1368x768_60.00
EndSection
