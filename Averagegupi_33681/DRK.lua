local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
skillz = gFunc.LoadFile('common\\skillz.lua');

local sets = {
    Idle = {
        Neck = 'Parade Gorget',
        Body = 'Vampire Cloak',
        Hands = 'Chs. Gauntlets +1',
        -- Ring1 = 'Electrum Ring',
        -- Ring2 = 'Fasting Ring',
        -- Back ='Gigant Mantle',
        Feet = 'Chs. Sollerets +1',
    },
    Resting = {
        Neck ='Checkered Scarf',
    },
    Town = {
        Head = 'Homam Zucchetto',
        Body = 'Ducal aketon',
    },
    Solo = {
        Head = 'Optical Hat',
        Neck = 'Parade Gorget',
        Body = 'Scorpion Harness',
        Hands = 'Dusk Gloves',
        Ear2 = 'Ethereal Earring',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Jelly ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Chs. Sollerets +1',
    },
    whoami = {
        Head = 'Homam Zucchetto',
        Neck = 'Parade Gorget',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Abyss cuirass',
        Hands = 'Abyss gauntlets',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Phalanx ring',
        Back = 'Fed. Army Mantle',
        Waist = 'Swift Belt',
        Legs = 'Chaos Flanchard',
        Feet = 'Chs. Sollerets +1',
    },
    Tp_Default = {
        Head = 'Homam Zucchetto',
        Neck = 'Prudence Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Haubergeon',
        Hands = 'Dusk Gloves',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Dusk Ledelsens',
    },
    Tp_DW = {
        Head = 'Homam Zucchetto',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
        Body = 'Haubergeon',
        Hands = 'Dusk Gloves',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Abyss Cape',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Dusk Ledelsens',
    },
    Precast = {
        Head = 'Homam Zucchetto',
        Neck = 'Willpower Torque',
        Ear1 = 'Loquac. Earring',
        Hands = 'Dusk Gloves',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Dusk Ledelsens',
        Back = 'Abyss Cape',
    },
    Cure = {
        Neck = 'Justice badge',
        Ring1 = 'Saintly Ring',
        Ring2 = 'Saintly Ring',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Abyss Flanchard',
        Feet = 'Chs. Sollerets +1',
    },
    Enhancing = {},
    Dread_Spikes = {}, --max out HP+ at cast to boost effect
    Enfeebling = {
        Head = 'Homam Zucchetto',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Cunning Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Chaos Cuirass',
        Hands = 'Abyss Gauntlets',
        Ring1 = 'Diamond Ring',
        Ring2 = 'Diamond Ring',
        Back = 'Abyss Cape',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Chaos Flanchard',
        Feet = 'Abyss Sollerets',
    },
    Dark = {
        Head = 'Chs. Burgeonet +1',
        Neck = 'Prudence Torque',
        Ear1 = 'Cunning Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Ryl.Sqr. Robe',
        Hands = 'Abyss Gauntlets',
        Ring1 = 'Diamond Ring',
        Ring2 = 'Diamond Ring',
        Back = 'Abyss Cape',
        Waist = 'Swift Belt',
        Legs = 'Abyss Flanchard',
    },
    Absorb = { --TODO
        Hands = 'Black Gadlings',
        Legs = 'Black Cuisses',
        Feet = 'Black Sollerets',
    },
    Nuke = {
        Head = 'Demon helm',
        Neck = 'Prudence torque',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Abyss Cuirass',
        Hands = 'Abyss Gauntlets',
        Ring1 = 'Diamond Ring',
        Ring2 = 'Diamond Ring',
        Back = 'Abyss Cape',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Chaos Flanchard',
        Feet = 'Abyss Sollerets',
    },

    Preshot = {
    },
    Midshot = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Chaos Cuirass',
        Hands = 'Irn.Msk. Gauntlets',
        Ring1 = 'Coral Ring',
        Ring2 = 'Coral Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Tracker\'s Kecks',
        Feet = 'Irn.Msk. Sabatons',
    },
    Ws_Default = { -- blanket WS
        Head = 'Chs. Burgeonet +1',
        Neck = 'Thunder gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Haubergeon',
        Hands = 'Alkyoneus\'s Brc.',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Flame Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Black cuisses',
        Feet = 'Chs. Sollerets +1',
    },
    Spikes = { -- set to leave body on with dread spikes up, only body here!

    },
    BloodWeapon = {},
    Movement = {
        Legs = 'Crimson Cuisses',
    },
    WeaponBash = {
        Hands = 'Chs. Gauntlets +1'
    },
    LastResort = {
        Feet = 'Abyss Sollerets',
    },
    Souleater = {
        Head = 'Chs. Burgeonet +1',
    },
};
profile.Sets = sets;

profile.Packer = {
    --{Name = 'Averagegupi', Quantity = 'all'},
};

profile.OnLoad = function() -- LOAD
    gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 6');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 95');
end

profile.OnUnload = function() --UNLOAD
    gcinclude.Unload();
end

profile.HandleCommand = function(args) --INPUT HANDLER?
    gcinclude.HandleCommands(args);
end

profile.HandleDefault = function() --AUTO HANDLER?
    local spikes = gData.GetBuffCount('Dread Spikes');
    if spikes ~= 0 then gFunc.EquipSet(sets.Spikes) end
    local currentlyEquipped = gData.GetEquipment();
    local mainWep

    gFunc.EquipSet(sets.Idle);


    -- local currentlyEquipped = gData.GetEquipment();
    -- mainWep = skillz.wep_table[currentlyEquipped.Main.Resource.Skill]; -- this will return the string value in wep table
    -- print('Main wep')
    -- print(mainWep)

    -- local lookupResult = skillz.wepSkills[mainWep['Freezebite']]
    -- print('lookup result')
    -- print(lookupResult)

    
    local player = gData.GetPlayer(); --PLAYER STATUS CHECK
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
            if(currentlyEquipped.Range == nil) then -- check for range to not be present (aka xbow,bow,boomerang)
                -- print('first check passed');
                if(currentlyEquipped.Ammo.Resource.Skill == 0) then
                    gFunc.Equip('Ammo', 'Bomb Core')
                end
            end
            if (gcdisplay.GetToggle('Solo') == true) then
                gFunc.EquipSet(sets.Solo)
                if (player.HPP <= 84) or (player.MPP >= 95) then
                    gFunc.Equip('Neck', 'Evasion Torque')
                end
            elseif (player.SubJob == 'NIN' and gcdisplay.GetToggle('dw')) then
                gFunc.EquipSet(sets.Tp_DW)
            elseif (player.SubJob == 'PLD' and gcdisplay.GetToggle('whoami')) then
                gFunc.EquipSet(sets.whoami)
            end

        elseif (player.Status == 'Resting') then
            gFunc.EquipSet(sets.Resting);

        elseif (player.IsMoving == true) then
            gFunc.EquipSet(sets.Movement);
        end

    gcinclude.CheckDefault();
end

profile.HandleAbility = function() --ABILITY HANDLER
    local ability = gData.GetAction();
    if string.match(ability.Name, 'Blood Weapon') then
        gFunc.EquipSet(sets.BloodWeapon);
    end
    if string.match(ability.Name, 'Last Resort') then
        gFunc.EquipSet(sets.LastResort);
    end
    if string.match(ability.Name, 'Souleater') then
        gFunc.EquipSet(sets.Souleater);
    end
    if string.match(ability.Name, 'Weapon Bash') then
        gFunc.EquipSet(sets.WeaponBash);
    end

    gcinclude.CheckCancels();
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    -- gcinclude.DoShadows(spell);
    gFunc.EquipSet(sets.Precast);
    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();

    local currentlyEquipped = gData.GetEquipment();

    -- print('first check: ' + currentlyEquipped.Ammo ~= nil);
    -- print('second check: ' currentlyEquipped.Ammo.Resource.Skill);

    if(currentlyEquipped.Range == nil) then -- check for range to not be present (aka xbow,bow,boomerang)
        -- print('first check passed');
        if(currentlyEquipped.Ammo.Resource.Skill == 0) then
            gFunc.Equip('Ammo', 'Phtm. Tathlum')
        end
    end

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure);
    elseif (spell.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke);
        if spell.MppAftercast <= 50 then
			gFunc.Equip('Neck', 'Uggalepih Pendant');
		end
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Dark);
        if (string.match(spell.Name, 'Dread Spikes')) then
            gFunc.EquipSet(sets.Dread_Spikes);
        end
        if (spell.Name:find('^Absorb') ~= nil) then
            gFunc.EquipSet(sets.Absorb);
        end
    end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
    if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then 
        gFunc.CancelAction() return;
    else
        gFunc.EquipSet(sets.Ws_Default)

        local action = gState.PlayerAction;
        local wepSkillName = action.Resource.Name[1]; -- this will return the name of the WS
        -- print('wepSkillName')
        -- print(wepSkillName)

        local currentlyEquipped = gData.GetEquipment();
        local mainWep = skillz.wep_table[currentlyEquipped.Main.Resource.Skill]; -- this will return the string value in wep table
        -- print('Main wep')
        -- print(mainWep)

        local lookupResult = skillz.wepSkills[mainWep][wepSkillName].skillchain -- looked up table from skillchain lib
        -- print('lookup result')
        -- print(lookupResult)

        -- local idkRenamePls_Snow = {}
        -- local idkRenamePls_Thunder = {}

        -- print(test123[mainWep]['Hard Slash'].skillchain[1])
        

        -- local wsData = AshitaCore:GetResourceManager():GetAbilityById(action.Resource.Id)
        -- print(wsData)

        -- print('skillchain table loop')
        for i, name in ipairs(lookupResult) do
            -- print("Element " .. i .. ": " .. name)
            if(name == 'Impaction' or name == 'Fragmentation') then
                gFunc.Equip('Neck', 'Thunder Gorget');
                -- idkRenamePls_Thunder.append(name);
            elseif(name == 'Induration' or name == 'Distortion') then
                gFunc.Equip('Neck', 'Snow Gorget');
                -- idkRenamePls_Snow.append(name)
            end
        end
        -- print(action.Resource.Element)
        -- for i, name in ipairs(action.Resource.Element) do
        --     print("Element " .. i .. ": " .. name)
        -- end
        -- print(action.Resource.Id)
        -- print(action.Resource.Name[0]) -- english name of WS ???
        -- print(action.Resource.Name[1]) -- this is the WS name in the name table
        -- print(action.Resource.Name[2]) -- this is the JP name in table

        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
    end
end

return profile;