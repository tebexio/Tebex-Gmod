Msg( "// Config Library 0.1       //\n" )

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

        file.Write("tebex/config.txt", configJson)

    else
        configJson = file.Read("tebex/config.txt")
        config = util.JSONToTable(configJson)

        print( "Config Loaded" )

    end

    return config

end

function TebexConfig:get(key)
    if (self.config[key] == nil) then
        return false
    end

    return self.config[key]
end