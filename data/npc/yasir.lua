local npcType = Game.createNpcType("Yasir")
local npc = {}

npc.description = "Yasir"

npc.health = "150"
npc.maxHealth = "150"
npc.outfit = {
    lookType = 146,
    lookHead = 85,
    lookBody = 7,
    lookLegs = 12,
    lookFeet = 19,
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
