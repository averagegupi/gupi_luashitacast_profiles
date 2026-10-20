local ElementalStaffTable = { -- important
    ['Fire'] = 'Fire Staff',
    ['Earth'] = 'Earth Staff',
    ['Water'] = 'Water Staff',
    ['Wind'] = 'Wind Staff',
    ['Ice'] = 'Aquilo\'s Staff',
    ['Thunder'] = 'Jupiter\'s Staff',
    ['Light'] = 'Light Staff',
    ['Dark'] = 'Pluto\'s Staff'
};

-- OBI LOGIC START --
local DayElementTable = {
    ['Firesday'] = 'Fire',
    ['Earthsday'] = 'Earth',
    ['Watersday'] = 'Water',
    ['Windsday'] = 'Wind',
    ['Iceday'] = 'Ice',
    ['Lightningday'] = 'Thunder',
    ['Lightsday'] = 'Light',
    ['Darksday'] = 'Dark'
};

local ElementalWaistTable = {
	['Earth'] = 'Dorin Obi',
	['Water'] = 'Suirin Obi',
	['Wind'] = 'Furin Obi',
	['Fire'] = 'Karin Obi',
	['Ice'] = 'Hyorin Obi',
	['Thunder'] = 'Rairin Obi',
	['Light'] = 'Korin Obi',
	['Dark'] = 'Anrin Obi'
};

function ObiCheck(spell)
    local element = spell.Element;
    local zone = gData.GetEnvironment();
    
    local badEle = {
        ['Fire'] = 'Water',
        ['Earth'] = 'Wind',
        ['Water'] = 'Thunder',
        ['Wind'] = 'Ice',
        ['Ice'] = 'Fire',
        ['Thunder'] = 'Earth',
        ['Light'] = 'Dark',
        ['Dark'] = 'Light'
    };
    
    local weight = 0;
    
    -- leaving in for debugging purposes
    -- print('day')
    -- print(zone.Day)
    -- print('day compare ')
    -- print(DayElementTable[zone.Day])
    -- print(' spell element of:')
    -- print(element)

    --Day Comparison
    if (DayElementTable[zone.Day] == element) then
        weight = weight + 1;
    elseif (DayElementTable[zone.Day] == badEle[element]) then
        weight = weight - 1;
    end

    -- leaving in for debugging purposes
    -- print('weather')
    -- print(zone.Weather)
    -- print(element)
    -- print(string.find(zone.Weather, 'x2'))

    --Weather Comparison
    if string.find(zone.Weather, element) then
        if string.find(zone.Weather, 'x2') then
            weight = weight + 2;
        else
            weight = weight + 1;
        end
    elseif string.find(zone.Weather, badEle[element]) then
        if string.find(zone.Weather, 'x2') then
            weight = weight - 2;
        else
            weight = weight - 1;
        end
    end    
    
    return weight;
	
end

-- OBI LOGIC END --

local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
skillz = gFunc.LoadFile('common\\skillz.lua');
conq = gFunc.LoadFile('common\\conquest.lua')

--[[ Template for any new sets you want to build
        Main = '',
        Sub = '',
        Range = '',
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
--]]

local sets = {
    Idle = { -- idle
        Main = 'Earth Staff',
        Body = 'Royal Cloak',

    },
    Resting = { -- rest gear
        Main = 'Pluto\'s Staff',
        Neck = 'Checkered Scarf',
        -- Body = 'Seer\'s Tunic',
        Waist = 'Reverend Sash',
    },
    Town = {
        Head = 'Wizard\'s Petasos',
        Body = 'Ducal aketon',
    },
    Dt = {
    },
    Tp_Default = {
    },
    -- TODO: check how much MP is being lost from idle, and try to swap accordingly
    Precast = { -- TODO: fix this when 75. For now this will be patching for constant gear updates
        Ammo = 'Phtm. Tathlum',
        -- Head = 'Nashira Turban',
        Head = 'Wizard\'s Petasos', -- seers/justa here to swap out from vermy
        Body = 'Justaucorps',
        Neck = 'Checkered Scarf',
        Ear1 = 'Cunning Earring',
        -- Hands = 'Blessed Mitts',
        -- Waist = 'Swift Belt',
        -- Legs = 'Blessed trousers',
        Feet = 'Wizard\'s Sabots',
        -- Feet = 'Rostrum Pumps',
        -- Feet = 'Healer\'s Duckbills',
    },
    Midcast = { -- SIRD or evasion
        Head = 'Nashira Turban',
        Neck = 'Willpower Torque',
        Feet = 'Wizard\'s Sabots',
    },
    Cure = {
        Main = 'Light Staff',
        Feet = 'Mannequin Pumps',
    },
    Cursna = {
    },
    Enhancing = {
        Neck = 'Enhancing Torque',
        Back = 'Merciful Cape',
    },
    Stoneskin = {
    },
    Phalanx = {
    },
    Enfeebling = {
        Body = 'Wizard\'s Coat',
        Neck = 'Enfeebling Torque',
        Feet = 'Mannequin Pumps',
    },
    Dark = { -- Dark magic set
        Neck = 'Dark Torque', -- 7
        Ear1 = 'Morukaka Earring', -- crank the hp up so I'm getting the most value out of amount drained
        Ear2 = 'Abyssal Earring', -- 5
        Ring1 = 'Snow Ring', -- 0
        Ring2 = 'Snow Ring', -- 0 swapped for drain/aspir for overlords ring
        Back = 'Merciful Cape', -- 5
        -- Waist = 'Steppe Sash', -- 60 (hp)
        Legs = 'Wizard\'s Tonban', -- 15
    },
    Nuke = { --set for general nuking
        Head = 'Wizard\'s Petasos',
        Neck = 'Checkered Scarf',
        Body = 'Justaucorps',
        Hands = 'Wizard\'s Gloves',
        Legs = 'Seer\'s Slacks',
    },
    Ws_Default = {},
    Movement = {},
};

profile.Sets = sets;
profile.Packer = {};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 2');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 5');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 91');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    local game = gData.GetEnvironment();

    gFunc.EquipSet(sets.Idle);
    if (game.Time < 6.00) or (game.Time > 18.00) then -- nighttime

    else -- daytime
        if(player.HPP < 99) then
            gFunc.Equip('Hands', 'Garden Bangles')
        end

    end

    if (player.Status == 'Engaged') then --here are you checks for engaged, resting, or running
        gFunc.EquipSet(sets.Tp_Default)
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    -- elseif (player.IsMoving == true) then --commented this out for now, I don't think BLM get any movement speed %+ items?
	-- 	gFunc.EquipSet(sets.Movement);
    end
    gcinclude.CheckDefault ();
end

profile.HandleAbility = function() --conditional gear swaps based on ability used, if needed
    gcinclude.CheckCancels();
end

profile.HandleItem = function() --conditional gear swaps based on item used, if needed
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();

        gFunc.EquipSet(sets.Precast)

        gcinclude.CheckCancels();
    end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local obiValue

        if (spell.Skill == 'Enhancing Magic') then --general enhancing
            gFunc.EquipSet(sets.Enhancing);
                if string.match(spell.Name, 'Phalanx') then
                    gFunc.EquipSet(sets.Phalanx);
                elseif string.match(spell.Name, 'Stoneskin') then
                    gFunc.EquipSet(sets.Stoneskin);
                -- elseif string.contains(spell.Name, 'Regen') then
                --     gFunc.EquipSet(sets.Regen);
                end

        elseif (spell.Skill == 'Healing Magic') then
            gFunc.EquipSet(sets.Cure);
            if string.match(spell.Name, 'Cursna') then
            gFunc.EquipSet(sets.Cursna);
            end

        elseif (spell.Skill == 'Elemental Magic') then
            gFunc.EquipSet(sets.Nuke);
            gFunc.Equip('main', ElementalStaffTable[spell.Element]); -- important
            -- if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then -- TODO: ELE OBI BLOCK
            --     gFunc.Equip('Waist', 'Hachirin-no-Obi');
            -- end
            -- if string.match(spell.Name, 'helix') then -- TODO: If SCH comes out
            --     gFunc.EquipSet(sets.Helix);
            --     if (gcdisplay.GetToggle('Burst') == true) then
            --         gFunc.EquipSet(sets.Burst);
            --     end
            -- end
            obiValue = ObiCheck(spell);
            if obiValue >= 1 then
                gFunc.Equip('Waist', ElementalWaistTable[spell.Element]);
            end
            if spell.MppAftercast <= 50 then
                gFunc.Equip('Neck', 'Uggalepih Pendant');
            end
            if (conq:GetInsideControl()) then
                -- print('Testing; Nuking while inside region controlled by current nation - Circlet ON')
                gFunc.Equip('Head', 'Republic Circlet')
            end
        elseif (spell.Skill == 'Enfeebling Magic') then
            gFunc.EquipSet(sets.Enfeebling);
            gFunc.Equip('main', ElementalStaffTable[spell.Element]);
        elseif (spell.Skill == 'Dark Magic') then
            gFunc.EquipSet(sets.Dark);
            gFunc.Equip('main', ElementalStaffTable[spell.Element]);
        end
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        gFunc.EquipSet(sets.Ws_Default)
    end
end

return profile;