local playerFocusNpc = {}

-- Checks whether a message is being sent to npc
-- msgContains(message, keyword)
function msgContains(message, keyword)
	local message, keyword = message:lower(), keyword:lower()
	if message == keyword then
		return true
	end

	return message:find(keyword) and not message:find('(%w+)' .. keyword)
end

-- Add the focus player from the npc (by creature id)
-- addFocus(creature)
function addFocus(creature)
	if not table.contains(playerFocusNpc, creature:getId()) then
		table.insert(playerFocusNpc, creature:getId())
		return true
	end
end

-- Remove the focus player from the npc (by creature id)
-- addFocus(creature)
function removeFocus(creature)
	if table.contains(playerFocusNpc, creature:getId()) then
		for i = 1, #playerFocusNpc do
			if playerFocusNpc[i] == creature:getId() then
				table.remove(playerFocusNpc, i)
				return true
			end
		end
	end
end

-- Npc talk
-- npc:talk({text, text2}) or npc:talk(text)
function Npc:talk(text)
	if type(text) == "table" then
		for i = 0, #text do
			self:say(text[i])
		end
	else
		self:say(text)
	end
end

-- Npc send message to player
-- npc:sendMessage(text)
function Npc:sendMessage(text)
	return self:say(text)
end

-- Npc send greetings message
-- npc:greetMessage(message, creature) = Automatic text
-- npc:greetMessage(message, creature, text) = Define a text
function Npc:greetMessage(message, creature, text)
	if msgContains(message, "hi") and addFocus(creature) then
		if text then
			self:sendMessage(text)
		else
			self:sendMessage("Hello, ".. creature:getName() ..", what you need?")
		end
	end
end

-- Npc send farewell message
-- npc:farewellMessage(message, creature) = Automatic text
-- npc:farewellMessage(message, creature, text) = Define a text
function Npc:farewellMessage(message, creature, text)
	if msgContains(message, "bye") and removeFocus(creature) then
		if text then
			self:sendMessage(text)
		else
			self:sendMessage("Goodbye, ".. creature:getName() .."")
		end
		return true
	end
end