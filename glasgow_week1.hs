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