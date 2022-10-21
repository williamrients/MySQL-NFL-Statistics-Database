USE football_stats_db;

-- VIEWS

-- view for all players on teams in a season
DROP VIEW IF EXISTS all_nfl_team_season_players;
CREATE VIEW all_nfl_team_season_players AS
SELECT 	team.team_name, season.season_id, CONCAT(player.given_name, ' ', player.family_name) as Player
FROM	team_season JOIN team
		ON team_season.team_name = team.team_name
        JOIN season ON season.season_id = team_season.season_id
        JOIN player ON player.player_id = team_season.player_id
;

-- view for all players and their positions
DROP VIEW IF EXISTS all_nfl_players_positions;
CREATE VIEW	all_nfl_players_positions AS
SELECT 	CONCAT(player.given_name, ' ', player.family_name) as Player, position.position_name
FROM	player_position JOIN player
		ON player_position.player_id = player.player_id
		JOIN position ON position.position_name  = player_position.position_name
;

-- view for all players and their stats
DROP VIEW IF EXISTS all_nfl_players_stats;
CREATE VIEW	all_nfl_players_stats AS
SELECT CONCAT(player.given_name, ' ', player.family_name) as Player, stat.stat_name
		, season.season_id, player_stat.stat_amount
FROM	player_stat JOIN player
		ON player_stat.player_id = player.player_id
        JOIN stat ON stat.stat_name = player_stat.stat_name
        JOIN season ON season.season_id = player_stat.season_id
;

-- STORED PROCEDURE

-- Insert player
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_insert_new_player$$
CREATE PROCEDURE sp_insert_new_player
(
	IN p_given_name 	varChar(50),
    IN p_family_name	varChar(50),
    IN p_year_drafted 	varChar(4)
)
COMMENT 'Inserts a new player into the Player table.'
BEGIN
	INSERT INTO player
		(given_name, family_name, year_drafted)
	VALUES
		(p_given_name, p_family_name, p_year_drafted)
;
	SELECT 	player_id, CONCAT(given_name, ' ', family_name) AS Player, year_drafted
    FROM 	player
;
END$$
DELIMITER ;

-- Update player
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_update_current_player$$
CREATE PROCEDURE sp_update_current_player
(
	IN p_player_id		int,
	IN p_given_name 	varChar(50),
    IN p_family_name	varChar(50),
    IN p_year_drafted 	varChar(4)
)
COMMENT 'Updates a current player in the Player table.'
BEGIN
	UPDATE	player
    SET		given_name = p_given_name, family_name = p_family_name, year_drafted = p_year_drafted
    WHERE	player_id = p_player_id
;
SELECT 	given_name, family_name, year_drafted
FROM	player
;
END$$
DELIMITER ;

-- Delete player
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_current_player$$
CREATE PROCEDURE sp_delete_current_player
(
	IN p_player_id		int
)
COMMENT 'Deletes a current player in the Player table.'
BEGIN
	IF p_player_id < 100 THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'Please enter a valid Player ID',
			MYSQL_ERRNO = 1146;
	END IF;
    DELETE FROM Player_Position
    WHERE		player_id = p_player_id
;
	DELETE FROM Team_Season
	WHERE		player_id = p_player_id
;
	DELETE FROM Player_Stat
    WHERE 		player_id = p_player_id
;
	DELETE FROM player
    WHERE		player_id = p_player_id
;
SELECT 	given_name, family_name, year_drafted
FROM	player
;
END$$
DELIMITER ;

-- Insert a new season
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_insert_new_season$$
CREATE PROCEDURE sp_insert_new_season
(
	IN p_season_id		varChar(9)
)
COMMENT 'Inserts a new season into the season table'
BEGIN
	INSERT INTO season
		(season_id)
	VALUES
		(p_season_id)
;

	SELECT 	season_id
    FROM	season
;
END$$
DELIMITER ;

-- Update a season
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_update_current_season$$
CREATE PROCEDURE sp_update_current_season
(
	IN	p_season_id		varChar(9),
    IN	p_new_season_id	varChar(9)
)
COMMENT 'Updates a current season in the season table'
BEGIN
	IF p_season_id = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'The season you want to update is required and must be seperated by a \'-\'',
			MYSQL_ERRNO = 1146;
	END IF;
	UPDATE season
    SET season_id = p_new_season_id
    WHERE season_id = p_season_id
;

	SELECT 	season_id
    FROM	season
;
END$$
DELIMITER ;

-- Delete a season
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_delete_current_season$$
CREATE PROCEDURE sp_delete_current_season
(
	IN	p_season_id		varChar(9)
)
COMMENT 'Deletes a current season into the season table'
BEGIN
	IF p_season_id = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'The season you want to delete is required and must be seperated by a \'-\'',
			MYSQL_ERRNO = 1146;
	END IF;
    DELETE FROM team_season
    WHERE season_id = p_season_id
;
	DELETE FROM player_stat
    WHERE season_id = p_season_id
;
	DELETE FROM season
    WHERE 		season_id = p_season_id
;

	SELECT 	season_id
    FROM	season
;
END$$
DELIMITER ;

-- View players on specific team
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_view_players_on_specific_team$$
CREATE PROCEDURE sp_view_players_on_specific_team
(
	IN p_team_name varChar(50)
)
COMMENT 'View players on specific team'
BEGIN
	IF p_team_name = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'Please enter a valid team',
			MYSQL_ERRNO = 1146;
	END IF;
	SELECT 	team_name, season_id, player
	FROM	all_nfl_team_season_players
	WHERE	team_name = p_team_name
;
END$$
DELIMITER ;

-- View players in a specific position
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_view_players_in_specific_position$$
CREATE PROCEDURE sp_view_players_in_specific_position
(
	IN p_position_name varChar(50)
)
COMMENT 'View players in specific position'
BEGIN
	IF p_position_name = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'Please enter a valid position',
			MYSQL_ERRNO = 1146;
	END IF;
	SELECT 	player, position_name
	FROM	all_nfl_players_positions
    WHERE	position_name = p_position_name
;
END$$
DELIMITER ;

-- View stats for specific player
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_view_stats_for_specific_player$$
CREATE PROCEDURE sp_view_stats_for_specific_player
(
	IN p_player_name varChar(50)
)
COMMENT 'View players with specific stat'
BEGIN
	IF p_player_name = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'Please enter the players given and family name seperated by a space',
			MYSQL_ERRNO = 1146;
	END IF;
	SELECT 	player, stat_name, season_id, stat_amount
	FROM	all_nfl_players_stats
	WHERE	player = p_player_name
	;
END$$
DELIMITER ;


-- TRIGGERS

-- Trigger for insert player
DROP TRIGGER IF EXISTS before_insert_new_player;
DELIMITER $$
CREATE TRIGGER before_insert_new_player
BEFORE INSERT ON player FOR EACH ROW
BEGIN
	IF NEW.given_name = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'Given name is required.',
			MYSQL_ERRNO = 1146;
	ELSEIF NEW.family_name = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'Family name is required.',
			MYSQL_ERRNO = 1146;
	ELSEIF NEW.year_drafted = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'Year Drafted is required and cannot be earlier than 1936.',
			MYSQL_ERRNO = 1146;
	END IF;
END $$
DELIMITER ;

-- Trigger for update player
DROP TRIGGER IF EXISTS before_update_current_player;
DELIMITER $$
CREATE TRIGGER before_update_current_player
BEFORE UPDATE ON player FOR EACH ROW
BEGIN
	IF NEW.player_id < 100 THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'Please enter a valid Player ID',
			MYSQL_ERRNO = 1146;
	ELSEIF NEW.given_name = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'Given name is required.',
			MYSQL_ERRNO = 1146;
	ELSEIF NEW.family_name = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'Family name is required.',
			MYSQL_ERRNO = 1146;
	ELSEIF NEW.year_drafted = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'Year Drafted is required and cannot be earlier than 1936.',
			MYSQL_ERRNO = 1146;
	END IF;
END $$
DELIMITER ;

-- Trigger for insert new season
DROP TRIGGER IF EXISTS before_insert_new_season;
DELIMITER $$
CREATE TRIGGER before_insert_new_season
BEFORE INSERT ON season FOR EACH ROW
BEGIN
	IF NEW.season_id = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'Season is required and must be seperated by a \'-\'',
			MYSQL_ERRNO = 1146;
	END IF;
END $$
DELIMITER ;

-- Trigger for updating current season
DROP TRIGGER IF EXISTS before_update_current_season;
DELIMITER $$
CREATE TRIGGER before_update_current_season
BEFORE UPDATE ON season FOR EACH ROW
BEGIN
	IF NEW.season_id = '' THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT =
				'New season is required and must be seperated by a \'-\'',
			MYSQL_ERRNO = 1146;
	END IF;
END $$
DELIMITER ;
