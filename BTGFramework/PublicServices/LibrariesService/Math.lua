--//Module Essentials
local MathModule = {}

--//Private functions
function _GetModifiedMathFunction(Operation, ...)
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
MathModule.ceil = _GetModifiedMathFunction("ceil")
MathModule.cos = _GetModifiedMathFunction("cos")
MathModule.cosh = _GetModifiedMathFunction("cosh")
MathModule.deg = _GetModifiedMathFunction("deg")
MathModule.exp = _GetModifiedMathFunction("exp")
MathModule.floor = _GetModifiedMathFunction("floor")
MathModule.frexp = _GetModifiedMathFunction("frexp")
MathModule.log10 = _GetModifiedMathFunction("log10")
MathModule.rad = _GetModifiedMathFunction("rad")
MathModule.round = _GetModifiedMathFunction("round")
MathModule.sign = _GetModifiedMathFunction("sign")
MathModule.sin = _GetModifiedMathFunction("sin")
MathModule.sinh = _GetModifiedMathFunction("sinh")
MathModule.sqrt = _GetModifiedMathFunction("sqrt")
MathModule.tan = _GetModifiedMathFunction("tan")
MathModule.tanh = _GetModifiedMathFunction("tanh")
MathModule.abs = _GetModifiedMathFunction("abs")
MathModule.acos = _GetModifiedMathFunction("acos")
MathModule.asin = _GetModifiedMathFunction("asin")
MathModule.atan = _GetModifiedMathFunction("atan")

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
