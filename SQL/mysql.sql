CREATE TABLE IF NOT EXISTS `carddav_server` (
  `carddav_server_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`carddav_server_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

ALTER TABLE `carddav_server` ADD CONSTRAINT `carddav_server_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

CREATE TABLE IF NOT EXISTS `carddav_contacts` (
  `carddav_contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carddav_server_id` int(10) unsigned NOT NULL,
  `etag` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `vcard` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`carddav_contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

ALTER TABLE `carddav_contacts` ADD CONSTRAINT `carddav_contacts_ibfk_1` FOREIGN KEY (`carddav_server_id`) REFERENCES `carddav_server` (`carddav_server_id`) ON DELETE CASCADE;