local Divine_Nuke_Table = {'Banish', 'Banish II', 'Banish III', 'Holy', 'Enlight'};
local ElementalStaffTable = { -- important
    ['Fire'] = 'Fire Staff',
    ['Earth'] = 'Earth Staff',
    ['Water'] = 'Water Staff',
    ['Wind'] = 'Wind Staff',
    ['Ice'] = 'Ice Staff',
    ['Thunder'] = 'Thunder Staff',
    ['Light'] = 'Light Staff',
    ['Dark'] = 'Dark Staff'
};
local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
skillz = gFunc.LoadFile('common\\skillz.lua');

local sets = {
    Idle = {
        Main = 'Earth Staff',
        Head = 'Healer\'s Cap',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Cleric\'s Bliaut',
        Hands = 'Blessed mitts',
        Waist = 'Cleric\'s Belt',
        Legs = 'Blessed trousers',
        Feet = 'Blessed pumps',
        Back = 'Gigant Mantle',
    },
    Resting = {
        Main = 'Dark Staff',
        Body = 'Errant Hpl.',
        Neck ='Checkered Scarf',
        Waist = 'Cleric\'s Belt',
        
    },
    Town = {
        Body = 'Ducal aketon',
    },
    Tp_Default = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Reverend Mail',
        Hands = 'Blessed Mitts',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        -- Back = 'Red Cape +1',
        Waist = 'Swift Belt',
        Legs = 'Blessed trousers',
        Feet = 'Blessed pumps',
    },
    Tp_DW = {

    },
    Precast = { -- baseline, max out haste/fastcast gear 
        Ear1 = 'Loquac. Earring',
        Hands = 'Blessed Mitts',
        Waist = 'Swift Belt',
        Legs = 'Blessed trousers',
        Feet = 'Blessed pumps',
        -- Feet = 'Healer\'s Duckbills',
    },
    Cure_Precast = { -- precast for specific cure cast time down gear
        Main = 'Rucke\'s Rung',
        Feet = 'Cure Clogs',
    },
    Cure_Potency = { -- throw cure potency stuff here
        -- light staff logic should handle wep
        Body = 'Noble\'s Tunic',
        Back = 'Red Cape +1',
        Waist = 'Cleric\'s Belt',
        Feet = 'Blessed pumps',

    },
    Healing = { --healing skill+ to mitigate resists
        Hands = 'Healer\'s Mitts',
        Legs = 'Cleric\'s Pantaln.',

    },
    Enhancing = {
        Neck = 'Enhancing Torque',
        Feet = 'Cleric\'s Duckbills',

    },
    BarSpell = {
        Body = 'Blessed bliaut',
        Legs = 'Cleric\'s Pantaln.',
    },
    Regen = {
        Main = 'Rucke\'s Rung',
        Body = 'Cleric\'s Bliaut',
    },
    Enfeebling = {
        Head = 'Healer\'s Cap',
        Neck = 'Enfeebling torque',
        Body = 'Healer\'s Bliaut',
        Hands = 'Blessed Mitts',
        Back = 'Red Cape +1',
        Waist = 'Cleric\'s Belt',
        Legs = 'Blessed trousers',
        Feet = 'Cleric\'s Duckbills',

    },
    -- ABILITIES --

    Divine_Nuke = { -- HOLY / BANISH M.ATT+ MND
        Head = 'Healer\'s Cap',
        Neck = 'Divine Torque', -- logic in cast to conditionally swap to uggy pendant
        Ear2 = 'Moldavite Earring',
        Body = 'Blessed bliaut',
        Hands = 'Blessed Mitts',
        Back = 'Red Cape +1',
        Waist = 'Cleric\'s Belt',
        Legs = 'Healer\'s Pantaln.',
        Feet = 'Cleric\'s Duckbills',

    },
    Ws_Default = { -- blanket WS
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Reverend Mail',
        Hands = 'Healer\'s Mitts',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Cleric\'s Belt',
        Legs = 'Wonder Braccae',
        Feet = 'Cleric\'s Duckbills'
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
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 3');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 93');
end

profile.OnUnload = function() --UNLOAD
    gcinclude.Unload();
end

profile.HandleCommand = function(args) --INPUT HANDLER?
    gcinclude.HandleCommands(args);
end

profile.HandleDefault = function() --AUTO HANDLER?

    -- local isCoverOn = gData.GetBuffCount('Cover')
    local shadows = gData.GetBuffCount('Copy Image') + gData.GetBuffCount('Copy Image (2)') + gData.GetBuffCount('Copy Image (3)') + gData.GetBuffCount('Copy Image (4+)')
    local currentlyEquipped = gData.GetEquipment();
    local player_entity = GetPlayerEntity(); -- Verbose, but leaving this in as an example
    local player = gData.GetPlayer(); --PLAYER STATUS CHECK
    
    
    gFunc.EquipSet(sets.Idle);


    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)

    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);


    end

    gcinclude.CheckDefault();
end

profile.HandleAbility = function() --ABILITY HANDLER
    local ability = gData.GetAction();

    gcinclude.CheckCancels();
end

profile.HandlePrecast = function() -- PRECAST
    local spell = gData.GetAction();

    gFunc.EquipSet(sets.Precast);
    if(spell.Name:contains('Cure')) then
        gFunc.EquipSet(sets.Cure_Precast)
    end

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function() -- MIDCAST
    local spell = gData.GetAction();

    gFunc.Equip('main', ElementalStaffTable[spell.Element]);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
        if(spell.Name:contains('Bar')) then
            gFunc.EquipSet(sets.BarSpell)
        elseif(spell.Name:contains('Regen')) then
            gFunc.EquipSet(sets.Regen)
        end
    elseif (spell.Skill == 'Healing Magic') then
        if(spell.Name:contains('Cure')) then
            gFunc.EquipSet(sets.Cure_Potency)
        else 
            gFunc.EquipSet(sets.Healing)
        end
    elseif (spell.Skill == 'Elemental Magic') then
        gFunc.EquipSet(sets.Nuke);
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Enmity);
    elseif(spell.Skill == 'Singing') then
        gFunc.EquipSet(sets.brdSub)

    elseif (spell.Skill == 'Divine Magic') then
        local damagingDivine = false -- set a flag for damage or just enmity divine spell (like flash)
        for _, s in ipairs(Divine_Nuke_Table) do -- loop through table
            if s == spell.Name then
                damagingDivine = true
                break
            end
        end
        if(damagingDivine == true) then
            gFunc.EquipSet(sets.Divine_Nuke);
            -- if(spell.Name == 'Enlight') then
                -- print('casting enlight, should not swap to uggy pendant');
            if spell.MppAftercast <= 50 then
                gFunc.Equip('Neck', 'Uggalepih Pendant');
            end
        -- else -- if its not a nuke, then its flash, slap enmity stuff on
            -- gFunc.EquipSet(sets.Enmity);
        end
    end
end


profile.HandleWeaponskill = function() -- WEAPONSKILL
    local canWS = gcinclude.CheckWsBailout();
    local wsName = gData.GetAction().Name;
    if (canWS == false) then gFunc.CancelAction() return;
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

        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
    end

    -- if (wsName == 'Spirit Taker') then
    --     gFunc.EquipSet(sets.Ws_SpiritTaker)
    -- end
end

return profile;