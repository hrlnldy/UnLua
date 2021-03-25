-- Created by hrlnldy on 2021-3-25 10:35:45
local Utility  = {}
local Protobuf = require "ThirdParty/protobuf"
local PCDir = UBlueprintPathsLibrary.ProjectContentDir()
print("Project content dir:" .. PCDir)

Protobuf.register_file(PCDir.."/Script/Pbc/test.pb")
-- Encode protobuf
-- @param protoname example as 'Protos.HelloRequest'
-- @param message in lua table
function Utility.Encode(protoname, message)
    local code = Protobuf.encode(protoname, message, function (buf, len)
        local array = TArray(buf) -- Array in ue4
        array:SetData(buf, len)
        return array
    end);
    return code
end

-- Decode protobuf
-- @param protoname example as 'Protos.HelloResponse'
-- @param array in ue4
function Utility.Decode(protoname, array)
	local len = array:Length();
    local data = array:GetData();
	local decode = Protobuf.decode(protoname, data, len);
    return decode;
end

return Utility;