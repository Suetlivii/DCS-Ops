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
Debug = Debuger:New(ME_isDebug)

A2AConfig = 
{
    {
        groupPrefix = "TurkF16CAP",
        spawnedGroupPrefix = "TurkF16CAPSpawned",
        minAltitude = 6500,
        maxAltitude = 10000,
        airBase = "Batumi",
        isCap = true,
        isGci = false,
        grouping = 2,
        overhead = 1,
        airCraftLimit = 4,
        minFrontlineDistance = 40000,
        maxFrontlineDistance = 100000
    }
}

local redZone = ZONE:FindByName("RedZone")
local blueZone = ZONE:FindByName("BlueZone")
local frontZone = ZONE:FindByName("FrontZone")

if ME_isTurkCap == true then 
    mainA2AController = A2AController:New()
    mainA2AController:SetDispatcher("RedAwacs", 180000, 100000, 90000, frontZone, redZone, blueZone)
    mainA2AController.A2ADispatcher:SetDisengageRadius(50000)

    mainA2AConfigurator = A2AConfigurator:New()
    mainA2AConfigurator:SetA2AConfigs(A2AConfig)
    mainA2AConfigurator:SetController(mainA2AController)
end