module Assets exposing (elmLogo, viteLogo)

import VitePluginHelper


elmLogo : String
elmLogo =
    VitePluginHelper.asset "/assets/images/elm.svg"


viteLogo : String
viteLogo =
    VitePluginHelper.asset "/assets/images/vite.svg"
