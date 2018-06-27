TebexConfig = {}
TebexConfig.__index = TebexConfig

function TebexConfig:init()
    local config = {
        buyEnabled = false,
        secret = "",
        buyCommand = "!donate",
        baseUrl = "https://plugin.buycraft.net"

    }
    setmetatable(config,TebexConfig)

    if (file.Exists("tebex/config", "DATA") == false) then
       print ( "No config exists, create" )

        configJson = util.TableToJSON(config)

        file.Write("tebex/config", configJson)

    else
        configJson = file.Read("tebex/config")
        config = util.JSONToTable(configJson)

        print( "Config Loaded" )

    end

    return config

end