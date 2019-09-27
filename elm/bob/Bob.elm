module Bob exposing (hey)


type Remark
    = Asking
    | AskingAndShouting
    | Shouting
    | Silent
    | Statement


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


stringToRemark : String -> Remark
stringToRemark string =
    case ( isAsking string, isShouting string, isSilent string ) of
        ( True, True, _ ) ->
            AskingAndShouting

        ( True, _, _ ) ->
            Asking

        ( _, True, _ ) ->
            Shouting

        ( _, _, True ) ->
            Silent

        _ ->
            Statement


isAsking : String -> Bool
isAsking =
    String.trim >> String.endsWith "?"


isShouting : String -> Bool
isShouting string =
    hasLetters string && (String.toUpper string == string)


isSilent : String -> Bool
isSilent =
    String.trim >> String.isEmpty


hasLetters : String -> Bool
hasLetters =
    String.any Char.isAlpha
