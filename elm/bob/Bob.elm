module Bob exposing (hey)

-- IMPORTS

import Regex



-- TYPES


type Remark
    = Asking
    | AskingAndShouting
    | Shouting
    | Silent
    | Statement



-- SOLUTION


hey : String -> String
hey string =
    case stringToRemark string of
        Asking ->
            "Sure."

        AskingAndShouting ->
            "Calm down, I know what I'm doing!"

        Shouting ->
            "Whoa, chill out!"

        Silent ->
            "Fine. Be that way!"

        Statement ->
            "Whatever."



-- HELPERS


stringToRemark : String -> Remark
stringToRemark string =
    if isAsking string && isShouting string then
        AskingAndShouting

    else if isAsking string then
        Asking

    else if isShouting string then
        Shouting

    else if isSilent string then
        Silent

    else
        Statement


isAsking : String -> Bool
isAsking string =
    string
        |> String.trim
        |> String.endsWith "?"


isShouting : String -> Bool
isShouting string =
    hasLetters string
        && (String.toUpper string == string)


isSilent : String -> Bool
isSilent =
    String.trim >> String.isEmpty


hasLetters : String -> Bool
hasLetters =
    let
        letters =
            "[A-Za-z]"
                |> Regex.fromString
                |> Maybe.withDefault Regex.never
    in
    Regex.contains letters
