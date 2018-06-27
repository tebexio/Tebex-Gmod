if not Tebex then
	Tebex = {}
	Tebex.commands = {}

	Tebex.warn = function ( msg )
		MsgC( Color( 255, 255, 0 ), msg )
	end

	Tebex.err = function ( msg )
		MsgC( Color( 255, 0, 0 ), msg )
	end

	Tebex.ok = function ( msg )
		MsgC( Color( 0, 255, 0 ), msg )
	end

	if not Tebex.consoleCommand then Tebex.consoleCommand = game.ConsoleCommand end

	file.CreateDir( "tebex" )

	Msg( "\n///////////////////////////////\n" )
	Msg( "//      TebexGmod v 0.1      //\n" )
	Msg( "//   https://www.tebex.io/   //\n" )
	Msg( "///////////////////////////////\n" )
	Msg( "// Loading...                //\n" )

	include( "tebex/client/apiclient.lua" )
	include( "tebex/models/config.lua" )

	include( "tebex/commands/secret.lua" )
	include( "tebex/commands/info.lua" )
	Msg( "///////////////////////////////\n\n" )

	Tebex.config = TebexConfig:init()
	Tebex.apiclient = TebexApiClient:init(Tebex)


	concommand.Add("tebex", function(ply, cmd, args)

		if (args[2] == nil) then
			--Help!
			return
		end

		if (Tebex.commands[args[2]] == nil) then
			Msg( "Unknown command \"tebex:" .. args[2] .. "\"" )
			return
		end

		Tebex.commands[args[2]](ply,args);

	end)
--game.ConsoleCommand( string stringCommand )

--[[
	local function clReady( ply )
		ply.ulib_ready = true
		hook.Call( ULib.HOOK_LOCALPLAYERREADY, _, ply )
	end
	concommand.Add( "ulib_cl_ready", clReady ) -- Called when the c-side player object is ready
--]]
end
