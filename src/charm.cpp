/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2019 Mark Samman <mark.samman@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include "otpch.h"
#include "charm.h"
#include "pugicast.h"

Charm* Charms::getCharm(uint8_t id)
{
	auto it = charms.find(id);
	if (it == charms.end()) {
		return nullptr;
	}
	return &it->second;
}

bool Charms::loadFromXml(bool /* reloading */) {
	pugi::xml_document doc;
	pugi::xml_parse_result result = doc.load_file("data/XML/charm.xml");
	if (!result) {
		printXMLError("Error - Charms::loadFromXml", "data/XML/charm.xml", result);
		return  false;
	 }

	for (auto charmNode : doc.child("charms").children()) {
		pugi::xml_attribute attr;
		if (strcasecmp(charmNode.name(), "charm") == 0) {
			pugi::xml_attribute clientIDbase = charmNode.attribute("clientid");
			if (!clientIDbase) {
				std::cout << "[Warning - Charms::loadFromXml] Missing Charms category clientid" << std::endl;
				continue;
			}

			uint8_t id = static_cast<uint8_t>(pugi::cast<uint16_t>(clientIDbase.value()));
			auto res = charms.emplace(std::piecewise_construct,
				std::forward_as_tuple(id),
				std::forward_as_tuple(id)
			);

			if (!res.second) {
				std::cout << "[Warning - Charms::loadFromXml] Duplicate Charms of ID: '" << id << "'." << std::endl;
				continue;
			}

			pugi::xml_attribute nameBase = charmNode.attribute("name");
			if (!nameBase) {
				std::cout << "[Warning - Charms::loadFromXml] Missing Charms category name" << std::endl;
				continue;
			}

			Charm& charm = res.first->second;
			charm.name = nameBase.as_string();

			if (!(attr = charmNode.attribute("type"))) {
				std::cout << "[Warning - Charms::loadFromXml] Missing Charms type." << std::endl;
				continue;
			}

			uint8_t type = static_cast<uint8_t>(pugi::cast<uint16_t>(attr.value()));
			charm.type = type;

			if (!(attr = charmNode.attribute("price"))) {
				std::cout << "[Warning - Charms::loadFromXml] Missing Charms type." << std::endl;
				continue;
			}

			uint16_t price = pugi::cast<uint16_t>(attr.value());
			charm.price = price;

			if (!(attr = charmNode.attribute("description"))) {
				std::cout << "[Warning - Charms::loadFromXml] Missing Charms type." << std::endl;
				continue;
			}

			charm.description = attr.as_string();
		}

	}

	return true;
}

bool Charms::reload() {

	return loadFromXml(true);
}
