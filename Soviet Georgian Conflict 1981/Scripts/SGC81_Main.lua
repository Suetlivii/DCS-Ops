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

if ME_isRedCap == true then 
    RedDetectionSetGroup = SET_GROUP:New()
    RedDetectionSetGroup:FilterPrefixes( { "Ussr EWR" } )
    RedDetectionSetGroup:FilterStart()

    -- Setup the detection and group targets to a 30km range!
    RedDetection = DETECTION_AREAS:New( RedDetectionSetGroup, 30000 )

    -- Setup the A2A dispatcher, and initialize it.
    RedA2ADispatcher = AI_A2A_DISPATCHER:New( RedDetection )

    RedA2ADispatcher:SetEngageRadius( 75000 )
    RedA2ADispatcher:SetGciRadius( 150000 )
    RedA2ADispatcher:SetDisengageRadius(200000)
    --RedA2ADispatcher:SetTacticalDisplay( true )

    -- local RedBorderZone = ZONE:FindByName("BorderZone")
    -- RedA2ADispatcher:SetBorderZone( BorderZone )

    --https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Wrapper.Airbase.html
    RedA2ADispatcher:SetSquadron( "MykopMig21", AIRBASE.Caucasus.Maykop_Khanskaya, { "Ussr_Mig21_CAP" }, 20 )

    -- RedA2ADispatcher:SetSquadronTakeoffInAir( "MykopMig21" )
    -- RedA2ADispatcher:SetSquadronTakeoffFromRunway( "MykopMig21" )
    -- RedA2ADispatcher:SetSquadronTakeoffFromParkingCold( "MykopMig21" )
    RedA2ADispatcher:SetSquadronTakeoffFromParkingHot( "MykopMig21" )  

    -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "MykopMig21" )
    -- RedA2ADispatcher:SetSquadronLandingAtEngineShutdown( "MykopMig21" )
    -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "MykopMig21" )
    RedA2ADispatcher:SetSquadronLandingAtRunway( "MykopMig21" )

    RedA2ADispatcher:SetSquadronGrouping( "MykopMig21", 2 )
    RedA2ADispatcher:SetSquadronOverhead( "MykopMig21", 2 )

    MykopMig21_CAPZone = ZONE:New( "MykopMig21_CAPZoneName")
    --min alt, max alt, min patrol speed, max patrol speed, min engage speed, max engage speed, radio/baro alt
    RedA2ADispatcher:SetSquadronCap( "MykopMig21", MykopMig21_CAPZone, 4000, 8000, 600, 800, 800, 1200, "RADIO" )
    --name, max spawned groups, min time sec, max time sec
    RedA2ADispatcher:SetSquadronCapInterval( "MykopMig21", 1, 5, 10, 1 )

    --min speed, max speed
    RedA2ADispatcher:SetSquadronGci( "MykopMig21", 900, 1200 )


    --https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Wrapper.Airbase.html
    RedA2ADispatcher:SetSquadron( "MozdokMig21", AIRBASE.Caucasus.Mozdok, { "Ussr_Mig21_CAP" }, 20 )

    -- RedA2ADispatcher:SetSquadronTakeoffInAir( "MykopMig21" )
    -- RedA2ADispatcher:SetSquadronTakeoffFromRunway( "MykopMig21" )
    -- RedA2ADispatcher:SetSquadronTakeoffFromParkingCold( "MykopMig21" )
    RedA2ADispatcher:SetSquadronTakeoffFromParkingHot( "MozdokMig21" )  

    -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "MykopMig21" )
    -- RedA2ADispatcher:SetSquadronLandingAtEngineShutdown( "MykopMig21" )
    -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "MykopMig21" )
    RedA2ADispatcher:SetSquadronLandingAtRunway( "MozdokMig21" )

    RedA2ADispatcher:SetSquadronGrouping( "MozdokMig21", 2 )
    RedA2ADispatcher:SetSquadronOverhead( "MozdokMig21", 2 )

    MozdokMig21_CAPZone = ZONE:New( "MozdokMig21_CAPZoneName")
    --min alt, max alt, min patrol speed, max patrol speed, min engage speed, max engage speed, radio/baro alt
    RedA2ADispatcher:SetSquadronCap( "MozdokMig21", MozdokMig21_CAPZone, 4000, 8000, 600, 800, 800, 1200, "RADIO" )
    --name, max spawned groups, min time sec, max time sec
    RedA2ADispatcher:SetSquadronCapInterval( "MozdokMig21", 1, 5, 10, 1 )

    --min speed, max speed
    RedA2ADispatcher:SetSquadronGci( "MozdokMig21", 900, 1200 )

end


if ME_isBlueCap == true then 

    BlueDetectionSetGroup = SET_GROUP:New()
    BlueDetectionSetGroup:FilterPrefixes( { "Blue EWR" } )
    BlueDetectionSetGroup:FilterStart()

    -- Setup the detection and group targets to a 30km range!
    BlueDetection = DETECTION_AREAS:New( BlueDetectionSetGroup, 10000 )

    -- Setup the A2A dispatcher, and initialize it.
    BlueA2ADispatcher = AI_A2A_DISPATCHER:New( BlueDetection )

    BlueA2ADispatcher:SetEngageRadius( 75000 )
    BlueA2ADispatcher:SetGciRadius( 150000 )
    BlueA2ADispatcher:SetDisengageRadius(165000)
    --BlueA2ADispatcher:SetTacticalDisplay( true )

    -- local BlueBorderZone = ZONE:FindByName("BorderZone")
    -- BlueA2ADispatcher:SetBorderZone( BorderZone )

    --https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Wrapper.Airbase.html
    BlueA2ADispatcher:SetSquadron( "F5EBatumi", AIRBASE.Caucasus.Batumi, { "F5ECap" }, 20 )

    -- BlueA2ADispatcher:SetSquadronTakeoffInAir( "F5EBatumi" )
    -- BlueA2ADispatcher:SetSquadronTakeoffFromRunway( "F5EBatumi" )
    -- BlueA2ADispatcher:SetSquadronTakeoffFromParkingCold( "F5EBatumi" )
    BlueA2ADispatcher:SetSquadronTakeoffFromParkingHot( "F5EBatumi" )  

    -- BlueA2ADispatcher:SetSquadronLandingNearAirbase( "F5EBatumi" )
    -- BlueA2ADispatcher:SetSquadronLandingAtEngineShutdown( "F5EBatumi" )
    -- BlueA2ADispatcher:SetSquadronLandingNearAirbase( "F5EBatumi" )
    BlueA2ADispatcher:SetSquadronLandingAtRunway( "F5EBatumi" )

    BlueA2ADispatcher:SetSquadronGrouping( "F5EBatumi", 2 )
    BlueA2ADispatcher:SetSquadronOverhead( "F5EBatumi", 1 )

    F5EBatumi_CAPZone = ZONE:New( "F5EBatumi_CAPZoneName")
    --min alt, max alt, min patrol speed, max patrol speed, min engage speed, max engage speed, radio/baro alt
    BlueA2ADispatcher:SetSquadronCap( "F5EBatumi", F5EBatumi_CAPZone, 4000, 8000, 600, 800, 800, 1200, "RADIO" )
    --name, max spawned groups, min time sec, max time sec
    BlueA2ADispatcher:SetSquadronCapInterval( "F5EBatumi", 1, 5, 10, 1 )

    --min speed, max speed
    BlueA2ADispatcher:SetSquadronGci( "F5EBatumi", 900, 1200 )

end

if ME_isBlueRAT == true then 
    local blueRatPlane = RAT:New("BlueRatC130")
    blueRatPlane.Debug = false
    blueRatPlane:SetDeparture({"Tbilisi-Lochini", "Kutaisi", "Senaki-Kolkhi"})
    blueRatPlane:SetDestination({"Tbilisi-Lochini", "Kutaisi", "Senaki-Kolkhi"})

    local blueRatManager = RATMANAGER:New(2)
    blueRatManager:Add(blueRatPlane, 1)
    blueRatManager:Add(blueRatPlane, 1)
    blueRatManager:Start(5)
    blueRatManager:Stop(7200)
end

if ME_isRedRAT == true then 
    local redRatPlane = RAT:New("USSRAn26RAT")
    redRatPlane.Debug = false
    redRatPlane:SetDeparture({"Gudauta", "Nalchik", "Mineralnye Vody"})
    redRatPlane:SetDestination({"Gudauta", "Nalchik", "Mineralnye Vody"})

    local redRatManager = RATMANAGER:New(2)
    redRatManager:Add(redRatPlane, 1)
    redRatManager:Add(redRatPlane, 1)
    redRatManager:Start(5)
    redRatManager:Stop(7200)
end