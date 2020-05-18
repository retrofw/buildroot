# RetroFW buildroot

This buildroot can be used to build RetroFW cross-compilation toolchain and the OS image.

## Building

First, clone or download the repo and run:

~~~bash
make RetroFW_defconfig BR2_EXTERNAL=board/retrofw
~~~

You only need to run this once.

Then, to build the toolchain, run:

~~~bash
make toolchain
~~~

You can also build particular libraries and packages this way, for example to build SDL and SDL_Image:

~~~bash
make sdl sdl_image
~~~

To build the OS image, run:

~~~bash
make
~~~

NOTE: Set `BR2_JLEVEL=0` to compile in parallel.
