package = "syncTensor"
version = "1.0-2"
source = {
   url = "git://github.com/amartya18x/syncTensor", -- We don't have one yet
   tag = "master"
}

description = {
   summary = "A package to transfer tensors from other libraries to torch7.",
   detailed = [[
      This will help return a table of torch tensors from
      some other formats like tensorflow etc.
   ]],
   maintainer = "Amartya Sanyal <amartya18x@gmail.com>", 
   --homepage = "http://...", -- We don't have one yet
   license = "MIT/X11" -- or whatever you like
}
dependencies = {
   "lua >= 5.1",
   "torch >= 7.0"
   --"penlight >= 1.0"
   -- If you depend on other rocks, add them here
}
external_dependencies = {
   LIBPYTHON = {
      header = "python2.7/Python.h"
   }
}
build = {
      type = "builtin",
      modules = {
      ["synctensor.init"] = "init.lua",
      ["synctensor.tensor_reader"] = "tensor_reader.lua",
      ["synctensor._env"] = "_env.lua",
      ["dump_ascii"] = "dump_ascii.c"
}     
}