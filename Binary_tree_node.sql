/*
You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.


Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
*/

select b.n,
case
    when b.p is not null then
        case
            when (select count(*) from bst where b.n = p) = 0
            then 'Leaf'
            else 'Inner'
        end
        else 'Root'
end
from BST b
order by b.n
