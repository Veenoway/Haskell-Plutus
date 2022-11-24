Type Haskell expressions in here.
λ test x = x*8
:: ? -> ?
λ test 10
80
:: Num a => a
λ addMore x y z = (x + y) * z
:: ? -> ?
λ addMore 10 10 20
400
:: Num a => a
λ f = \x -> x*8
x * 8
:: Expr
λ f 9
72
:: Num a => a
λ f' = \ x -> x+1
<hint>:1:75: parse error on input ‘=’
λ f' = \x -> x+1
<hint>:1:75: parse error on input ‘=’
λ f1 = \x -> x+5
x + 5
:: Expr
λ f1 14
19
:: Num a => a
λ add3num1 = \x y z -> x+y+z
x + y + z
:: Expr
λ 10 + 10 + add3num1 10 10 10
50
:: Num a => a
λ [5,4,6,32]
[5,4,6,32]
:: Num t => [t]
λ [1,2,3,4,5]
[1,2,3,4,5]
:: Num t => [t]
λ length [1,2,3,4,5]
5
:: Int
λ sumprod = \x y -> [x+y, x*y]
[x + y,x * y]
:: [Expr]
λ sumprod 4 7
[11,28]
:: Num t => [t]
λ list = [2,4,5,6]
[2,4,5,6]
:: Num t => [t]
λ mylist = [2,4,6,8]
[2,4,6,8]
:: Num t => [t]
λ answer = 12
12
:: Num a => a
λ yourlist = [7, answer +2,7*8,answer*2]
[7,14,56,24]
:: Num a => [a]
λ your list
Not in scope: ‘your’
λ yourlist
[7,14,56,24]
:: Num a => [a]
λ 42 : []
[42]
:: Num a => [a]
λ [1,2] ++ [3,4]
[1,2,3,4]
:: Num a => [a]
λ length [23, 29] + length [48, 41, 44] == length ([23, 29] ++ [48, 41, 44])
True
:: Bool
λ [2,4..12]
[2,4,6,8,10,12]
:: (Enum t, Num t) => [t]
λ [1.1..3.1]
[1.1,2.1,3.1]
:: (Enum t, Fractional t) => [t]
λ ['a','d'..'z']
"adgjmpsvy"
:: [Char]
λ [2 *x |x <- [1..10] 
<hint>:1:264:
parse error (possibly incorrect indentation or mismatched brackets)
λ [2*x | x <- [1..10]]
[2,4,6,8,10,12,14,16,18,20]
:: (Enum t, Num t) => [t]
λ [2*x +1 | x <- [1..10]
<hint>:1:266:
parse error (possibly incorrect indentation or mismatched brackets)
λ [[2*x +1 | x <- [1..10]]
<hint>:1:268:
parse error (possibly incorrect indentation or mismatched brackets)
λ [2*x + 1 | x <- [1..10]]
[3,5,7,9,11,13,15,17,19,21]
:: (Enum t, Num t) => [t]
λ [[a,b] | a <- [1,2,3], b <- [4,5,6]]
[[1,4],[1,5],[1,6],[2,4],[2,5],[2,6],[3,4],[3,5],[3,6]]
:: Num t => [[t]]
λ [1,2,3,4] !! 2
3
:: Num a => a
λ ['a'..'z'] !! 33
*Exception: Prelude.!!: index too large
λ head [1,2,3]
1
:: Num a => a
λ tail [1,2,3]
[2,3]
:: Num a => [a]
λ head []
Sorry, I can't display this result.
λ tail [] :: [Int]
*Exception: Prelude.tail: empty list
λ next
λ  