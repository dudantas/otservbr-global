local mType = Game.createMonsterType("Crackler")
local monster = {}

monster.description = "a crackler"
monster.experience = 0
monster.outfit = {
	lookType = 293,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15000
monster.maxHealth = 15000
monster.race = "venom"
monster.corpse = 0
monster.speed = 300
monster.summonCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 3,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.events = {"CracklerTransform"}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = -100, maxDamage = -300, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 20, minDamage = -100, maxDamage = -300, type = COMBAT_ENERGYDAMAGE, range = 4, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 2000, chance = 20, minDamage = -100, maxDamage = -300, type = COMBAT_ENERGYDAMAGE, range = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_YELLOWENERGY, target = true},
	-- energy damage
	{name ="combat", type = COMBAT_ENERGYDAMAGE, interval = 2000, chance = 15, minDamage = -400, maxDamage = -800, effect = CONST_ME_BLOCKHIT, target = false}
}

monster.defenses = {
	defense = 50,
	armor = 50,
	{name ="combat", interval = 2000, chance = 12, minDamage = 100, maxDamage = 300, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 100},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 100},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 100},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
