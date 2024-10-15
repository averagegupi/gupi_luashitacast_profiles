local Divine_Nuke_Table = {'Banish', 'Banish II', 'Holy', 'Enlight'};
local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
skillz = gFunc.LoadFile('common\\skillz.lua');
conq = gFunc.LoadFile('common\\conquest.lua')

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
        Ring1 = 'Sattva Ring',
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
        Body = 'Homam Corazza',
        Hands = 'Homam Manopolas',
        Ring1 = 'Sattva Ring',
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
        Ring1 = 'Sattva Ring',
        Legs = 'Valor Breeches',
        Feet = 'Valor Leggings',
        Waist = 'Warwolf Belt',
        Back = 'Valor Cape',
    },
    Utsu = { -- stack haste for the recast reduction
        Head = 'Homam Zucchetto',
        Hands = 'Homam Manopolas',
        Waist = 'Sprinter\'s Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    Tp_DW = {

    },
    mdt = {
        Ear1 = 'Coral Earring',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Resentment Cape',
        Legs = 'Crimson Cuisses',
        Feet = 'Crimson Greaves',
    },
    Precast = { -- FC only
        Ear1 = 'Loquac. Earring',
        Legs = 'Homam Cosciales',
    },
    tankInterim = { -- between pre and mid cast
    -- body and legs handled individually due to event gear restrictions
        Head = 'Koenig Schaller', 
        Neck = 'Willpower Torque', -- 5 SIRD
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Ethereal Earring',
        -- Body = 'Valor Surcoat',
        Hands = 'Homam Manopolas',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Warwolf Belt',
        -- Legs = 'Valor Breeches', -- 10 SIRD
        Feet = 'Glt. Leggings +1',
    },
    Cure = {
        Ear1 = 'Hospitaler Earring',

    },
    maxHpPrecast = {

    },
    Enhancing = { -- TODO: for sj RDM bar/enspell/phalanx
        Ear1 = 'Moldavite Earring', -- apparently MAB impacts spike damage, slap these on for blaze spikes
        Ear2 = 'Novio Earring',
        Neck = 'Enhancing Torque',
        Legs = 'Glt. Breeches +1',
        Back = 'Merciful Cape',

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
        -- Sub = 'Ice Shield', -- TODO: update to get the name of the wep on OH if not shield, and put it back on after ability?
        Hands = 'Valor Gauntlets',
    },
    Chivalry = { --MND mod
        Head = 'Gallant Coronet',
        Neck = 'Faith Torque',
        Body = 'Wonder Kaftan',
        Ring1 = 'Aqua Ring',
        Back = 'Ryl. Army Mantle',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Wonder Braccae',
        Feet = 'Valor Leggings',

    },
    Holy_Circle = {
        Feet = 'Glt. Leggings +1',
    },
    Divine_Nuke = { -- HOLY / BANISH M.ATT+ MND
        Head = 'Gallant Coronet',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Novio Earring',
        Neck = 'Faith Torque', -- logic in cast to conditionally swap to uggy pendant
        Body = 'Gallant Surcoat',
        Ring1 = 'Aqua Ring',
        Back = 'Ryl. Army Mantle',
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
        Ear2 = 'Waetoto\'s Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Alkyoneus\'s Brc.',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Valor Breeches',
        Feet = 'Valor leggings'
    },
    elTank = {
        Head = 'Koenig Schaller',
        Neck = 'Parade Gorget',
        Ear1 = 'Morukaka Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Valor Surcoat',
        Hands = 'Homam Manopolas',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Jelly Ring',
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
    ['hpDown'] = { -- -7 hp
        Ammo = 'Phtm. Tathlum', -- 0
        Head = 'Reraise Hairpin', -- -7
        Neck = 'Willpower Torque', -- 0
        Ear1 = 'Brutal Earring', -- 0
        Ear2 = 'Loquac. Earring', -- 0
        Body = 'Wonder Maillot +1', -- 0
        -- Hands = 'Wonder Mitts', -- body also swaps hands, 0
        Ring1 = 'Aqua Ring', -- 0
        Ring2 = 'Snow Ring', -- 0
        Back = 'Amemet Mantle +1', -- 0
        Waist = 'Sprinter\'s Belt', -- 0
        Legs = 'Taru. Trunks +1', -- 0
        -- Feet = 'Crimson greaves', -- legs swap feet, 0
    },
    ['hpUp'] = { -- 371 cure nighttime, 20 enmity = 445 enmity generated
        Ammo = 'Happy Egg', -- 10
        Head = 'Valor Coronet', -- 18hp/ 2 enmity
        Neck = 'Shield Torque', -- 7
        Ear1 = 'Morukaka Earring', -- 35
        Ear2 = 'Ethereal Earring', -- 15
        Body = 'Valor Surcoat', -- 23 / 4 enmity
        Hands = 'Homam Manopolas', -- 20 / 3 enmity
        Ring1 = 'Sattva Ring', -- 30 / 5 enmity
        Ring2 = 'Bomb Queen Ring', -- 75
        Back = 'Gigant Mantle', -- 80
        Waist = 'Warwolf Belt', -- 0 /3 enmity
        Legs = 'Valor Breeches', -- 20 / 3 enmity
        Feet = 'Homam Gambieras', -- 26
    },
    ['es'] = {
        Main = 'Earth Staff',
    },
    ['sb'] = {
        Main = 'Joyeuse',
        Sub = 'Ice Shield',
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


playedthissomanytimesIknowwhatImtalkingabout = function (refresh)
    
    local default_config = {
        font = {
            family = 'Consolas',
            size = 10,
            color = math.d3dcolor(255, 255, 0, 0),
            position = {350, 350}
        },
        background = {
            color = math.d3dcolor(128, 0, 0, 0),
            visible = true
        }
    };
    
    local tp_config = default_config;
    
    -- Create the font object..
    local f = AshitaCore:GetFontManager():Create('_picklerick');
    f:SetColor(tp_config.font.color);
    f:SetFontFamily(tp_config.font.family);
    f:SetFontHeight(tp_config.font.size);
    f:SetPositionX(tp_config.font.position[1]);
    f:SetPositionY(tp_config.font.position[2]);
    f:SetText('');
    f:SetVisible(true);
    f:GetBackground():SetVisible(tp_config.background.visible);
    f:GetBackground():SetColor(tp_config.background.color);
    
    
    local f = AshitaCore:GetFontManager():Get('_picklerick')
    local txt = ''
    if (refresh == 0) then
        txt = string.format('|cFFFF0000|%s|r', 'Refresh!')
        -- tell reminder for refresh, is a joke, don't uncomment this unless you want to get blisted
        -- AshitaCore:GetChatManager():QueueCommand(1, '/tell  refresh me pls');
    end
    if (f ~= nil) then
        f:SetText(txt)
    end
end 

profile.HandleDefault = function() --AUTO HANDLER?

    local isCoverOn = gData.GetBuffCount('Cover')
    local shadows = gData.GetBuffCount('Copy Image') + gData.GetBuffCount('Copy Image (2)') + gData.GetBuffCount('Copy Image (3)') + gData.GetBuffCount('Copy Image (4+)')
    local currentlyEquipped = gData.GetEquipment();
    local player_entity = GetPlayerEntity(); -- Verbose, but leaving this in as an example
    local player = gData.GetPlayer(); --PLAYER STATUS CHECK
    local refresh = gData.GetBuffCount('Refresh')
    
    -- print(conq:GetOutsideControl()) -- are you in a region controlled by nation other than yours
    -- print(conq:GetInsideControl()) -- are you in a region controlled by your nation
    
    gFunc.EquipSet(sets.Idle);
    if (gcdisplay.GetToggle('es') == true) then 
        gFunc.EquipSet(sets.es) 
    end
    if (gcdisplay.GetToggle('sb') == true) then 
        gFunc.EquipSet(sets.sb) 
    end

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
            -- print(refresh);
            playedthissomanytimesIknowwhatImtalkingabout(refresh)
            gFunc.EquipSet(sets.elTank)
        else
            AshitaCore:GetFontManager():Delete('_picklerick');
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

    elseif string.match(ability.Name, 'Chivalry') then
        gFunc.EquipSet(sets.Chivalry);

    elseif string.match(ability.Name, 'Provoke') then
        gFunc.EquipSet(sets.Enmity);
    end

    gcinclude.CheckCancels();
end

profile.HandlePrecast = function() -- PRECAST
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
	local player = gData.GetPlayer();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
    local fastCastValue = 0.04 -- Loq/Homam pants
    local minimumBuffer = 0.1;
    local packetDelay = 0.25; -- using packetflow
    
    gFunc.EquipSet(sets.Precast);

    -- tank flag check for cure bomb
    if (gcdisplay.GetToggle('tank') == true and spell.Skill == 'Healing Magic' and target.Name == me) then -- checking tank flag and that I'm casting healing for curebomb handling
        -- print('hp down going on')
        gFunc.EquipSet(sets.hpDown) -- dropping HP in precast, to bomb in midcast
    end

    if (player.SubJob == "RDM") then
        -- RDM is .15, warlock mantle??
        fastCastValue = fastCastValue + 0.15
    end
    local castDelay = ((spell.CastTime * (1 - fastCastValue)) / 1000) - minimumBuffer;
    
    if (castDelay >= packetDelay) then
        gFunc.SetMidDelay(castDelay);
    end

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function() -- MIDCAST
    local game = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
	local player = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    -- MIDCAST SIRD/SKILL CHECK START; *starting small, will build upon as more usecases arise.
    -- For now this will be used specifically with tank toggle
    if(gcdisplay.GetToggle('tank') == true) then
        -- need this here since hpDown is throwing on event clothes that cant use hand/feet gear. Manually replacing before interim set
        gFunc.Equip('Body','Valor Surcoat')
        gFunc.Equip('Legs','Valor Breeches')
        gFunc.InterimEquipSet(sets.tankInterim)  
    end
    -- MIDCAST SIRD/SKILL CHECK END

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    elseif (spell.Skill == 'Healing Magic') then
        if (gcdisplay.GetToggle('tank') == true and target.Name == player) then
            gFunc.EquipSet(sets.hpUp) -- cranking HP up for enmity
            if (game.Time > 6.00) and (game.Time < 18.00) then
                gFunc.Equip('Ammo','Fenrir\'s Stone');
            end
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
    elseif (spell.Skill == 'Ninjutsu') then -- finish in full haste gear for recast
        gFunc.EquipSet(sets.Utsu);

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
        if (game.Time > 6.00 and game.Time < 18.00) then --daytime 10attack
            gFunc.Equip('Ear2', 'Fenrir\'s Earring')
        end

        local action = gState.PlayerAction;
        local wepSkillName = action.Resource.Name[1]; -- this will return the name of the WS
        -- print('wepSkillName')
        -- print(wepSkillName)

        local currentlyEquipped = gData.GetEquipment();
        local mainWep = skillz.wep_table[currentlyEquipped.Main.Resource.Skill]; -- this will return the string value in wep table
        -- Flame and Abyssal handling for GS
        if (mainWep == 'GreatSword') then
            gFunc.Equip('Ring1', 'Flame Ring')
            gFunc.Equip('Ear2', 'Abyssal Earring')
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