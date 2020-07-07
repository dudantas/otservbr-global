local messages = {
	"Found a bug? Report on the github issue tracker: https://github.com/dudantas/otservbr-global/issues"
}

function onThink(interval)
	local msg = messages[math.random(#messages)]
	Game.broadcastMessage(msg, MESSAGE_EVENT_ADVANCE)
	return true
end
