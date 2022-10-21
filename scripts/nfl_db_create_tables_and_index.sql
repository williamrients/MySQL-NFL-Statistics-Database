/*
	Project:		Football Stats Database
	Name:			Football_Stats_db
    Author:			William Rients
    Description: 	Database to keep track of player stats by season
					team, and position
*/

-- CREATE TABLES
DROP DATABASE IF EXISTS 	Football_Stats_db;
CREATE DATABASE 			Football_Stats_db;
USE 						Football_Stats_db;

DROP TABLE IF EXISTS 		Team;
CREATE TABLE				Team
(
    team_name 		varChar(50)		primary key,
    team_mascot		varChar(50)		not null,
    team_city		varChar(50)		not null,
    team_state		varChar(50)		not null
);

DROP TABLE IF EXISTS 		Season;
CREATE TABLE				Season
(
	season_id		varChar(9)		primary key
);

DROP TABLE IF EXISTS 		Player;
CREATE TABLE				Player
(
	player_id		int				primary key auto_increment,
    given_name		varChar(50)		not null,
    family_name		varChar(50)		not null,
    year_drafted 	varChar(4)		not null
);
ALTER TABLE Player		auto_increment = 100;

DROP TABLE IF EXISTS 		Position;
CREATE TABLE				Position
(
	position_name 	varChar(50)		primary key,
    position_description varChar(255) not null
);

DROP TABLE IF EXISTS 		Stat;
CREATE TABLE				Stat
(
    stat_name		varChar(50)		primary key,
    stat_description varChar(255)	not null
);
ALTER TABLE Stat		auto_increment = 100;

DROP TABLE IF EXISTS		Team_Season;
CREATE TABLE				Team_Season
(
	team_name		varChar(50)		not null,
    season_id		varChar(9)		not null,
    player_id		int				not null,
    CONSTRAINT pk_Team_Season PRIMARY KEY (team_name, season_id, player_id),
    CONSTRAINT fk_Team_Season_team_name FOREIGN KEY (team_name)
		REFERENCES Team (team_name),
    CONSTRAINT fk_Team_Season_season_id FOREIGN KEY (season_id)
		REFERENCES Season (season_id),
	CONSTRAINT fk_Team_Season_player_id FOREIGN KEY (player_id)
		REFERENCES Player (player_id)
);

DROP TABLE IF EXISTS		Player_Position;
CREATE TABLE				Player_Position
(
	player_id		int			not null,
    position_name 	varChar(50) not null,
    CONSTRAINT pk_Player_Position PRIMARY KEY (player_id, position_name),
    CONSTRAINT fk_Player_Position_player_id FOREIGN KEY (player_id)
		REFERENCES Player (player_id),
    CONSTRAINT fk_Player_Position_position_name FOREIGN KEY (position_name)
		REFERENCES Position (position_name)
);

DROP TABLE IF EXISTS		Player_Stat;
CREATE TABLE				Player_Stat
(
	player_id		int			not null,
    stat_name		varChar(50) not null,
    season_id		varChar(9) 	not null,
    stat_amount		float		not null,
    CONSTRAINT pk_Player_Stat PRIMARY KEY (player_id, stat_name, season_id),
    CONSTRAINT fk_Player_Stat_player_id FOREIGN KEY (player_id)
		REFERENCES Player (player_id),
	CONSTRAINT fk_Player_Stat_stat_name FOREIGN KEY (stat_name)
		REFERENCES Stat (stat_name),
	CONSTRAINT fk_Player_Stat_season_id FOREIGN KEY (season_id)
		REFERENCES Season (season_id)
);


-- CREATE INDEXS
CREATE INDEX Team_team_info
	ON Team (team_name, team_mascot, team_city, team_state)
;

CREATE INDEX Player_player_info
	ON PLayer (player_id, given_name, family_name, year_drafted)
;

CREATE INDEX Position__info
	ON Position (position_name, position_description)
;

CREATE INDEX Stat_info
	ON Stat (stat_name, stat_description)
;

CREATE INDEX Team_Season_info
	ON Team_Season (team_name, season_id, player_id)
;

CREATE INDEX Player_Position_info
	ON Player_Position (player_id, position_name)
;

CREATE INDEX Player_Stat_info
	ON Player_Stat (player_id, stat_name, season_id, stat_amount)
;



