local npcType = Game.createNpcType("Ariella")
local npc = {}

npc.description = "Ariella"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 155,
    lookHead = 115,
    lookBody = 3,
    lookLegs = 1,
    lookFeet = 76,
    lookAddons = 2
}

npc.voices = {
    interval = 120,
    chance = 0,
    { text = "Have a drink in Meriana's only tavern!", yell = false }
}

npc.flags = {
    attackable = false,
    hostile = false,
    floorchange = false
}

npcType.onThink = function(npc, interval)
end

npcType.onAppear = function(npc, creature)
end

npcType.onDisappear = function(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
    local player = creature:getPlayer()
    if player then	
        if npc:greet(message, player) then
            return true
        elseif npc:unGreet(message, player) then
            return true
        end
    end
end

npcType:register(npc)
