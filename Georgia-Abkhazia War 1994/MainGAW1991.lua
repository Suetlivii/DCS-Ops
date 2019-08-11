-----------------------------------------------------------------------------------------------------------------------------------------------
-- Debuger used for debug
-- 
-----------------------------------------------------------------------------------------------------------------------------------------------
Debuger = {}

function Debuger:New(_isDebugMode)
    newObj = 
    {
        isDebugMode = _isDebugMode
    }
    self.__index = self
    return setmetatable(newObj, self)
end

function Debuger:Log(msgString)
    if self.isDebugMode == true then
        newDebugMessage = MESSAGE:New(tostring(msgString .. "\n"), 10, "DEBUG", false):ToAll()
    end
    BASE:E(tostring(msgString))
end

-----------------------------------------------------------------------------------------------------------------------------------------------

Debug = Debuger:New(false)

local redZone = ZONE:FindByName("RedZone")
local blueZone = ZONE:FindByName("BlueZone")

mainA2AController = A2AController:New()
local frontZone = ZONE:FindByName("FrontZone")
mainA2AController:SetDispatcher("EWR", 230000, 80000, 200000, frontZone, redZone, blueZone)

mainA2AConfigurator = A2AConfigurator:New()
mainA2AConfigurator:SetA2AConfigs(A2AConfig)
mainA2AConfigurator:SetController(mainA2AController)
--mainA2AConfigurator:StartA2A()

mainA2GController = A2GController:New(A2GConfigs)
mainA2GController:SetZones(blueZone, redZone, blueZone)
mainA2GController:StartBAI(1800, 0.5, 1)


SEADController = SEAD:New( {"SEAD Georgian SA-8 #002", "EWR"} )