--//Module Essentials
local BTGFrameworkModule = {}

--//Public Services
local BTGServices = {}
BTGServices.LibrariesService = require(script.PublicServices.LibrariesService)

--//Public Functions
function BTGFrameworkModule.GetBTGService(RequiredServiceName)
	assert(typeof(RequiredServiceName) == "string", string.format("BTGFramework.GetBTGService function error: Argument 1 expected string, got %s.", typeof(RequiredServiceName)))
	assert(BTGServices[RequiredServiceName] ~= nil, string.format("BTGFramework.GetBTGService function error: %s is not a valid service name.", RequiredServiceName))
	return BTGServices[RequiredServiceName]
end

--//Metatables
local BTGFrameworkModuleMetatable = {}
BTGFrameworkModuleMetatable.__index = function(Table, Index)
	assert(BTGServices[Index] ~= nil, string.format("BTGFramework.GetBTGService function error: %s is not a valid service name.", tostring(Index)))
	return BTGServices[Index]
end

BTGFrameworkModuleMetatable.__metatable = "null"

setmetatable(BTGFrameworkModule, BTGFrameworkModuleMetatable)

return BTGFrameworkModule