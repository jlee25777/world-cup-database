USE worldcup_database;

DROP VIEW IF EXISTS wc2014_higher_average_goals;

CREATE VIEW wc2014_higher_average_goals AS
SELECT AwayT.Team_Name, AVG(CASE
	WHEN HomeT.Team_ID = home_team_id THEN home_team_goals
    WHEN AwayT.Team_ID = away_team_id THEN away_team_goals
    END) AS "Average_Goals"
FROM matches M
JOIN teams HomeT ON M.home_team_id = HomeT.team_id
JOIN teams AwayT ON M.away_team_id = AwayT.team_id
WHERE M.tournament_id = 1
GROUP BY Team_Name
HAVING Average_Goals > (SELECT AVG(CASE
		WHEN HomeT.Team_ID = home_team_id THEN home_team_goals
		WHEN AwayT.Team_ID = away_team_id THEN away_team_goals
		END)
	FROM matches M
	JOIN teams HomeT ON M.home_team_id = HomeT.team_id
	JOIN teams AwayT ON M.away_team_id = AwayT.team_id)
ORDER BY Average_Goals DESC;
# View that displays the teams with a higher than average number of goals scored in the 2014 World Cup

DROP VIEW IF EXISTS team_player_positions;

CREATE VIEW team_player_positions AS
SELECT 
    t.team_name,
    p.player_name,
    p.position,
    (
        SELECT COUNT(DISTINCT p2.position)
        FROM players p2
        WHERE p2.team_id = p.team_id AND p2.position IS NOT NULL
    ) AS total_unique_positions_on_team
FROM 
    players p
JOIN 
    teams t ON p.team_id = t.team_id
WHERE 
    p.position IS NOT NULL
ORDER BY 
    t.team_name, p.position, p.player_name;
# View that displays the positions of each player on each team in the database and each team's number of unique positions
    
DROP VIEW IF EXISTS top_stadiums;

CREATE VIEW top_stadiums AS
SELECT 
    s.stadium_name,
    COUNT(m.match_id) AS matches_hosted
FROM matches m
JOIN stadiums s ON m.stadium_id = s.stadium_id
GROUP BY s.stadium_id, s.stadium_name
ORDER BY matches_hosted DESC
LIMIT 5;
# View that displays the top 5 stadiums in the database by number of matches hosted

DROP VIEW IF EXISTS matches_won_in_extra_time;

CREATE VIEW matches_won_in_extra_time AS
SELECT 
    m.home_team_goals,
    m.away_team_goals,
    m.win_conditions,
    ht.team_name AS home_team_name,
    at.team_name AS away_team_name
FROM matches m
JOIN teams ht ON m.home_team_id = ht.team_id
JOIN teams at ON m.away_team_id = at.team_id
WHERE m.win_conditions LIKE '%extra time%';
# View that displays all matches that were decided in extra time

DROP PROCEDURE IF EXISTS referee_matches;

DELIMITER $$

CREATE PROCEDURE referee_matches(
 IN Ref_name_input VARCHAR(100), Tour_year_input INT
)
BEGIN
	SELECT Year, Match_ID, Tournament_Stage, HomeT.Team_Name AS Home_Team_Name, AwayT.Team_Name AS Away_Team_Name, Home_Team_Goals, Away_Team_Goals, R.referee_name AS Referee_Name, AR1.referee_name AS AR1_Name, AR2.referee_name AS AR2_Name
	FROM matches M
	JOIN teams HomeT ON M.home_team_id = HomeT.team_id
	JOIN teams AwayT ON M.away_team_id = AwayT.team_id
	JOIN referees R ON M.referee_id = R.referee_id
	JOIN referees AR1 ON M.ar1_id = AR1.referee_id
	JOIN referees AR2 ON M.ar2_id = AR2.referee_id
    JOIN tournaments T ON M.tournament_id = T.tournament_id
	WHERE R.referee_name = Ref_name_input OR AR1.referee_name = Ref_name_input or AR2.referee_name = Ref_name_input AND Year = Tour_year_input
    ORDER BY Match_ID;
END$$

DELIMITER ;
# Example
CALL referee_matches('Djamet Haimoudi', 2014);
# Procedure that displays the matches that a referee worked in a particular World Cup when that ref's name and the tournament year are entered

DROP PROCEDURE IF EXISTS tournament_stage_stadiums;

DELIMITER $$

CREATE PROCEDURE tournament_stage_stadiums(
 IN Tour_stage_input VARCHAR(75), Tour_year_input INT
)
BEGIN
	SELECT Stadium_Name, Stadium_City
    FROM matches
    JOIN stadiums USING (stadium_id)
    JOIN tournaments USING (tournament_id)
    WHERE tournament_stage = Tour_stage_input AND Year = Tour_year_input;
END$$

DELIMITER ;
# Example
CALL tournament_stage_stadiums('Semi-finals', 2014);
#Procedure that displays the stadiums that were used in the entered tournament and tournament stage 

DROP FUNCTION IF EXISTS max_attendance_by_year;

DELIMITER //

CREATE FUNCTION max_attendance_by_year(wc_year INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE max_attendance INT DEFAULT 0;

    SELECT MAX(attendance)
    INTO max_attendance
    FROM matches
    JOIN tournaments USING (tournament_id)
    WHERE year = wc_year;

    RETURN max_attendance;
END;
//

DELIMITER ;
# Example
SELECT max_attendance_by_year(2014);
#Function that displays the maximum match attendance for the entered tournament

DROP FUNCTION IF EXISTS coach_of_winning_team;

DELIMITER //

CREATE FUNCTION coach_of_winning_team (
    year_entry INT
)
RETURNS VARCHAR(75)
DETERMINISTIC 
READS SQL DATA
BEGIN
    DECLARE coach_output VARCHAR(75);

    SELECT c.coach_name
    INTO coach_output
    FROM coaches c
    JOIN teams t ON c.coach_id = t.coach_id
    JOIN tournaments tm ON t.team_id = tm.winning_team_id
    WHERE tm.year = year_entry;

    RETURN coach_output;
END //

DELIMITER ;
# Example
SELECT coach_of_winning_team(2014);
#Function that displays the name of the coach that won the World Cup in the entered year