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
    RedDetectionSetGroup:FilterPrefixes( { "Iran EWR" } )
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

    if ME_JiroftTomcatCount > 0 then 
        --https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Wrapper.Airbase.html
        RedA2ADispatcher:SetSquadron( "JiroftTomcat", AIRBASE.PersianGulf.Jiroft_Airport, { "Iran Tomcat Jiroft" }, ME_JiroftTomcatCount )

        -- RedA2ADispatcher:SetSquadronTakeoffInAir( "ShirazTomcat" )
        -- RedA2ADispatcher:SetSquadronTakeoffFromRunway( "ShirazTomcat" )
        -- RedA2ADispatcher:SetSquadronTakeoffFromParkingCold( "ShirazTomcat" )
        RedA2ADispatcher:SetSquadronTakeoffFromParkingHot( "JiroftTomcat" )  

        -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "ShirazTomcat" )
        -- RedA2ADispatcher:SetSquadronLandingAtEngineShutdown( "ShirazTomcat" )
        -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "ShirazTomcat" )
        RedA2ADispatcher:SetSquadronLandingAtRunway( "JiroftTomcat" )

        RedA2ADispatcher:SetSquadronGrouping( "JiroftTomcat", 2 )
        RedA2ADispatcher:SetSquadronOverhead( "JiroftTomcat", 1 )

        --ShirazTomcat_CAPZone = ZONE:New( "ShirazTomcat_CAPZoneName")
        --min alt, max alt, min patrol speed, max patrol speed, min engage speed, max engage speed, radio/baro alt
        --RedA2ADispatcher:SetSquadronCap( "ShirazTomcat", ShirazTomcat_CAPZone, 4000, 8000, 600, 800, 800, 1200, "RADIO" )
        --name, max spawned groups, min time sec, max time sec
        --RedA2ADispatcher:SetSquadronCapInterval( "ShirazTomcat", 1, 5, 10, 1 )

        --min speed, max speed
        RedA2ADispatcher:SetSquadronGci( "JiroftTomcat", 900, 1200 )
    end

 ------------------------------------------------------------------------------------------------------------------------------
    if ME_LarF4Count > 0 then 
        --https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Wrapper.Airbase.html
        RedA2ADispatcher:SetSquadron( "LarF4", AIRBASE.PersianGulf.Lar_Airbase, { "LarF4" }, ME_LarF4Count )

        -- RedA2ADispatcher:SetSquadronTakeoffInAir( "ShirazTomcat" )
        -- RedA2ADispatcher:SetSquadronTakeoffFromRunway( "ShirazTomcat" )
        -- RedA2ADispatcher:SetSquadronTakeoffFromParkingCold( "ShirazTomcat" )
        RedA2ADispatcher:SetSquadronTakeoffFromParkingHot( "LarF4" )  

        -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "ShirazTomcat" )
        -- RedA2ADispatcher:SetSquadronLandingAtEngineShutdown( "ShirazTomcat" )
        -- RedA2ADispatcher:SetSquadronLandingNearAirbase( "ShirazTomcat" )
        RedA2ADispatcher:SetSquadronLandingAtRunway( "LarF4" )

        RedA2ADispatcher:SetSquadronGrouping( "LarF4", 2 )
        RedA2ADispatcher:SetSquadronOverhead( "LarF4", 1 )

        LarF4_CAPZone = ZONE:New( "LarF4CapZone")
        --min alt, max alt, min patrol speed, max patrol speed, min engage speed, max engage speed, radio/baro alt
        RedA2ADispatcher:SetSquadronCap( "LarF4", LarMig21_CAPZone, 4000, 8000, 600, 800, 800, 1200, "RADIO" )
        --name, max spawned groups, min time sec, max time sec
        RedA2ADispatcher:SetSquadronCapInterval( "LarF4", 1, 5, 10, 1 )

        --min speed, max speed
        RedA2ADispatcher:SetSquadronGci( "LarF4", 900, 1200 )
    end

end

if ME_isBlueCap == true then 

    BlueDetectionSetGroup = SET_GROUP:New()
    BlueDetectionSetGroup:FilterPrefixes( { "Blue EWR" } )
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

    if ME_DhafraF15Count > 0 then 
        --https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Wrapper.Airbase.html
        BlueA2ADispatcher:SetSquadron( "DahfraF15", AIRBASE.PersianGulf.Al_Dhafra_AB, { "DahfraF15" }, ME_DhafraF15Count )

        -- BlueA2ADispatcher:SetSquadronTakeoffInAir( "F5EBatumi" )
        -- BlueA2ADispatcher:SetSquadronTakeoffFromRunway( "F5EBatumi" )
        -- BlueA2ADispatcher:SetSquadronTakeoffFromParkingCold( "F5EBatumi" )
        BlueA2ADispatcher:SetSquadronTakeoffFromParkingHot( "DahfraF15" )  

        -- BlueA2ADispatcher:SetSquadronLandingNearAirbase( "F5EBatumi" )
        -- BlueA2ADispatcher:SetSquadronLandingAtEngineShutdown( "F5EBatumi" )
        -- BlueA2ADispatcher:SetSquadronLandingNearAirbase( "F5EBatumi" )
        BlueA2ADispatcher:SetSquadronLandingAtRunway( "DahfraF15" )

        BlueA2ADispatcher:SetSquadronGrouping( "DahfraF15", 2 )
        BlueA2ADispatcher:SetSquadronOverhead( "DahfraF15", 2 )

        DahfraF15_CAPZone = ZONE:New( "DahfraF15CapZone")
        --min alt, max alt, min patrol speed, max patrol speed, min engage speed, max engage speed, radio/baro alt
        BlueA2ADispatcher:SetSquadronCap( "DahfraF15", DahfraF15_CAPZone, 2000, 5000, 600, 800, 800, 1200, "RADIO" )
        --name, max spawned groups, min time sec, max time sec
        BlueA2ADispatcher:SetSquadronCapInterval( "DahfraF15", 1, 5, 10, 1 )

        --min speed, max speed
        BlueA2ADispatcher:SetSquadronGci( "DahfraF15", 900, 1200 )
    end

end

if ME_counterSEAD == true then 

    redCounterSEAD = SEAD:New( {"Iran SA-6", "Iran HAWK", "Iran SA-2", "Iran SA-3" } )

end