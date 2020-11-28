# pixel
This project is in order to illuminate a string of neopixels with a TinyFPGA board. This project allows the pixels to be illuminated with independent color from the other pixels

The board I will be using is The TinyFPGA bx board. I used this one from sparkfun(https://www.sparkfun.com/products/14829). however, any Tinyfpga with enough headers
will work.

Here is the image of the board I will be using
![alt text](https://cdn.sparkfun.com//assets/parts/1/3/0/9/8/14829-TinyFPGA_BX_Board-01.jpg)

And here is a image of the neopixel ring i used. Any set will work. circle or light strip. My strip has 24 pixels so if yours is different you will have to change
the length of the strip in the code

![alt text](https://www.distrelec.biz/Web/WebShopImages/landscape_large/5-/01/Adafruit-1586-30091145-01.jpg)

The startup guide for this board was extremely helpful. Here is a link too it.

https://tinyfpga.com/bx/guide.html

The first step is to make sure python is installed on your computer.

[Windows download](https://www.python.org/ftp/python/3.6.5/python-3.6.5-amd64-webinstall.exe)

[Mac download](https://www.python.org/ftp/python/3.6.5/python-3.6.5-macosx10.6.pkg)

Next Make sure tinyprog and apio are installed with pip
open a terminal or command prop and run

```
pip install apio==0.4.0b5 tinyprog
apio install system scons icestorm iverilog
apio drivers --serial-enable
tinyprog --update-bootloader
```

Atom is an amazing tool for this project. I would recommend you use it for you IDE
[Atom Download](https://atom.io/)

Once Atom is downloaded open it and click 
File > Settings > Install
Type in “apio-ide” in the “Search Packages” text box and click “Packages”

Install “apio-ide”. Click yes for any dependencies. Ignore any warnings about the APIO version. 

You can download the test project here from TinyFPGA 

https://github.com/tinyfpga/TinyFPGA-BX/archive/master.zip 
this can be used by copying the apio_template into your working folder in atom if you dont have one yet create one.

This test project is where I got my pins.pcf file that i made some minor changes too.

once your board is plugged in select the upload button and atom will automatically build and upload your design. 

If everything works, we can begin wiring the FPGA to the neo pixel.

```
connect pin 5 on the FPGA to the Data in pin on the neo pixel
#Any pin will work but you will have to edit the top.v file
Connect any one of the gnd pins on the fpga to the gnd on the neopixel
connect the 3.3v pin on the fpga to the 3.3v pin on the neopixel
```

now you’re ready to run. the colors should begin showing once the build is completed and uploaded.

Troubleshooting

If nothing happens when you build and load you may have to reset your tinyfpga you can do this by hitting the reset button at the base of the board
(hint it is the only button)

You will know the board is ready to accept the new build once the onboard led blinks rapidly. This means the bootloader has been activated. 

For questions about how this all works check out my presentation here
[My awesome presentation](https://drive.google.com/file/d/1c3NWIdD6CYc-RdFBa_h5MdjtiGycR3Mc/view?usp=sharing)
