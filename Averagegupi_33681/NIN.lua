local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
skillz = gFunc.LoadFile('common\\skillz.lua');
conq = gFunc.LoadFile('common\\conquest.lua')
local ElementalStaffTable = { 
    ['Fire'] = 'Fire Staff',
    ['Earth'] = 'Earth Staff',
    ['Water'] = 'Water Staff',
    ['Wind'] = 'Wind Staff',
    ['Ice'] = 'Ice Staff',
    ['Thunder'] = 'Thunder Staff',
    ['Light'] = 'Light Staff',
    ['Dark'] = 'Dark Staff'
};
local sets = {
    Idle = {
        Head = 'Arhat\'s Jinpachi',
        Hands = 'Kog. Tekko +1', --dusk gloves, swap em out
        Body = 'War Shinobi Gi',
    },
    Resting = {},
    Silence = {
        Main = 'Senjuinrikio',
        Sub = 'Garuda\'s Dagger',
    },
    Fudo = {
        Main = 'Senjuinrikio',
        Sub = 'Fudo',
    },
    Stun = {
        Main = 'Senjuinrikio',
        Sub = 'Mamushito +1',
    },
    Town = {
        Body = 'Ducal aketon',
    },
    Tp_Default = {
        Head = 'Panther Mask',
        Neck = 'Hope Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
        Body = 'Ninja Chainmail',
        Hands = 'Dusk Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Sprinter\'s Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Fuma Sune-Ate',
    },
    Tp_Acc = {
        Head = 'Optical Hat',
        Body = 'Koga Chainmail',
        Ring1 = 'Toreador\'s Ring',
    },
    Precast = { --HASTE + FAST CAST STUFF
        Head ='Panther Mask',
        Neck = 'Willpower Torque',
        Ear1 = 'Loquac. Earring',
        Hands = 'Kog. Tekko +1',
        Waist = 'Sprinter\'s Belt',
        Legs = 'Byakko\'s Haidate',
    },
    Utsu = { --EVA OR DT HERE?
        Neck = 'Willpower Torque',
        Ear1 = 'Loquac. Earring',
    },
    Nuke = { -- ELE WHEEL BURST
        Head = 'Yasha Jinpachi',
        Neck = 'Prudence Torque',
        Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Blue Cotehardie',
        Hands = 'Kog. Tekko +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Fed. Army Mantle',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Nin. Kyahan +1',
    },
    Enfeeb = { -- TODO: INT stack gear?
        Head = 'Ninja Hatsuburi',
        Neck = 'Prudence Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Stealth Earring',
        Body = 'Blue Cotehardie',
        Hands = 'Kog. Tekko +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Fed. Army Mantle',
        Waist = 'Koga Sarashi',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Koga Kyahan',
    },
    D2D_TP = {
        Hands = 'Kog. Tekko +1',
    },
    Preshot = {
    },
    Midshot = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'War Shinobi Gi',
        Hands = 'Nin. Tekko +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Ninja Hakama',
        Feet = 'Ninja Kyahan',
    },
    Ws_Default = {
        Head = 'Shr.Znr.Kabuto',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Waetoto\'s Earring',
        Body = 'Haubergeon',
        Hands = 'Nin. Tekko +1',
        Ring1 = 'Flame Ring',
        Ring2 = 'Flame Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Creek M. Clomps',
    },
    Night_WS = {
        Feet = 'Koga Kyahan',
    },
    D2D_WS = {
        Hands = 'Kog. Tekko +1',
    },
    Enmity = { --ENMITY SET USED /W PROVOKE
        Head = 'Arhat\'s Jinpachi',
        Body = 'Arhat\'s Gi',
        Ring1 = 'Sattva Ring',
        Legs = 'Nokizaru Hakama',
        Waist = 'Warwolf Belt',
        Back = 'Resentment Cape',
    },
    mdt = {
        Ear1 = 'Coral Earring',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Resentment Cape',
        Legs = 'Crimson Cuisses',
        Feet = 'Crimson Greaves',
    },
    Yonin = { --TANKING SET
        Head = 'Optical Hat',
        Neck = 'Evasion Torque',
        Ear2 = 'Ethereal Earring',
        Body = 'Scorpion Harness',
        Hands = 'Rasetsu Tekko',
        Back = 'Boxer\'s Mantle',
        Waist = 'Koga Sarashi',
        Feet = 'Fuma Sune-Ate',
        Ring1 = 'Toreador\'s Ring',
        -- Ring2 = 'Bomb Queen Ring',
        Ring2 = 'Toreador\'s Ring',
    },
    Yonin_NoShadow = { -- -DT (YONIN BUT NO SHADOW)
        Head = 'Arhat\'s Jinpachi',
        Body = 'Arhat\'s gi',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Jelly ring',
        Back = 'Boxer\'s Mantle',
    },
    Movement = {
        Feet = 'Nin. Kyahan +1',
    },
    ['cap60'] = {
        Main = 'Zushio',
        Sub = 'Anju',
        Ammo = 'Happy Egg',
        Head = 'Walkure Mask',
        Neck = 'Peacock Amulet',
        Ear1 = 'Morukaka Earring',
        Ear2 = 'Drone Earring',
        Body = 'Scorpion Harness',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Resentment Cape',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Nokizaru Hakama',
        Feet = 'Bounding Boots',
    },
    ['RaccSixty'] = {
        Head = 'Ninja Hatsuburi',
        Neck = 'Peacock Amulet',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Scorpion Harness',
        Hands = 'Ninja Tekko',
        Ring1 = 'Scorpion Ring +1',
        Ring2 = 'Scorpion Ring +1',
        Back = 'Fed. Army Mantle',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Ninja Hakama',
        Feet = 'Bounding Boots',
    },
    ['cap50'] = {
        Main = 'Zushio',
        Sub = 'Anju',
        Ammo = 'Happy Egg',
        Head = 'Walkure Mask',
        Neck = 'Peacock Amulet',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Nokizaru gi',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Jaeger Ring',
        Back = 'Resentment Cape',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Nokizaru Hakama',
        Feet = 'Bounding Boots',
    },
};

profile.Sets = sets;
profile.Packer = { --TODO:Add stack tool items here if you use em
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 8');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 97');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
end

profile.HandleDefault = function()
    local game = gData.GetEnvironment();
    local player = gData.GetPlayer();
    local yonin = gData.GetBuffCount('Yonin')
    local shadows = gData.GetBuffCount('Copy Image') + gData.GetBuffCount('Copy Image (2)') + gData.GetBuffCount('Copy Image (3)') + gData.GetBuffCount('Copy Image (4+)')
    local currentlyEquipped = gData.GetEquipment();

    -- print(currentlyEquipped.Ammo) --table return
    -- print(currentlyEquipped.Ammo.Resource.Skill) -- 0 return for non-throwable (bomb core)
    -- print(conq:GetOutsideControl())


    gFunc.EquipSet(sets.Idle);
    if (conq:GetOutsideControl() and player.HPP < 99) then
        gFunc.Equip('Head', 'President. Hairpin')
    end
    if (game.Time < 7.00) or (game.Time > 17.00) then
        gFunc.EquipSet(sets.Movement);
    end
    if ((player.SubJob == 'RDM' or player.SubJob == 'DRK') and player.MP < 41) then
        gFunc.Equip('body', 'Blue Cotehardie')
    end
    -- print(player.MP)
    -- print(player.SubJob);

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default);
        if (gcdisplay.GetToggle('acc') == true) then
            gFunc.EquipSet(sets.Tp_Acc)    
        end
        if(currentlyEquipped.Range == nil) then -- check for range to not be present (aka xbow,bow,boomerang)
            -- print('first check passed');
            if(currentlyEquipped.Ammo.Resource.Skill == 0 and yonin == 0) then
                gFunc.Equip('Ammo', 'Bomb Core')
            else
                gFunc.Equip('Ammo', 'Fenrir\'s Stone')
            end
        end
        if (game.Time < 7.00) or (game.Time > 17.00) then
            gFunc.EquipSet(sets.D2D_TP);
        end
            if (gcdisplay.GetToggle('silence') == true) then
                gFunc.EquipSet(sets.Silence)

            elseif (gcdisplay.GetToggle('fudo') == true) then
                gFunc.EquipSet(sets.Fudo)

            elseif (gcdisplay.GetToggle('stun') == true) then
                gFunc.EquipSet(sets.Stun)
            end
        if (gcdisplay.GetToggle('cap60') == true) then
            gFunc.EquipSet(sets.cap60)
        end
        if (gcdisplay.GetToggle('cap50') == true) then
            gFunc.EquipSet(sets.cap50)
        end
        if (yonin > 0) then --YONIN ACTIVE = TANK SET
            gFunc.EquipSet(sets.Yonin);
        end
        if (shadows == 0) then --CHECK FOR SHADOWS UP
            gFunc.EquipSet(sets.Yonin_NoShadow)
        end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
        if (game.Time < 6.00) or (game.Time > 18.00) then
            gFunc.EquipSet(sets.Movement);
        end
    end

    -- TODO: toggles for 'serious' tanking of stuff mdt/pdt?/resistance
    -- outside of engaged check, so can be idle in these sets
    if(gcdisplay.GetToggle('mdt')) then 
        gFunc.EquipSet(sets.mdt)
    end  

    gcinclude.CheckDefault();
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    if string.match(ability.Name, 'Provoke') then
        gFunc.EquipSet(sets.Enmity)
    end

    gcinclude.CheckCancels();
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gcinclude.DoShadows(spell);

    gFunc.EquipSet(sets.Precast);
    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();
    local NukeTable = table.concat(gcinclude.NinNukes, ',')
    local currentlyEquipped = gData.GetEquipment();

    -- print('first check: ' + currentlyEquipped.Ammo ~= nil);
    -- local hello123 = currentlyEquipped.Ammo.Resource.Skill;
    -- print('second check: ' + hello123 == 0);

    if(currentlyEquipped.Range == nil) then
        -- print('first check passed');
        if(currentlyEquipped.Ammo.Resource.Skill == 0) then
            gFunc.Equip('Ammo', 'Phtm. Tathlum')
        end
    end

    if (spell.Skill == 'Ninjutsu') then
        if string.contains(spell.Name, 'Utsusemi') then
            gFunc.EquipSet(sets.Utsu);
            -- elseif (gcinclude.NinNukes:contains(spell.Name)) then -- TODO: SEPARATE OUT NUKE FROM INT STACK ENFEEB
            --     gFunc.EquipSet(sets.Nuke);
        elseif string.find(NukeTable, spell.Name, 1, true) == nil then -- if the spell casting isn't in the NinNukes table
            gFunc.EquipSet(sets.Enfeeb);
        else
            gFunc.EquipSet(sets.Nuke);
            if spell.MppAftercast <= 50 then
                gFunc.Equip('Neck', 'Uggalepih Pendant');
            end
            if (gcdisplay.GetToggle('nuke') == true) then
                gFunc.Equip('main', ElementalStaffTable[spell.Element]); 
            end
        end
    end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()

    gFunc.EquipSet(sets.Midshot);
    if (gcdisplay.GetToggle('cap60') == true) then
        gFunc.EquipSet(sets.RaccSixty)
    end
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
    local game = gData.GetEnvironment();
    if (canWS == false) then
        gFunc.CancelAction()
        return;
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

        local lookupResult = skillz.wepSkills[mainWep][wepSkillName].skillchain
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


        if (game.Time < 6.00) or (game.Time > 18.00) then
            gFunc.EquipSet(sets.Night_WS);
        end
        if (game.Time < 7.00) or (game.Time > 17.00) then
            gFunc.EquipSet(sets.D2D_WS);
        end
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet'))
        end
    end
end

return profile;