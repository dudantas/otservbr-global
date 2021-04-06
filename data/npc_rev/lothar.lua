local npcType = Game.createNpcType("Lothar")
local npc = {}

npc.walkInterval = "2000"
npc.script = "lothar.lua"
npc.description = "Lothar"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 153,
    lookHead = 114,
    lookBody = 113,
    lookLegs = 132,
    lookFeet = 132,
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
    if greetMessage(message, creature) then
        npc:say("Hello, ".. creature:getName() ..", what you need?", TALKTYPE_PRIVATE_NP)
    end

    if farewellMessage(message, creature) then
        npc:say("Goodbye, ".. creature:getName() .."", TALKTYPE_PRIVATE_NP)
    end
end

npcType:register(npc)