/**
 * Created by Hrlnldy on 2021-1-6 20:49:32
 *
 * bindinglua.h
 */
#pragma once

#ifndef PROTOBUF_C_BINDING_H
#define PROTOBUF_C_BINDING_H

#ifdef __cplusplus
extern "C" {
#endif

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
#ifdef __cplusplus
}
#endif 

#define LUA_PBCLIBNAME	"protobufc"		// Pbc库名字
extern int (luaopen_protobufc)(lua_State* L);	// 注册函数声明

/**
 * 库的注册表
 */
static const luaL_Reg pbc_loadedlibs[] = {
  {LUA_PBCLIBNAME, luaopen_protobufc},
  {NULL, NULL}
};


/**
 * Lua中调用的解析库
 */
int luaopen_protobufc(lua_State* L);

/**
 * 在lua中实现自定义的库
 */
void luaL_openlibs_pbc(lua_State* L);

#endif //PROTOBUF_C_BINDING_H