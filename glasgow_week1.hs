-- Well done, you finished your first Haskell tutorial!.
-- Let's recap what we've learned:
-- Expressions: evaluate mathematical expressions, operators, rules of precedence and role of parenthese, infix and prefix operations.
-- Functions: calling existing functions, combining them and including them in expressions.
-- Equations: naming expressions using assignments, immutable variables.

function roots(a,b,c) {
    det2 = b*b-4*a*c;
    det = sqrt(det2);
    root1=(-b+det)/2/a;
    root2=(-b-det)/2/a;
    return [root1,root2];
}
-- in haskell become =>
roots a b c = let
    det2 = b*b-4*a*c
    det = sqrt(det2)
    root1=(-b+det)/2/a
    root2=(-b-det)/2/a
in  [root1,root2]

def max(x,y):
    if x > y:
        return x
    else:
        return y
-- in haskell become =>
max x y = if x > y then x else y

map (\x -> 2*x) [1..10] -- return [2,4,6,8,10,12,14,16,18,20]

-- Case statement

  Red = 1
    Blue = 2
    Yellow = 3

    color = set_color();
    action = case color 
        when Red then action1()
        when Blue then action2()
        when Yellow then action3()
    end
-- in haskell become => 
data Color = Red | Blue | Green
color = set_color
action = case color of 
    Red -> action1
    Blue -> action2
    Green -> action3

-- Reduction

-- For a reduction there is only one possible answer 
3 + (5 * (8-2))
3 + (5 * 6)
3 + 30
33

-- multiple reduction

(3+4) * (15-9)
-- >
  7 * (15-9)
-- >
  7 * 6
-- >
 42  

--  or

(3+4) * (15-9)
-- >
  (3+4) * 6
-- >
  7 * 6
-- >
  42

-- The result doesn’t depend on reduction path

-- FUNCTIONS

--  There are two fundamental operations on functions: function definition (creating a function) and function application (using a function to compute a result).
-- preludes === function pre-defined in a standard library
-- Anonymous function
f = \x -> x+1
-- or named function
f x = x + 1

-- Exemple
f  = \x - > x+1
  f 3
--  > {bind x=3}
  (x+1) where x=3
--  > {substitute 3 for x}
  3+1
--  >
4

-- LIST
minmax = \x y -> [min x y, max x y]
minmax 3 8  -- > [3,8]
minmax 8 3  -- > [3,8]
-- constant list
mylist = [2,4,6,8]
-- It also can be a expression
answer = 42
yourlist = [7, answer+1, 7*8] -- > [7, 43, 56]

-- Constructing lists
[23, 29] ++ [48, 41, 44] -- > [23, 29, 48, 41, 44]
-- Haskell has a sequence notation for lists.
[0 .. 5] -- > [0,1,2,3,4,5]
[100 .. 103] -- > [100,101,102,103]
-- Can be use for char
[’a’ .. ’z’] 
-- > 
[’a’,’b’,’c’,’d’,’e’,’f’,’g’,’h’,’i’,’j’,’k’, ’l’,’m’,’n’,’o’,’p’,’q’,’r’,’s’,’t’,’u’,’v’, ’w’,’x’,’y’,’z’]
-- 
[’0’ .. ’9’]
-- > 
[’0’,’1’,’2’,’3’,’4’,’5’,’6’,’7’,’8','9’]

-- List comprehensions
-- Set of even numbers {2 * x | x <- N}
-- Set of odd numbers {2 * x + 1 | x <- N}
-- The cross product of two sets A and B is {(a,b) | a <- A, b <- B}
[2*x | x <- [0..10]]
-- >
[0,2,4,6,8,10,12,14,16,18,20]

[2*x + 1 | x <- [0..10]]
-- >  
[1,3,5,7,9,11,13,15,17,19,21]

[[a,b] | a <- [10,11,12] , b <- [20,21]]
-- >
[[10,20],[10,21],[11,20],[11,21],[12,20],[12,21]]

-- The !! operator takes a list and an index, and returns the corresponding element.
-- If the index is negative, or too large, undefined is returned.
[5,3,8,7]  !! 2    -- > 8
[0 .. 100]  !! 81  -- > 81
['a'..'z'] !! 13  -- > 'n'

-- head and tail
head :: [a] -> a
head [4,5,6] -- > 4
tail :: [a] -> [a]
tail [4,5,6] -- > [5,6]

-- Lists are lazy
-- for example defining xs = [1,2,xs !! 5,4] will not result in an error as long as you don’t access the third element.
-- Keep in mind that lists are also immutable. As a result, if you define xs2 = xs ++ xs and try to access the third element xs2 !! 2 will still result in an error because xs has not been modified:
