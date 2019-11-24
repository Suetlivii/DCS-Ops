EXAM_DetectionSetGroup = SET_GROUP:New()
EXAM_DetectionSetGroup:FilterPrefixes( { "EWR PREFIX1", "EWR PREFIX2" } )
EXAM_DetectionSetGroup:FilterStart()

-- Setup the detection and group targets to a 30km range!
EXAM_Detection = DETECTION_AREAS:New( EXAM_DetectionSetGroup, 10000 )

-- Setup the A2A dispatcher, and initialize it.
EXAM_A2ADispatcher = AI_A2A_DISPATCHER:New( EXAM_Detection )

EXAM_A2ADispatcher:SetEngageRadius( 100000 )
EXAM_A2ADispatcher:SetGciRadius( 200000 )
EXAM_A2ADispatcher:SetDisengageRadius(230000)
EXAM_A2ADispatcher:SetTacticalDisplay( true )

local EXAM_BorderZone = ZONE:FindByName("BorderZone")
EXAM_A2ADispatcher:SetBorderZone( BorderZone )

--https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Wrapper.Airbase.html
EXAM_A2ADispatcher:SetSquadron( "SQUADRON_NAME", AIRBASE.Caucasus.Mozdok, { "INGAME GROUP NAME" }, 20 )

-- EXAM_A2ADispatcher:SetSquadronTakeoffInAir( "SQUADRON_NAME" )
-- EXAM_A2ADispatcher:SetSquadronTakeoffFromRunway( "SQUADRON_NAME" )
-- EXAM_A2ADispatcher:SetSquadronTakeoffFromParkingCold( "SQUADRON_NAME" )
EXAM_A2ADispatcher:SetSquadronTakeoffFromParkingHot( "SQUADRON_NAME" )  

-- EXAM_A2ADispatcher:SetSquadronLandingNearAirbase( "SQUADRON_NAME" )
-- EXAM_A2ADispatcher:SetSquadronLandingAtEngineShutdown( "SQUADRON_NAME" )
-- EXAM_A2ADispatcher:SetSquadronLandingNearAirbase( "SQUADRON_NAME" )
EXAM_A2ADispatcher:SetSquadronLandingAtRunway( "SQUADRON_NAME" )

EXAM_A2ADispatcher:SetSquadronGrouping( "SQUADRON_NAME", 2 )
EXAM_A2ADispatcher:SetSquadronOverhead( "SQUADRON_NAME", 1.5 )

SQUADRON_NAME_CAPZone = ZONE:New( "SQUADRON_NAME_CAPZoneName")
--min alt, max alt, min patrol speed, max patrol speed, min engage speed, max engage speed, radio/baro alt
EXAM_A2ADispatcher:SetSquadronCap( "SQUADRON_NAME", SQUADRON_NAME_CAPZone, 4000, 8000, 600, 800, 800, 1200, "RADIO" )
--name, max spawned groups, min time sec, max time sec
EXAM_A2ADispatcher:SetSquadronCapInterval( "SQUADRON_NAME", 2, 30, 120, 1 )

--min speed, max speed
EXAM_A2ADispatcher:SetSquadronGci( "SQUADRON_NAME", 900, 1200 )


