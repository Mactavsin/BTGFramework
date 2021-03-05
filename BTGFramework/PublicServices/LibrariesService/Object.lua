--//Module Essentials
local ObjectModule = {}

--//Variables
local BlankObject = Instance.new("Folder")

--//Private Functions
function _GetAncestors(Object, Result, IsDescending)
    if Object ~= game and Object ~= nil then 
        if IsDescending == true then 
            table.insert(Result, 1, Object.Parent)
            return _GetAncestors(Object.Parent, Result, IsDescending)
        else
            table.insert(Result, #Result + 1, Object.Parent)
            return _GetAncestors(Object.Parent, Result, IsDescending)
        end
    end
    return Result
end

function _GetAncestorsOfName(Object, Name, Result, IsDescending)
    if Object ~= game and Object ~= nil and Object.Name == Name then 
        if IsDescending == true then 
            table.insert(Result, 1, Object.Parent)
            return _GetAncestorsOfName(Object.Parent, Name, Result, IsDescending)
        else
            table.insert(Result, #Result + 1, Object.Parent)
            return _GetAncestorsOfName(Object.Parent, Name, Result, IsDescending)
        end
    end
    return Result
end

function _GetAncestorsOfClass(Object, ClassName, Result, IsDescending)
    if Object ~= game and Object ~= nil and Object.ClassName == ClassName then 
        if IsDescending == true then 
            table.insert(Result, 1, Object.Parent)
            return _GetAncestorsOfClass(Object.Parent, ClassName, Result, IsDescending)
        else
            table.insert(Result, #Result + 1, Object.Parent)
            return _GetAncestorsOfClass(Object.Parent, ClassName,  Result, IsDescending)
        end
    end
    return Result
end

function _GetAncestorsWhichAreA(Object, ClassName, Result, IsDescending)
    if Object ~= game and Object ~= nil and Object:IsA(ClassName) == true then 
        if IsDescending == true then 
            table.insert(Result, 1, Object.Parent)
            return _GetAncestorsWhichAreA(Object.Parent, ClassName, Result, IsDescending)
        else
            table.insert(Result, #Result + 1, Object.Parent)
            return _GetAncestorsWhichAreA(Object.Parent, ClassName, Result, IsDescending)
        end
    end
    return Result
end

--//Public Functions
ObjectModule.ClearAllChildren = BlankObject.ClearAllChildren
ObjectModule.Clone = BlankObject.Clone
ObjectModule.Destroy = BlankObject.Destroy
ObjectModule.FindFirstAncestor = BlankObject.FindFirstAncestor
ObjectModule.FindFirstAncestorOfClass = BlankObject.FindFirstAncestorOfClass
ObjectModule.FindFirstAncestorWhichIsA = BlankObject.FindFirstAncestorWhichIsA
ObjectModule.FindFirstChild = BlankObject.FindFirstChild
ObjectModule.FindFirstChildWhichIsA = BlankObject.FindFirstChildWhichIsA
ObjectModule.GetActor = BlankObject.GetActor
ObjectModule.GetAttribute = BlankObject.GetAttribute
ObjectModule.GetAttributeChangedSignal = BlankObject.GetAttributeChangedSignal
ObjectModule.GetAttributes = BlankObject.GetAttributes
ObjectModule.GetChildren = BlankObject.GetChildren
ObjectModule.GetDebugId = BlankObject.GetDebugId
ObjectModule.GetDescendants = BlankObject.GetDescendants
ObjectModule.GetFullName = BlankObject.GetFullName
ObjectModule.GetPropertyChangedSignal = BlankObject.GetPropertyChangedSignal
ObjectModule.IsA = BlankObject.IsA
ObjectModule.IsAncestorOf = BlankObject.IsAncestorOf
ObjectModule.IsDescendantOf = BlankObject.IsDescendantOf
ObjectModule.SetAttribute = BlankObject.SetAttribute
ObjectModule.WaitForChild = BlankObject.WaitForChild

ObjectModule.ClearChildrenOfName = function(Object, Name, IsRecursive)
    IsRecursive = (type(IsRecursive) == "boolean" and IsRecursive) or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.ClearChildrenOfName function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(Name) == "string", string.format("BTGFramework.LibrariesService.Object.ClearChildrenOfName function error: Argument 2 expected string; got %s.", type(Name)))
    if IsRecursive == true then 
        for Index, Value in ipairs(Object:GetDescendants()) do 
            if Value.Name == Name then 
                Value:Destroy()
            end
        end
    else
        for Index, Value in ipairs(Object:GetChildren()) do 
            if Value.Name == Name then 
                Value:Destroy()
            end
        end
    end
end

ObjectModule.ClearChildrenOfClass = function(Object, ClassName, IsRecursive)
    IsRecursive = (type(IsRecursive) == "boolean" and IsRecursive) or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.ClearChildrenOfClass function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.ClearChildrenOfClass function error: Argument 2 expected string; got %s.", type(ClassName)))
    if IsRecursive == true then 
        for Index, Value in ipairs(Object:GetDescendants()) do 
            if Value.ClassName == ClassName then 
                Value:Destroy()
            end
        end
    else
        for Index, Value in ipairs(Object:GetChildren()) do 
            if Value.ClassName == ClassName then 
                Value:Destroy()
            end
        end
    end
end

ObjectModule.ClearChildrenWhichAreA = function(Object, ClassName, IsRecursive)
    IsRecursive = (type(IsRecursive) == "boolean" and IsRecursive) or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.ClearChildrenWhichAreA function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.ClearChildrenWhichAreA function error: Argument 2 expected string; got %s.", type(ClassName)))
    if IsRecursive == true then 
        for Index, Value in ipairs(Object:GetDescendants()) do 
            if Value:IsA(ClassName) == true then 
                Value:Destroy()
            end
        end
    else
        for Index, Value in ipairs(Object:GetChildren()) do 
            if Value:IsA(ClassName) == true then 
                Value:Destroy()
            end
        end
    end
end

ObjectModule.FindFirstChildOfClass = function(Object, ClassName, IsRecursive)
    IsRecursive = (type(IsRecursive) == "boolean" and IsRecursive) or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.FindFirstChildOfClass function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.FindFirstChildOfClass function error: Argument 2 expected string; got %s.", type(ClassName)))
    if IsRecursive == false then 
        return Object:FindFirstChildOfClass(ClassName)
    else
        for Index, Value in ipairs(Object:GetDescendants()) do 
            if Value.ClassName == ClassName then 
                return Value
            end
        end
        return nil
    end
end

ObjectModule.GetAncestors = function(Object, IsDescending) 
    IsDescending = (type(IsDescending) == "boolean" and IsDescending) or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetAncestors function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    return _GetAncestors(Object, {}, IsDescending)
end

ObjectModule.GetAncestorsOfName = function(Object, Name, IsDescending) 
    IsDescending = (type(IsDescending) == "boolean" and IsDescending) or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetAncestorsOfName function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(Name) == "string", string.format("BTGFramework.LibrariesService.Object.GetAncestorsOfName function error: Argument 2 expected string; got %s.", type(Name)))
    return _GetAncestorsOfName(Object, Name, {}, IsDescending)
end

ObjectModule.GetAncestorsOfClass = function(Object, ClassName, IsDescending) 
    IsDescending = (type(IsDescending) == "boolean" and IsDescending) or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetAncestorsOfClass function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.GetAncestorsOfClass function error: Argument 2 expected string; got %s.", type(ClassName)))
    return _GetAncestorsOfClass(Object, ClassName, {}, IsDescending)
end

ObjectModule.GetAncestorsWhichAreA = function(Object, ClassName, IsDescending) 
    IsDescending = (type(IsDescending) == "boolean" and IsDescending) or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetAncestorsWhichAreA function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.GetAncestorsWhichAreA function error: Argument 2 expected string; got %s.", type(ClassName)))
    return _GetAncestorsWhichAreA(Object, ClassName, {}, IsDescending)
end

ObjectModule.GetChildrenOfName = function(Object, Name)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetChildrenOfName function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(Name) == "string", string.format("BTGFramework.LibrariesService.Object.GetChildrenOfName function error: Argument 2 expected string; got %s.", type(Name)))
    local Result = {}
    for Index, Value in ipairs(Object:GetChildren()) do 
        if Value.Name == Name then 
            table.insert(Result, #Result + 1, Value)
        end
    end
    return Result
end

ObjectModule.GetChildrenOfClass = function(Object, ClassName)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetChildrenOfClass function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.GetChildrenOfClass function error: Argument 2 expected string; got %s.", type(ClassName)))
    local Result = {}
    for Index, Value in ipairs(Object:GetChildren()) do 
        if Value.ClassName == ClassName then 
            table.insert(Result, #Result + 1, Value)
        end
    end
    return Result
end

ObjectModule.GetChildrenWhichAreA = function(Object, ClassName)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetChildrenWhichAreA function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.GetChildrenWhichAreA function error: Argument 2 expected string; got %s.", type(ClassName)))
    local Result = {}
    for Index, Value in ipairs(Object:GetChildren()) do 
        if Value:IsA(ClassName) == true then 
            table.insert(Result, #Result + 1, Value)
        end
    end
    return Result
end

ObjectModule.GetDescendantsOfName = function(Object, Name)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetDescendantsOfName function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(Name) == "string", string.format("BTGFramework.LibrariesService.Object.GetDescendantsOfName function error: Argument 2 expected string; got %s.", type(Name)))
    local Result = {}
    for Index, Value in ipairs(Object:GetDescendants()) do 
        if Value.Name == Name then 
            table.insert(Result, #Result + 1, Value)
        end
    end
    return Result
end

ObjectModule.GetDescendantsOfClass = function(Object, ClassName)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetDescendantsOfClass function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.GetDescendantsOfClass function error: Argument 2 expected string; got %s.", type(ClassName)))
    local Result = {}
    for Index, Value in ipairs(Object:GetDescendants()) do 
        if Value.ClassName == ClassName then 
            table.insert(Result, #Result + 1, Value)
        end
    end
    return Result
end

ObjectModule.GetDescendantsWhichAreA = function(Object, ClassName)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetDescendantsWhichAreA function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.GetDescendantsWhichAreA function error: Argument 2 expected string; got %s.", type(ClassName)))
    local Result = {}
    for Index, Value in ipairs(Object:GetDescendants()) do 
        if Value:IsA(ClassName) == true then 
            table.insert(Result, #Result + 1, Value)
        end
    end
    return Result
end

ObjectModule.WaitForChildOfClass = function(Object, ClassName)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.WaitForChildOfClass function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.WaitForChildOfClass function error: Argument 2 expected string; got %s.", type(ClassName)))
    local Result = Object:FindFirstChildOfClass(ClassName)
    if Result ~= nil then 
        return Result
    else
        while true do
            local NewObject = Object.ChildAdded:Wait()
            if NewObject.ClassName == ClassName then 
                return NewObject
            end
        end
    end
end

ObjectModule.WaitForChildWhichIsA = function(Object, ClassName)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.WaitForChildWhichIsA function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.WaitForChildWhichIsA function error: Argument 2 expected string; got %s.", type(ClassName)))
    local Result = Object:FindFirstChildWhichIsA(ClassName)
    if Result ~= nil then 
        return Result
    else
        while true do
            local NewObject = Object.ChildAdded:Wait()
            if NewObject:IsA(ClassName) == true then 
                return NewObject
            end
        end
    end
end

return ObjectModule
