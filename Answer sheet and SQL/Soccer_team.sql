--1. View the first 100 rows of the dataset to understand its structure.
SELECT TOP (100)* FROM [dbo].[ketro_sa_soccer_dataset_advanced]
--2.	Count the total number of players in the dataset.
SELECT COUNT (PLAYER_NAME) FROM [dbo].[ketro_sa_soccer_dataset_advanced]
--3.	List all unique teams in the league.
SELECT DISTINCT (TEAM) FROM [dbo].[ketro_sa_soccer_dataset_advanced]
--4.	Count how many players are in each team.
SELECT COUNT (PLAYER_NAME)FROM [dbo].[ketro_sa_soccer_dataset_advanced] GROUP BY TEAM
--5.	Identify the top 10 players with the most goals.
SELECT TOP (10) PLAYER_NAME, GOALS
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY GOALS DESC;
--6.	Find the average salary for players in each team.
SELECT
Team,
    average_salary_zar
FROM
    [dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY
    TEAM;

--7.	Retrieve the top 10 players with the highest market value
SELECT
TOP 10 player_name, market_value_zar from  [dbo].[ketro_sa_soccer_dataset_advanced] order by market_value_zar desc;
--8. Calculate the average passing accuracy for each position.
SELECT player_name, Position,  AVG(passing_accuracy) As AveragePassingAccuracy 
FROM [dbo].[ketro_sa_soccer_dataset_advanced]
Group  BY player_name, position;
--9. Compare shot accuracy with goals to find correlations.
SELECT
    (AVG(Shot_Accuracy * Goals) - AVG(Shot_Accuracy) * AVG(Goals)) / 
    (STDEVP(Shot_Accuracy) * STDEVP(Goals)) AS Correlation
FROM[dbo].[ketro_sa_soccer_dataset_advanced];
--10  Compute total goals and assists for each team.
  select
   team, 
  SUM(GOALS), Sum (ASSISTS) FROM [dbo].[ketro_sa_soccer_dataset_advanced]
  group by Team;
  --11. Count players by their marital status.
  SELECT
  marital_status,
  COUNT(*)PLAYER_NAME
  FROM [dbo].[ketro_sa_soccer_dataset_advanced]
  GROUP BY MARITAL_STATUS;
  --12.	Count players by nationality
  SELECT
   Nationality, Count(*)Player_name
   from [dbo].[ketro_sa_soccer_dataset_advanced]
   Group by nationality;
   --13. Find average market value grouped by nationality.
   SELECT
   nationality,
   AVG(market_value_zar) as Average_market_value
   FROM [dbo].[ketro_sa_soccer_dataset_advanced]
   Group by Nationality;
   --14. Determine how many player contracts end in each year.
   select
  Count (*) player_name,
   contract_end_year 
   from [dbo].[ketro_sa_soccer_dataset_advanced]
   group by contract_end_year;
   --15.	Identify players whose contracts end next year.
   select
   player_name, contract_end_year from [dbo].[ketro_sa_soccer_dataset_advanced]
   where contract_end_year = 2026;
   --16. Summarize the number of players by injury status.
   Select  Count (player_name), injury_status
   From [dbo].[ketro_sa_soccer_dataset_advanced]
   Group by injury_status;
   --17. Calculate goals per match ratio for each player.
   
SELECT
    player_name,
    goals,
    matches_played,
    CAST(goals AS DECIMAL(10, 2)) / NULLIF(matches_played, 0) AS match_ratio
FROM
    [dbo].[ketro_sa_soccer_dataset_advanced];
    --18.	Count how many players are managed by each agent.
    Select Agent,
    count(player_name) as players
    FROM [dbo].[ketro_sa_soccer_dataset_advanced]
    Group By Agent;
    --19. Calculate average height and weight by player position.
    Select Count(player_name), position,
    AVG(height_cm) as average_height, Avg(weight_kg) As Average_weight
    From [dbo].[ketro_sa_soccer_dataset_advanced]
    Group by position;
    --20. Identify players with the highest combined goals and assists.
    Select player_name, goals, assists,
    (goals+assists) as total_contributions
    From [dbo].[ketro_sa_soccer_dataset_advanced]
    Order by Total_contributions DESC;
