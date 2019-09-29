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
    case ( isDivisibleBy year 400, isDivisibleBy year 100, isDivisibleBy year 4 ) of
        ( True, True, _ ) ->
            LeapYear

        ( _, True, _ ) ->
            NormalYear

        ( _, _, True ) ->
            LeapYear

        _ ->
            NormalYear


isDivisibleBy : Int -> Int -> Bool
isDivisibleBy year int =
    modBy int year == 0
