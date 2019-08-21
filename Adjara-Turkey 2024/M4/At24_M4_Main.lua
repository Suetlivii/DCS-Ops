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
        airCraftLimit = 8,
        minCapTime = 800,
        maxCapTime = 1000,
        minFrontlineDistance = 40000,
        maxFrontlineDistance = 100000
    },
    {
        groupPrefix = "TurkF16GCI",
        spawnedGroupPrefix = "TurkF16GCISpawned",
        minAltitude = 6500,
        maxAltitude = 10000,
        airBase = "Batumi",
        isCap = false,
        isGci = true,
        grouping = 2,
        overhead = 1,
        airCraftLimit = 4,
        minCapTime = 800,
        maxCapTime = 1000,
        minFrontlineDistance = 40000,
        maxFrontlineDistance = 100000
    }
}

local redZone = ZONE:FindByName("RedZone")
local blueZone = ZONE:FindByName("BlueZone")
local frontZone = ZONE:FindByName("FrontZone")
local redHeliAttackZone = ZONE:FindByName("RedHeliAttack")
local redHeliPatrolZone = ZONE:FindByName("RedHeliPatrol")

if ME_isTurkCap == true then 
    mainA2AController = A2AController:New()
    mainA2AController:SetDispatcher("RedAwacs", 250000, 100000, 100000, frontZone, redZone, blueZone)
    mainA2AController.A2ADispatcher:SetDisengageRadius(90000)

    mainA2AConfigurator = A2AConfigurator:New()
    mainA2AConfigurator:SetA2AConfigs(A2AConfig)
    mainA2AConfigurator:SetController(mainA2AController)
end

if ME_Zeus == true then 
    mapCommand = MarkCommandController:New()

    mapCommand:SetExplosion()
    mapCommand:SetSpawn()
end

A2GConfigs = 
{
    {
        groupPrefix = "TurkF4",
        spawnedGroupNamePrefix = "BAI:",
        airbaseName = "Batumi",
        minAlt = 4500,
        maxAlt = 8000,
        minDistance = 40000,
        maxDistance = 100000,
        attackDelay = 60
    },
    {
        groupPrefix = "TurkF16SEAD",
        spawnedGroupNamePrefix = "SEAD:",
        airbaseName = "Batumi",
        minAlt = 6000,
        maxAlt = 8000,
        minDistance = 40000,
        maxDistance = 100000,
        attackDelay = 60
    }
}

A2GHeli = 
{
    {
        groupPrefix = "TurkAh1w",
        spawnedGroupNamePrefix = "BAI:",
        airbaseName = "Batumi",
        minAlt = 50,
        maxAlt = 200,
        minDistance = 40000,
        maxDistance = 100000,
        attackDelay = 20
    },
    {
        groupPrefix = "TurkUh1",
        spawnedGroupNamePrefix = "COIN:",
        airbaseName = "Batumi",
        minAlt = 50,
        maxAlt = 200,
        minDistance = 40000,
        maxDistance = 100000,
        attackDelay = 20
    }
}

if ME_TurkBAI == true then 
    mainA2GController = A2GController:New(A2GConfigs)
    mainA2GController:SetZones(frontZone, redZone, blueZone)
    mainA2GController:StartBAI(2000, 0.25, 2)

    mainHeliA2GController = A2GController:New(A2GHeli)
    mainHeliA2GController:SetZones(redHeliAttackZone, redHeliPatrolZone, blueZone)
    mainHeliA2GController:StartBAI(1400, 0.5, 2)
end 