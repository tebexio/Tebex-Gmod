Msg( "// Command tebex:secret      //\n" )


Tebex.commands["secret"] = function(ply, args)
    if (args[3] == nil) then
        Tebex.err( "No secret provided" )
    end

    config:set("secret", args[3])
    apiclient = TebexApiClient:init(config:get("baseUrl"), config:get("secret"))
    apiclient:get("/info", function(code, body)
        print (body)
    end)
end