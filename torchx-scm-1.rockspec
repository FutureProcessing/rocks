package = "torchx"
version = "scm-1"

platforms = {
      [1] = "win32";
      [2] = "mingw32";
      [3] = "windows";
   };
   

source = {
   url = "git://github.com/nicholas-leonard/torchx",
   tag = "master"
}

description = {
   summary = "torch extensions",
   detailed = [[
   	    Experimental torch extensions
   ]],
   homepage = "https://github.com/nicholas-leonard/torchx/blob/master/README.md"
}

dependencies = {
   "torch >= 7.0",
   "paths >= 1",
   "sys >= 1.1"
}

build = {
   type = "command",
   build_command = [[
git submodule install 
git submodule update
cmake -E make_directory build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)" && $(MAKE)
   ]],
   install_command = "cd build && $(MAKE) install",
   
   platforms = {
      windows = {
      build_command  = [[
cmake -E make_directory build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)" && $(MAKE)
]]
      }
   }
   
   
}
