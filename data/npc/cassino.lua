local npcType = Game.createNpcType("Cassino")
local npc = {}

npc.description = "Cassino"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 0
npc.speed = 0
npc.walkRadius = 2

npc.outfit = {
    lookType = 132,
    lookHead = 60,
    lookBody = 22,
    lookLegs = 24,
    lookFeet = 32,
    lookAddons = 2
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
