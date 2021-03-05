--//Module Essentials
local ObjectModule = {}

--//Variables
local BlankObject = Instance.new("Folder")

--//Private Functions
function _GetAnchestors(Object, Result, IsDescending)
    if Object ~= game and Object ~= nil then 
        if IsDescending == true then 
            table.insert(Result, 1, Object.Parent)
            return _GetAnchestors(Object.Parent, Result, IsDescending)
        else
            table.insert(Result, #Result + 1, Object.Parent)
            return _GetAnchestors(Object.Parent, Result, IsDescending)
        end
    end
    return Result
end

function _GetAnchestorsOfName(Object, Name, Result, IsDescending)
    if Object ~= game and Object ~= nil and Object.Name == Name then 
        if IsDescending == true then 
            table.insert(Result, 1, Object.Parent)
            return _GetAnchestors(Object.Parent, Result, IsDescending)
        else
            table.insert(Result, #Result + 1, Object.Parent)
            return _GetAnchestors(Object.Parent, Result, IsDescending)
        end
    end
    return Result
end

function _GetAnchestorsOfClass(Object, ClassName, Result, IsDescending)
    if Object ~= game and Object ~= nil and Object.ClassName == ClassName then 
        if IsDescending == true then 
            table.insert(Result, 1, Object.Parent)
            return _GetAnchestors(Object.Parent, Result, IsDescending)
        else
            table.insert(Result, #Result + 1, Object.Parent)
            return _GetAnchestors(Object.Parent, Result, IsDescending)
        end
    end
    return Result
end

function _GetAnchestorsWhichIsA(Object, ClassName, Result, IsDescending)
    if Object ~= game and Object ~= nil and Object:IsA(ClassName) == true then 
        if IsDescending == true then 
            table.insert(Result, 1, Object.Parent)
            return _GetAnchestors(Object.Parent, Result, IsDescending)
        else
            table.insert(Result, #Result + 1, Object.Parent)
            return _GetAnchestors(Object.Parent, Result, IsDescending)
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

function ObjectModule.ClearChildrenOfName(Object, Name, IsRecursive)
    IsRecursive = IsRecursive or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.ClearChildrenOfName function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(Name) == "string", string.format("BTGFramework.LibrariesService.Object.ClearChildrenOfName function error: Argument 2 expected string; got %s.", type(Name)))
    assert(type(IsRecursive) == "boolean", string.format("BTGFramework.LibrariesService.Object.ClearChildrenOfName function error: Argument 3 expected boolean, nil; got %s.", type(IsRecursive)))
    if IsRecursive == true then 
        for Index, Value in pairs(Object:GetDescendants()) do 
            if Value.Name == Name then 
                Value:Destroy()
            end
        end
    else
        for Index, Value in pairs(Object:GetChildren()) do 
            if Value.Name == Name then 
                Value:Destroy()
            end
        end
    end
end

function ObjectModule.ClearChildrenOfClass(Object, ClassName, IsRecursive)
    IsRecursive = IsRecursive or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.ClearChildrenOfClass function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.ClearChildrenOfClass function error: Argument 2 expected string; got %s.", type(ClassName)))
    assert(type(IsRecursive) == "boolean", string.format("BTGFramework.LibrariesService.Object.ClearChildrenOfClass function error: Argument 3 expected boolean, nil; got %s.", type(IsRecursive)))
    if IsRecursive == true then 
        for Index, Value in pairs(Object:GetDescendants()) do 
            if Value.ClassName == ClassName then 
                Value:Destroy()
            end
        end
    else
        for Index, Value in pairs(Object:GetChildren()) do 
            if Value.ClassName == ClassName then 
                Value:Destroy()
            end
        end
    end
end

function ObjectModule.ClearChildrenWhichAreA(Object, ClassName, IsRecursive)
    IsRecursive = IsRecursive or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.ClearChildrenWhichAreA function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.ClearChildrenWhichAreA function error: Argument 2 expected string; got %s.", type(ClassName)))
    assert(type(IsRecursive) == "boolean", string.format("BTGFramework.LibrariesService.Object.ClearChildrenWhichAreA function error: Argument 3 expected boolean, nil; got %s.", type(IsRecursive)))
    if IsRecursive == true then 
        for Index, Value in pairs(Object:GetDescendants()) do 
            if Value:IsA(ClassName) == true then 
                Value:Destroy()
            end
        end
    else
        for Index, Value in pairs(Object:GetChildren()) do 
            if Value:IsA(ClassName) == true then 
                Value:Destroy()
            end
        end
    end
end

function ObjectModule.FindFirstChildOfClass(Object, ClassName, IsRecursive)
    IsRecursive = IsRecursive or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.FindFirstChildOfClass function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.FindFirstChildOfClass function error: Argument 2 expected string; got %s.", type(ClassName)))
    assert(type(IsRecursive) == "boolean", string.format("BTGFramework.LibrariesService.Object.FindFirstChildOfClass function error: Argument 3 expected boolean, nil; got %s.", type(IsRecursive)))
    if IsRecursive == false then 
        return Object:FindFirstChildOfClass(ClassName)
    else
        for Index, Value in pairs(Object:GetDescendants()) do 
            if Value.ClassName == ClassName then 
                return Value
            end
        end
        return nil
    end
end

function ObjectModule.GetAncestors(Object, IsDescending) 
    IsDescending = IsDescending or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetAncestors function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(IsDescending) == "boolean", string.format("BTGFramework.LibrariesService.Object.GetAncestors function error: Argument 2 expected boolean, nil; got %s.", type(IsDescending)))
    local Result = {}
    return _GetAnchestors(Object, Result, IsDescending)
end

function ObjectModule.GetAncestorsOfName(Object, Name, IsDescending) 
    IsDescending = IsDescending or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetAncestorsOfName function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(Name) == "string", string.format("BTGFramework.LibrariesService.Object.GetAncestorsOfName function error: Argument 2 expected string; got %s.", type(Name)))
    assert(type(IsDescending) == "boolean", string.format("BTGFramework.LibrariesService.Object.GetAncestorsOfName function error: Argument 3 expected boolean, nil; got %s.", type(IsDescending)))
    local Result = {}
    return _GetAnchestorsOfName(Object, Name ,Result, IsDescending)
end

function ObjectModule.GetAncestorsOfClass(Object, ClassName, IsDescending) 
    IsDescending = IsDescending or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetAncestorsOfClass function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.GetAncestorsOfClass function error: Argument 2 expected string; got %s.", type(ClassName)))
    assert(type(IsDescending) == "boolean", string.format("BTGFramework.LibrariesService.Object.GetAncestorsOfClass function error: Argument 3 expected boolean, nil; got %s.", type(IsDescending)))
    local Result = {}
    return _GetAnchestorsOfClass(Object, ClassName, Result, IsDescending)
end

function ObjectModule.GetAncestorsWhichAreA(Object, ClassName, IsDescending) 
    IsDescending = IsDescending or false
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetAncestorsWhichAreA function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.GetAncestorsWhichAreA function error: Argument 2 expected string; got %s.", type(ClassName)))
    assert(type(IsDescending) == "boolean", string.format("BTGFramework.LibrariesService.Object.GetAncestorsWhichAreA function error: Argument 3 expected boolean, nil; got %s.", type(IsDescending)))
    local Result = {}
    return _GetAnchestorsOfClass(Object, ClassName, Result, IsDescending)
end

function ObjectModule.GetChildrenOfName(Object, Name)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetChildrenOfName function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(Name) == "string", string.format("BTGFramework.LibrariesService.Object.GetChildrenOfName function error: Argument 2 expected string; got %s.", type(Name)))
    local Result = {}
    for Index, Value in pairs(Object:GetChildren()) do 
        if Value.Name == Name then 
            table.insert(Result, #Result + 1, Value)
        end
    end
    return Result
end

function ObjectModule.GetChildrenOfClass(Object, ClassName)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetChildrenOfClass function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.GetChildrenOfClass function error: Argument 2 expected string; got %s.", type(ClassName)))
    local Result = {}
    for Index, Value in pairs(Object:GetChildren()) do 
        if Value.ClassName == ClassName then 
            table.insert(Result, #Result + 1, Value)
        end
    end
    return Result
end

function ObjectModule.GetChildrenWhichAreA(Object, ClassName)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetChildrenWhichAreA function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.GetChildrenWhichAreA function error: Argument 2 expected string; got %s.", type(ClassName)))
    local Result = {}
    for Index, Value in pairs(Object:GetChildren()) do 
        if Value:IsA(ClassName) == true then 
            table.insert(Result, #Result + 1, Value)
        end
    end
    return Result
end

function ObjectModule.GetDescendantsOfName(Object, Name)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetDescendantsOfName function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(Name) == "string", string.format("BTGFramework.LibrariesService.Object.GetDescendantsOfName function error: Argument 2 expected string; got %s.", type(Name)))
    local Result = {}
    for Index, Value in pairs(Object:GetDescendants()) do 
        if Value.Name == Name then 
            table.insert(Result, #Result + 1, Value)
        end
    end
    return Result
end

function ObjectModule.GetDescendantsOfClass(Object, ClassName)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetDescendantsOfClass function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.GetDescendantsOfClass function error: Argument 2 expected string; got %s.", type(ClassName)))
    local Result = {}
    for Index, Value in pairs(Object:GetDescendants()) do 
        if Value.ClassName == ClassName then 
            table.insert(Result, #Result + 1, Value)
        end
    end
    return Result
end

function ObjectModule.GetDescendantsWhichAreA(Object, ClassName)
    assert(typeof(Object) == "Instance", string.format("BTGFramework.LibrariesService.Object.GetDescendantsWhichAreA function error: Argument 1 expected Instance; got %s.", typeof(Object)))
    assert(type(ClassName) == "string", string.format("BTGFramework.LibrariesService.Object.GetDescendantsWhichAreA function error: Argument 2 expected string; got %s.", type(ClassName)))
    local Result = {}
    for Index, Value in pairs(Object:GetDescendants()) do 
        if Value:IsA(ClassName) == true then 
            table.insert(Result, #Result + 1, Value)
        end
    end
    return Result
end

function ObjectModule.WaitForChildOfClass(Object, ClassName)
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

function ObjectModule.WaitForChildWhichIsA(Object, ClassName)
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