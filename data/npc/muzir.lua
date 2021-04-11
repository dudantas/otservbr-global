local npcType = Game.createNpcType("Muzir")
local npc = {}

npc.description = "Muzir"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 0
npc.walkRadius = 2

npc.outfit = {
    lookType = 146,
    lookHead = 95,
    lookBody = 4,
    lookLegs = 11,
    lookFeet = 76,
    lookAddons = 0
}

npc.voices = {
    interval = 120,
    chance = 0,
    { text = "Daraman's blessings.", yell = false }
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
