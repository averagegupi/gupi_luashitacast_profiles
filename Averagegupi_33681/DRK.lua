local zuccSuccTable = {'Drain', 'Drain II', 'Aspir'};
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
local intDebuffTable = {'Burn','Frost','Choke','Rasp','Shock','Drown'}
local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');
skillz = gFunc.LoadFile('common\\skillz.lua');
conq = gFunc.LoadFile('common\\conquest.lua')

local sets = {
    Idle = {
        Neck = 'Parade Gorget',
        Body = 'Vampire Cloak',
        -- Hands = 'Blood Fng. Gnt.',
        Back = 'Gigant Mantle',
        Legs = 'Crimson Cuisses',
        -- Feet = 'Homam Gambieras',
    },
    Resting = {
        Neck ='Checkered Scarf',
    },
    Town = {
        Head = 'Homam Zucchetto',
        Body = 'Ducal aketon',
    },
    Solo = {
        -- Ammo = 'Fenrir\'s Stone',
        Head = 'Homam Zucchetto',
        -- Neck = 'Parade Gorget',
        Body = 'Homam Corazza',
        Hands = 'Homam Manopolas',
        Ear2 = 'Ethereal Earring',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Jelly ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Sprinter\'s Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    DrgSJ = {
        Ear2 = 'Wyvern Earring',
    },
    THFSJ = { -- stack the TA here
        Body = 'Homam Corazza',
    },
    Acc_Override = {
        -- Ear1 = 'Abyssal Earring',
        -- Neck = 'Peacock Amulet',
        Body = 'Homam Corazza',
        Back = 'Abyss Cape',
    },
    Tp_Default = { -- neck and ear logic SHOULD be handled
        Head = 'Homam Zucchetto',
        Body = 'Haubergeon',
        Hands = 'Homam Manopolas',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Sprinter\'s Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    Precast = { -- FC only
        Ear1 = 'Loquac. Earring',
        Legs = 'Homam Cosciales',
    },
    castInterim = { -- FC only
        Head = 'Homam Zucchetto',
        Neck = 'Evasion Torque',
        Ear2 = 'Ethereal Earring',
        Body = 'Scorpion Harness',
        Ring2 = 'Sattva Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Chs. Flanchard +1',
    },
    Midcast = { -- SIRD or evasion
        Neck = 'Willpower Torque',
    },
    Cure = {
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Abs. Flanchard +1',
        Feet = 'Chs. Sollerets +1',
    },
    Enhancing = {
        Ear1 = 'Moldavite Earring', -- apparently MAB impacts spike damage, slap these on
        Ear2 = 'Novio Earring',
        Neck = 'Enhancing Torque',
        Body = 'Abyss Cuirass',
        Back = 'Merciful Cape',
    },
    mdt = {
        Ear1 = 'Coral Earring',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Resentment Cape',
        Legs = 'Abs. Flanchard +1',
        Feet = 'Crimson Greaves',
    },
    Dread_Spikes = { --max out HP+ at cast to boost effect
        Ammo = 'Fenrir\'s Stone', --30 (daytime)
        Head = 'Homam Zucchetto', -- 22
        Neck = 'Evasion Torque', -- 7
        Ear1 = 'Morukaka Earring', -- 35
        Ear2 = 'Ethereal Earring', -- 15
        Body = 'Wonder Kaftan', -- 36
        Hands = 'Alkyoneus\'s Brc.', -- 40
        Ring1 = 'Sattva Ring', -- 30
        Ring2 = 'Bomb Queen Ring', -- 75
        Back = 'Gigant Mantle', -- 80
        Waist = 'Steppe Sash', -- 60
        Legs = 'Homam Cosciales', -- 26
        Feet = 'Homam Gambieras', -- 31
    },
    Enfeebling = {
        Head = 'Homam Zucchetto',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Cunning Earring',
        Ear2 = 'Abyssal Earring',
        Body = 'Chaos Cuirass',
        Hands = 'Abyss Gauntlets',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Abyss Cape',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Chs. Flanchard +1',
        Feet = 'Abyss Sollerets',
    },
    Dark = {
        Head = 'Chs. Burgeonet +1', -- 5
        Neck = 'Dark Torque', -- 7
        Ear1 = 'Morukaka Earring', -- crank the hp up so I'm getting the most value out of amount drained
        Ear2 = 'Abyssal Earring', -- 5
        Body = 'Demon\'s Harness', -- 5
        Hands = 'Blood Fng. Gnt.', -- 11
        Ring1 = 'Snow Ring', -- 0
        Ring2 = 'Snow Ring', -- 0 swapped for drain/aspir for overlords ring
        Back = 'Merciful Cape', -- 5
        Waist = 'Sprinter\'s Belt', -- 0
        Legs = 'Abs. Flanchard +1', -- 7
        Feet = 'Homam Gambieras', -- 0
    },
    Absorb = {
        Head = 'Black Sallet',
        Ear1 = 'Cunning Earring', -- override, need spell to land
        Hands = 'Black Gadlings',
        Back = 'Abyss Cape', -- 2 more mAcc than merciful, need spell to land
        Waist = 'Ryl.Kgt. Belt', -- not worried about recast, want spell to land
        Legs = 'Black Cuisses',
        Feet = 'Black Sollerets',
    },
    Nuke = {
        Head = 'Demon helm',
        Neck = 'Prudence torque',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Novio Earring',
        Body = 'Abyss Cuirass',
        Hands = 'Abyss Gauntlets',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Abyss Cape',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Chs. Flanchard +1',
        Feet = 'Homam Gambieras',
    },
    INTDebuff = {
        Neck = 'Prudence torque',
        Ear1 = 'Cunning Earring',
        Ear2 = 'Abyssal Earring',
        Back = 'Fed. Army Mantle',
    },
    Preshot = {
    },
    Midshot = {
        Head = 'Optical Hat',
        Neck = 'Faith Torque',
        Ear1 = 'Drone Earring',
        Ear2 = 'Waetoto\'s Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Blood Fng. Gnt.',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Tracker\'s Kecks',
        Feet = 'Homam Gambieras',
    },
    Ws_Default = { -- blanket WS
        Head = 'Chs. Burgeonet +1',
        Neck = 'Prudence Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Waetoto\'s Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Alkyoneus\'s Brc.',
        Ring1 = 'Flame Ring',
        Ring2 = 'Flame Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Black cuisses',
        Feet = 'Hct. Leggings'
    },
    BloodWeapon = {},
    WeaponBash = {
        Hands = 'Chs. Gauntlets +1'
    },
    LastResort = {
        Feet = 'Abyss Sollerets',
    },
    Souleater = {
        Body = 'Gloom Breastplate',
        Back = 'Abyss Cape', -- losing body acc, need it here
    },
    -- per weapon logic 
    None = { -- aka shield
        Neck = 'Shield Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring',
    },
    GreatSword = {
        Neck = 'Prudence Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Abyssal Earring',
    },
    GreatAxe = {
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Ethereal Earring',
    },
    Scythe = {
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Abyssal Earring',
    },
    Sword = {
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
    },
    Dagger = { --zerg???
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
    },
    Axe = {
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
    },
    ['zerg'] = {
        Ammo = 'Fenrir\'s Stone',
        Head = 'Homam Zucchetto',
        Neck = 'Peacock Amulet',
        Ear1 = 'Morukaka\'s Earring',
        Ear2 = 'Wyvern Earring',
        Body = 'Homam Corazza',
        Hands = 'Homam Manopolas',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Bomb Queen Ring',
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
    -- if spikes ~= 0 then gFunc.EquipSet(sets.Spikes) end
    local souleater = gData.GetBuffCount('Souleater');
    local currentlyEquipped = gData.GetEquipment();
    local game = gData.GetEnvironment();
    local mainWep

    gFunc.EquipSet(sets.Idle);
    if (game.Time > 6.00 and game.Time < 18.00) then
        gFunc.Equip('Hands', 'Garden Bangles')
    end


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
        
        if(souleater == 1) then
            gFunc.EquipSet(sets.Souleater)
        end

        if(currentlyEquipped.Range == nil) then -- check for range to not be present (aka xbow,bow,boomerang)
            -- print('first check passed');
            if(currentlyEquipped.Ammo.Resource.Skill == 0) then
                gFunc.Equip('Ammo', 'Bomb Core')
            end
        end
        
        -- current weapon logic START
        local mainWepSet

        -- SJ DRG LOGIC START | not using atm but setting specifc wep types to use wyvern earring on assuming sj DRG
        -- local twoHanders = {'GreatSword','Scythe','GreatAxe'}
        -- for i, setName in ipairs(twoHanders) do
        --     print("setName " .. setName .. ": " .. mainWepSet)
        --     if(setName == mainWepSet) then
        --         gFunc.Equip('Ear2', 'Wyvern Earring');
        --         return
        --     end
        -- end
        -- SJ DRG LOGIC END

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
        
        -- check for sj of DRG and throw wyvern in Ear2 slot
        if(player.SubJob == 'DRG') then
            gFunc.EquipSet(sets.DrgSJ)
            -- gFunc.Equip('Ear2', 'Wyvern Earring');
        end
        if(player.SubJob == 'THF') then
            gFunc.EquipSet(sets.THFSJ)
        end

        if (gcdisplay.GetToggle('acc') == true) then
            gFunc.EquipSet(sets.Acc_Override)    
        end

        if (gcdisplay.GetToggle('Solo') == true) then
            gFunc.EquipSet(sets.Solo)
            if (player.HPP >= 85 and player.MPP <= 95) then -- check to use p gorget if activatable, otherwise use logic above
                gFunc.Equip('Neck', 'Parade Gorget')
            end

        -- elseif (player.SubJob == 'PLD' and gcdisplay.GetToggle('whoami')) then
        --     gFunc.EquipSet(sets.whoami)
        end
        -- current weapon login END


        if(gcdisplay.GetToggle('zerg')) then
            gFunc.EquipSet(sets.zerg)
            if (game.Time < 6.00 or game.Time > 18.00) then
                gFunc.Equip('Ammo', 'Happy Egg')
            end
        end

    elseif (player.Status == 'Resting') then
        if (player.HPP >= 85) then -- check to use p gorget if activatable, otherwise use logic above
            gFunc.Equip('Neck', 'Parade Gorget')
        else
            gFunc.EquipSet(sets.Resting);
        end

    -- elseif (player.IsMoving == true) then -- W.Legs in idle set, no longer need this check
    --     gFunc.EquipSet(sets.Movement);
    end
    
    -- TODO: toggles for 'serious' tanking of stuff mdt/pdt?/resistance
    -- outside of engaged check, so can be idle in these sets
    if(gcdisplay.GetToggle('mdt')) then 
        gFunc.EquipSet(sets.mdt)
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
    local target = gData.GetActionTarget();
	local player = gData.GetPlayer();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
    local fastCastValue = 0.04 -- Loq/Homam pants
    local minimumBuffer = 0.1;
    local packetDelay = 0.25; -- using packetflow

    -- gcinclude.DoShadows(spell);
    gFunc.EquipSet(sets.Precast);

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

profile.HandleMidcast = function()
    local spell = gData.GetAction();
    local obiValue
    local currentlyEquipped = gData.GetEquipment();
    local game = gData.GetEnvironment();
    local target = gData.GetActionTarget();
	local player = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    -- print(spell.Element)
    -- print('first check: ' + currentlyEquipped.Ammo ~= nil);
    -- print('second check: ' currentlyEquipped.Ammo.Resource.Skill);

    gFunc.InterimEquipSet(sets.castInterim)  

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
        obiValue = ObiCheck(spell);
        if spell.MppAftercast <= 50 then
			gFunc.Equip('Neck', 'Uggalepih Pendant');
		end
        if (conq:GetInsideControl()) then
            -- print('Testing; Nuking while inside region controlled by current nation - Circlet ON')
            gFunc.Equip('Head', 'Republic Circlet')
        end
        if obiValue >= 1 then
            print('Obi for day/element going on - ELEMENTAL')
            gFunc.Equip('Waist', ElementalWaistTable[spell.Element]);
        else
            print('Obi check not met - ELEMENTAL')
        end
        if (gcdisplay.GetToggle('nuke') == true) then
            gFunc.Equip('main', ElementalStaffTable[spell.Element]); 
        end
        for i, name in ipairs(intDebuffTable) do
            if(name == spell.Name) then
                gFunc.EquipSet(sets.INTDebuff);
                -- print('match found, using INT set')
                if (gcdisplay.GetToggle('nuke') == true) then
                    gFunc.Equip('main', 'Ice Staff'); 
                end
            end
        end
    elseif (spell.Skill == 'Enfeebling Magic') then
        gFunc.EquipSet(sets.Enfeebling);
    elseif (spell.Skill == 'Dark Magic') then
        gFunc.EquipSet(sets.Dark);
        if (string.match(spell.Name, 'Dread Spikes')) then
            gFunc.EquipSet(sets.Dread_Spikes);
        elseif (spell.Name:find('^Absorb') ~= nil) then
            gFunc.EquipSet(sets.Absorb);
        elseif (string.contains(spell.Name, 'Drain') or string.contains(spell.Name, 'Aspir')) then 
            obiValue = ObiCheck(spell);
            gFunc.Equip('ring2', 'Overlord\'s Ring');
            if (spell.Name == 'Drain') then
                gFunc.Equip('ring1', 'Bomb Queen Ring')
            end
            -- print(obiValue);
            if obiValue >= 1 then
                print('Obi for day/element going on - DARK MAGIC')
                gFunc.Equip('Waist', ElementalWaistTable[spell.Element]);
            else
                print('Obi check not met - DARK')
            end
        end
    end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    local game = gData.GetEnvironment();
    gFunc.EquipSet(sets.Midshot);
    if (game.Time < 6.00 or game.Time > 18.00) then -- nighttime 10 rAttack
        gFunc.Equip('Ear1', 'Fenrir\'s Earring')
    end
    -- if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
    local game = gData.GetEnvironment();
    local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then 
        gFunc.CancelAction() return;
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
        -- Flame and Abyssal handling for GS/Scythe
        if (mainWep == 'GreatSword' or mainWep == 'Scythe') then
            gFunc.Equip('Ear2', 'Abyssal Earring')
        end
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