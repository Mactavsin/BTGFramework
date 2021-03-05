--//Module Essentials
local ConvertModule = {}
local ConvertModuleEssentialsTable = require(5991776622)

--//Roblox Services
local HTTPService = game:GetService("HttpService")

--//Variables
local DatatypeTable = ConvertModuleEssentialsTable.DatatypeTable
local ClassTable = ConvertModuleEssentialsTable.ClassTable
local ClassTableIgnore = ConvertModuleEssentialsTable.ClassTableIgnore

--//Private Functions
function _FromInstanceToTable(Object, Class, Result, IsJSONCompatible)
    if IsJSONCompatible == true then 
        for Key, Value in pairs(ClassTable[Class].Properties) do 
            if Value.SecurityLevel == "None" and Value.IsScriptAccessable == true then 
                local PropertyType = type(Object[Key])
                if PropertyType == "userdata" then 
                    Result[Key] = ConvertModule.FromDatatypeToTable(Object[Key]) or ConvertModule.FromInstanceToTable(Object[Key])
                elseif PropertyType ~= "table" and PropertyType ~= "function" and PropertyType ~= "thread" then
                    Result[Key] = Object[Key]
                end
            end
        end
    else
        for Key, Value in pairs(ClassTable[Class].Properties) do 
            if Value.SecurityLevel == "None" and Value.IsScriptAccessable == true then 
                Result[Key] = Object[Key]
            end
        end    
    end
    if ClassTable[Class].SuperClass ~= "<<<ROOT>>>" then 
        return _FromInstanceToTable(Object, ClassTable[Class].SuperClass, Result, IsJSONCompatible)
    else
        return Result
    end
end

function _FromTableToInstance(Table, Class, Object)
    for Key, Value in pairs(ClassTable[Class].Properties) do 
        if Value.SecurityLevel == "None" and Value.IsReadOnly == false and Value.IsScriptAccessable == true then 
            Object[Key] = ConvertModule.FromTableToDatatype(Table[Key]) or Table[Key] or Object[Key]
        end
    end
    if ClassTable[Class].SuperClass ~= "<<<ROOT>>>" then 
        return _FromTableToInstance(Table, ClassTable[Class].SuperClass, Object)
    else
        return Object
    end
end

function _FromTableToJSONString(Table, Result, IgnoreInstances, BlacklistTable)
    for Key, Value in pairs(Table) do
        local ValueType = type(Value)
        if ValueType == "thread" or ValueType == "function" then
            continue
        elseif ValueType == "table" and table.find(BlacklistTable, Value) == nil then
            table.insert(BlacklistTable, #BlacklistTable + 1, Value)
            Result[Key] = _FromTableToJSONString(Value, {}, BlacklistTable)
        elseif ValueType == "userdata" and table.find(BlacklistTable, Value) == nil then
            table.insert(BlacklistTable, #BlacklistTable + 1, Value)
            Result[Key] = ConvertModule.FromDatatypeToTable(Value) or (IgnoreInstances == false and ConvertModule.FromInstanceToTable(Value, true)) or nil
        else
            Result[Key] = Value
        end
    end
    return Result
end

function _FromJSONStringToTable(Table)
    for Key, Value in pairs(Table) do
        if type(Value) == "table" then 
            Table[Key] = ConvertModule.FromTableToDatatype(Value) or ConvertModule.FromTableToInstance(Value) or _FromJSONStringToTable(Value)
        end
    end
    return Table
end

--//Public Functions
function ConvertModule.ToString(Input)
    return tostring(Input)
end

function ConvertModule.ToNumber(Input, Base)
    Base = (type(Base) == "number" and Base) or 10
    local InputType = typeof(Input)
    if InputType == "boolean" then
        return tonumber((Input and 1 or 0), Base)
    elseif InputType == "table" then
        return tonumber(#Input, Base)
    elseif InputType == "BrickColor" then
        return tonumber(Input.Number, Base)
    elseif InputType == "DateTime" then
        return tonumber(Input.UnixTimestamp, Base)
    elseif InputType == "EnumItem" then
        return tonumber(Input.Value, Base)
    elseif InputType == "Instance" and Input:IsA("ValueBase") == true and Input:IsA("ObjectValue") == false then
        return ConvertModule.ToNumber(Input.Value, Base)
    elseif InputType == "Vector2" or InputType == "Vector3" then
        return tonumber(Input.Magnitude, Base)
    else
        return tonumber(Input, Base)
    end
end

function ConvertModule.ToBoolean(Input)
    local InputType = type(Input)
    if InputType == "string" then
        Input = string.match(string.lower(Input), "^%s*(%w+)%s*$")
        if Input == "f" or Input == "false" or tonumber(Input) == 0 then
            return false
        else
            return true
        end
    elseif InputType == "number" then
        return Input ~= 0
    elseif InputType == "boolean" then
        return Input
    elseif InputType == "nil" then
        return false
    else
        return true
    end
end

function ConvertModule.FromTableToJSONString(Input, IgnoreInstances)
    IgnoreInstances = (type(IgnoreInstances) == "boolean" and IgnoreInstances) or true
    if type(Input) == "table" then 
        local BlacklistTable = {}
        return HTTPService:JSONEncode(_FromTableToJSONString(Input, {}, IgnoreInstances, BlacklistTable))
    else
        return nil
    end
end

function ConvertModule.FromJSONStringToTable(Input)
    if type(Input) == "string" then 
        return _FromJSONStringToTable(HTTPService:JSONDecode(Input))
    else
        return nil
    end
end

function ConvertModule.FromInstanceToTable(Object, IsJSONCompatible)
    IsJSONCompatible = (type(IsJSONCompatible) == "boolean" and IsJSONCompatible) or false
    if typeof(Object) == "Instance" and ClassTable[Object.ClassName] ~= nil and ClassTable[Object.ClassName].IsCreatable == true and table.find(ClassTableIgnore, Object.ClassName) == nil then 
        return _FromInstanceToTable(Object, Object.ClassName, {ClassName = Object.ClassName}, IsJSONCompatible)
    else
        return nil
    end
end

function ConvertModule.FromTableToInstance(Table)
    if type(Table) == "table" and ClassTable[Table.ClassName] ~= nil and ClassTable[Table.ClassName].IsCreatable == true and table.find(ClassTableIgnore, Table.ClassName) == nil then 
        return _FromTableToInstance(Table, Table.ClassName, Instance.new(Table.ClassName))
    else
        return nil    
    end
end

function ConvertModule.FromDatatypeToTable(UserData)
    return (DatatypeTable[typeof(UserData)] ~= nil and DatatypeTable[typeof(UserData)].ToTable(UserData)) or nil
end

function ConvertModule.FromTableToDatatype(Table)
    if type(Table) == "table" then 
        return (DatatypeTable[Table.Datatype] ~= nil and DatatypeTable[Table.Datatype].FromTable(Table)) or nil
    else
        return nil
    end
end

return ConvertModule