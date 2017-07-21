# SyncTensor
This does work
```
wget https://raw.githubusercontent.com/LantaoYu/SeqGAN/master/save/target_params.pkl

th

th> sc = require 'synctensor'
                                                                      [0.0081s]
th> tr = sc.tensor_reader('./target_params.pkl')
                                                                      [0.0000s]
th> tr:read_tf_tensors()
Reading tf params....
reading from text dump...
Parsing to get Tensors
{5000,32}
{32,32}
{32,32}
{32}
{32,32}
{32,32}
{32}
{32,32}
{32,32}
{32}
{32,32}
{32,32}
{32}
{32,5000}
{5000}
```

However note that it has to be in the same directory as the python file in it. If somebody can please make it independant of the python file by either putting the source in the c file or making the `so` file inclusive of the python file, somehow.


