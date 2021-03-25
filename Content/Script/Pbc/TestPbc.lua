require "UnLua"

local TestPbc = Class()

local Utility = require "Pbc/Utility"
print("Enter Testpbc")

local encode = Utility.Encode("Protos.HelloRequest",{name = "Tespbc..."} );
print(encode)
local res = Utility.Decode("Protos.HelloRequest", encode);
print(res.name)

return TestPbc