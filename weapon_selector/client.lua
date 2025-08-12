local currentWeaponIndex = 1
local mountedWeapons = {}
local displayWeaponNameUntil = 0
local currentWeaponName = ""

local knownVehicleWeapons = {
    `VEHICLE_WEAPON_TANK`,
    `VEHICLE_WEAPON_SPACE_ROCKET`,
    `VEHICLE_WEAPON_PLAYER_LASER`,
    `VEHICLE_WEAPON_PLAYER_BULLET`,
    `VEHICLE_WEAPON_PLAYER_BUZZARD`,
    `VEHICLE_WEAPON_PLAYER_HUNTER`,
    `VEHICLE_WEAPON_PLAYER_SAVAGE`,
    `VEHICLE_WEAPON_DOGFIGHTER_MG`,

    --aby wstawic bron musisz zdobyc nazwy plikow uzbrojenia, takie cos jak wszedzie indziej. robisz to w tym gownie pod esc. zostawiasz laser na dole i sie tego nie tykasz, bo skrypt latwo jest wyebac
    
    --tampa
    
    `VEHICLE_WEAPON_TAMPA_MISSILE`,
    `VEHICLE_WEAPON_TAMPA_FIXEDMINIGUN`,
    `VEHICLE_WEAPON_TAMPA_DUALMINIGUN`,
    `VEHICLE_WEAPON_TAMPA_MORTAR`,
    
    --su57
    
    `VEHICLE_WEAPON_SU57_SAAM_ROCKET`,
    `VEHICLE_WEAPON_SU57_GUN`,
    `VEHICLE_WEAPON_SU57_ROCKET`,
    
    --f22
    
    `VEHICLE_WEAPON_F22_4AAM_ROCKET`,
    `VEHICLE_WEAPON_F22_GUN`,
    `VEHICLE_WEAPON_F22_ROCKET`,
    `VEHICLE_WEAPON_FB22_JDAM`,
    
    --F14
    
    `VEHICLE_WEAPON_F14D_AIM7`,
    `VEHICLE_WEAPON_F14A_AIM54`,
    `VEHICLE_WEAPON_F14D_GUN`,
    `VEHICLE_WEAPON_F14D_AIM9`,

   --mig29
    
    `VEHICLE_WEAPON_MIG29_SAAM_ROCKET`,
    `VEHICLE_WEAPON_MIG29_GUN`,
    `VEHICLE_WEAPON_MIG29_ROCKET`,
    
    --rafale
    
    `VEHICLE_WEAPON_RAFALE_GBU24`,
    `VEHICLE_WEAPON_RAFALE_AASM`,
	`VEHICLE_RAFALE_MICAEM`,
    `VEHICLE_RAFALE_TYPE25`,
    `VEHICLE_WEAPON_RAFALE_SCALPEG`,
	`VEHICLE_WEAPON_PLAYER_LAZER`,
    
    --f/a18
    
    `VEHICLE_FA18F_FLARE`,
    `VEHICLE_WEAPON_FA18F_AMRAAM`,
    `VEHICLE_WEAPON_FA18F_HARM_ROCKE`,
    `VEHICLE_WEAPON_FA18F_GUN`,
    `VEHICLE_WEAPON_FA18F_PAVEWAY`,
    `VEHICLE_WEAPON_FA18F_ROCKET`,
   
    --gripen
    
 	`VEHICLE_WEAPON_GRPN_METEOR`,
    `VEHICLE_WEAPON_GRPN_GUN`,
    `VEHICLE_WEAPON_GRPN_IRIS`,
    `VEHICLE_WEAPON_GRPN_TAURUS`,
    
    --frogfoot
    
    `VEHICLE_WEAPON_SU25_BARRAGE`,
    `VEHICLE_WEAPON_SU25_BOMB`,
    `VEHICLE_WEAPON_SU25_CANNON`,
    `VEHICLE_WEAPON_SU25_ROCKET`,
    `VEHICLE_WEAPON_SU25_MGP`,
    
    --flanker
    
    `VEHICLE_WEAPON_SU37M2_ROCKET`,
    `VEHICLE_WEAPON_TERMI_GUN`,
    `VEHICLE_WEAPON_SU37M_ROCKET`,
    
    --a10c
    `VEHICLE_WEAPON_A10C_AGM65`,
    `VEHICLE_WEAPON_WARTHOG_GUN`,
    `VEHICLE_WEAPON_A10C_AIM9`,
    `VEHICLE_WEAPON_A10C_AGM65`,
    `VEHICLE_WEAPON_A10C_UGB`,
    
    
    --eurofighter
    `VEHICLE_WEAPON_METEOR`,
    `VEHICLE_WEAPON_TYPN_GUN`,
    `VEHICLE_WEAPON_IRIS_ROCKET`,
    `VEHICLE_WEAPON_TYPN_PAVEWAY`,
   
    
    --f16c
    `VEHICLE_WEAPON_F16C_4AAM_ROCKET`,
    `VEHICLE_WEAPON_F16C_HARM_ROCKET`,
    `VEHICLE_WEAPON_F16C_GUN`,
    `VEHICLE_WEAPON_F16C_ROCKET`,
    `VEHICLE_WEAPON_F16C_PAVEWAY`,
    
    
    --mirage2k
    `VEHICLE_WEAPON_exocet`,
    `VEHICLE_WEAPON_mir2k_GUN`,
    `VEHICLE_WEAPON_mslf_ROCKET`,
    `VEHICLE_WEAPON_mir2k_PAVEWAY`,
    
    --blackhawk
    `VEHICLE_WEAPON_UH60V_MISSILE`,
    `VEHICLE_WEAPON_UH60V_BARRAGE`,
    `VEHICLE_WEAPON_UH60V_CANNON`,
    
    --ah1z
    `VEHICLE_WEAPON_AH1Z_MISSILE`,
    `VEHICLE_WEAPON_AH1Z_AIM9`,
    `VEHICLE_WEAPON_AH1Z_BARRAGE`,
    `VEHICLE_WEAPON_AH1Z_CANNON`,
    
    --su33
    `VEHICLE_WEAPON_SU33M2_ROCKET`,
    `VEHICLE_WEAPON_FLAND_GUN`,
    `VEHICLE_WEAPON_SU33M_ROCKET`,
    
    --su30
    `VEHICLE_WEAPON_SAAM_ROCKET`,
    `VEHICLE_WEAPON_su30sm_GUN`,
    `VEHICLE_WEAPON_SU30MSL_ROCKET`,
    
    --									POJAZDY NAZIEMNE
    --_________________________________________________________________________________________________________--
  		
    
    --Abrams
    
    `VEHICLE_WEAPON_M1A2_CANNON`,
    `VEHICLE_WEAPON_M1A2_CANNON_APFSDS`,
    `VEHICLE_WEAPON_M1A2_MG`,
    
    --t72
    
    `VEHICLE_WEAPON_T90A_CANNON`,
    `VEHICLE_WEAPON_T72B3M_MG`,
    
    --armata
    
    `VEHICLE_WEAPON_TANK_ARMATA`,
    `VEHICLE_WEAPON_ARMATA_MG`,
    
    --k2
    
    `VEHICLE_WEAPON_K2_CANNON`,
    `VEHICLE_WEAPON_Leo2A7_APFSDS`,
    `VEHICLE_WEAPON_LEOPARD2_MG`,
    `VEHICLE_WEAPON_LEOPARD_MG`,
    
    --bmp2
    `VEHICLE_WEAPON_TURRET_BMP2M`,
    `VEHICLE_WEAPON_BMP2M_MISSILE`,
    
    --bradley
    `VEHICLE_WEAPON_TURRET_BRADLEY`,
    `VEHICLE_WEAPON_TOW`,
    
    --himars
    
    `VEHICLE_WEAPON_ARTILLERY`,
    `VEHICLE_WEAPON_SMOKEARTY`,
    `VEHICLE_WEAPON_HIMARS`,
    
    --puma
    
    `VEHICLE_WEAPON_PUMA_CANNON`,
    `VEHICLE_WEAPON_MELLS`,
    
    --k9
    
    `VEHICLE_WEAPON_K9THUNDER_CANNON`,
    
    --ka52
    
    `VEHICLE_WEAPON_MI28_MISSILE`,
    `VEHICLE_WEAPON_MI28_BARRAGE`,
    `VEHICLE_WEAPON_MI28_CANNON`,
    
    --mi24
    
    `VEHICLE_WEAPON_MI24P_CANNON`,
    `VEHICLE_WEAPON_MI24P_MISSILE`,
    `VEHICLE_WEAPON_MI24P_BARRAGE`,
    `VEHICLE_WEAPON_MI24P_MG`,
    
    --tigr
    
    `VEHICLE_WEAPON_TURRET_BTR82A`,
    `VEHICLE_WEAPON_BTR82A_GL`,
    `VEHICLE_WEAPON_BTR82A_MG`,
    
    --lerc
    
    `VEHICLE_WEAPON_LECLERC_CANNON`,
    `VEHICLE_WEAPON_LECLERC_CANNON_APFSDS`,
    `VEHICLE_WEAPON_LECLERC_MG`,
    
    --havenger
    `VEHICLE_WEAPON_HMMWV`,
    `VEHICLE_WEAPON_HMMWV_MISSILE`,

    
    
    --ending value nie wstawiac ponizej, bo skrypt sie wyebie
  	`VEHICLE_WEAPON_ENEMY_LASER` 
}

-- Pobiera nazwę broni (bezpiecznie)
function GetWeaponName(weaponHash)
    local hudStats = GetWeaponHudStats(weaponHash)
    if hudStats ~= nil and type(hudStats) == "table" and hudStats.label ~= nil then
        return GetLabelText(hudStats.label)
    end
    return "Broń: " .. tostring(weaponHash)
end

-- UI z nazwą broni
function DrawWeaponNameUI(text)
    SetTextFont(0)
    SetTextScale(0.5, 0.5)
    SetTextCentre(true)
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.5, 0.8)
end

-- Cache zamontowanych broni (wywołane raz po wejściu do pojazdu)
function CacheMountedWeapons(vehicle)
    local player = PlayerPedId()
    mountedWeapons = {}

    for _, weapon in ipairs(knownVehicleWeapons) do
        if SetCurrentPedVehicleWeapon(player, weapon) then
            table.insert(mountedWeapons, weapon)
        end
    end

    if #mountedWeapons > 0 then
        SetCurrentPedVehicleWeapon(player, mountedWeapons[1])
        currentWeaponIndex = 1
        currentWeaponName = GetWeaponName(mountedWeapons[1])
        displayWeaponNameUntil = GetGameTimer() + 3000
    else
        currentWeaponName = ""
    end
end

-- Przełączanie broni
function CycleVehicleWeapons()
    if #mountedWeapons == 0 then return end

    currentWeaponIndex = (currentWeaponIndex % #mountedWeapons) + 1
    local player = PlayerPedId()
    local newWeapon = mountedWeapons[currentWeaponIndex]

    if SetCurrentPedVehicleWeapon(player, newWeapon) then
        currentWeaponName = GetWeaponName(newWeapon)
        displayWeaponNameUntil = GetGameTimer() + 3000
    end
end

-- Wątek detekcji wejścia/wyjścia z pojazdu
Citizen.CreateThread(function()
    local wasInVehicle = false

    while true do
        Wait(200)
        local player = PlayerPedId()
        local inVehicle = IsPedInAnyVehicle(player, false)

        if inVehicle and not wasInVehicle then
            local vehicle = GetVehiclePedIsUsing(player)
            CacheMountedWeapons(vehicle)
        elseif not inVehicle and wasInVehicle then
            mountedWeapons = {}
            currentWeaponIndex = 1
            currentWeaponName = ""
            displayWeaponNameUntil = 0
        end

        wasInVehicle = inVehicle
    end
end)

-- Wątek obsługujący przycisk i rysowanie UI
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 73) then -- X
            CycleVehicleWeapons()
        end

        if GetGameTimer() < displayWeaponNameUntil and currentWeaponName ~= "" then
            DrawWeaponNameUI(currentWeaponName)
        end
    end
end)
