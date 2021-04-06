local npcType = Game.createNpcType("Rock In A Hard Place")
local npc = {}

npc.walkInterval = "0"
npc.floorChange = "0"
npc.script = "rock_in_a_hard_place.lua"
npc.description = "Rock In A Hard Place"

npc.health = "100"
npc.maxHealth = "100"
npc.outfit = {
    lookTypeex = 14898
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