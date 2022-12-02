{-# OPTIONS_GHC -Wno-overlapping-patterns #-}
isLeapYear :: Integer -> Bool
isLeapYear year 
    | isDivisibleBy 400 = True
    | isDivisibleBy 100 = False
    | isDivisibleBy 4 = True
    | otherwise = False
    where isDivisibleBy x = mod year x == 0

-- 1year === 31557600
-- ?? === 1_000_000_000

data Planet = Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune 

earthYearsTo :: Planet -> Float
earthYearsTo planet = case planet of
    Mercury -> 0.2408467
    Venus -> 0.61519726
    Earth -> 1.0
    Mars -> 1.8808158
    Jupiter -> 11.862615
    Saturn -> 29.447498
    Uranus -> 84.016846
    Neptune -> 164.79132

multiply :: Float -> Float
multiply x = x * 31557600

getResult :: Float -> Float -> Float
getResult x y = x / multiply y

ageOn :: Planet -> Float -> Float
ageOn planet seconds = getResult seconds (earthYearsTo planet)

-- 

-- Too end when learning skills

verifyAllChar :: Char -> [Bool]
verifyAllChar t =
    [x == t | x <- ['a'..'z']] 
    
collatz :: Integer -> Bool -> Maybe Integer
collatz n =
  case n of 
  even -> n / 2
  odd -> 3*n + 1

-- Guessing game Exercice part 1

check :: String -> String -> Char -> (Bool,String)
check word display c 
    = (c `elem` word, [
        if x==c
            then c
            else y | (x,y) <- zip word display])

turn :: String -> String -> Int -> IO ()
turn word display n =
  do if n==0
       then putStrLn "You lose"
       else if word==display
              then putStrLn "You win!"
              else mkguess word display n

mkguess :: String -> [Char] -> Int -> IO ()
mkguess word display n =
  do putStrLn (display ++ "  " ++ take n (repeat '*'))
     putStr "  Enter your guess: "
     q <- getLine
     let (correct, display') = check word display (q!!0)
     let n' = if correct then n else n-1
     turn word display' n'

starman :: String -> Int -> IO ()
starman word n = turn word ['-' | x <- word] n