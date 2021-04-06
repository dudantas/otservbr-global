local npcType = Game.createNpcType("Rashid of Island")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.walkRadius = "3"
npc.script = "rashid.lua"
npc.description = "Rashid of Island"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 146,
    lookHead = 100,
    lookBody = 100,
    lookLegs = 119,
    lookFeet = 115,
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