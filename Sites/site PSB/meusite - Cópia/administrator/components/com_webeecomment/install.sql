CREATE TABLE IF NOT EXISTS #__webeeComment_Comment(
	id INTEGER UNSIGNED NOT NULL DEFAULT NULL AUTO_INCREMENT,
        articleId INTEGER UNSIGNED NOT NULL DEFAULT 0,
	content TEXT NOT NULL DEFAULT '',
	handle TEXT NOT NULL,
	isUser INTEGER UNSIGNED NOT NULL DEFAULT 0,
	email TEXT NOT NULL,
	url TEXT DEFAULT '',
        published INTEGER UNSIGNED NOT NULL DEFAULT 0,
	saved DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
	ordering INTEGER UNSIGNED NOT NULL DEFAULT 0,
	hits INTEGER UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS #__webeeComment_Disabled(
	id INTEGER UNSIGNED NOT NULL DEFAULT NULL AUTO_INCREMENT,
	target_id INTEGER UNSIGNED NOT NULL DEFAULT 0,
	type TEXT NOT NULL,
	PRIMARY KEY(id)

);
