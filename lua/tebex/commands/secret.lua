Msg( "// Command tebex:secret      //\n" )


Tebex.commands["secret"] = function(ply, args)
    if (args[3] == nil) then
        Tebex.err( "No secret provided" )
    end

    Tebex.config:set("secret", args[3])
    Tebex.apiclient.get("/info", function(code, body)
        print (string)
    end)
end