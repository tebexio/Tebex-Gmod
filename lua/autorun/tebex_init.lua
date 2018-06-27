-- Short and sweet
print ("Tebex?" )
if SERVER then
	include( "tebex/init.lua" )
else
	include( "tebex/noclient.lua" )
end
