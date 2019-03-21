import Data.Char 
allchar = zip [1..] ['"'..'z']
chartonum s = head [fst x | x <- allchar, snd x == s]
mapto = map toUpper 