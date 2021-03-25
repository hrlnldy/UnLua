echo off
pushd "%~dp0"

set bin=%~dp0../Plugins/UnLua/Source/UnLua/ThirdParty/protobuf/bin
set protos=%cd%
set outdir=%~dp0../Content\Script\Pbc

for /R %%s in (*.proto) do (
for %%i in ("%%s") do (
echo find %%~ni
"%bin%/protoc.exe" --proto_path="%protos%" "%%s" --descriptor_set_out="%outdir%/%%~ni.pb"
)
)
popd
