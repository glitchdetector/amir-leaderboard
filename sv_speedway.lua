local CurrentDisplayType = "setText"
local CurrentDisplayTitle = ""
local CurrentDisplayLines = {}
local CurrentDisplayAdUrls = {"ads/ad_2.png", "ads/ad_3.png", "ads/ad_4.png"}

-- Display a list of player times on the leaderboard
-- Times are automatically formatted to a readable format
-- The provided time is in milliseconds, if you have seconds just multiply by 1000
function showPlayerTimes(title, times)
    CurrentDisplayType = "setPlayerTimes"
    CurrentDisplayLines = times
    CurrentDisplayTitle = title
    TriggerClientEvent("speedway:setPlayerTimes", -1, title, times)
end
AddEventHandler("amir-leaderboard:setPlayerTimes", showPlayerTimes)
exports("setPlayerTimes", showPlayerTimes)

-- Display a list of player names on the leaderboard
-- Names are automatically formatted to fit the display
-- If you want to display raw names, use showText instead
function showPlayerNames(title, names)
    CurrentDisplayType = "setPlayerNames"
    CurrentDisplayLines = names
    CurrentDisplayTitle = title
    TriggerClientEvent("speedway:setPlayerNames", -1, title, names)
end
AddEventHandler("amir-leaderboard:setPlayerNames", showPlayerNames)
exports("setPlayerNames", showPlayerNames)

-- Display a list of text lines on the leaderboard
-- There is no validation for text fitting the display
-- Recommended max is 5-6 characters per entry
function showText(title, lines)
    CurrentDisplayType = "setText"
    CurrentDisplayLines = lines
    CurrentDisplayTitle = title
    TriggerClientEvent("speedway:setText", -1, title, lines) 
end
AddEventHandler("amir-leaderboard:setText", showText)
exports("setText", showText)

function setAdUrls(ad1, ad2, ad3)
    CurrentDisplayAdUrls = {ad1, ad2, ad3}
    TriggerClientEvent("speedway:setAdUrls", -1, CurrentDisplayAdUrls)
end
AddEventHandler("amir-leaderboard:setAdUrls", setAdUrls)
exports("setAdUrls", setAdUrls)

RegisterServerEvent("speedway:requestData")
AddEventHandler("speedway:requestData", function()
    local source = source
    TriggerClientEvent("speedway:" .. CurrentDisplayType, source, CurrentDisplayTitle, CurrentDisplayLines)
    TriggerClientEvent("speedway:setAdUrls", source, CurrentDisplayAdUrls)
end)

-- Example use
RegisterCommand("speedway_example", function(source, args, rawCommand)
    -- Can be raw usernames from players, it'll automatically format them to fit the display
    TriggerEvent("amir-leaderboard:setPlayerNames", "5", {
        "Johnathan",
        "Amir",
        "Glitch",
        "Sample",
        "Foo",
        "Bar",
        "Baz",
        "Ambitioneer",
        "VeryLongUsername"
    })
    Wait(10000)
    -- Times in milliseconds, automatically made into mm:ss format
    TriggerEvent("amir-leaderboard:setPlayerTimes", "6", {
        15600,
        25000,
        32000,
        48000,
        51000,
        68000,
        76600,
        95000,
        143982,
    })
    Wait(10000)
    -- Text lines, no validation for fitting the display
    TriggerEvent("amir-leaderboard:setText", "7", {
        "Hello",
        "World",
        "This",
        "Is",
        "A",
        "Test",
        "Of",
        "The",
        "Display"
    })
end, true)