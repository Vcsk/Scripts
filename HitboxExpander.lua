--[[

Open source
Made by !vcsk0#1516
Credits to me

]]

local CoreGui = game:GetService("StarterGui")

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/MyUILib(Unamed).lua"))();
local Window = Library:Window("Hitbox Expander")

if game:GetService("CoreGui"):FindFirstChild("ToggleGui_Test") then
    game:GetService("CoreGui"):FindFirstChild("ToggleGui_Test")
end

local ToggleGui_Test = Instance.new("ScreenGui")
local Toggle = Instance.new("TextButton")

ToggleGui_Test.Name = "ToggleGui_Test"
ToggleGui_Test.Parent = game.CoreGui

Toggle.Name = "Toggle"
Toggle.Parent = ToggleGui_Test
Toggle.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Toggle.BackgroundTransparency = 0.660
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0.0650164187, 0, 0.0888099447, 0)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = "Toggle"
Toggle.TextColor3 = Color3.fromRGB(128, 187, 219)
Toggle.TextSize = 24.000
Toggle.TextXAlignment = Enum.TextXAlignment.Left
Toggle.Active = true
Toggle.Draggable = true
Toggle.MouseButton1Click:connect(function()
    Library:ToggleUI()
end)

local HomeTab = Window:Tab("Home","rbxassetid://10888331510")
local PlayerTab = Window:Tab("Players","rbxassetid://12296135476")

HomeTab:Slider("Hitbox Size:", 0,500, function(value)
	getgenv().HitboxSize = value
end)

HomeTab:Toggle("Everyone", function(state)
	getgenv().HitboxStatus = state
    game:GetService('RunService').RenderStepped:connect(function()
		if HitboxStatus == true then
			for i,v in next, game:GetService('Players'):GetPlayers() do
				if v.Name ~= game:GetService('Players').LocalPlayer.Name then
					pcall(function()
						v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize,HitboxSize,HitboxSize)
						v.Character.HumanoidRootPart.Transparency = 0.7
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
						v.Character.HumanoidRootPart.Material = "Neon"
						v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
		end
	end)
end)

HomeTab:Toggle("Enemy Only", function(state)
    getgenv().TeamCheck = state
    game:GetService('RunService').RenderStepped:connect(function()
		if TeamCheck == true then
			for i,v in next, game:GetService('Players'):GetPlayers() do
				if game:GetService('Players').LocalPlayer.Team ~= v.Team then
					pcall(function()
						v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize,HitboxSize,HitboxSize)
						v.Character.HumanoidRootPart.Transparency = 0.7
						v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
						v.Character.HumanoidRootPart.Material = "Neon"
						v.Character.HumanoidRootPart.CanCollide = false
					end)
				end
			end
		end
	end)
end)

PlayerTab:Slider("WalkSpeed", 16,500, function(value)
    getgenv().Walkspeed = value
end)

PlayerTab:Slider("JumpPower", 50,1000, function(value)
    getgenv().Jumppower = value
end)

PlayerTab:Slider("Fov", 70,120, function(v)
     game.Workspace.CurrentCamera.FieldOfView = v
end)

PlayerTab:Toggle("Status:", function(state)
    getgenv().EnabledWJ = state
    if EnabledWJ == true then
        CoreGui:SetCore("SendNotification", {
            Title = "Status:";
            Text = "on";
            Duration = 5;
        })
        while EnabledWJ == true do wait(1)
            pcall(function()
                game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Walkspeed
                game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Jumppower
            end)
        end
    else
        CoreGui:SetCore("SendNotification", {
            Title = "Status:";
            Text = "off";
            Duration = 5;
        })
    end
end)

PlayerTab:Toggle("(Everyone) ESP Name", function(state)
local c = workspace.CurrentCamera
local ps = game:GetService("Players")
local lp = ps.LocalPlayer
local rs = game:GetService("RunService")

local function esp(p,cr)
	local h = cr:WaitForChild("Humanoid")
	local hrp = cr:WaitForChild("Head")

	local text = Drawing.new("Text")
	text.Visible = false
	text.Center = true
	text.Outline = false 
	text.Font = 3
	text.Size = 16.16
	text.Color = Color3.new(170,170,170)

	local conection
	local conection2
	local conection3

	local function dc()
		text.Visible = false
		text:Remove()
		if conection then
			conection:Disconnect()
			conection = nil 
		end
		if conection2 then
			conection2:Disconnect()
			conection2 = nil 
		end
		if conection3 then
			conection3:Disconnect()
			conection3 = nil 
		end
	end

	conection2 = cr.AncestryChanged:Connect(function(_,parent)
		if not parent then
			dc()
		end
	end)

	conection3 = h.HealthChanged:Connect(function(v)
		if (v<=0) or (h:GetState() == Enum.HumanoidStateType.Dead) then
			dc()
		end
	end)

	conection = rs.RenderStepped:Connect(function()
		local hrp_pos,hrp_onscreen = c:WorldToViewportPoint(hrp.Position)
		if hrp_onscreen then
			text.Position = Vector2.new(hrp_pos.X, hrp_pos.Y - 27)
			text.Text = "[ "..p.Name.." ]"
			text.Visible = true
		elseif state == false then
			text.Text = ""
			text.Visible = false
		else
			text.Visible = false
		end
	end)
end

local function p_added(p)
	if p.Character then
		esp(p,p.Character)
	end
	p.CharacterAdded:Connect(function(cr)
		esp(p,cr)
	end)
end

for i,p in next, ps:GetPlayers() do 
	if p ~= lp then
		p_added(p)
	end
end

ps.PlayerAdded:Connect(p_added)
end)

PlayerTab:Toggle("(Enemy Only) ESP Name", function(state)
    print("SOON")
end)

PlayerTab:Toggle("Noclip", function(s)
    getgenv().Noclip = s
    if Noclip == true then
        CoreGui:SetCore("SendNotification", {
            Title = "Noclip:";
            Text = "on";
            Duration = 5;
        })
        while Noclip == true do
            game:GetService("RunService").Stepped:wait()
            game.Players.LocalPlayer.Character.Head.CanCollide = false
            game.Players.LocalPlayer.Character.Torso.CanCollide = false
        end
    else
        CoreGui:SetCore("SendNotification", {
            Title = "Noclip:";
            Text = "off";
            Duration = 5;
        })
    end
end)

PlayerTab:Toggle("Infinite Jump", function(s)
getgenv().InfJ = s
    game:GetService("UserInputService").JumpRequest:connect(function()
        if InfJ == true then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end
    end)
end)

PlayerTab:Button("Rejoin", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)
