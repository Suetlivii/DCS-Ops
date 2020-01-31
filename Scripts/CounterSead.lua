----------------------------------------------------
--CounterSead script
--Moose Dependent 
--Script will detect antiradiation missiles and turn target radar off. After some time it will turn it on back
--
--How to use:
--Create new object of the CounterSead class for each group prefix, then :Start() the process
--
--      NewCounterSeadObject = CounterSead:NEW( GroupPrefix, MinOffTime, MaxOffTime, isMoving )
--      NewCounterSeadObject:Start()
--
--Example: 
--      RedCounterSead = CounterSead:NEW( {"RU SAM SA-2"}, 45, 90, true)
--      RedCounterSead:Start()


--Global Methods
CounterSead = {}

function CounterSead:NEW( _groupPrefix, _minOffTime, _maxOffTime, _isMoving )
    newObj = 
    {
        groupPrefix = _groupPrefix,
        minOffTime = _minOffTime,
        maxOffTime = _maxOffTime,
        isMoving = _isMoving
    }
    self.__index = self
    return setmetatable(newObj, self)  
end

function CounterSead:Start()

end


--PrivateMethods

--List of all antiradiation missile
CounterSeadAntiradMissiles = 
{
    "AGM-88C",
    "KH-25MPU",
    "AGM-45A",
    "AGM-45B"
}

function CounterSead:StartDefence()

end
