local npcType = Game.createNpcType("The First Dragon")
local npc = {}

npc.walkInterval = "2000"
npc.script = "the_first_dragon.lua"
npc.description = "The First Dragon"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 947,
    lookAddons = 3,
    lookHead = 113,
    lookBody = 117,
    lookLegs = 119,
    lookFeet = 80
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