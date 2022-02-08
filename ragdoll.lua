--[[


 ▄▄▄▄    ██▀███   ▒█████   ██ ▄█▀▓█████  ███▄    █ 
▓█████▄ ▓██ ▒ ██▒▒██▒  ██▒ ██▄█▒ ▓█   ▀  ██ ▀█   █ 
▒██▒ ▄██▓██ ░▄█ ▒▒██░  ██▒▓███▄░ ▒███   ▓██  ▀█ ██▒
▒██░█▀  ▒██▀▀█▄  ▒██   ██░▓██ █▄ ▒▓█  ▄ ▓██▒  ▐▌██▒
░▓█  ▀█▓░██▓ ▒██▒░ ████▓▒░▒██▒ █▄░▒████▒▒██░   ▓██░
░▒▓███▀▒░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒ ▒▒ ▓▒░░ ▒░ ░░ ▒░   ▒ ▒ 
▒░▒   ░   ░▒ ░ ▒░  ░ ▒ ▒░ ░ ░▒ ▒░ ░ ░  ░░ ░░   ░ ▒░
 ░    ░   ░░   ░ ░ ░ ░ ▒  ░ ░░ ░    ░      ░   ░ ░ 
 ░         ░         ░ ░  ░  ░      ░  ░         ░ 
      ░                                                 


]]--

local PlayerData = {}
local PlayerRagdoll = false

--[[ This is for ESX, if you don't use it, remove the lines below ]]--
ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local entityAlpha = GetEntityAlpha(GetPlayerPed(-1))
        if entityAlpha < 100 then
            Citizen.Wait(0)
        else
            if PlayerRagdoll and IsControlJustReleased(1, 22) then
                PlayerRagdoll = not PlayerRagdoll
            end
            if PlayerRagdoll then
                if ESX == "nil" then
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ for getting up!")
                    SetPedRagdollForceFall(player)
                    ResetPedRagdollTimer(player)
                    SetPedToRagdoll(player, 1000, 1000, 3, 0, 0, 0)
                    ResetPedRagdollTimer(player)
                else
                    -- You can add your notify system (mythic notification or just the fivem base)
                    SetPedRagdollForceFall(player)
                    ResetPedRagdollTimer(player)
                    SetPedToRagdoll(player, 1000, 1000, 3, 0, 0, 0)
                    ResetPedRagdollTimer(player)
            end
        end    
    end
end)

-- Key register for the ragdoll
RegisterCommand('+ragdoll', function()
	PlayerRagdoll = not PlayerRagdoll
end, false)
RegisterKeyMapping('+ragdoll', 'Ragdoll Keybind', 'keyboard', 'k')
