local CurrentWeather = "CLEAR"
local blackout = false
local baseTime = 0
local timeOffset = 0
local freezeTime = false


function SetWeatherAndNotify(weatherType, isBlackout)
    CurrentWeather = weatherType
    blackout = isBlackout
    TriggerClientEvent('vSync:updateWeather', -1, CurrentWeather, blackout)
    print(("[vSync] Weather changed to %s | Blackout: %s"):format(CurrentWeather, blackout and "ON" or "OFF"))
end

local stages = {
    {time = 1800, weather = "CLOUDS", blackout = false},
    {time = 900, weather = "RAIN",    blackout = false},
    {time = 300,  weather = "THUNDER", blackout = true}
}

RegisterNetEvent("txAdmin:events:scheduledRestart")
AddEventHandler("txAdmin:events:scheduledRestart", function(eventData)
    local json = require "json"
    local data = type(eventData) == "string" and json.decode(eventData) or eventData
    local secondsLeft = data.secondsRemaining or 300
    print(("[vSync] Scheduled restart in %d seconds"):format(secondsLeft))

    for _, stage in ipairs(stages) do
        if secondsLeft >= stage.time then
            SetWeatherAndNotify(stage.weather, stage.blackout)
            break
        end
    end

    TriggerClientEvent('vSync:updateTime', -1, base, offset, freeze)
end)

RegisterNetEvent("txAdmin:events:skippedNextScheduledRestart")
AddEventHandler("txAdmin:events:skippedNextScheduledRestart", function(eventData)
    print("[vSync] Restart skipped. Reverting weather to CLEAR.")
    SetWeatherAndNotify("CLEAR", false)
end)
