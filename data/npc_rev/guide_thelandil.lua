local npcType = Game.createNpcType("Guide Thelandil")
local npc = {}

npc.walkInterval = "2000"
npc.floorChange = "0"
npc.script = "guide_thelandil.lua"
npc.description = "Guide Thelandil"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookType = 159,
    lookHead = 78,
    lookBody = 80,
    lookLegs = 101,
    lookFeet = 96
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