Msg( "// Command tebex:secret      //\n" )


Tebex.commands["secret"] = function(ply, args)
    if (args[3] == nil) then
        Tebex.err( "No secret provided" )
    end

    config:set("secret", args[3])
    apiclient = TebexApiClient:init(config:get("baseUrl"), config:get("secret"))
    apiclient:get("/information", function(body)
        print (body)
    end, function(body)
        Tebex.err (body["error_message"])
    end)
end