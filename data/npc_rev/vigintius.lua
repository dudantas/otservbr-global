local npcType = Game.createNpcType("Vigintius")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "vigintius.lua"
npc.description = "Vigintius"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 273,
    lookHead = 94,
    lookBody = 94,
    lookLegs = 88,
    lookFeet = 61,
    lookAddons = 3
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