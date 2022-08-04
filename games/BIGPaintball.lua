local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = game:GetService("Players").LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local worldToViewportPoint = Camera.worldToViewportPoint
local Character = player.Character

local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Tracy = Library:MakeWindow({Name = "Tracy Hub | Item Asylum", HidePremium = false, SaveConfig = true, ConfigFolder = "TH_ItemA", IntroText = "TracyHub"})

Library:MakeNotification({
	Name = "Welcome to TracyHub!",
	Content = "Thanks you for using TracyHub!",
	Image = "rbxassetid://7072722883",
	Time = 5
})

local MainTab = Tracy:MakeTab({
	Name = "Home",
	Icon = "rbxassetid://7072717697",
	PremiumOnly = false
})
local Sect = MainTab:AddSection({
	Name = "Welcome to Tracy Hub!"
})
local Sect2 = MainTab:AddSection({
	Name = "Join our discord for support and updates."
})
local Sect3 = MainTab:AddSection({
	Name = "Thanks you for using TracyHub!"
})
local Sect4 = MainTab:AddSection({
	Name = "CREDITS"
})
local Sect5 = MainTab:AddSection({
	Name = "Made by Sonmol#0001"
})

local AimTab = Tracy:MakeTab({
	Name = "Aimbot",
	Icon = "rbxassetid://7072716196",
	PremiumOnly = false
})

local AimSect = AimTab:AddSection({
	Name = "ESP"
})

AimTab:AddToggle({
    Name = "Player box",
	Default = false,
	Flag = "boxesp",
})

AimTab:AddToggle({
    Name = "Tracers",
	Default = false,
	Flag = "traceresp",
})

AimTab:AddToggle({
    Name = "Positions",
	Default = false,
	Flag = "posesp",
})

AimTab:AddToggle({
    Name = "Team Check",
	Default = false,
	Flag = "teamcheck",
})

local PlayerTab = Tracy:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://7072724538",
	PremiumOnly = false
})
local MGaeneralSect = PlayerTab:AddSection({
	Name = "Movement"
})
PlayerTab:AddSlider({
	Name = "Walkspeed",
	Min = 16,
	Max = 250,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "WalkSpeed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
	end    
})
PlayerTab:AddSlider({
	Name = "JumpPower",
	Min = 50,
	Max = 500,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "JumpPower",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
	end    
})
local MGaeneralSect = PlayerTab:AddSection({
	Name = "Others"
})
PlayerTab:AddButton({
	Name = "Sit",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.Sit = true
  	end    
})
PlayerTab:AddSlider({
	Name = "HipHeight",
	Min = 1.35,
	Max = 500,
	Default = 1.35,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "HipHeight",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.HipHeight = (Value)
	end    
})

local MiscTab = Tracy:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://7072721644",
	PremiumOnly = false
})
local MGeneralSect = MiscTab:AddSection({
	Name = "Anti AFK"
})
MiscTab:AddToggle({
    Name = "Anti AKF",
	Default = false,
	Flag = "antiafk",
	Callback = function()
		Library:MakeNotification({
			Name = "Success!",
			Content = "Anti AFK has been toggled!",
			Image = "rbxassetid://7072706536",
			Time = 3
		})
	end
})

local DiscordTab = Tracy:MakeTab({
	Name = "Discord", 
	Icon = "rbxassetid://7072717318",
	PremiumOnly = false
})
local DiscordSect = DiscordTab:AddSection({
	Name = "Discord"
})
DiscordTab:AddButton({
	Name = "Discord Invite",
	Callback = function()
      		setclipboard("https://discord.gg/")
			  Library:MakeNotification({
				Name = "Success!",
				Content = "Invite link copied to clipboard.",
				Image = "rbxassetid://7072706536",
				Time = 3
			})
  	end    
})

RunService.Heartbeat:Connect(function()
    if Library.Flags["traceresp"].Value then
        for i,v in pairs(game.Players:GetChildren()) do
            local Line = Drawing.new("Line")
            Line.Visible = false
            Line.Color = Color3.new(1,1,1)
            Line.Thickness = 1
            Line.Transparency = 1
    
            function Tracers()
                game:GetService("RunService").RenderStepped:Connect(function()
                    if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v ~= player then
                        local vector, onScreen = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                        if onScreen then
                            if _G.TracerPositon then
                                Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
                                Line.To = Vector2.new(vector.X, vector.Y)
                            else
                                Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                                Line.To = Vector2.new(vector.X, vector.Y)
                            end
                            
                            if v.TeamColor == player.TeamColor and _G.Teamcheck then
                                Line.Visible = false
                            else
                                Line.Visible = true
                            end
                        else
                            Line.Visible = false
                        end
                    else
                        Line.Visible = false
                    end
                end)
            end
        end
    
        game.Players.PlayerAdded:Connect(function(v)
            local Line = Drawing.new("Line")
            Line.Visible = false
            Line.Color = Color3.new(1,1,1)
            Line.Thickness = 1
            Line.Transparency = 1
    
            function Tracers()
                game:GetService("RunService").RenderStepped:Connect(function()
                    if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v ~= player then
                        local vector, onScreen = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                        if onScreen then
                            if _G.TracerPositon then
                                Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
                                Line.To = Vector2.new(vector.X, vector.Y)
                            else
                                Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                                Line.To = Vector2.new(vector.X, vector.Y)
                            end
                            
                            if v.TeamColor == player.TeamColor and _G.Teamcheck then
                                Line.Visible = false
                            else
                                Line.Visible = true
                            end
                        else
                            Line.Visible = false
                        end
                    else
                        Line.Visible = false
                    end
                end)
            end
        end)
    end

    if Library.Flags["traceresp"].Value == false then
        for i,v in pairs(game.Players:GetChildren()) do
            local Line = Drawing.new("Line")
            Line.Visible = false
            Line.Color = Color3.new(1,1,1)
            Line.Thickness = 1
            Line.Transparency = 1
    
            function Tracers()
                game:GetService("RunService").RenderStepped:Connect(function()
                    if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v ~= player then
                        local vector, onScreen = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                        if onScreen then
                            if _G.TracerPositon then
                                Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
                                Line.To = Vector2.new(vector.X, vector.Y)
                            else
                                Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                                Line.To = Vector2.new(vector.X, vector.Y)
                            end
                            
                            if v.TeamColor == player.TeamColor and _G.Teamcheck then
                                Line.Visible = false
                            else
                                Line.Visible = false
                            end
                        else
                            Line.Visible = false
                        end
                    else
                        Line.Visible = false
                    end
                end)
            end
        end
    
        game.Players.PlayerAdded:Connect(function(v)
            local Line = Drawing.new("Line")
            Line.Visible = false
            Line.Color = Color3.new(1,1,1)
            Line.Thickness = 1
            Line.Transparency = 1
    
            function Tracers()
                game:GetService("RunService").RenderStepped:Connect(function()
                    if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v ~= player then
                        local vector, onScreen = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                        if onScreen then
                            if _G.TracerPositon then
                                Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
                                Line.To = Vector2.new(vector.X, vector.Y)
                            else
                                Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                                Line.To = Vector2.new(vector.X, vector.Y)
                            end
                            
                            if v.TeamColor == player.TeamColor and _G.Teamcheck then
                                Line.Visible = false
                            else
                                Line.Visible = false
                            end
                        else
                            Line.Visible = false
                        end
                    else
                        Line.Visible = false
                    end
                end)
            end
        end)
    end
end)

Library:Init()