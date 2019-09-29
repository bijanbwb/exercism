module Leap exposing (isLeapYear)


type YearCategory
    = LeapYear
    | NormalYear


isLeapYear : Int -> Bool
isLeapYear year =
    case yearCategory year of
        LeapYear ->
            True

        NormalYear ->
            False


yearCategory : Int -> YearCategory
yearCategory year =
    case ( isDivisibleBy 400 year, isDivisibleBy 100 year, isDivisibleBy 4 year ) of
        ( True, True, _ ) ->
            LeapYear

        ( _, True, _ ) ->
            NormalYear

        ( _, _, True ) ->
            LeapYear

        _ ->
            NormalYear


isDivisibleBy : Int -> Int -> Bool
isDivisibleBy int =
    modBy int >> (==) 0
