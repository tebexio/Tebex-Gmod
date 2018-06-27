Msg( "// API Client 0.1            //\n" )

TebexApiClient = {}
TebexApiClient.__index = TebexApiClient

function TebexApiClient:init(baseUrl, secret, timeout)
    local apiclient = {}

    setmetatable(apiclient,TebexApiClient)

    apiclient.baseUrl = baseUrl
    apiclient.secret = secret;

    print (apiclient.baseUrl)

    if (timeout == nil) then
        timeout = 5000
    end

    apiclient.timeout = timeout

    return apiclient

end

function TebexApiClient:get(endpoint, success, failure)
    print( self.baseUrl .. endpoint )
    HTTP(
        {
            failed = failure,
            success = success,
            method = "GET",
            url = self.plugin.config.get("baseUrl") .. endpoint,
            headers = {
                ['X-Buycraft-Secret'] = self.plugin.config.get("secret")
            }
        }
    )
end