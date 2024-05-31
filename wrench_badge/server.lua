RegisterNetEvent("Create_baxbadge", function(ped, boneIndex, playerid)
    TriggerClientEvent("bax_badge:created", -1, ped)
end)