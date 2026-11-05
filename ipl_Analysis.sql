use test_ipl;
create database test_ipl;
select * from matches;

-- 1Total Matches Won by Each Team
select match_result,count(*)
 from matches
group by match_result
order by count(*) desc;

select team, match_result, count(*)
from matches
where match_result = team
group by match_result
order by count(*) desc;

-- question 2; top teams with high average runs scored
-- average runs_scored is greater thn 130 runs
-- and the total number of matches played is more then 50





select team, avg(runs_scored) as team_avg_run_scored
,count(*) as matchs
from matches
group by team
having avg(runs_scored) >130 and count(*) > 50;

-- Matches with Low Wickets Lost:
--  Write an SQL query to find all matches where the team lost fewer than 3 wickets. 
-- Show the match_id, team, runs_scored, and wickets_lost.

select match_id,team , runs_scored, wickets_lost
from matches
where wickets_lost < 3
order by runs_scored desc, wickets_lost desc;

-- ,question 4; Average Runs Conceded Rounded to two Decimal places


select team, avg(runs_scored) as team_avg_run_scored
,count(*) as matchs
from matches
group by team
having avg(runs_scored) >130 and count(*) > 50;


select team, round(avg(runs_conceded),  2) as runs_conceded
from matches
group by team
order by avg(runs_conceded) desc;

-- questions 4: Average Runs Conceded Rounded to two Decimal places

select round(avg(runs_conceded), 2) as runs_conceded
from matches
order by avg(runs_conceded) desc;


-- question 5.Matches at specific venues
-- venues starting with the letter 'M' . Display the match-id , match_date , venue ,and team

select match_id,match_date,venue,team
from matches
where venue like 'M%'
order by match_id;

-- questions 6 Total runs scored with run rate calculations
-- run rate (total runs scored divided by overs faced)
-- display both the total runs and the run rate rounded to the two decimal places






select team
, round(sum(runs_scored),  2) as runs_scored
, round(sum(runs_scored) * 1.00/ sum(overs_faced), 2) as run_rate
from matches
group by team;

-- question 7; top bowlers based on wickets takes
-- top 3 teams based on the total number of wickets taken
-- include only those teams that have taken more than 200 wickets

 select * from matches;
 
 
select team, sum(wickets_taken) as wickets_taken
from matches
group by team
having sum(wickets_taken) > 200
order by sum(wickets_taken) desc
limit 3;





