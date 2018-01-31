/*
Write a SQL query to find all numbers that appear at least three times consecutively.

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+
For example, given the above Logs table, 
1 is the only number that appears consecutively for at least three times.

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
*/
select distinct a.Num as ConsecutiveNums from Logs a, Logs b, Logs c
where a.Id = b.Id +1 and b.ID = c.ID+1 and a.Num = b.Num and b.Num = c.Num;

/* another example */
select distinct l1.num as ConsecutiveNums
from Logs l1 
    join Logs l2 on l1.id=l2.id-1 
    join Logs l3 on l2.id=l3.id-1
where l1.num=l2.num and l2.num=l3.num