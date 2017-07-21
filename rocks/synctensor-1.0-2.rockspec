package = "syncTensor"
version = "1.0-2"
source = {
   url = "git:github.com/amartya18x/SyncTensor" -- We don't have one yet
}

description = {
   summary = "A package to transfer tensors from other libraries to torch7.",
   detailed = [[
      This will help return a table of torch tensors from
      some other formats like tensorflow etc.
   ]],
   maintainer = "Amartya Sanyal <amartya18x@gmail.com>" 
   homepage = "http://...", -- We don't have one yet
   license = "MIT/X11" -- or whatever you like
}
dependencies = {
   "lua >= 5.1",
   "torch >= 7.0"
   --"penlight >= 1.0"
   -- If you depend on other rocks, add them here
}
build = {
      type = "builtin",
      modules = {
      tensor_reader = "tensor_reader.lua",
      tf = "tf_reader.lua"	
      }     
}