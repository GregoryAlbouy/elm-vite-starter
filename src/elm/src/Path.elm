module Path exposing (img)


img : String -> String
img name =
    "/public/assets/images/" ++ name
