package = "image"
version = "1.1.alpha-0"

source = {
   url = "git://github.com/diz-vara/image",
   tag = "master"
}

description = {
   summary = "An image library for Torch",
   detailed = [[
This package provides routines to load/save and manipulate images
using Torch's Tensor data structure.
   ]],
   homepage = "https://github.com/diz-vara/image",
   license = "BSD"
}

dependencies = {
   "torch >= 7.0",
   "sys >= 1.0",
   "xlua >= 1.0",
   "dok"
}

build = {
   type = "command",
   build_command = [[
cmake -E make_directory build && cd build && cmake .. -DLUALIB=$(LUALIB) -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)" -DJPEG_LIBRARY=%JPEG_LIBRARY% -DJPEG_INCLUDE_DIR=%JPEG_INCLUDE_DIR% && $(MAKE)
   ]],
   install_command = "cd build && $(MAKE) install"
}
