local npcType = Game.createNpcType("Kallimae")
local npc = {}

npc.description = "Kallimae"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 1199,
    lookHead = 95,
    lookBody = 52,
    lookLegs = 0,
    lookFeet = 71,
    lookAddons = 1
}

npc.voices = {
    interval = 120,
    chance = 0,
    { text = "Good bye.", yell = false }
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
