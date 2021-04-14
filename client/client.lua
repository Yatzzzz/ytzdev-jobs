---------------------------YATZZZ--------------------------
ESX = nil
local PlayerLoaded = false

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
    while ESX.PlayerData == nil do
        Citizen.Wait(100)
    end
    ESX.PlayerData = ESX.GetPlayerData()

    if blipstatus == false then
        CreateBlip()
    end
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    PlayerLoaded = true
    Citizen.Wait(4000)
    CreateBlip()
end)

local sleep = 1000

local blipstatus = false

local textstatus = true

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(sleep)
        perform = true
        local ped = PlayerPedId()
        local pedcoords = GetEntityCoords(ped)
        for _,v in pairs(TC) do
            for i = 1, #v.inform, 1 do
               local dst = GetDistanceBetweenCoords(pedcoords, v.inform[i].yer.x, v.inform[i].yer.y, v.inform[i].yer.z, true)
               if textstatus == true then
               if dst <= 8 then
                    if v.inform.MeslekIstek then
                        if ESX.PlayerData.job and ESX.PlayerData.job.name == v.inform.meslek then
                            perform = false
                            DrawText3D(v.inform[i].yer.x, v.inform[i].yer.y, v.inform[i].yer.z, v.inform[i].DrawText)
                        end
                    else
                    perform = false
                    DrawText3D(v.inform[i].yer.x, v.inform[i].yer.y, v.inform[i].yer.z, v.inform[i].DrawText)
                  end
                end
               if dst <= 2 and IsControlJustPressed(0, 38) then
                textstatus = false
                    if v.inform[i].Tipi == "toplama" then
                        if v.inform.meslek == "kasap" then
                        eatprop = CreateObject(GetHashKey('prop_cs_steak'),pedcoords.x, pedcoords.y,pedcoords.z, true, true, true)
                        AttachEntityToEntity(eatprop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0x49D9), 0.15, 0.0, 0.01, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                        karton = CreateObject(GetHashKey('prop_cs_clothes_box'),pedcoords.x, pedcoords.y,pedcoords.z, true, true, true)
                        AttachEntityToEntity(karton, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.13, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
                        LoadDict("anim@heists@ornate_bank@grab_cash_heels")
                        TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
                        FreezeEntityyerition(PlayerPedId(), true)
                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "ytzdev-jobs",
                            duration = v.inform[i].Progressbar.duration,
                            label = v.inform[i].Progressbar.text,
                            useWhileDead = false,
                            canCancel = false,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "",
                                anim = "",
                            },
                            prop = {
                                model = "",
                            }
                        }, function(status)
                            if not status then
                                TriggerServerEvent("ytzdev-jobs:itemal", v.inform.ilkitem, v.inform[i].eklenenItemMiktari, false) 
                                ClearPedTasks(ped)
                                DeleteEntity(karton)
                                DeleteEntity(eatprop)
                                FreezeEntityyerition(ped, false)
                                textstatus = true
                            end
                        end)
                    elseif v.inform.meslek == "maden" then
                        RequestAnimDict("melee@large_wpn@streamed_core")
                            Citizen.Wait(100)
                            TaskPlayAnim(PlayerPedId(), "melee@large_wpn@streamed_core", "ground_attack_on_spot", 8.0, -8.0, -1, 1, 0, false, false, false)
                            SetEntityHeading(ped, 270.0)
                            TriggerServerEvent('InteractSound_SV:PlayOnSource', 'pickaxe', 0.5)
                            pickaxe = CreateObject(GetHashKey("prop_tool_pickaxe"), 0, 0, 0, true, true, true) 
                            AttachEntityToEntity(pickaxe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.18, -0.02, -0.02, 350.0, 100.00, 140.0, true, true, false, true, 1, true)
                            TriggerEvent("mythic_progbar:client:progress", {
                                name = "ytzdev-jobs",
                                duration = v.inform[i].Progressbar.duration,
                                label = v.inform[i].Progressbar.text,
                                useWhileDead = false,
                                canCancel = false,
                                controlDisables = {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                                animation = {
                                    animDict = "",
                                    anim = "",
                                },
                                prop = {
                                    model = "",
                                }
                            }, function(status)
                                if not status then
                                    ClearPedTasks(ped)
                                    DetachEntity(pickaxe, 1, true)
                                    DeleteEntity(pickaxe)
                                    DeleteObject(pickaxe)
                                    textstatus = true
                                         local luck = math.random(1, 250)
                                if luck < 40 then
                                    TriggerServerEvent("ytzdev-jobs:itemal", v.inform.item[1], v.inform[i].eklenenItemMiktari, false) 
                                elseif luck > 50 and luck < 100 then
                                    TriggerServerEvent("ytzdev-jobs:itemal", v.inform.item[2], v.inform[i].eklenenItemMiktari, false) 
                                elseif luck > 150 and luck < 220 then
                                    TriggerServerEvent("ytzdev-jobs:itemal", v.inform.item[3], v.inform[i].eklenenItemMiktari, false) 
                                else
                                    ESX.ShowNotification("Herhangi birşey çıkaramadın!")
                                end
                                end
                            end)
                        else
                            TriggerEvent("mythic_progbar:client:progress", {
                                name = "ytzdev-jobs",
                                duration = v.inform[i].Progressbar.duration,
                                label = v.inform[i].Progressbar.text,
                                useWhileDead = false,
                                canCancel = true,
                                controlDisables = {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                                animation = {
                                    animDict = v.inform[i].Progressbar.animDict,
                                    anim = v.inform[i].Progressbar.anim,
                                },
                                prop = {
                                    model = "",
                                }
                            }, function(status)
                                if not status then
                                    TriggerServerEvent("ytzdev-jobs:itemal", v.inform.ilkitem, v.inform[i].eklenenItemMiktari, false) 
                                    ClearPedTasks(ped)
                                    textstatus = true
                            end
                        end) 
                     end
                    elseif v.inform[i].Tipi == "isleme" then
                            TriggerEvent("mythic_progbar:client:progress", {
                                name = "ytzdev-jobs",
                                duration = v.inform[i].Progressbar.duration,
                                label = v.inform[i].Progressbar.text,
                                useWhileDead = false,
                                canCancel = true,
                                controlDisables = {
                                    disableMovement = true,
                                    disableCarMovement = true,
                                    disableMouse = false,
                                    disableCombat = true,
                                },
                                animation = {
                                    animDict = v.inform[i].Progressbar.animDict,
                                    anim = v.inform[i].Progressbar.anim,
                                },
                                prop = {
                                    model = "",
                                }
                            }, function(status)
                                if not status then
                                TriggerServerEvent("ytzdev-jobs:itemal", v.inform.item, v.inform[i].eklenenItemMiktari, true, v.inform.ilkitem, v.inform.GerekenMiktar)
                                ClearPedTasks(ped)
                                textstatus = true
                            end
                            
                        end)  
                    elseif v.inform[i].Tipi == "satis" then
                        if v.inform.meslek == "maden" then
                            madensatis()
                        else
                        TriggerServerEvent('ytzdev-jobs:satis', v.inform.item, v.inform.kazanc)
                    end
                    end
               end
            end
        end
    end
        if perform then
            sleep = 1000
        end
        if not perform then
            sleep = 7
        end
    end
end)

madensatis = function ()
    ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'satis',
            {
                title    = 'Satış Menüsü',
                elements = {
                    {label = "Elmas", value = "elmas"},
                    {label = "Altın", value = "altin"},
                    {label = "Demir", value = "demir"} 
                }
            },
            function(data, menu)
                if data.current.value == "elmas" then
                    TriggerServerEvent('ytzdev-jobs:satis', "elmas", 5000, "anameslek")
                elseif data.current.value == 'demir' then
                    TriggerServerEvent('ytzdev-jobs:satis', "demir", 1000, "anameslek")
                elseif data.current.value == 'altin' then
                    TriggerServerEvent('ytzdev-jobs:satis', "altin", 4000, "anameslek")
                end
            end,
            function(data, menu)
                menu.close()
            end
        )
end

CreateBlip = function()
    for _,v in pairs(TC) do
        for i = 1, #v.inform, 1 do
            v.inform.blipp = AddBlipForCoord(v.inform[i].blip.coords)
            SetBlipSprite(v.inform.blipp, v.inform[i].blip.sprite)
            SetBlipColour(v.inform.blipp, v.inform[i].blip.color)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.inform[i].blip.name)
            EndTextCommandSetBlipName(v.inform.blipp)
            SetBlipAsShortRange(v.inform.blipp, true)
            blipstatus = true
        end
    end
end

function DrawText3D(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

RegisterNetEvent('textstatus')
AddEventHandler("textstatus", function(changethis)
    textstatus = changethis
end)
---------------------------YATZZZ--------------------------