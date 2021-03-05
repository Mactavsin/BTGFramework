--------------------------------------------------------------------------------------------------
--The ClassTable part of this module is made possible by CloneTrooper1019's API-Dump.json file  --
--in his Roblox Client Tracker github repository.                                               --
--                                                                                              --
--I was gonna paste the lisance of the project here but turns out there is none so I'm writing  --
--this comment here to credit him since I'm using his API Dump.                                 --
--                                                                                              --
--If you want to check it out visit this link down below:                                       --
--https://github.com/CloneTrooper1019/Roblox-Client-Tracker                                     --
--                                                                                              --
--API-Dump.json file link:                                                                      --
--https://raw.githubusercontent.com/CloneTrooper1019/Roblox-Client-Tracker/roblox/API-Dump.json --
--------------------------------------------------------------------------------------------------

local BTGFrameworkLibrariesServiceModule = {}
local HTTPService = game:GetService("HttpService")
local APIDumpURL = "https://raw.githubusercontent.com/CloneTrooper1019/Roblox-Client-Tracker/roblox/API-Dump.json"

BTGFrameworkLibrariesServiceModule.ClassTable = {}

BTGFrameworkLibrariesServiceModule.ClassTableIgnore = {
	"CSGDictionaryService",
	"Player",
	"FlyweightService",
	"ParabolaAdornment",
	"NonReplicatedCSGDictionaryService",
	"DebuggerWatch",
	"PluginAction"
}

BTGFrameworkLibrariesServiceModule.DatatypeTable = {
	['Axes'] = {
		['Properties'] = {
			"Top",
			"Bottom",
			"Left",
			"Right",
			"Back",
			"Front"
		},
		['ToTable'] = function(Input)
			return {
				Datatype = "Axes",
				X = Input.X,
				Y = Input.Y,
				Z = Input.Z,
				Top = Input.Top,
				Bottom = Input.Bottom,
				Left = Input.Left,
				Right = Input.Right,
				Back = Input.Back,
				Front = Input.Front
			}
		end,
		['FromTable'] = function(Input)
			local Result = {}
			for Index, Value in ipairs(BTGFrameworkLibrariesServiceModule.DatatypeTable.Axes.Properties) do
				if Input[Value] == true then
					table.insert(Result, #Result + 1, Enum.NormalId[Value])
				end
			end
			return Axes.new(table.unpack(Result))
		end
	},
	['BrickColor'] = {
		['Properties'] = {
			"Number"
		},
		['ToTable'] = function(Input)
			return {
				Datatype = "BrickColor",
				Number = Input.Number,
				r = Input.r,
				g = Input.g,
				b = Input.b,
				Name = Input.Name,
				Color = BTGFrameworkLibrariesServiceModule.DatatypeTable.Color3.ToTable(Input.Color)
			}
		end,
		['FromTable'] = function(Input)
			return BrickColor.new(Input.Number)
		end 
	}, 
	['CatalogSearchParams'] = {
		['Properties'] = {
			"SearchKeyword",
			"MinPrice",
			"MaxPrice",
			"SortType",
			"CategoryFilter",
			"BundleType",
			"AssetTypes"
		},
		['ToTable'] = function(Input)
			local Result = {}
			Result.Datatype = "CatalogSearchParams"
			Result.SearchKeyword = Input.SearchKeyword
			Result.MinPrice = Input.MinPrice
			Result.MaxPrice = Input.MaxPrice
			Result.SortType = BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.ToTable(Result.SortType)
			Result.CategoryFilter = BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.ToTable(Result.CategoryFilter)
			local BundleType = {}
			for Index, Value in ipairs(Input.BundleType) do 
				table.insert(BundleType, #BundleType + 1, BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.ToTable(Value))
			end
			Result.BundleType = BundleType
			local AssetTypes = {}
			for Index, Value in ipairs(Input.AssetTypes) do 
				table.insert(AssetTypes, #AssetTypes + 1, BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.ToTable(Value))
			end
			Result.AssetTypes = AssetTypes
			return Result
		end,
		['FromTable'] = function(Input)
			local Result = CatalogSearchParams.new()
			Result.SearchKeyword = Input.SearchKeyword
			Result.MinPrice = Input.MinPrice
			Result.MaxPrice = Input.MaxPrice
			Result.SortType = BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.FromTable(Result.SortType)
			Result.CategoryFilter = BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.FromTable(Result.CategoryFilter)
			local BundleType = {}
			for Index, Value in ipairs(Input.BundleType) do 
				table.insert(BundleType, #BundleType + 1, BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.FromTable(Value))
			end
			Result.BundleType = BundleType
			local AssetTypes = {}
			for Index, Value in ipairs(Input.AssetTypes) do 
				table.insert(AssetTypes, #AssetTypes + 1, BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.FromTable(Value))
			end
			Result.AssetTypes = AssetTypes
			return Result
		end 
	},
	['CFrame'] = {
		['Properties'] = {
			"X",
			"Y",
			"Z",
			"XVector",
			"YVector",
			"ZVector"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "CFrame",
				Position = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.Position),
				X = Input.X,
				Y = Input.Y,
				Z = Input.Z,
				LookVector = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.LookVector),
				RightVector = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.RightVector),
				UpVector = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.UpVector),
				XVector = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.XVector),
				YVector = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.YVector),
				ZVector = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.ZVector)
			}
		end,
		['FromTable'] = function(Input) 
			local XVector = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.FromTable(Input.XVector)
			local YVector = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.FromTable(Input.YVector)
			local ZVector = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.FromTable(Input.ZVector)
			return CFrame.new(Input.X, Input.Y, Input.Z, XVector.X, YVector.X, ZVector.X, XVector.Y, YVector.Y, ZVector.Y, XVector.Z, YVector.Z, ZVector.Z)
		end
	},
	['Color3'] = {
		['Properties'] = {
			"R",
			"G",
			"B"
		},
		['ToTable'] = function(Input)
			return {
				Datatype = "Color3",
				R = Input.R,
				G = Input.G,
				B = Input.B
			}
		end,
		['FromTable'] = function(Input) 
			return Color3.new(Input.R, Input.G, Input.B)
		end
	},
	['ColorSequence'] = {
		['Properties'] = {
			"Keypoints"
		},
		['ToTable'] = function(Input) 
			local Result = {}
			Result.Datatype = "ColorSequence"
			Result.Keypoints = {}
			for Index, Value in ipairs(Input.Keypoints) do 
				table.insert(Result.Keypoints, #Result.Keypoints + 1, BTGFrameworkLibrariesServiceModule.DatatypeTable.ColorSequenceKeypoint.ToTable(Value))
			end
			return Result
		end,
		['FromTable'] = function(Input) 
			local Keypoints = {}
			for Index, Value in ipairs(Input.Keypoints) do 
				table.insert(Keypoints, #Keypoints + 1, BTGFrameworkLibrariesServiceModule.DatatypeTable.ColorSequenceKeypoint.FromTable(Value))
			end
			return ColorSequence.new(Keypoints)
		end
	},
	['ColorSequenceKeypoint'] = {
		['Properties'] = {
			"Time",
			"Value"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "ColorSequenceKeypoint",
				Time = Input.Time,
				Value = BTGFrameworkLibrariesServiceModule.DatatypeTable.Color3.ToTable(Input.Value)
			}
		end,
		['FromTable'] = function(Input) 
			return ColorSequenceKeypoint.new(Input.Time, BTGFrameworkLibrariesServiceModule.DatatypeTable.Color3.FromTable(Input.Value))
		end
	},
	['DateTime'] = {
		['Properties'] = {
			"UnixTimestampMillis"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "DateTime",
				UnixTimestamp = Input.UnixTimestamp,
				UnixTimestampMillis = Input.UnixTimestampMillis
			}
		end,
		['FromTable'] = function(Input) 
			return DateTime.fromUnixTimestampMillis(Input.UnixTimestampMillis)
		end
	},
	['DockWidgetPluginGuiInfo'] = {
		['Properties'] = {
			"InitialEnabled",
			"InitialEnabledShouldOverrideRestore",
			"FloatingXSize",
			"FloatingYSize",
			"MinWidth",
			"MinHeight"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "DockWidgetPluginGuiInfo",
				InitialEnabled = Input.InitialEnabled,
				InitialEnabledShouldOverrideRestore = Input.InitialEnabledShouldOverrideRestore,
				FloatingXSize = Input.FloatingXSize,
				FloatingYSize = Input.FloatingYSize,
				MinWidth = Input.MinWidth,
				MinHeight = Input.MinHeight
			}
		end,
		['FromTable'] = function(Input) 
			return DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Right, Input.InitialEnabled, Input.InitialEnabledShouldOverrideRestore, Input.FloatingXSize, Input.FloatingYSize, Input.MinWidth,Input.MinHeight)
		end
	},
	['EnumItem'] = {
		['Properties'] = {
			"Name",
			"EnumType"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "EnumItem",
				Name = Input.Name,
				Value = Input.Value,
				EnumType = tostring(Input.EnumType)
			}
		end,
		['FromTable'] = function(Input) 
			return Enum[Input.EnumType][Input.Name]
		end
	},
	['Faces'] = {
		['Properties'] = {
			"Top",
			"Bottom",
			"Left",
			"Right",
			"Back",
			"Front"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "Faces",
				Top = Input.Top,
				Bottom = Input.Bottom,
				Left = Input.Left,
				Right = Input.Right,
				Back = Input.Back,
				Front = Input.Front
			}
		end,
		['FromTable'] = function(Input) 
			local Result = {}
			for Index, Value in ipairs(BTGFrameworkLibrariesServiceModule.DatatypeTable.Faces.Properties) do
				if Input[Value] == true then
					table.insert(Result, #Result + 1, Enum.NormalId[Value])
				end
			end
			return Faces.new(table.unpack(Result))
		end
	},
	['NumberRange'] = {
		['Properties'] = {
			"Min",
			"Max"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "NumberRange",
				Min = Input.Min,
				Max = Input.Max
			}
		end,
		['FromTable'] = function(Input) 
			return NumberRange.new(Input.Min, Input.Max)
		end
	},
	['NumberSequence'] = {
		['Properties'] = {
			"Keypoints"
		},
		['ToTable'] = function(Input) 
			local Result = {}
			Result.Datatype = "NumberSequence"
			Result.Keypoints = {}
			for Index, Value in ipairs(Input.Keypoints) do 
				table.insert(Result.Keypoints, #Result.Keypoints + 1, BTGFrameworkLibrariesServiceModule.DatatypeTable.NumberSequenceKeypoint.ToTable(Value))
			end
			return Result
		end,
		['FromTable'] = function(Input) 
			local Keypoints = {}
			for Index, Value in ipairs(Input.Keypoints) do 
				table.insert(Keypoints, #Keypoints + 1, BTGFrameworkLibrariesServiceModule.DatatypeTable.NumberSequenceKeypoint.FromTable(Value))
			end
			return NumberSequence.new(Keypoints)
		end
	},
	['NumberSequenceKeypoint'] = {
		['Properties'] = {
			"Envelope",
			"Time",
			"Value"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "NumberSequenceKeypoint",
				Envelope = Input.Envelope,
				Time = Input.Time,
				Value = Input.Value
			}
		end,
		['FromTable'] = function(Input) 
			return NumberSequenceKeypoint.new(Input.Time, Input.Value, Input.Envelope)
		end
	},
	['PathWaypoint'] = {
		['Properties'] = {
			"Action",
			"Position"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "PathWaypoint",
				Action = BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.ToTable(Input.Action),
				Position = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.Position)
			}
		end,
		['FromTable'] = function(Input) 
			return PathWaypoint.new(BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.FromTable(Input.Position), BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.FromTable(Input.Action))
		end
	},
	['PhysicalProperties'] = {
		['Properties'] = {
			"Density",
			"Friction",
			"Elasticity",
			"FrictionWeight",
			"ElasticityWeight"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "PhysicalProperties",
				Density = Input.Density,
				Friction = Input.Friction,
				Elasticity = Input.Elasticity,
				FrictionWeight = Input.FrictionWeight,
				ElasticityWeight = Input.ElasticityWeight
			}
		end,
		['FromTable'] = function(Input) 
			return PhysicalProperties.new(Input.Density, Input.Friction, Input.Elasticity, Input.FrictionWeight, Input.ElasticityWeight)
		end
	},
	['Ray'] = {
		['Properties'] = {
			"Origin",
			"Direction"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "Ray",
				Origin = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.Origin),
				Direction = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.Direction),
				Unit = {
					Datatype = "Ray",
					Origin = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.Unit.Origin),
					Direction = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.Unit.Direction),
					Unit = Input.Unit
				}
			}
		end,
		['FromTable'] = function(Input) 
			return Ray.new(BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.FromTable(Input.Origin), BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.FromTable(Input.Direction))
		end
	},
	['Rect'] = {
		['Properties'] = {
			"Min",
			"Max"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "Rect",
				Width = Input.Width,
				Height = Input.Height,
				Min = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector2.ToTable(Input.Min),
				Max = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector2.ToTable(Input.Max)
			}
		end,
		['FromTable'] = function(Input) 
			return Rect.new(BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector2.FromTable(Input.Min), BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector2.FromTable(Input.Max))
		end
	},
	['Region3'] = {
		['Properties'] = {
			"CFrame",
			"Size"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "Region3",
				CFrame = BTGFrameworkLibrariesServiceModule.DatatypeTable.CFrame.ToTable(Input.CFrame),
				Size = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.ToTable(Input.Size)
			}
		end,
		['FromTable'] = function(Input) 
			local CFrameValue = BTGFrameworkLibrariesServiceModule.DatatypeTable.CFrame.FromTable(Input.CFrame)
			local Size = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3.FromTable(Input.Size)
			return Region3.new((CFrameValue * CFrame.new(-Size.X / 2, -Size.Y / 2, -Size.Z / 2)).p, (CFrameValue * CFrame.new(Size.X / 2, Size.Y / 2, Size.Z / 2)).p)
		end
	},
	['Region3int16'] = {
		['Properties'] = {
			"Min",
			"Max"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "Region3int16",
				Min = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3int16.ToTable(Input.Min),
				Max = BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3int16.ToTable(Input.Max)
			}
		end,
		['FromTable'] = function(Input) 
			return Region3int16.new(BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3int16.FromTable(Input.Min), BTGFrameworkLibrariesServiceModule.DatatypeTable.Vector3int16.FromTable(Input.Max))
		end
	},
	['TweenInfo'] = {
		['Properties'] = {
			"EasingDirection",
			"Time",
			"DelayTime",
			"RepeatCount",
			"EasingStyle",
			"Reverses"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "TweenInfo",
				EasingDirection = BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.ToTable(Input.EasingDirection),
				Time = Input.Time,
				DelayTime = Input.DelayTime,
				RepeatCount = Input.RepeatCount,
				EasingStyle = BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.ToTable(Input.EasingStyle),
				Reverses = Input.Reverses
			}
		end,
		['FromTable'] = function(Input) 
			return TweenInfo.new(Input.Time, BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.FromTable(Input.EasingStyle), BTGFrameworkLibrariesServiceModule.DatatypeTable.EnumItem.FromTable(Input.EasingDirection), Input.RepeatCount, Input.Reverses, Input.DelayTime)
		end
	},
	['UDim'] = {
		['Properties'] = {
			"Scale",
			"Offset"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "UDim",
				Scale = Input.Scale,
				Offset = Input.Offset
			}
		end,
		['FromTable'] = function(Input) 
			return UDim.new(Input.Scale, Input.Offset)
		end
	},
	['UDim2'] = {
		['Properties'] = {
			"X",
			"Y"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "UDim2",
				X = BTGFrameworkLibrariesServiceModule.DatatypeTable.UDim.ToTable(Input.X),
				Y = BTGFrameworkLibrariesServiceModule.DatatypeTable.UDim.ToTable(Input.Y),
				Width = BTGFrameworkLibrariesServiceModule.DatatypeTable.UDim.ToTable(Input.Width),
				Height = BTGFrameworkLibrariesServiceModule.DatatypeTable.UDim.ToTable(Input.Height)
			}
		end,
		['FromTable'] = function(Input) 
			return UDim2.new(BTGFrameworkLibrariesServiceModule.DatatypeTable.UDim.FromTable(Input.X), BTGFrameworkLibrariesServiceModule.DatatypeTable.UDim.FromTable(Input.Y))
		end
	},
	['Vector2'] = {
		['Properties'] = {
			"X",
			"Y",
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "Vector2",
				X = Input.X,
				Y = Input.Y,
				Magnitude = Input.Magnitude,
				Unit = {
					Datatype = "Vector2",
					X = Input.Unit.X,
					Y = Input.Unit.Y,
					Magnitude = Input.Unit.Magnitude,
					Unit = Input.Unit
				}
			}
		end,
		['FromTable'] = function(Input) 
			return Vector2.new(Input.X, Input.Y)
		end
	},
	['Vector2int16'] = {
		['Properties'] = {
			"X",
			"Y",
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "Vector2int16",
				X = Input.X,
				Y = Input.Y,
			}
		end,
		['FromTable'] = function(Input) 
			return Vector2int16.new(Input.X, Input.Y)
		end
	},
	['Vector3'] = {
		['Properties'] = {
			"X",
			"Y",
			"Z"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "Vector3",
				X = Input.X,
				Y = Input.Y,
				Z = Input.Z,
				Magnitude = Input.Magnitude,
				Unit = {
					Datatype = "Vector3",
					X = Input.Unit.X,
					Y = Input.Unit.Y,
					Z = Input.Z,
					Magnitude = Input.Unit.Magnitude,
					Unit = Input.Unit
				}
			}
		end,
		['FromTable'] = function(Input) 
			return Vector3.new(Input.X, Input.Y, Input.Z)
		end
	},
	['Vector3int16'] = {
		['Properties'] = {
			"X",
			"Y",
			"Z"
		},
		['ToTable'] = function(Input) 
			return {
				Datatype = "Vector2int16",
				X = Input.X,
				Y = Input.Y,
				Z = Input.Z
			}
		end,
		['FromTable'] = function(Input) 
			return Vector3int16.new(Input.X, Input.Y, Input.Z)
		end
	}
}

function GetAsync(URL)
	local Success, Data = pcall(function()
		return HTTPService:GetAsync(URL)
	end)

	if Success == true then
		return Data
	else
		print(Data)
		return GetAsync(URL)
	end
end

for ClassIndex, ClassValue in ipairs(HTTPService:JSONDecode(GetAsync(APIDumpURL)).Classes) do
	local ClassTags = ClassValue.Tags or {}
	BTGFrameworkLibrariesServiceModule.ClassTable[ClassValue.Name] = {}
	BTGFrameworkLibrariesServiceModule.ClassTable[ClassValue.Name].Properties = {}
	BTGFrameworkLibrariesServiceModule.ClassTable[ClassValue.Name].SuperClass = ClassValue.Superclass
	BTGFrameworkLibrariesServiceModule.ClassTable[ClassValue.Name].IsCreatable = table.find(ClassTags, "NotCreatable") == nil 
	for MemberIndex, MemberValue in ipairs(ClassValue.Members) do
		if MemberValue.MemberType == "Property" then 
			local MemberTags = MemberValue.Tags or {}
			BTGFrameworkLibrariesServiceModule.ClassTable[ClassValue.Name].Properties[MemberValue.Name] = {}
			BTGFrameworkLibrariesServiceModule.ClassTable[ClassValue.Name].Properties[MemberValue.Name].SecurityLevel = MemberValue.Security.Write
			BTGFrameworkLibrariesServiceModule.ClassTable[ClassValue.Name].Properties[MemberValue.Name].IsReadOnly = table.find(MemberTags, "ReadOnly") ~= nil
			BTGFrameworkLibrariesServiceModule.ClassTable[ClassValue.Name].Properties[MemberValue.Name].IsScriptAccessable = table.find(MemberTags, "NotScriptable") == nil
		end
	end
end

return BTGFrameworkLibrariesServiceModule