local npcType = Game.createNpcType("Rabaz")
local npc = {}

npc.description = "Rabaz"

npc.health = 100
npc.maxHealth = npc.health
npc.walkInterval = 2000
npc.walkRadius = 2

npc.outfit = {
    lookType = 130,
    lookHead = 39,
    lookBody = 38,
    lookLegs = 1,
    lookFeet = 1,
    lookAddons = 0
}

npc.voices = {
    interval = 90,
    chance = 0,
    { text = "Potions, runes, wands and rods, all here in the great Malunga's house.", yell = false }
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