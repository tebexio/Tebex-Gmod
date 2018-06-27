if not Tebex then
	Tebex = {}

	if not Tebex.consoleCommand then Tebex.consoleCommand = game.ConsoleCommand end

	file.CreateDir( "tebex" )

	Msg( "\n///////////////////////////////\n" )
	Msg( "//      TebexGmod v 0.1      //\n" )
	Msg( "//   https://www.tebex.io/   //\n" )
	Msg( "///////////////////////////////\n" )
	Msg( "// Loading...                //\n" )

--	include( "tebex/commands/info.lua" )
	include( "tebex/models/config.lua")
	Msg( "///////////////////////////////\n\n" )

	config = TebexConfig:init()

	Msg( "Buy command is " .. config:get("buyCommand") .. "\n")

	config:set("buyCommand", "!buynow")

	Msg( "Buy command is " .. config:get("buyCommand") .. "\n")

--[[
	AddCSLuaFile( "ulib/cl_init.lua" )
	AddCSLuaFile( "autorun/ulib_init.lua" )
	local folder = "ulib/shared"
	local files = file.Find( folder .. "/" .. "*.lua", "LUA" )
	for _, file in ipairs( files ) do
		AddCSLuaFile( folder .. "/" .. file )
	end

	folder = "ulib/client"
	files = file.Find( folder .. "/" .. "*.lua", "LUA" )
	for _, file in ipairs( files ) do
		AddCSLuaFile( folder .. "/" .. file )
	end

	--Shared modules
	local files = file.Find( "ulib/modules/*.lua", "LUA" )
	if #files > 0 then
		for _, file in ipairs( files ) do
			Msg( "[ULIB] Loading SHARED module: " .. file .. "\n" )
			include( "ulib/modules/" .. file )
			AddCSLuaFile( "ulib/modules/" .. file )
		end
	end

	--Server modules
	local files = file.Find( "ulib/modules/server/*.lua", "LUA" )
	if #files > 0 then
		for _, file in ipairs( files ) do
			Msg( "[ULIB] Loading SERVER module: " .. file .. "\n" )
			include( "ulib/modules/server/" .. file )
		end
	end

	--Client modules
	local files = file.Find( "ulib/modules/client/*.lua", "LUA" )
	if #files > 0 then
		for _, file in ipairs( files ) do
			Msg( "[ULIB] Loading CLIENT module: " .. file .. "\n" )
			AddCSLuaFile( "ulib/modules/client/" .. file )
		end
	end

	local function clReady( ply )
		ply.ulib_ready = true
		hook.Call( ULib.HOOK_LOCALPLAYERREADY, _, ply )
	end
	concommand.Add( "ulib_cl_ready", clReady ) -- Called when the c-side player object is ready
--]]
end
