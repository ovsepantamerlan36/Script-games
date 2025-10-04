local replicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = game:GetService("Players").LocalPlayer
local infenergy = false
local autoconvert = false
local killall = false
local collectmoney = false
local automerge = false
local autobuy = false
local buyamount = "3"
local autoupgrade = false
local tycoon

for _,v in workspace.Tycoon.Tycoons:GetChildren() do
    if v.Owner.Value == localPlayer then
        tycoon = v
    end
end

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local window = WindUI:CreateWindow({
    Title = "Merge Tower Defense",
    SubTitle = "Author: TwizzleFuzz",
    Theme = "Dark",
    Folder = "WindUITest",
    Size = UDim2.new(0, 360, 0, 250)
})

-- Currency tab
local tabCurrency = window:Tab({ Title = "Currency", Icon = "dollar-sign" })
local sectionCurrency = tabCurrency:Section({
    Title = "Main",
    Expandable = false,
    Opened = true
})
sectionCurrency:Toggle({
    Title = "Infinite energy",
    Value = false,
    Callback = function(val) infenergy = val end
})
sectionCurrency:Toggle({
    Title = "Auto convert energy",
    Value = false,
    Callback = function(val) autoconvert = val end
})
sectionCurrency:Toggle({
    Title = "Auto collect money",
    Value = false,
    Callback = function(val) collectmoney = val end
})

-- Weapons tab
local tabWeapons = window:Tab({ Title = "Weapons", Icon = "sword" })
local sectionWeapons = tabWeapons:Section({
    Title = "Main",
    Expandable = false,
    Opened = true
})
sectionWeapons:Toggle({
    Title = "Kill all zombies",
    Value = false,
    Callback = function(val) killall = val end
})
sectionWeapons:Button({
    Title = "Gun modifications",
    Callback = function()
        local character = localPlayer.Character
        local tool = character and character:FindFirstChildWhichIsA("Tool")
        local gun
        if tool and tool:FindFirstChild("GunClient") and tool:FindFirstChild("Configuration") then
            gun = tool
        end
        if gun then
            if gun.Configuration:FindFirstChild("Automatic") and tool.Configuration.Automatic.Value == false then
                gun.Configuration.Automatic.Value = true
            end
            if gun.Configuration:FindFirstChild("Firerate") and gun.Configuration.Firerate.Value > 0 then
                gun.Configuration.Firerate.Value = 0
            end
            if gun.Configuration:FindFirstChild("ReloadTime") and gun.Configuration.ReloadTime.Value > 0 then
                gun.Configuration.ReloadTime.Value = 0
            end
            WindUI:Notify({Title = "Weapons", Content = "Gun modifications applied!"})
        else
            WindUI:Notify({Title = "Weapons", Content = "No compatible tool found!"})
        end
    end
})

-- Tycoon tab
local tabTycoon = window:Tab({ Title = "Tycoon", Icon = "building" })
local sectionTycoon = tabTycoon:Section({
    Title = "Main",
    Expandable = false,
    Opened = true
})
sectionTycoon:Toggle({
    Title = "Auto buy towers",
    Value = false,
    Callback = function(val) autobuy = val end
})
sectionTycoon:Dropdown({
    Title = "Amount",
    Values = {"3", "10", "30", "50", "100", "1000", "10000"},
    Default = 1,
    Callback = function(val) buyamount = val end
})
sectionTycoon:Toggle({
    Title = "Auto merge towers",
    Value = false,
    Callback = function(val) automerge = val end
})
sectionTycoon:Toggle({
    Title = "Auto upgrade convert",
    Value = false,
    Callback = function(val) autoupgrade = val end
})

window:Open()

game:GetService("RunService").RenderStepped:Connect(function(delta)
    local character = localPlayer.Character
    local tier = localPlayer:GetAttribute("Tier")
    local tool = character and character:FindFirstChildWhichIsA("Tool")
    local gun
    if tool and tool:FindFirstChild("GunClient") and tool:FindFirstChild("Configuration") then
        gun = tool
    end

    if infenergy then
        replicatedStorage.Signals.RemoteEvents.GetWoolRemote:FireServer(tier)
    end
    if autoconvert then
        replicatedStorage.Signals.RemoteEvents.PutRemote:FireServer()
    end
    if collectmoney and character then
        for _,v in workspace:GetChildren() do
            if v.Name == "Money" then
                firetouchinterest(v, character.HumanoidRootPart, 0)
                firetouchinterest(v, character.HumanoidRootPart, 1)
            end
        end
    end
    if killall and gun and tycoon then
        for _,v in tycoon.Round:GetChildren() do
            if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                gun.Remotes.CastRay:FireServer(Vector3.new(1,1,1), v.Humanoid, true)
            end
        end
    end
    if autobuy and tycoon and buyamount ~= "" then
        local button = tycoon.Buttons_E["Add"..buyamount] or tycoon.Buttons_E["Add"]
        if button and button.Head and character and character:FindFirstChild("HumanoidRootPart") then
            firetouchinterest(button.Head, character.HumanoidRootPart, 0)
            firetouchinterest(button.Head, character.HumanoidRootPart, 1)
        end
    end
    if automerge and tycoon then
        firetouchinterest(tycoon.Buttons_E.Merge.Head, character.HumanoidRootPart, 0)
        firetouchinterest(tycoon.Buttons_E.Merge.Head, character.HumanoidRootPart, 1)
    end
    if autoupgrade and tycoon then
        firetouchinterest(tycoon.Buttons_E.Upgrade.Head, character.HumanoidRootPart, 0)
        firetouchinterest(tycoon.Buttons_E.Upgrade.Head, character.HumanoidRootPart, 1)
    end
end)
