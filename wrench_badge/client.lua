local badgeexists = false
local badgeProp = nil

local function flashbadge()
    TriggerServerEvent("Create_baxbadge", PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), GetPlayerServerId(PlayerId()))
end

exports("usedbadge", function()
    flashbadge()
end)

RegisterNetEvent("bax_badge:created", function(ped)
      CreateThread(function ()
        local coords = GetEntityCoords(ped)
        local badgeProp = CreateObject(GetHashKey("prop_fib_badge"), coords.x, coords.y, coords.z + 0.2, true, true, true)
        AttachEntityToEntity(badgeProp, ped, GetPedBoneIndex(ped, 28422), 0.065, 0.029, -0.035, 80.0, -1.90, 75.0, true, true, false, true, 1, true)
        RequestAnimDict('paper_1_rcm_alt1-9')
      while HasAnimDictLoaded("paper_1_rcm_alt1-9") == false do
        RequestAnimDict('paper_1_rcm_alt1-9')
        Wait(0)
      end
      RequestAnimDict('paper_1_rcm_alt1-9')
      TaskPlayAnim(ped, 'paper_1_rcm_alt1-9', 'player_one_dual-9', 8.0, -8, 10.0, 49, 0, 0, 0, 0)
      Wait(3000)
      DeleteObject(badgeProp)
      ClearPedSecondaryTask(ped)
    end)
end)
