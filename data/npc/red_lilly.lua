local npcType = Game.createNpcType("Red Lilly")
local npc = {}

npc.description = "Red Lilly"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 136,
    lookHead = 96,
    lookBody = 57,
    lookLegs = 28,
    lookFeet = 47,
    lookAddons = 0
}

npc.voices = {
    interval = 120,
    chance = 0,
    { text = "Come visit my little pawnshop! General equipment and such. Don't miss it!", yell = false }
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
