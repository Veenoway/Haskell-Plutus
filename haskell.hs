-- I: Types & Classes
-- not is a function who will give the !== of an element 
getOppositBool :: Bool -> Bool
getOppositBool e = not e

-- Another way to write it : 
getOppositBool' :: Bool -> Bool
getOppositBool' = not

-- Starting Haskell formation from University of Glasgow

hello name = "Hello, " ++name

-- function sq(x:number;y:number) {
--     return x*x+y*y
-- }
sq :: Int -> Int -> Int
sq x y =  x * x + y * y

lst = [1,2] ++ [3,4]

-- abs return the absolute of a number
abs 5 -- > 5
abs (-6) -- > 6

-- min max function

min 3 8 -- > 3
max 3  8 -- > 8

-- Equations give names to values
-- var are const
answer = 43

add :: (Int,Int) -> Int
add (x,y) = x + y

zeroTo :: Int -> [Int]
zeroTo n = [0..n]

add' :: Int -> (Int -> Int)
add' x y = x + y

mult :: Int -> (Int -> (Int -> Int))
mult x y z = x*y*z
-- mult takes an integer x and returns a function mult ,
-- which in turn takes an integer y and returns a function mult x y,
-- which finally takes an integer z and returns the result x*y*z