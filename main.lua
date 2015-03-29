scriptId = 'com.thalmic.examples.virtual-alphabet'
scriptTitle = "Virtual Alphabet"
scriptDetailsUrl = ""

unlockcheck = false
movementcheck = false

function onForegroundWindowChange(app, title)
    myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    return true
end

function onPoseEdge(pose, edge)  
    myo.debug("onPoseEdge: " .. pose .. ": " .. edge)

    if (edge == "on") then
        if (pose == "doubleTap") then
            onUnlock()
        elseif (pose == "fist") then
            onFist()
        elseif (pose == "fingersSpread") then
            onFingersSpread()    
        -- elseif (pose == "waveIn") then
        --     onWaveIn()  
        -- elseif (pose == "waveOut") then
        --     onWaveOut()          
        end
    end
end

-- No vibrate because locking and unlocking already vibrate the myo
function onUnlock()
    if (unlockcheck == false) then
        myo.unlock("hold")
        unlockcheck = true
    elseif (unlockcheck == true) then
        myo.lock("hold")
        unlockcheck = false
    end
end

function onFist()
    if (movementcheck == false) then
        myo.vibrate("short")
        myo.vibrate("short")
        myo.controlMouse(true)
        movementcheck = true
    elseif (movementcheck == true) then
        myo.vibrate("short")
        myo.vibrate("short")
        myo.vibrate("short")
        myo.controlMouse(false)
        movementcheck = false
    end  
end

function onFingersSpread()
    myo.vibrate("short") 
    myo.mouse("left", "click")
end  

-- function onWaveIn() 
-- end

-- function onWaveOut()  
-- end