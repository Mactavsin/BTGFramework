--//Module Essentials
local LibrariesServiceModule = {}

--//Libraries
local Libraries = {}
Libraries.Convert = require(script.Convert)
Libraries.Object = require(script.Object)

--//Public Functions
function LibrariesServiceModule.GetLibrary(LibraryName) 
    assert(typeof(LibraryName) == "string", string.format("BTGFramework.LibrariesService.GetLibrary function error: Argument 1 expected string; got %s.", typeof(LibraryName)))
    assert(Libraries[LibraryName] ~= nil, string.format("BTGFramework.LibrariesService.GetLibrary function error: %s is not a valid library name.", LibraryName))
    return Libraries[LibraryName]
end

return LibrariesServiceModule
