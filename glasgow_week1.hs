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

-- Zip function
zip [1,2,3] [4,5,6] -- return [(1,4),(2,5),(3,6)]
zip [1,2,3] "abc" -- return [(1,'a'),(2,'b'),(3,'c')]
zip3 "gla" "bei" "nai" -- return [('g','b','n'),('l','e','a'),('a','i','i')]
zipWith max [1,2,3] [0,2,4] -- return [1,2,4]
zipWith (+) [1,2,3] [0,2,4] -- return [1,4,7]
zipWith (\x ->(\y -> (x,y))) [1,2,3] "abc" -- return [(1,'a'),(2,'b'),(3,'c')]

-- polymorphic function
fst :: (a,b) -> a
head :: [a] -> a
take :: Int -> [a] -> [a] 
take 5 [1,3,5,6,7,8,9] --return [1,3,5,6,7]
zip :: [a] -> [b] -> [(a,b)]
id :: a -> a

Num -- Numeric type
Eq -- Equality type
Ord -- Ordered type

(+) :: Num a => a -> a -> a
(==) :: Eq a => a -> a -> Bool
(<) :: Ord a => a -> a -> Bool

-- Exercice :
-- What are the typs of the following values?

-- 1
['a','b','c'] === [Char]
('a','b','c') === (Char,Char,Char)
[(False,'0',(True,'1'))] === ((Bool),(Char))
([False,True],['0','1']) === [[Bool],[Char]]
[tail,init,reverse] === [[a] -> [a]]

-- 2
second xs = head (tail xs) 
second [1,2,3,4] == 2
second :: [Int] -> Int 
second :: [a] -> a -- polymorphic
swap (x,y) = (y,x) 
swap :: (a,b)-> (b,a)
pair x y = (x,y)
pair :: a -> b -> (a,b)
double x = x*2 
double :: Int -> Int
palindrome xs = reverse xs == xs
twice f x = f (f x)

-- 3
-- Check your answers using Ghci

putStrLn "hello world" -- equivalent to console.log
putStrLn ("Hello" ++ " World!")
do { putStrLn "what is your name?"; x <- getLine; putStrLn ("hello " ++ x) }
do { putStrLn "what is your name?"; n <-getLine; let nUpper = map toUpper n in putStrLn ("HELLO " ++ nUpper) }
read "42" :: Int
read "42"::Float
-- show convert to String
show 42putStrLn (show (6*7))

-- list comprehension

length :: [a] -> Int           -- function type
length [] = 0                  -- base case
length (x:xs) = 1 + length xs  -- recursion case

filter :: (a->Bool) -> [a] -> [a]
filter (<5) [3,9,2,12,6,4] -- > [3,2,4]

filter :: (a -> Bool) -> [a] -> [a]
filter pred []    = []
filter pred (x:xs)
  | pred x         = x : filter pred xs
  | otherwise      = filter pred xs

-- Perform a computation on each element of a list: map
-- Iterate over a list, from left to right: foldl
-- Iterate over a list, from right to left: foldr

map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs

(.) :: (b->c) -> (a->b) -> a -> c
(f . g) x = f (g x)
map f (map g xs) = map (f . g) xs
map :: (a -> b) -> [a] -> [b]
map _ []     = []
map f (x:xs) = f x : map f xs

foldl :: (b->a->b) -> b -> [a] -> b
foldl (+) z []          -- > z
foldl (+) z [x0]        -- > z + x0
foldl (+) z [x0,x1]     -- > (z + x0) + x1
foldl (+) z [x0,x1,x2]  -- > ((z + x0) + x1) + x2

-- recursive definition of foldl
foldl        :: (b -> a -> b) -> b -> [a] -> b
foldl f z0 xs0 = lgo z0 xs0
             where
                lgo z []     =  z
                lgo z (x:xs) = lgo (f z x) xs

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr (+) z []          -- > z
foldr (+) z [x0]        -- > x0 + z
foldr (+) z [x0,x1]     -- > x0 + (x1 + z)
foldr (+) z [x0,x1,x2]  -- > x0 + (x1 + (x2 + z))

-- recursive definition of foldr
foldr            :: (a -> b -> b) -> b -> [a] -> b
foldr k z = go
          where
            go []     = z
            go (y:ys) = y `k` go ys

[x0,x1,x2] -- can also be write
x0 :  x1 : x2 : []

foldr (:)  [] [x0,x1,x2]
  -- >
  x0 :  x1 : x2 : []

-- some application :

sum xs = foldr (+) 0 xs
product xs = foldr (*) 1 xs

sum      = foldr (+) 0
product  = foldr (*) 1

  map :: (a -> b) -> [a] -> [b]
    foldl :: (b -> a -> b) -> b -> [a] -> b 
    foldr :: (a -> b -> b) -> b -> [a] -> b

-- conditional functions
length [] = 0
length x:xs = 1 + length xs

length lst =
if lst == []
  then 0
  else let x:xs = lst in 1 + length xs

length lst
  | lst == [] = 0
  | otherwise = let x:xs = lst in 1 + length xs

f = f' where f' 1 = 0; f' x = x + f' (x-1)

filter (<5) [3,9,2,12,6,4]

-- possible recurse function to filtre
filter pred lst
  | null lst = []
  | otherwise = if pred x 
     then x:filter pred xs
     else filter pred xs
       where x:xs=lst

    filter :: (a -> Bool) -> [a] -> [a]
    filter pred []    = []
    filter pred xs
      | pred x         = x : filter pred xs
      | otherwise      = filter pred (x:xs)

 foldl (\acc elt -> acc++[elt]) "" "A string"
   foldl (+) (map (*2) [1..8])
   foldl (+) 0 (map (*2) [1..8])

   foldl (/) 16 [8,4,2,1]
  -- 16/8 = 2.0 2.0 / 4 = 0.5 0.5 / 2 = 0.25. 0.25 / 1 = 0.25.
