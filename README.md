# World Cup Database — Advanced SQL

## Overview
A relational database project analyzing FIFA World Cup data using 
advanced SQL including views, stored procedures, functions, and 
complex multi-table joins.

## Database Structure
- **Matches** — match results, scores, attendance, win conditions
- **Teams** — participating nations
- **Players** — player names and positions by team
- **Referees** — match officials
- **Stadiums** — venue names and cities
- **Tournaments** — World Cup years and winning teams
- **Coaches** — team coaches

## Tech Stack
- MySQL
- SQL (Views, Stored Procedures, Functions, Subqueries, JOINs)

## Features Built

### Views
- `wc2014_higher_average_goals` — teams with above average goals 
  in the 2014 World Cup using subquery comparison
- `team_player_positions` — all player positions with unique 
  position count per team using correlated subquery
- `top_stadiums` — top 5 stadiums by number of matches hosted
- `matches_won_in_extra_time` — all matches decided in extra time

### Stored Procedures
- `referee_matches(name, year)` — returns all matches a referee 
  worked in a given World Cup year
- `tournament_stage_stadiums(stage, year)` — returns stadiums 
  used in a specific stage and year

### Functions
- `max_attendance_by_year(year)` — returns highest match 
  attendance for a given World Cup
- `coach_of_winning_team(year)` — returns the coach of the 
  World Cup winning team for a given year

## Example Queries
```sql
-- Find all matches Djamet Haimoudi refereed in 2014
CALL referee_matches('Djamet Haimoudi', 2014);

-- Find stadiums used in the 2014 Semi-finals
CALL tournament_stage_stadiums('Semi-finals', 2014);

-- Get max attendance in 2014
SELECT max_attendance_by_year(2014);

-- Get winning coach in 2014
SELECT coach_of_winning_team(2014);
```

## Note
This was a collaborative academic project. My contributions included 
database design, SQL programming, and query development.
