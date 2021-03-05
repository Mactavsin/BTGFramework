--//Module Essentials
local MathModule = {}

--//Private functions
function _GeneralFunction(Operation, ...)
    return function(...)
        local Result = {}
        for Index, Value in ipairs({...}) do 
            table.insert(Result, #Result + 1, math[Operation](Value))
        end
        return table.unpack(Result)
    end
end

--//Public Variables
MathModule.huge = math.huge
MathModule.pi = math.pi
MathModule.e = 2.71828182845904523536028747135266249775724709369995957496696762772407663035354759457138217852516642742746
MathModule.gamma = 0.577215664901532860606512090082402431042159335939923598805767234884867726777664670936947063291746749
MathModule.phi = 1.61803398874989484820458683436563811772030917980576286213544862270526046281890244970720720418939113748475
MathModule.tau = 6.28318530717958647692528676655900576839433879875021164194988918461563281257241799725606965068423413

--//Public Functions
MathModule.atan2 = math.atan2
MathModule.clamp = math.clamp
MathModule.fmod = math.fmod
MathModule.ldexp  = math.ldexp
MathModule.log = math.log
MathModule.max = math.max
MathModule.min = math.min
MathModule.modf = math.modf
MathModule.noise = math.noise
MathModule.pow = math.pow
MathModule.random = math.random
MathModule.randomseed = math.randomseed
MathModule.ceil = _GeneralFunction("ceil")
MathModule.cos = _GeneralFunction("cos")
MathModule.cosh = _GeneralFunction("cosh")
MathModule.deg = _GeneralFunction("deg")
MathModule.exp = _GeneralFunction("exp")
MathModule.floor = _GeneralFunction("floor")
MathModule.frexp = _GeneralFunction("frexp")
MathModule.log10 = _GeneralFunction("log10")
MathModule.rad = _GeneralFunction("rad")
MathModule.round = _GeneralFunction("round")
MathModule.sign = _GeneralFunction("sign")
MathModule.sin = _GeneralFunction("sin")
MathModule.sinh = _GeneralFunction("sinh")
MathModule.sqrt = _GeneralFunction("sqrt")
MathModule.tan = _GeneralFunction("tan")
MathModule.tanh = _GeneralFunction("tanh")
MathModule.abs = _GeneralFunction("abs")
MathModule.acos = _GeneralFunction("acos")
MathModule.asin = _GeneralFunction("asin")
MathModule.atan = _GeneralFunction("atan")

MathModule.acosh = function(...)
    local Result = {}
    for Index, Value in ipairs({...}) do 
        table.insert(Result, #Result + 1, math.log(Value + math.sqrt((Value ^ 2) - 1)))
    end
    return table.unpack(Result) 
end

MathModule.asinh = function(...)
    local Result = {}
    for Index, Value in ipairs({...}) do 
        table.insert(Result, #Result + 1, math.log(Value + math.sqrt((Value ^ 2) + 1)))
    end
    return table.unpack(Result)
end

MathModule.atanh = function(...)
    local Result = {}
    for Index, Value in ipairs({...}) do 
        table.insert(Result, #Result + 1, 0.5 * math.log((1 + Value) / (1 - Value)))
    end
    return table.unpack(Result)
end

MathModule.cbrt = function(...)
    local Result = {}
    for Index, Value in ipairs({...}) do 
        table.insert(Result, #Result + 1, (math.abs(Value) ^ (1 / 3)) * math.sign(Value))
    end
    return table.unpack(Result)
end

return MathModule