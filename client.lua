Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)
        local speed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6)
        -- Condition to check if the ped is in a vehicle
        if (IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(math.floor(speed))
        end
    end
end)

CreateThread(function()

    local function ReturnRGB(l) local rgb = {}
        local n = GetGameTimer() / 200
        rgb.r = math.floor(math.sin(n * l + 0) * 127 + 128)
        rgb.g = math.floor(math.sin(n * l + 2) * 127 + 128)
        rgb.b = math.floor(math.sin(n * l + 4) * 127 + 128)
        return rgb
    end

    local rainbowInt = 0


    rainbowInt = ReturnRGB(1.0)
    if selectedThemeRainbow then
        MainColor = {
            r = rainbowInt.r,
            g = rainbowInt.g,
            b = rainbowInt.b,
            a = 255
        }
    end



    while true do
        Wait(1000)

        

        local playerId = PlayerPedId()

        local playerVehicle = GetVehiclePedIsIn(playerId, false)

        if playerVehicle > 0 then
            local rgb = ReturnRGB(1.0)



            local Vehicle--[[ Vehicle ]]  =
            GetVehiclePedIsUsing(
                playerId--[[ Ped ]]
            )

            SetVehicleCustomPrimaryColour(
                Vehicle--[[ Vehicle ]] ,
                rgb.r--[[ integer ]] ,
                rgb.g--[[ integer ]] ,
                rgb.b--[[ integer ]]
            )
            SetVehicleCustomSecondaryColour(Vehicle, rgb.r, rgb.g, rgb.b)



        end


    end



end)