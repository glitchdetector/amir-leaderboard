function EnsureModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
end

CreateThread(function()
    print("Loading Amir Speedway Sign...")
    EnsureModel("amir_speedway_led")
    DuiObject = CreateDui("nui://amir-leaderboard/speedway.html", 512, 512)
    local timeout = GetNetworkTime()
    while not IsDuiAvailable(DuiObject) and GetNetworkTime()-timeout < 6000 do
        Citizen.Wait(0)
    end
    print("Loaded Amir Speedway Sign!")
    local txd = CreateRuntimeTxd('amir_speedway_sign')
    local dui = GetDuiHandle(DuiObject)
    local tx = CreateRuntimeTextureFromDuiHandle(txd, "amir_speedway_led", dui)
    AddReplaceTexture('amir_speedway_led', 'amir_speedway_led', 'amir_speedway_sign', "amir_speedway_led")

    RegisterNetEvent("speedway:setPlayerTimes", function(title, players)
        SendDuiMessage(DuiObject, json.encode({
            type = "playerTimes",
            title = title,
            players = players
        }))
    end)
    RegisterNetEvent("speedway:setPlayerNames", function(title, players)
        SendDuiMessage(DuiObject, json.encode({
            type = "playerNames",
            title = title,
            players = players
        }))
    end)
    RegisterNetEvent("speedway:setText", function(title, players)
        SendDuiMessage(DuiObject, json.encode({
            type = "playerText",
            title = title,
            players = players
        }))
    end)
    RegisterNetEvent("speedway:setAdUrls", function(urls)
        SendDuiMessage(DuiObject, json.encode({
            type = "ads",
            url = urls,
        }))
    end)

    -- Load the data whenever the player gets close enough
    while true do
        Wait(0)
        local pos = GetEntityCoords(PlayerPedId())
        local dist = #(pos - vector3(-2869.0178, 8427.412, 87.68421))
        if dist < 1500.0 then
            TriggerServerEvent("speedway:requestData")
            break
        else
            Wait(30000)
        end
    end
end)