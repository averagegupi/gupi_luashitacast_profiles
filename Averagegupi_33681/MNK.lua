local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
skillz = gFunc.LoadFile('common\\skillz.lua');
conq = gFunc.LoadFile('common\\conquest.lua')
-- local wsPoints = 208;
local sets = {
    Idle = {
        Body = 'Melee Cyclas',

    },
    Resting = {
        Neck = 'Checkered Scarf',
        Body = 'Melee Cyclas',
        Back = 'Melee Cape',
        
    },
    Town = {
        Body = 'Ducal aketon',
    },
    Tp_Default = {
        Head = 'Panther Mask',
        Neck = 'Faith Torque',
        Ear1 = 'Ethereal Earring', -- ear1 will be replaced by wyvern for drg SJ
        Ear2 = 'Brutal Earring',
        Body = 'Scorpion Harness',
        Hands = 'Mel. Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Black Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Fuma Sune-Ate',
    },
    DrgSJ = {
        Head = 'Optical Hat', -- TODO: update this when/if dune boots and panth mask+1
        Ear1 = 'Wyvern Earring',
    },
    Acc_Override = { -- TODO: build this out
        Head = 'Optical Hat',
        -- Neck = 'Peacock Amulet',

    },
    Enmity = { -- TODO: LOAD UP THAT PLATE
        Waist = 'Warwolf Belt',
        Ring1 = 'Sattva Ring',
        Back = 'Resentment Cape',
    },
    mdt = {
        Ear1 = 'Coral Earring',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Resentment Cape',
    },
    Precast = {
        Ear1 = 'Loquac. Earring'
    },
    Enhancing = { -- TODO: for sj RDM bar/enspell/phalanx
        Ear1 = 'Moldavite Earring', -- apparently MAB impacts spike damage, slap these on for blaze spikes
        Ear2 = 'Novio Earring',
        Neck = 'Enhancing Torque',
        Back = 'Merciful Cape',
    },
    -- ABILITIES --
    Focus = {
        Head = 'Temple Crown',
    },
    Dodge = {
        Feet = 'Temple Gaiters',
    },
    Chakra = { -- VIT mod;
        Ammo = 'Happy Egg',
        Head = 'Genbu\'s Kabuto',
        Ear1 = 'Waetoto\'s Earring',
        Body = 'Temple Cyclas', -- 3 VIT; Enhances Chakra effect
        Hands = 'Mel. Gloves +1', -- Enhances Chakra effect II
        Ring1 = 'Sattva Ring',
        Back = 'Melee Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Wonder Braccae',
        Feet = 'Creek M Clomps',
    },
    Boost = {
        Hands = 'Temple Gloves',
    },
    Counterstance = {
        Feet = 'Mel. Gaiters +1'
    },
    ChiBlast = { -- MND mod
        Head = 'Temple Crown',
        Neck = 'Faith Torque',
        Ring2 = 'Aqua Ring',
        Back = 'Melee Cape',
        Legs = 'Tpl. Hose +1',
    },

    Movement = {
    },

    Ws_Default = { -- blanket WS
        Head = 'Shr.Znr.Kabuto',
        Neck = 'Faith Torque',
        Ear1 = 'Coral Earring',
        Ear2 = 'Ethereal Earring',
        Body = '',
        Hands = 'Mel. Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Flame Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Creek M Clomps',
    },
    brdSub = {
        Ear2 = 'Singer\'s Earring',
        Back = 'Singer\'s Mantle',
    },
    elTank = { -- TODO: use for skillup farming atm, but update to actual tank/guard
        Ammo = 'Fenrir\'s Stone',
        Head = 'Arhat\'s Jinpachi',
        Neck = 'Guarding Torque',
        Ear1 = 'Waetoto\'s Earring',
        Ear2 = 'Ethereal Earring',
        Body = 'Arhat\'s gi',
        Hands = 'Mel. Gloves +1',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Jelly Ring',
        -- Ring2 = 'Deflecting Band', -- tactical guard, slow +5% (use?)
        Back = 'Boxer\'s Mantle',
        Waist = 'Black Belt',
        Legs = 'Tpl. Hose +1',
        Feet = 'Mel. Gaiters +1',
    },
    None = { -- TODO: test this, pretty sure no H2H is still H2H skill; this was for shield on PLD
    --     Head = 'Koenig Schaller',
    --     Neck = 'Shield Torque',
    --     Ear1 = 'Morukaka Earring',
    --     Ear2 = 'Ethereal Earring',
    --     Feet = 'Glt. Leggings +1',
    },
    HandToHand = {
        Neck = 'Faith Torque',
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
    ['hpDown'] = { -- TODO: copy/paste this from PLD, keeping this logic in here if I get dumb ideas about tanking
    --     Ammo = 'Phtm. Tathlum', -- 0
    --     Head = 'Reraise Hairpin', -- -7
    --     Neck = 'Willpower Torque', -- 0
    --     Ear1 = 'Brutal Earring', -- 0
    --     Ear2 = 'Loquac. Earring', -- 0
    --     Body = 'Haubergeon', -- 0
    --     Hands = 'Wonder Mitts', -- 12
    --     Ring1 = 'Aqua Ring', -- 0
    --     Ring2 = 'Snow Ring', -- 0
    --     Back = 'Amemet Mantle +1', -- 0
    --     Waist = 'Sprinter\'s Belt', -- 0
    --     Legs = 'Valor Breeches', -- 20
    --     Feet = 'Crimson greaves', -- 15
    },
    ['hpUp'] = { -- +395hp -40hp in hpDown set = 355 HP to be cureIV'd; 375hp in daytime /w FenrirStone
    --     Ammo = 'Happy Egg', -- 10
    --     Head = 'Koenig Schaller', -- 30
    --     Neck = 'Shield Torque', -- 7
    --     Ear1 = 'Morukaka Earring', -- 35
    --     Ear2 = 'Ethereal Earring', -- 15
    --     Body = 'Wonder Kaftan', -- 36
    --     Hands = 'Alkyoneus\'s Brc.', -- 40
    --     Ring1 = 'Bomb Queen Ring', -- 75
    --     Ring2 = 'Toreador\'s Ring', -- 10
    --     Back = 'Gigant Mantle', -- 80
    --     Waist = 'Warwolf Belt', -- 0
    --     Legs = 'Homam Cosciales', -- 31
    --     Feet = 'Homam Gambieras', -- 26
    },

};
profile.Sets = sets;

local HandleGabagool = function()

    local eyyImWalkinHere = { 
        [0] = "Yo, you orderin' or just standin' there? What you want?",
        [1] = "Get a caprese hero, it ain't gonna disappoint!",
        [2] = "You want that hero toasted, or you like it weak?",
        [3] = "Fresh mozz just dropped, you want in or what?",
        [4] = "Classic pep-if you know, you know. Get one.",
        [5] = "Extra provolone? Don\'t be cheap, load it up!",
        [6] = "Our marinara? You ain't dippin' in better anywhere else.",
        [7] = "You tryna skip the prosciutto? Nah, you need that Parma.",
        [8] = "These cannolis will blow your mind. Take one, don\'t argue.",
        [9] = "Pesto so good, you ain\'t ever goin' back to that store-bought trash!",
        };
        -- print(eyyImWalkinHere[math.random(0,9)])

    return eyyImWalkinHere[math.random(0,9)]

end

profile.Packer = {
    --{Name = 'Averagegupi', Quantity = 'all'},
};

profile.OnLoad = function() -- LOAD
    gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 4');
    AshitaCore:GetChatManager():QueueCommand(1, '/lockstyleset 92');
end

profile.OnUnload = function() --UNLOAD
    gcinclude.Unload();
end

profile.HandleCommand = function(args) --INPUT HANDLER?
    gcinclude.HandleCommands(args);
end

profile.HandleDefault = function() --AUTO HANDLER?
    local game = gData.GetEnvironment();
    local outsideControl = conq:GetOutsideControl()
    local currentlyEquipped = gData.GetEquipment();
    local isCounterstanceOn = gData.GetBuffCount('Counterstance')
    local player_entity = GetPlayerEntity(); -- Verbose, but leaving this in as an example
    local player = gData.GetPlayer(); --PLAYER STATUS CHECK
    
    -- print(conq:GetOutsideControl()) -- are you in a region controlled by nation other than yours
    -- print(conq:GetInsideControl()) -- are you in a region controlled by your nation
    
    gFunc.EquipSet(sets.Idle);
    if (game.Time > 6.00 and game.Time < 18.00) then -- daytime
        gFunc.Equip('Hands', 'Garden Bangles')
        gFunc.Equip('Ammo', 'Fenrir\'s Stone')
    end
    if (outsideControl) then
        gFunc.Equip('Head', 'President. Hairpin')
    end
    if (player.HPP <= 50) then
        gFunc.Equip('Waist', 'Muscle Belt')
    end
    -- if (player.SubJob == 'RDM' and player.MPP < 99) then
    --     gFunc.Equip('Body', 'Royal Cloak')
    -- end

    -- print(player_entity.Look.Sub.type)
    -- need to check for currentlyEquipped.Sub to exist, if so there is something in the OH
    -- shield means that .Sub exists AND returns 0 in table (AND sj is not Ninja?)
    -- print('Sub: ' + currentlyEquipped.Sub.Resource.Skill)
    -- print('Main: ' + currentlyEquipped.Main.Resource.Skill)

    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
                if (gcdisplay.GetToggle('acc') == true) then
            gFunc.EquipSet(sets.Acc_Override)    
        end
        -- print('tp set on')
        if(player.SubJob == 'DRG') then
            gFunc.EquipSet(sets.DrgSJ)
        end
        -- weapon logic START 
        -- local mainWepSet
        -- print('between HP/MP threshold')
        -- print(currentlyEquipped.Sub)
        -- if(currentlyEquipped.Sub ~= nil and currentlyEquipped.Sub.Resource.Skill == 0) then -- sub existing and equaling 0 means shield
            --     mainWepSet = wep_table[currentlyEquipped.Sub.Resource.Skill];
            -- if(currentlyEquipped.Sub ~= nil) then -- something in the sub slot
            --     if (currentlyEquipped.Sub.Resource.Skill == 0) then
            --         mainWepSet = 'None' -- special handling for shield
            --     else
            --         mainWepSet = skillz.wep_table[currentlyEquipped.Main.Resource.Skill];
            --         -- print(skillz.wep_table[currentlyEquipped.Main.Resource.Skill]) -- debugging, this would return correct output
            --     end
            -- elseif(currentlyEquipped.Sub == nil and currentlyEquipped.Main ~= nil) then -- nothing in sub slot, main is present
                -- local mainWep = currentlyEquipped.Main.Resource.Skill; -- verbose, but leaving in as learning
                -- local wepSet = sets.wep_table[mainWep];
                -- print('what is mainwep: ' + mainWepSet)
                -- print(mainWepSet)
                -- mainWepSet = skillz.wep_table[currentlyEquipped.Main.Resource.Skill];
                -- print(skillz.wep_table[currentlyEquipped.Main.Resource.Skill])
            -- end 
            -- gFunc.EquipSet(sets[mainWepSet]) -- look in the weapon table, equip the resulting set
            -- weapon logic END 

        -- moved this inside engaged check for idle/resting sets
        if (gcdisplay.GetToggle('tank') == true) then
            gFunc.EquipSet(sets.elTank)
        end

        -- TOOD: need this inside engaged, or outside?
        if(isCounterstanceOn == 1) then
            -- print('counterstance is on') --testing
            gFunc.EquipSet(sets.Counterstance)
        end

        -- print(currentlyEquipped.Main.Name)
        if(currentlyEquipped.Main.Name == 'Faith Baghnakhs') then
            gFunc.Equip('Ammo', 'Virtue Stone')
        end

    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
        
    elseif (player.IsMoving == true) then
        gFunc.EquipSet(sets.Movement);
        
    end
        
        -- outside of engaged check, so can be idle in these sets
        if(gcdisplay.GetToggle('mdt')) then 
            gFunc.EquipSet(sets.mdt)
        end    
        
        gcinclude.CheckDefault();
    end
    
    profile.HandleAbility = function() --ABILITY HANDLER
    local ability = gData.GetAction();

    if string.match(ability.Name, 'Focus') then
        gFunc.EquipSet(sets.Focus);
    end
    if string.match(ability.Name, 'Dodge') then
        gFunc.EquipSet(sets.Dodge);
    end
    if string.match(ability.Name, 'Boost') then
        gFunc.EquipSet(sets.Boost);
    end
    if string.match(ability.Name, 'Chakra') then
        gFunc.EquipSet(sets.Chakra);
    end
    if string.match(ability.Name, 'Chi Blast') then
        gFunc.EquipSet(sets.ChiBlast);
    end
    if string.match(ability.Name, 'Counterstance') then
        gFunc.EquipSet(sets.Counterstance);
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
    local game = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
	local player = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

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
    elseif (spell.Skill == 'Enfeebling Magic') then -- enmity here for /RDM bind,blind,etc
        gFunc.EquipSet(sets.Enmity);
    elseif (spell.Skill == 'Dark Magic') then -- enmity here if /DRK stun
        gFunc.EquipSet(sets.Enmity);
    elseif (spell.Skill == 'Divine Magic') then
        gFunc.EquipSet(sets.Enmity);
    elseif(spell.Skill == 'Singing') then
        gFunc.EquipSet(sets.brdSub)
    end
end


profile.HandleWeaponskill = function() -- WEAPONSKILL
    local game = gData.GetEnvironment();
    local canWS = gcinclude.CheckWsBailout();
    local wsName = gData.GetAction().Name;
    if (canWS == false) then gFunc.CancelAction() return;
    else
        gFunc.EquipSet(sets.Ws_Default)
        if (game.Time > 6.00 and game.Time < 18.00) then --daytime 10attack
            gFunc.Equip('Ear1', 'Fenrir\'s Earring')
        end

        local action = gState.PlayerAction;
        local wepSkillName = action.Resource.Name[1]; -- this will return the name of the WS
        -- print('wepSkillName')
        -- print(wepSkillName)

        local currentlyEquipped = gData.GetEquipment();
        local mainWep = skillz.wep_table[currentlyEquipped.Main.Resource.Skill]; -- this will return the string value in wep table
        if (mainWep == nil) then
            mainWep = 'HandToHand'
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

        if (gcdisplay.GetToggle('eyy') == true) then
            AshitaCore:GetChatManager():QueueCommand(1, '/p ' + HandleGabagool()); 
        end
        -- wsPoints = wsPoints + 3
        -- print (wsPoints)
        -- AshitaCore:GetChatManager():QueueCommand(1, '/p You are at: ' + wsPoints + ' points.'); 

        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
    end

end

return profile;