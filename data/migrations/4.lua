function onUpdateDatabase()
	print("> Updating database to version 5 (bestiary and charms)")
	db.query("ALTER TABLE `players` ADD `bestiary_kills` LONGBLOB DEFAULT NULL")
	db.query("ALTER TABLE `players` ADD `bestiary_tracker` LONGBLOB DEFAULT NULL")
	db.query("ALTER TABLE `players` ADD `charm_points` INT(11) DEFAULT 0")
	db.query("ALTER TABLE `players` ADD `charm_expansion` TINYINT(11) DEFAULT 0")
	db.query("ALTER TABLE `players` ADD `charms` LONGBLOB DEFAULT NULL")
	return true
end
