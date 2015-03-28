scriptId = 'com.thalmic.examples.letters'
scriptTitle = "Letters"
scriptDetailsUrl = ""

function onForegroundWindowChange(app, title)
	myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
	--if (title == ) then
		return true
	--else
	--	return false
	--end
end

function onPoseEdge(pose, edge)  
    myo.debug("onPoseEdge: " .. pose .. ": " .. edge)

    if (edge == "on") then
        if (pose == "waveOut") then
            onWaveOut()     
        elseif (pose == "waveIn") then
            onWaveIn()
        elseif (pose == "fist") then
            onFist()
        elseif (pose == "fingersSpread") then
            onFingersSpread()           
        end
    end
end

function onWaveOut()  
end

function onWaveIn()  
end

function onFist()  
    myo.controlMouse(true)
end

function onFingersSpread()  
    myo.controlMouse(false)
end  