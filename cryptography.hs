{-
In this challenge, you will be writing an implementation of a basic encryption 
algorithm (similar to the Vigenère cipher). Encryption (more broadly known as 
cryptography) is the process of protecting data by making it readable only by 
those with the authority to see it. Encryption generally works using keys -- 
passwords used by the algorithm to jumble the sensitive data in some way. 
Someone who wants to encrypt a secret message chooses a key, feeding it and 
the message to the encryption program. The program outputs an unreadable version 
of the message. Someone who knows the selected key can give it to the program (along 
with the encrypted message) to get back the original data.

Write and submit a Haskell program that performs encryption and decryption. This 
program will work by asking for some text (to be the secret message), a key 
(the password), and whether the user wants to encrypt or decrypt the given data. 
The program will then perform the specified action.

You will implement a simple algorithm that produces its output by adding together 
corresponding characters in the message and key. Since there is no way to 
mathematically add two letters, you will have to convert each one to a number 
that represents it, operate on that number, then convert back to a letter. Use 
this string for the conversions:

associations = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 .,:;'\"/\\<>(){}[]-=_+?!"

To get a character's numeric representation, find the index of that character 
in the string to get the index of char's first occurrence in associations). To get 
a character back from this numeric representation, get the character at that number's 
index in the string. For example, the letter 'c' would be represented by a 2 because 
'c' is at index 2 in the string. If you wanted to find which character is represented 
by 8, you would get the character at index 8, which is 'i'.

Once you can convert characters to numbers and back, you can implement the actual 
algorithm. It will work by adding each character in the message to its corresponding 
character in the key (of course, you are actually adding their numerical equivalents). 
If the message is longer than the key, the key should be repeated to provide more 
letters to combine. Also, if the sum you get is too high a number to translate back 
to a character, wrap that number to the beginning of the associations string. 

For example, using the message "test" and the key "hi" would look like this:

  19(t) 04(e) 18(s) 19(t)
+ 07(h) 08(i) 07(h) 08(i)
-----------------------------
= 26(A) 12(m) 25(z) 27(B)

Decryption should reverse the process: Given the encrypted message and the original 
key, it should output the original message. This can simply be done by reversing 
your algorithm -- that is, subtracting (not adding) from each character in the 
message its corresponding character in the key.

Your progam's output should look like this:

Enter e to encrypt, d to decrypt, or q to quit: 
z
Did not understand command, try again.
Enter e to encrypt, d to decrypt, or q to quit: 
e
Message: 
Two plus two = Five
Key: 
Lorem ipsum
+KF;B(CH=NIZ}m;R\Dt
Enter e to encrypt, d to decrypt, or q to quit: 
d
Message: 
+KF;B(CH=NIZ}m;R\Dt
Key: 
Lorem ipsum
Two plus two = Five
Enter e to encrypt, d to decrypt, or q to quit: 
q
Goodbye!

-}
import Control.Monad
allchar = zip [1..] [' '..'z']
chartonum c = head [fst x | x <- allchar, snd x == c]
numtochar n = head [snd x | x <- allchar, fst x == n]
td = (read :: String -> Double)

addit t = let p = sum [fst t, snd t]
          in if p > 91
          then p - 91
          else p
          
subit e = let p = snd e - fst e
          in if p < 1
          then p + 91
          else p

getkey k m = let rep = (round ((td $ show $ length m) / (td $ show $ length k)) + 1) -- dont worry about all this :)
                 ks = take rep $ repeat k                                           -- this too 
             in map chartonum $ unwords ks
 
encrypt = do
    putStrLn "Message: "
    m' <- getLine
    putStrLn "Key: "
    k' <- getLine
    let m = map chartonum m'
        key' = getkey k' m'
        key = zip key' m
        added = map addit key
    putStrLn $ map numtochar added
    main
    
decrypt = do
    putStrLn "Message: "
    m' <- getLine
    putStrLn "Key: "
    k' <- getLine
    let m = map chartonum m'
        key' = getkey k' m'
        key = zip key' m
        subbed = map subit key
    putStrLn $ map numtochar subbed
    main

main = do
    putStrLn "Enter e to encrypt, d to decrypt, or q to quit: "
    verdict <- getLine
    if verdict == "e"
    then encrypt
    else if verdict == "d"
    then decrypt
    else if verdict == "q"
    then putStrLn "Goodbye!"
    else do
        putStrLn "Did not understand command, try again."
        main
