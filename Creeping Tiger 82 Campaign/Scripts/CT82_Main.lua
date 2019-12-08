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
    RedDetectionSetGroup:FilterPrefixes( { "Red EWR" } )
    RedDetectionSetGroup:FilterStart()

    -- Setup the detection and group targets to a 30km range!
    RedDetection = DETECTION_AREAS:New( RedDetectionSetGroup, 30000 )

    -- Setup the A2A dispatcher, and initialize it.
    RedA2ADispatcher = AI_A2A_DISPATCHER:New( RedDetection )

    RedA2ADispatcher:SetEngageRadius( 100000 )
    RedA2ADispatcher:SetGciRadius( 300000 )
    RedA2ADispatcher:SetDisengageRadius(280000)
    --RedA2ADispatcher:SetTacticalDisplay( true )

    -- local RedBorderZone = ZONE:FindByName("BorderZone")
    -- RedA2ADispatcher:SetBorderZone( BorderZone )


    --https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Wrapper.Airbase.html
    RedA2ADispatcher:SetSquadron( "ShirazTomcat", AIRBASE.PersianGulf.Shiraz_International_Airport, { "Shiraz_Tomcat" }, 20 )

    -- RedA2ADispatcher:SetSquadronTakeoffInAir( "ShirazTomcat" )
    -- RedA2ADispatcher:SetSquadronTakeoffFromRunway( "ShirazTomcat" )
    -- RedA2ADispatcher:SetSquadronTakeoffFromParkingCold( "ShirazTomcat" )
    RedA2ADispatcher:SetSquadronTakeoffFromParkingHot( "ShirazTomcat" )  

    -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "ShirazTomcat" )
    -- RedA2ADispatcher:SetSquadronLandingAtEngineShutdown( "ShirazTomcat" )
    -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "ShirazTomcat" )
    RedA2ADispatcher:SetSquadronLandingAtRunway( "ShirazTomcat" )

    RedA2ADispatcher:SetSquadronGrouping( "ShirazTomcat", 2 )
    RedA2ADispatcher:SetSquadronOverhead( "ShirazTomcat", 2 )

    --ShirazTomcat_CAPZone = ZONE:New( "ShirazTomcat_CAPZoneName")
    --min alt, max alt, min patrol speed, max patrol speed, min engage speed, max engage speed, radio/baro alt
    --RedA2ADispatcher:SetSquadronCap( "ShirazTomcat", ShirazTomcat_CAPZone, 4000, 8000, 600, 800, 800, 1200, "RADIO" )
    --name, max spawned groups, min time sec, max time sec
    --RedA2ADispatcher:SetSquadronCapInterval( "ShirazTomcat", 1, 5, 10, 1 )

    --min speed, max speed
    RedA2ADispatcher:SetSquadronGci( "ShirazTomcat", 900, 1200 )

 ------------------------------------------------------------------------------------------------------------------------------

    --https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Wrapper.Airbase.html
    RedA2ADispatcher:SetSquadron( "LarMig21", AIRBASE.PersianGulf.Lar_Airbase, { "Lar_Mig21" }, 20 )

    -- RedA2ADispatcher:SetSquadronTakeoffInAir( "ShirazTomcat" )
    -- RedA2ADispatcher:SetSquadronTakeoffFromRunway( "ShirazTomcat" )
    -- RedA2ADispatcher:SetSquadronTakeoffFromParkingCold( "ShirazTomcat" )
    RedA2ADispatcher:SetSquadronTakeoffFromParkingHot( "LarMig21" )  

    -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "ShirazTomcat" )
    -- RedA2ADispatcher:SetSquadronLandingAtEngineShutdown( "ShirazTomcat" )
    -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "ShirazTomcat" )
    RedA2ADispatcher:SetSquadronLandingAtRunway( "LarMig21" )

    RedA2ADispatcher:SetSquadronGrouping( "LarMig21", 2 )
    RedA2ADispatcher:SetSquadronOverhead( "LarMig21", 2 )

    LarMig21_CAPZone = ZONE:New( "LarMig21_CAPZoneName")
    --min alt, max alt, min patrol speed, max patrol speed, min engage speed, max engage speed, radio/baro alt
    RedA2ADispatcher:SetSquadronCap( "LarMig21", LarMig21_CAPZone, 4000, 8000, 600, 800, 800, 1200, "RADIO" )
    --name, max spawned groups, min time sec, max time sec
    RedA2ADispatcher:SetSquadronCapInterval( "LarMig21", 1, 5, 10, 1 )

    --min speed, max speed
    RedA2ADispatcher:SetSquadronGci( "LarMig21", 900, 1200 )

 ------------------------------------------------------------------------------------------------------------------------------

    --https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Wrapper.Airbase.html
    RedA2ADispatcher:SetSquadron( "KermanMig21", AIRBASE.PersianGulf.Kerman_Airport, { "Lar_Mig21" }, 20 )

    -- RedA2ADispatcher:SetSquadronTakeoffInAir( "ShirazTomcat" )
    -- RedA2ADispatcher:SetSquadronTakeoffFromRunway( "ShirazTomcat" )
    -- RedA2ADispatcher:SetSquadronTakeoffFromParkingCold( "ShirazTomcat" )
    RedA2ADispatcher:SetSquadronTakeoffFromParkingHot( "KermanMig21" )  

    -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "ShirazTomcat" )
    -- RedA2ADispatcher:SetSquadronLandingAtEngineShutdown( "ShirazTomcat" )
    -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "ShirazTomcat" )
    RedA2ADispatcher:SetSquadronLandingAtRunway( "KermanMig21" )

    RedA2ADispatcher:SetSquadronGrouping( "KermanMig21", 2 )
    RedA2ADispatcher:SetSquadronOverhead( "KermanMig21", 2 )

    --LarMig21_CAPZone = ZONE:New( "LarMig21_CAPZoneName")
    --min alt, max alt, min patrol speed, max patrol speed, min engage speed, max engage speed, radio/baro alt
    --RedA2ADispatcher:SetSquadronCap( "LarMig21", LarMig21_CAPZone, 4000, 8000, 600, 800, 800, 1200, "RADIO" )
    --name, max spawned groups, min time sec, max time sec
    --RedA2ADispatcher:SetSquadronCapInterval( "LarMig21", 1, 5, 10, 1 )

    --min speed, max speed
    RedA2ADispatcher:SetSquadronGci( "KermanMig21", 900, 1200 )

end

if ME_isBlueCap == true then 

    BlueDetectionSetGroup = SET_GROUP:New()
    BlueDetectionSetGroup:FilterPrefixes( { "Blue AWACS" } )
    BlueDetectionSetGroup:FilterStart()

    -- Setup the detection and group targets to a 30km range!
    BlueDetection = DETECTION_AREAS:New( BlueDetectionSetGroup, 10000 )

    -- Setup the A2A dispatcher, and initialize it.
    BlueA2ADispatcher = AI_A2A_DISPATCHER:New( BlueDetection )

    BlueA2ADispatcher:SetEngageRadius( 100000 )
    BlueA2ADispatcher:SetGciRadius( 240000 )
    BlueA2ADispatcher:SetDisengageRadius(180000)
    --BlueA2ADispatcher:SetTacticalDisplay( true )

    -- local BlueBorderZone = ZONE:FindByName("BorderZone")
    -- BlueA2ADispatcher:SetBorderZone( BorderZone )

    --https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Wrapper.Airbase.html
    BlueA2ADispatcher:SetSquadron( "MinhadHornet", AIRBASE.PersianGulf.Al_Minhad_AB, { "Minhad_Hornet" }, 20 )

    -- BlueA2ADispatcher:SetSquadronTakeoffInAir( "F5EBatumi" )
    -- BlueA2ADispatcher:SetSquadronTakeoffFromRunway( "F5EBatumi" )
    -- BlueA2ADispatcher:SetSquadronTakeoffFromParkingCold( "F5EBatumi" )
    BlueA2ADispatcher:SetSquadronTakeoffFromParkingHot( "MinhadHornet" )  

    -- BlueA2ADispatcher:SetSquadronLandingNearAirbase( "F5EBatumi" )
    -- BlueA2ADispatcher:SetSquadronLandingAtEngineShutdown( "F5EBatumi" )
    -- BlueA2ADispatcher:SetSquadronLandingNearAirbase( "F5EBatumi" )
    BlueA2ADispatcher:SetSquadronLandingAtRunway( "MinhadHornet" )

    BlueA2ADispatcher:SetSquadronGrouping( "MinhadHornet", 2 )
    BlueA2ADispatcher:SetSquadronOverhead( "MinhadHornet", 2 )

    --F5EBatumi_CAPZone = ZONE:New( "F5EBatumi_CAPZoneName")
    --min alt, max alt, min patrol speed, max patrol speed, min engage speed, max engage speed, radio/baro alt
    --BlueA2ADispatcher:SetSquadronCap( "F5EBatumi", F5EBatumi_CAPZone, 4000, 8000, 600, 800, 800, 1200, "RADIO" )
    --name, max spawned groups, min time sec, max time sec
    --BlueA2ADispatcher:SetSquadronCapInterval( "F5EBatumi", 1, 5, 10, 1 )

    --min speed, max speed
    BlueA2ADispatcher:SetSquadronGci( "MinhadHornet", 900, 1200 )

end