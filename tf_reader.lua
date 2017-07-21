local tensor_reader = require 'reader_class'
local function tensor_reader:read_tf_tensors(fname)
   local temp_dump = fname.."_temp.dump"
   os.execute("python dump_ascii.py "..fname.." > "..temp_dump)
   local ascii_reader = ascii_reader(temp_dump)
   os.execute("rm "..temp_dump)
   ascii_reader:read()
   local tensors = ascii_reader:get_tensors()
   return tensors
end
