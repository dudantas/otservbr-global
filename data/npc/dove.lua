local npcType = Game.createNpcType("Dove")
local npc = {}

npc.description = "Dove"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 136,
    lookHead = 59,
    lookBody = 86,
    lookLegs = 106,
    lookFeet = 115,
    lookAddons = 0
}

npc.voices = {
    interval = 90,
    chance = 0,
    { text = "If you need help with letters or parcels, just ask me. I can explain everything.", yell = false },
    { text = "Hey, send a letter to your friend now and then. Keep in touch, you know.", yell = false },
    { text = "Welcome to the post office!", yell = false }
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