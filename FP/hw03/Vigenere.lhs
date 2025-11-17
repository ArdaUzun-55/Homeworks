> module Vigenere where

> import Data.Char
> import Data.List

> crackCols n xs = concat [ caesar_crack c | c <- columns n xs ]

> crackKey xs = [ caesar_int2let (caesar_crackKey c) | c <- columns best xs ]
>   where
>     range = [1..15]
>     best = snd (minimum (zip chitab range))
>     chitab = [ caesar_chisqr (caesar_freqs (crackCols n xs)) caesar_table | n <- range ]

> chunks n [] = []
> chunks n xs = take n xs : chunks n (drop n xs)

> columns n xs = transpose (chunks n xs)

--------------------------------------------------------------------------------

CONTRACT

> encode :: String -> String -> String

PURPOSE [TODO]
encodes a text with a key and makes it unreadable
EXAMPLES [TODO]

> example1_encode = encode "key" "hello" == "aijvs"

DEFINITION [TODO]

> encode ks ms =  [caesar_shift (caesar_let2int x) y |(x,y) <- zip ms (cycle ks)]


--------------------------------------------------------------------------------

CONTRACT

> decode :: String -> String -> String

PURPOSE [TODO]
"decode an encoded text with a key by inverting the key and applying it.
EXAMPLES [TODO]

> example1_decode = decode "key" "aijvs" == "hello"

DEFINITION [TODO]

> decode ks ms = [caesar_shift (caesar_let2int x) (caesar_int2let ((26 - caesar_let2int y) `mod` 26)) |(x,y) <- zip ms (cycle ks)]

--------------------------------------------------------------------------------

> test_string = "vc avvt oys budbvh nbu las gks upau gz ziq hspa vw dwvcyg ndtm wc ioqf kp azvhr iv jdfy fwh owa jhw zw lrdf nvc poj uwg gspym ric pvghzwtjb zvtro zlusi mkszlxu lric kqfusdelkg tzg iyo ewl adhfght zcyslzf hspa tuch hzbxbo fwh gz swaj dd tbqu pul wvlcra icc hty hst nvvv iom zccaka dpzja gr mt lrvhcdfmq hstymf bz wwvqh vlbglbr hty oycvgrg wxl odqv hvq zpi buh aahvrw oxzabojp hzbxbo fwh rphwqgh ewvar bpiz bi ejui izptaa zs iowhjve apnw xdzb rt nvc zsct ajhse lachqtpstl htcf grhd hvq mzjy cusrchvg kzblv vc avvt gz swaj dd tbqu hv yrbr zw ocyv ab zzcn fr wduo vc avvt gz swaj dd tbqu hv yrbr zw ocyv iag ewhvxv qdy noz iom iwdw qs w whl midi wah wpzb zwdw q zcfak ylyp h gdgen nvvv xm jh ndbtq xfha pkoyvl bqs ioqaj ht ebxzo hty vlkl yhocca gr dxuo fcxt wah lck noz bhv dbo tizpow zqqh mn avgs xu yltph oehoe nmah advt vc avvt gz swaj dd tbqu hv yrbr zw ocyv ab zzcn fr wduo vc avvt gz swaj dd tbqu hv yrbr zw ocyv ab zzcn fr wduo vc avvt gz swaj dd tbqu hv yrbr hvq hspusf tzg iyo ewl slgs"



-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
----------- IGNORE THIS SECTION, AS IT IS JUST A COPY OF THE ORIGINAL CODE OF CIPHER.LHS --------------
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

Caeser cipher example from section 5.5 of Programming in Haskell,
Graham Hutton, Cambridge University Press, 2007.

TUHH modifications
 - Added "caesar_" to all function names
 - Added module declaration
 - Added caesar_decode, and caesar_crackKey functions
 - Reimplemented caesar_crack using caesar_decode and caesar_crackKey
 - Ignore international lowercase characters
   (use isAsciiLower instead of isLower)

Encoding and decoding
---------------------

> caesar_let2int                       :: Char -> Int
> caesar_let2int c                     =  ord c - ord 'a'
>
> caesar_int2let                       :: Int -> Char
> caesar_int2let n                     =  chr (ord 'a' + n)
>
> caesar_shift                         :: Int -> Char -> Char
> caesar_shift n c | isAsciiLower c    =  caesar_int2let ((caesar_let2int c + n) `mod` 26)
>                  | otherwise         =  c
>
> caesar_encode                        :: Int -> String -> String
> caesar_encode n xs                   =  [caesar_shift n x | x <- xs]
>
> caesar_decode                        :: Int -> String -> String
> caesar_decode n xs                   =  caesar_encode (-n) xs

Frequency analysis
------------------

> caesar_table                         :: [Float]
> caesar_table                         =  [8.2, 1.5, 2.8, 4.3, 12.7, 2.2, 2.0,
>                                          6.1, 7.0, 0.2, 0.8,  4.0, 2.4, 6.7,
>                                          7.5, 1.9, 0.1, 6.0,  6.3, 9.1, 2.8,
>                                          1.0, 2.4, 0.2, 2.0,  0.1]
>
> caesar_lowers                        :: String -> Int
> caesar_lowers xs                     =  length [x | x <- xs, isAsciiLower x]
>
> caesar_count                         :: Char -> String -> Int
> caesar_count x xs                    =  length [x' | x' <- xs, x == x']
>
> caesar_percent                       :: Int -> Int -> Float
> caesar_percent n m                   =  (fromIntegral n / fromIntegral m) * 100
>
> caesar_freqs                         :: String -> [Float]
> caesar_freqs xs                      =  [caesar_percent (caesar_count x xs) n | x <- ['a'..'z']]
>                                         where n = caesar_lowers xs
>
> caesar_chisqr                        :: [Float] -> [Float] -> Float
> caesar_chisqr os es                  =  sum [((o - e) ^ 2) / e | (o,e) <- zip os es]
>
> caesar_rotate                        :: Int -> [a] -> [a]
> caesar_rotate n xs                   =  drop n xs ++ take n xs
>
> caesar_positions                     :: Eq a => a -> [a] -> [Int]
> caesar_positions x xs                =  [i | (x',i) <- zip xs [0..], x == x']
>
> caesar_crackKey                      :: String -> Int
> caesar_crackKey xs                   =  (caesar_positions (minimum chitab) chitab) !! 0
>                                         where
>                                           chitab = [caesar_chisqr (caesar_rotate n mcaesar_freqs) caesar_table | n <- [0..25]]
>                                           mcaesar_freqs = caesar_freqs xs
>
> caesar_crack                         :: String -> String
> caesar_crack xs                      =  caesar_decode (caesar_crackKey xs) xs
