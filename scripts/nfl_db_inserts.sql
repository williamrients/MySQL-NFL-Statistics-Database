USE Football_Stats_db;

-- INSERTS FOR EACH TABLE
INSERT INTO Team
	(team_name, team_mascot, team_city, team_state)
VALUES
	('Cardinals', 'Big Red', 'Glendale', 'Arizona'),
    ('Rams', 'Rampage', 'Los Angeles', 'California'),
    ('Chargers', 'Boltman', 'Los Angeles', 'California'),
    ('49ers', 'Sourdough Sam', 'San Francisco', 'California'),
    ('Broncos', 'Thunder', 'Denver', 'Colorado'),
    ('Jaguars', 'Jaxson de Ville', 'Jacksonville ', 'Florida'),
    ('Dolphins', 'T.D.', 'Miami', 'Florida'),
    ('Buccaneers', 'Captain Fear', 'Tampa Bay', 'Florida'),
    ('Falcons', 'Freddie Falcon', 'Atlanta', 'Georgia'),
    ('Bears', 'Staley Da Bear', 'Chicago', 'Illinois'),
    ('Colts', 'Blue', 'Indianapolis', 'Indiana'),
    ('Saints', 'Gumbo', 'New Orleans', 'Louisiana'),
    ('Ravens', 'Poe', 'Baltimore', 'Maryland'),
    ('Commanders', 'Commander', 'Washington', 'Maryland'),
    ('Patriots', 'Pat Patriot', 'New England', 'Massachusetts'),
    ('Lions', 'Roary', 'Detroit', 'Michigan'),
    ('Vikings', 'Viktor the Viking', 'Minneapolis', 'Minnesota'),
    ('Chiefs', 'KC Wolf', 'Kansas City', 'Missouri'),
    ('Raiders', 'Raider Rusher', 'Las Vegas', 'Nevada'),
    ('Giants', 'Giant', 'New York', 'New Jersey'),
    ('Jets', 'Jet', 'New York', 'New Jersey'),
    ('Bills', 'Billy Buffalo', 'Buffalo', 'New York'),
    ('Panthers', 'Sir Purr', 'Charlotte', 'North Carolina'),
    ('Bengals', 'Who Dey', 'Cincinnati', 'Ohio'),
    ('Browns', 'Swagger', 'Cincinnati', 'Ohio'),
	('Eagles', 'Swoop', 'Philadelphia', 'Pennsylvania'),
    ('Steelers', 'Steely McBeam', 'Pittsburgh', 'Pennsylvania'),
    ('Titans', 'T-Rac', 'Nashville', 'Tennessee'),
    ('Cowboys', 'Rowdy', 'Dallas', 'Texas'),
    ('Texans', 'Toro', 'Houston', 'Texas'),
    ('Seahawks', 'Blitz', 'Seattle', 'Washington'),
    ('Packers', 'Packer', 'Green Bay', 'Wisconsin')
;

INSERT INTO Season
	(season_id)
VALUES
	('2021-2022'),
	('2020-2021'),
	('2019-2020'),
    ('2018-2019'),
    ('2015-2016'),
    ('2010-2011'),
    ('2017-2018'),
    ('2006-2007'),
    ('2008-2009'),
    ('2016-2017')
    
;

INSERT INTO Player
	(player_id, given_name, family_name, year_drafted)
VALUES
	(DEFAULT, 'Tom', 'Brady', '2000'),
	(DEFAULT, 'Dalvin', 'Cook', '2017'),
    (DEFAULT, 'Cooper', 'Kupp', '2017'),
    (DEFAULT, 'Haason', 'Reddick', '2017'),
    (DEFAULT, 'Jordan', 'Poyer', '2013'),
    (DEFAULT, 'Matthew', 'Stafford', '2009'),
    (DEFAULT, 'Patrick', 'Mahomes', '2017'),
    (DEFAULT, 'Michael', 'Vick', '2001'),
    (DEFAULT, 'David', 'Carr', '2002'),
    (DEFAULT, 'Carson', 'Palmer', '2003'),
    (DEFAULT, 'Eli', 'Manning', '2004'),
    (DEFAULT, 'Alex', 'Smith', '2005'),
    (DEFAULT, 'Vince', 'Young', '2006'),
    (DEFAULT, 'JaMarcus', 'Russell', '2007'),
    (DEFAULT, 'Sam', 'Bradford', '2010')
;

INSERT INTO Position
	(position_name, position_description)
VALUES
	('Quarterback', 'Player who starts the play.'),
    ('Running back', 'Executes rushing plays '),
    ('Wide receiver', 'Pass-catching specialists'),
    ('Defensive line', 'Rush passer and contain rusher'),
    ('Defensive back', 'Defend against wide receivers/last line of defense')
;

INSERT INTO Stat
	(stat_name, stat_description)
VALUES

	('Completion Percent', 'Percent of passes completed compared to incomplete'),
	('Touchdown Passes', 'Total touchdown passes thrown'),
	('Interceptions Thrown', 'Total interceptions throw'),

	('Rushing Yards', 'Total amount of yards ran with the ball'),
	('Rushing Touchdowns', 'Total touchdowns rushed'),
	('Receiving Yards', 'Total yards catching the ball'),
	('Receiving Touchdowns', 'Total touchdowns caught'),

	('Sacks', 'Total times quarterback was tackled behind scrimmage line'),
	('Tackles', 'Total times player with ball was tackled'),
	('Interceptions', 'Total interceptions caught by a defender'),
	('Passes Deflected', 'Total passes deflected from quarterback')
;


INSERT INTO	Team_Season
	(team_name, season_id, player_id)
VALUES
	('Buccaneers', '2021-2022', 100),
    ('Vikings', '2021-2022', 101),
    ('Rams', '2021-2022', 102),
    ('Eagles', '2021-2022', 103),
    ('Bills', '2021-2022', 104),
    ('Rams', '2021-2022', 105),
    ('Chiefs', '2021-2022', 106),
    ('Eagles', '2010-2011', 107),
    ('49ers', '2010-2011', 108),
    ('Cardinals', '2015-2016', 109),
    ('Giants', '2015-2016', 110),
    ('Chiefs', '2017-2018', 111),
    ('Titans', '2006-2007', 112),
    ('Raiders', '2008-2009', 113),
    ('Vikings', '2016-2017', 114)
    
;

INSERT INTO Player_Position
	(player_id, position_name)
VALUES
	(100,'Quarterback'),
    (101, 'Running back'),
    (102, 'Wide receiver'),
    (103, 'Defensive line'),
    (104,'Defensive back'),
    (105, 'Quarterback'),
    (106,'Quarterback'),
    (107,'Quarterback'),
    (108,'Quarterback'),
    (109,'Quarterback'),
    (110,'Quarterback'),
    (111,'Quarterback'),
    (112,'Quarterback'),
    (113,'Quarterback'),
    (114,'Quarterback')
;



INSERT INTO Player_Stat
	(player_id, stat_name, season_id, stat_amount)
VALUES
	(100, 'Completion Percent', '2021-2022', 22),
    (100, 'Touchdown Passes', '2021-2022', 44),
    (100, 'Interceptions Thrown', '2021-2022', 22),
    
    (105, 'Completion Percent', '2021-2022', 33),
    (105, 'Touchdown Passes', '2021-2022', 15),
    (105, 'Interceptions Thrown', '2021-2022', 12),
    
    (106, 'Completion Percent', '2021-2022', 12),
    (106, 'Touchdown Passes', '2021-2022', 55),
    (106, 'Interceptions Thrown', '2021-2022', 22),
    
    (107, 'Completion Percent', '2010-2011', 66),
    (107, 'Touchdown Passes', '2010-2011', 44),
    (107, 'Interceptions Thrown', '2010-2011', 11),
    
    (108, 'Completion Percent', '2010-2011', 12),
    (108, 'Touchdown Passes', '2010-2011', 55),
    (108, 'Interceptions Thrown', '2010-2011', 88),
    
    (109, 'Completion Percent', '2015-2016', 22),
    (109, 'Touchdown Passes', '2015-2016', 44),
    (109, 'Interceptions Thrown', '2015-2016', 22),
    
    (110, 'Completion Percent', '2015-2016', 33),
    (110, 'Touchdown Passes', '2015-2016', 22),
    (110, 'Interceptions Thrown', '2015-2016', 12),
    
    (111, 'Completion Percent', '2017-2018', 44),
    (111, 'Touchdown Passes', '2017-2018', 12),
    (111, 'Interceptions Thrown', '2017-2018', 33),
    
    (112, 'Completion Percent', '2006-2007', 22),
    (112, 'Touchdown Passes', '2006-2007', 44),
    (112, 'Interceptions Thrown', '2006-2007', 88),
    
    (113, 'Completion Percent', '2008-2009', 55),
    (113, 'Touchdown Passes', '2008-2009', 11),
    (113, 'Interceptions Thrown', '2008-2009', 22),
    
    (114, 'Completion Percent', '2016-2017', 12),
    (114, 'Touchdown Passes', '2016-2017', 44),
    (114, 'Interceptions Thrown', '2016-2017', 55),
    
    
    (101, 'Rushing Yards', '2021-2022', 55),
    (101, 'Rushing Touchdowns', '2021-2022', 88),
    (101, 'Receiving Yards', '2021-2022', 22),
    (101, 'Receiving Touchdowns', '2021-2022', 22),
    
    (102, 'Rushing Yards', '2021-2022', 55),
    (102, 'Rushing Touchdowns', '2021-2022', 88),
    (102, 'Receiving Yards', '2021-2022', 22),
    (102, 'Receiving Touchdowns', '2021-2022', 22),
	
	(103, 'Sacks','2021-2022', 22),
    (103, 'Tackles', '2021-2022', 55),
    (103, 'Interceptions','2021-2022', 77),
    (103, 'Passes Deflected','2021-2022', 11),

	(104, 'Sacks','2021-2022', 22),
    (104, 'Tackles', '2021-2022', 55),
    (104, 'Interceptions','2021-2022', 77),
    (104, 'Passes Deflected','2021-2022', 11)
;
    
    

  

  
  
  

    
    