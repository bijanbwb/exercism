module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year
  | isDivisibleBy 100 && isDivisibleBy 400 = True
  | isDivisibleBy 100 = False
  | isDivisibleBy 4 = True
  | otherwise = False
  where isDivisibleBy = isDivisibleByYear year

isDivisibleByYear :: Integer -> Integer -> Bool
isDivisibleByYear year n =
  year `mod` n == 0
