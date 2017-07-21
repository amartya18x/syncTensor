#include <stdio.h>
#include <stdlib.h>
#include "lua.h"
#include "lualib.h"

#include "lauxlib.h"

static int dump_ascii(lua_State *L)
{
  const char *path = luaL_checkstring(L, 1);
  int c = 0;
  char final_command[500];
  char *command = "python dump_ascii.py ";
  for(c=0; c< 21; c++)
    final_command[c] = command[c];
  for(;c<120;c++)
    {
      if(path[c-21] == 0)
	{
	  final_command[c] = 0;
	  break;
	}
      else
	final_command[c] = path[c-21];
    }
  int i;
  char *redirect = " >temp.dump";
  for(i=0;i < 11; i++)
    final_command[c+i] = redirect[i];
  system(final_command);
  return 1;
}



static const struct luaL_Reg functions [] = {
    {"dump_ascii", dump_ascii},
    {NULL, NULL}
};


int luaopen_dump_ascii(lua_State *L) {
    lua_register(L, "dump_ascii", dump_ascii);
    return 1;
}
