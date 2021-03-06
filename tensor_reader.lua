require 'class'
require 'pl'
local _ = require 'moses'
local sc = require 'synctensor._env'
local tensor_reader = torch.class("tensor_reader", sc)

function tensor_reader:__init(fName)
   self.fname = fName
   self.read_flag = false
end

function tensor_reader:read()
   io.input(self.dumpname)
   self.text = io.read("*all")
   self.tbl = _.map(self.text:split(" "),
		    function (i, v)
		       return tonumber(v)
   end)
   self.read_flag = true
end

function tensor_reader:get_tensors()
   assert(self.read_flag)
   self.num_tensor = self.tbl[1]
   local cur_idx = 2
   self.tensors = {}
   for i = 1, self.num_tensor do
      local n_dim = self.tbl[cur_idx]
      cur_idx = cur_idx + 1
      local shape = tablex.sub(self.tbl, cur_idx, cur_idx + n_dim-1)
      cur_idx = cur_idx + n_dim
      local n_elem = _.reduce(shape,
			      function(memo,v)
				 return memo*v 
      end)
      local values = tablex.sub(self.tbl, cur_idx, cur_idx + n_elem - 1)
      cur_idx = cur_idx + n_elem
      table.insert(self.tensors,
		   torch.DoubleTensor(values):view(table.unpack(shape)))
   end
end
   
function tensor_reader:clear()
   self.tbl = nil
   self.read_flag = false
   collectgarbage()
end

function tensor_reader:read_tf_tensors()
   local fname = self.fname
   local temp_dump = "temp.dump"
   --os.execute("python dump_ascii.py "..fname.." > "..temp_dump)
   dump_ascii(fname)
   self.dumpname = temp_dump
   self:read()
   os.execute("rm "..temp_dump)
   self:get_tensors()
   return self.tensors
end

