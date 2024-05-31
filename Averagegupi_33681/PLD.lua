local Divine_Nuke_Table = {'Banish', 'Banish II', 'Holy', 'Enlight'};
local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
skillz = gFunc.LoadFile('common\\skillz.lua');

local sets = {
    Idle = {
        Body = 'Royal Cloak',
        Neck = 'Parade Gorget',
        Hands = 'Homam Manopolas',
        Legs = 'Crimson Cuisses',
        -- Feet = 'Homam Gambieras',
    },
    Resting = {
        
    },
    Town = {
        Body = 'Ducal aketon',
    },
    Tp_Default = {
        Head = 'Homam Zucchetto',
        Neck = 'Parade Gorget',
        Ear1 = 'Morukaka Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Valor Surcoat',
        Hands = 'Homam Manopolas',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Sprinter\'s Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    dd = {
        Head = 'Homam Zucchetto',
        -- Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        -- Ear2 = 'Ethereal Earring',
        Body = 'Scorpion Harness',
        Hands = 'Homam Manopolas',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Sprinter\'s Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    noShield = {
        Feet = 'Homam Gambieras',
        
    },
    Enmity = { -- TODO: LOAD UP THAT PLATE
        Head = 'Valor Coronet',
        Body = 'Valor Surcoat',
        Hands = 'Homam Manopolaslets',
        Legs = 'Valor Breeches',
        Feet = 'Valor Leggings',
        Waist = 'Warwolf Belt',
        Back = 'Valor Cape',
    },
    Tp_DW = {

    },
    mdt = {
        Ear1 = 'Coral Earring',
        Ring1 = 'Coral Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Resentment Cape',
    },
    Precast = {
        Head = 'Homam Zucchetto',
        Neck = 'Willpower Torque',
        Ear1 = 'Loquac. Earring',
        Hands = 'Homam Manopolas',
        Legs = 'Homam Cosciales',
        Waist = 'Sprinter\'s Belt',
        Feet = 'Homam Gambieras',
    },
    Cure = {
        Ear1 = 'Hospitaler Earring',

    },
    maxHpPrecast = {

    },
    Enhancing = { -- TODO: for sj RDM bar/enspell/phalanx
        Neck = 'Enhancing Torque',
        Legs = 'Glt. Breeches +1'

    },
    Enfeebling = {

    },
    -- ABILITIES --
    Rampart = {
        Head = 'Valor Coronet'
    },
    Cover = {
        Head = 'Gallant Coronet',
        Body = 'Valor Surcoat',
        Ear1 = 'Morukaka Earring', -- swap out Ethereal, cover augment doesn't stack with it
        Ear2 = 'Coral Earring', -- swap out Ethereal, cover augment doesn't stack with it

    },
    Sentinel = {
        Feet = 'Valor Leggings',
    },
    Shield_Bash = {
        Sub = 'Ice Shield', -- TODO: update to get the name of the wep on OH if not shield, and put it back on after ability?
        Hands = 'Valor Gauntlets',
    },
    Holy_Circle = {
        Feet = 'Glt. Leggings +1',
    },
    Divine_Nuke = { -- HOLY / BANISH M.ATT+ MND
        Head = 'Gallant Coronet',
        Ear1 = 'Moldavite Earring',
        Neck = 'Divine Torque', -- logic in cast to conditionally swap to uggy pendant
        Body = 'Gallant Surcoat',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Wonder Braccae',
        Feet = 'Valor Leggings',

    },
    Movement = {
        Legs = 'Crimson Cuisses',
    },
    Ws_Default = { -- blanket WS
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Haubergeon',
        Hands = 'Alkyoneus\'s Brc.',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Flame Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Valor Breeches',
        Feet = 'Wonder Clomps'
    },
    elTank = {
        Head = 'Koenig Schaller',
        Neck = 'Parade Gorget',
        Ear1 = 'Morukaka Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Valor Surcoat',
        Hands = 'Homam Manopolaslets',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Crimson Cuisses',
        Feet = 'Glt. Leggings +1',
    },
    None = { -- aka shield
        Head = 'Koenig Schaller',
        Neck = 'Shield Torque',
        Ear1 = 'Morukaka Earring',
        Ear2 = 'Ethereal Earring',
        Feet = 'Glt. Leggings +1',
    },
    Dagger = {
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
    },
    Sword = { -- Note: swapping out brutal for stealth. Joytoy + justice + virtue stones = the juice
        Ammo = 'Virtue Stone',
        Neck = 'Peacock Amulet',
        Ear1 = 'Stealth Earring',
        Ear2 = 'Ethereal Earring',
    },
    GreatSword = {
        Neck = 'Prudence Torque',
        -- Ear1 = 'Brutal Earring',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Ethereal Earring', --testing
    },
    Polearm = {
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring',
    },
    Club = {
        Neck = 'Prudence Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
    },
    Staff = {
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring',
    },
    ['hpDown'] = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Reraise Hairpin',
        Neck = 'Willpower Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Loquac. Earring',
        Body = 'Haubergeon',
        Hands = 'Homam Manopolas',
        Ring1 = 'Ether Ring',
        Ring2 = 'Fasting Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Friar\'s Rope',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Bounding Boots',
    },
    ['hpUp'] = {
        Ammo = 'Fenrir\'s Stone',
        Head = 'Homam Zucchetto',
        Neck = 'Shield Torque',
        Ear1 = 'Morukaka Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Wonder Kaftan',
        Hands = 'Alkyoneus\'s Brc.',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Gigant Mantle',
        Waist = 'Sprinter\'s Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
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
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 5');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 94');
end

profile.OnUnload = function() --UNLOAD
    gcinclude.Unload();
end

profile.HandleCommand = function(args) --INPUT HANDLER?
    gcinclude.HandleCommands(args);
end

profile.HandleDefault = function() --AUTO HANDLER?

    local isCoverOn = gData.GetBuffCount('Cover')
    local shadows = gData.GetBuffCount('Copy Image') + gData.GetBuffCount('Copy Image (2)') + gData.GetBuffCount('Copy Image (3)') + gData.GetBuffCount('Copy Image (4+)')
    local currentlyEquipped = gData.GetEquipment();
    local player_entity = GetPlayerEntity(); -- Verbose, but leaving this in as an example
    local player = gData.GetPlayer(); --PLAYER STATUS CHECK
    
    
    gFunc.EquipSet(sets.Idle);

    -- print(player_entity.Look.Sub.type)
    -- need to check for currentlyEquipped.Sub to exist, if so there is something in the OH
    -- shield means that .Sub exists AND returns 0 in table (AND sj is not Ninja?)
    -- print('Sub: ' + currentlyEquipped.Sub.Resource.Skill)
    -- print('Main: ' + currentlyEquipped.Main.Resource.Skill)

    if (player.Status == 'Engaged') then
        -- default here is tank set
        gFunc.EquipSet(sets.Tp_Default)
        if(currentlyEquipped.Sub == nil or currentlyEquipped.Sub ~= 0) then -- check for shield. If none, swap boots
            gFunc.EquipSet(sets.noShield);
        end
    
        -- weapon logic START 
        local mainWepSet
        -- print('between HP/MP threshold')
        -- print(currentlyEquipped.Sub)
        -- if(currentlyEquipped.Sub ~= nil and currentlyEquipped.Sub.Resource.Skill == 0) then -- sub existing and equaling 0 means shield
            --     mainWepSet = wep_table[currentlyEquipped.Sub.Resource.Skill];
            if(currentlyEquipped.Sub ~= nil) then -- something in the sub slot
                if (currentlyEquipped.Sub.Resource.Skill == 0) then
                    mainWepSet = 'None' -- special handling for shield
                else
                    mainWepSet = skillz.wep_table[currentlyEquipped.Main.Resource.Skill];
                    -- print(skillz.wep_table[currentlyEquipped.Main.Resource.Skill]) -- debugging, this would return correct output
                end
            elseif(currentlyEquipped.Sub == nil and currentlyEquipped.Main ~= nil) then -- nothing in sub slot, main is present
                -- local mainWep = currentlyEquipped.Main.Resource.Skill; -- verbose, but leaving in as learning
                -- local wepSet = sets.wep_table[mainWep];
                -- print('what is mainwep: ' + mainWepSet)
                -- print(mainWepSet)
                mainWepSet = skillz.wep_table[currentlyEquipped.Main.Resource.Skill];
                -- print(skillz.wep_table[currentlyEquipped.Main.Resource.Skill])
            end 
            gFunc.EquipSet(sets[mainWepSet]) -- look in the weapon table, equip the resulting set
            -- weapon logic END 
            -- reworked the paradge gorget logic, it'll slap it on when I'm above 85% hp and less than 95% mp
            if (player.HPP >= 85  and player.MPP <= 95) then
                gFunc.Equip('Neck', 'Parade Gorget')
            end --neck logic end
            if (shadows == 0 and player.SubJob == 'NIN') then --CHECK FOR SHADOWS UP
                gFunc.Equip('Ring1', 'Jelly Ring'); -- TODO: update
                gFunc.Equip('Ear2', 'Ethereal Earring');
            end
            -- dd flag check
            if (gcdisplay.GetToggle('dd') == true) then -- this is the flag for damage set
                gFunc.EquipSet(sets.dd) -- slapping generic damage set on
            end
            
        elseif (player.Status == 'Resting') then
            gFunc.EquipSet(sets.Resting);
            
        elseif (player.IsMoving == true) then
            gFunc.EquipSet(sets.Movement);
            
        end
        
        if (gcdisplay.GetToggle('tank') == true) then
            gFunc.EquipSet(sets.elTank) -- cranking HP up for enmity
        end
        -- TODO: toggles for 'serious' tanking of stuff mdt/pdt?/resistance
        -- outside of engaged check, so can be idle in these sets
        if(gcdisplay.GetToggle('mdt')) then 
            gFunc.EquipSet(sets.mdt)
        end    
        -- cover check
        if(isCoverOn == 1) then
            print('cover is on') --testing
            gFunc.EquipSet(sets.Cover)
        end
        
        gcinclude.CheckDefault();
    end
    
    profile.HandleAbility = function() --ABILITY HANDLER
    local ability = gData.GetAction();

    if string.match(ability.Name, 'Rampart') then
        gFunc.EquipSet(sets.Rampart);

    elseif string.match(ability.Name, 'Cover') then
        gFunc.EquipSet(sets.Cover);

    elseif string.match(ability.Name, 'Sentinel') then
        gFunc.EquipSet(sets.Sentinel);

    elseif string.match(ability.Name, 'Shield Bash') then
        gFunc.EquipSet(sets.Shield_Bash);

    elseif string.match(ability.Name, 'Holy Circle') then
        gFunc.EquipSet(sets.Holy_Circle);

    elseif string.match(ability.Name, 'Provoke') then
        gFunc.EquipSet(sets.Enmity);
    end

    gcinclude.CheckCancels();
end

profile.HandlePrecast = function() -- PRECAST
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
	local player = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
    
    -- tank flag check for cure bomb
    if (gcdisplay.GetToggle('tank') == true and spell.Skill == 'Healing Magic' and target.Name == player) then -- checking tank flag and that I'm casting healing for curebomb handling
        gFunc.EquipSet(sets.hpDown) -- dropping HP in precast, to bomb in midcast
    else
        gFunc.EquipSet(sets.Precast);
    end

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function() -- MIDCAST
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
	local player = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    elseif (spell.Skill == 'Healing Magic') then
        if (gcdisplay.GetToggle('tank') == true and target.Name == player) then
            gFunc.EquipSet(sets.hpUp) -- cranking HP up for enmity
        else
            gFunc.EquipSet(sets.Cure);
        end
    -- elseif (spell.Skill == 'Elemental Magic') then
    --     gFunc.EquipSet(sets.Nuke);
    -- TODO: probably useless for PLD, but build this table out for /RDM tanking??
    elseif (spell.Skill == 'Enfeebling Magic') then -- enmity here for /RDM bind,blind,etc
        gFunc.EquipSet(sets.Enmity);
    elseif (spell.Skill == 'Dark Magic') then -- enmity here if /DRK stun
        gFunc.EquipSet(sets.Enmity);

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
            if(spell.Name == 'Enlight') then
                -- print('casting enlight, should not swap to uggy pendant');
            elseif spell.MppAftercast <= 50 then
                gFunc.Equip('Neck', 'Uggalepih Pendant');
            end
        else -- if its not a nuke, then its flash, slap enmity stuff on
            gFunc.EquipSet(sets.Enmity);
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
        -- replace rajas with 2nd flame for GS ws
        if (mainWep == 'GreatSword') then
            gFunc.Equip('Ring1', 'Flame Ring')
        end
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