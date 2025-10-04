local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/ovsepantamerlan36/Script-games/refs/heads/main/games-list.lua"))()

local URL = Games[game.PlaceId]

if URL then
  loadstring(game:HttpGet(URL))()
end
