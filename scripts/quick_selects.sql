USE football_stats_db;

/*
SELECT 	team_name, team_mascot, team_city, team_state
FROM	team
;

SELECT 	season_id
FROM 	season
;

SELECT 	player_id, given_name, family_name, year_drafted
FROM	player
;

SELECT 	position_name, position_description
FROM	position
ORDER BY	position_name;
;

SELECT 	stat_name, stat_name, stat_description
FROM	stat
;

SELECT 
		player.given_name
        , player.family_name
        , stat.stat_name
        , season.season_id
		, player_stat.stat_amount

FROM	player_stat JOIN player
		ON player_stat.player_id = player.player_id
        JOIN stat ON stat.stat_name = player_stat.stat_name
        JOIN season ON season.season_id = player_stat.season_id
;

SELECT 	CONCAT(player.given_name, ' ', player.family_name) as Player, position.position_name
FROM	player_position JOIN player
		ON player_position.player_id = player.player_id
		JOIN position ON position.position_name  = player_position.position_name
ORDER BY	player
;

SELECT 	team.team_name, season.season_id, CONCAT(player.given_name, ' ', player.family_name) as Player
FROM	team_season JOIN team
		ON team_season.team_name = team.team_name
        JOIN season ON season.season_id = team_season.season_id
        JOIN player ON player.player_id = team_season.player_id
;

SELECT player.given_name, player.family_name, stat.stat_name
		, season.season_id, player_stat.stat_amount
FROM	player_stat JOIN player
		ON player_stat.player_id = player.player_id
        JOIN stat ON stat.stat_name = player_stat.stat_name
        JOIN season ON season.season_id = player_stat.season_id
;
*/

CALL `football_stats_db`.`sp_insert_new_player`('', 'Cousins', '2012');




