with cte as (select *, row_number() over (partition by id order by rnk desc) as rnk1 from (
  select *,row_number() over(partition by id) as rnk from demo)),
  cte1 as (select id,val,rnk from cte),
cte2 as (select id,val,rnk1 from cte)

select id,val,sum(dummy) as sum1,count(dummy) as c1 from (
select cte1.id as id ,cte1.val as val,case when cte1.val==cte2.val then 1 else 0 end as dummy from cte1 
inner join cte2 on cte1.id=cte2.id and  cte1.rnk=cte2.rnk1) group by id having sum1==c1;
-- id  val
-- 1 a 
-- 1 b 
-- 1 b
-- 1 a
-- 2 a
-- 2 b
-- 2 c
-- 3 a
-- 3 b
-- 3 c
