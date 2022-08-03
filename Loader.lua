--[[

// TracyHub v1 \\

Credits:
[Sonmol]: Owner, developer, BigPaintball, Tower Of Mysery

Kocmoc is owned, coded developed and managed by Sonmol alone. Anyone else who claims to be a developer is an impersonator.

Thanks for using TracyHub! ^-^

]]

if game.PlaceId == 3527629287 then
	game.Players.LocalPlayer:Kick("Coming Soon.")
elseif game.PlaceId == 4954752502 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Sonmol/TracyHub/main/games/TowerOfMysery.lua"))()
elseif game.PlaceId == 5956785391 or game.PlaceId == 7722306047 then
	game.Players.LocalPlayer:Kick("Coming Soon.")
else
	game.Players.LocalPlayer:Kick("Error loadng TracyHub.\n\nNo supported game found.\n\nPlease join a supported game.")
end
