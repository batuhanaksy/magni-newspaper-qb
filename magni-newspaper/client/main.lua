if Config.Version == "new" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Version == "old" then
    QBCore = nil
    Citizen.CreateThread(function()
        while QBCore == nil do
            TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
    end)  
end

CreateThread(function()
    if Config.UseTarget then
        exports[Config.Target]:AddTargetModel(Config.Props, {
            options = {
                {
                    icon = "fa-solid fa-newspaper",
                    label = "News Paper",
                    action = function()
                        OpenNewsPaper()
                    end
                },
            },
            distance = 2.5
        })
    end
end)

RegisterNetEvent("magni-newspaper:open", function()
    OpenNewsPaperEdit()
end)

RegisterNetEvent("magni-newspaper:open2", function()
    OpenNewsPaper()
end)

function OpenNewsPaper()
    QBCore.Functions.TriggerCallback('magni-newspaper:server:page', function(cb)
        for _, v in pairs(cb) do
            SendNUIMessage({
                action = 'open',
                fpheader = v.firstpage_header,
                fpnews = v.firstpage,
                spheader = v.secondpage_header,
                spnews = v.secondpage,
                tpheader = v.thirdpage_header,
                ss = v.firstpagephoto,
                ss1 = v.secondpagephoto,
                ss2 = v.thirdpagephoto,
                time = v.time,
                tpnews = v.thirdpage
            })
            SetNuiFocus(true, true)
            startAnim()
        end
    end)
end

function OpenNewsPaperEdit()
    QBCore.Functions.TriggerCallback('magni-newspaper:server:page', function(cb)
        for _, v in pairs(cb) do
            SendNUIMessage({
                time = v.time,
                action = 'edit'
            })
            SetNuiFocus(true, true)
        end
    end)
end

RegisterNUICallback("firstpage", function(data)
    TriggerServerEvent("magni-newspaper:firstpage", data)
end)

RegisterNUICallback("secondpage", function(data)
    TriggerServerEvent("magni-newspaper:secondpage", data)
end)

RegisterNUICallback("thirdpage", function(data)
    TriggerServerEvent("magni-newspaper:thirdpage", data)
end)

RegisterNUICallback("close", function()
    stopAnim()
    SetNuiFocus(false, false)
end)

function startAnim()
    Citizen.CreateThread(function()
        RequestAnimDict("missfam4")
        while not HasAnimDictLoaded("missfam4") do
          Citizen.Wait(0)
        end
        attachObject()
        TaskPlayAnim(PlayerPedId(), "missfam4", "base", 3.0, 2.0, -1, 33, 0.0, false, false, false)
    end)
end

function attachObject()
    newspaper = CreateObject(GetHashKey("prop_cliff_paper"), 0, 0, 0, true, true, true)
    AttachEntityToEntity(newspaper, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.26, 0.06, 0.16, 320.0, 310.0, 0.0, true, true, false, true, 1, true)
end

function stopAnim()
    StopAnimTask(PlayerPedId(), "missfam4", "base", 3.0, 2.0, -1, 33, 0.0, false, false, false)
    DeleteEntity(newspaper)
end