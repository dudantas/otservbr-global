local npcType = Game.createNpcType("The Dream Master")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "the_dream_master.lua"
npc.description = "The Dream Master"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 130,
    lookHead = 19,
    lookBody = 39,
    lookLegs = 20,
    lookFeet = 58,
    lookAddons = 0
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