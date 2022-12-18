--// Credits to The Owner \\--

print ("Subscribe Louis")

local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ka = Instance.new("TextButton")
local infammo = Instance.new("TextButton")
local iy = Instance.new("TextButton")
local esp = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(116, 116, 116)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.357408851, 0, 0.390184075, 0)
Main.Size = UDim2.new(0, 365, 0, 193)
Main.Active = true
Main.Draggable = true

Frame.Parent = Main
Frame.BackgroundColor3 = Color3.fromRGB(185, 185, 185)
Frame.Position = UDim2.new(-0.00196248922, 0, -0.0019708348, 0)
Frame.Size = UDim2.new(0, 365, 0, 32)

TextLabel.Parent = Main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(0, 364, 0, 31)
TextLabel.Font = Enum.Font.SciFi
TextLabel.Text = "Made By F20 FR"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

ka.Name = "ka"
ka.Parent = Main
ka.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ka.Position = UDim2.new(0.542965591, 0, 0.222600907, 0)
ka.Size = UDim2.new(0, 154, 0, 30)
ka.Font = Enum.Font.SourceSans
ka.Text = "Kill Aura (Equip weapon"
ka.TextColor3 = Color3.fromRGB(0, 0, 0)
ka.TextScaled = true
ka.TextSize = 14.000
ka.TextWrapped = true
ka.MouseButton1Down:connect(function()
	while true do
		wait(0.3) -- don't change this

		-- finding the characters
		for i, v in pairs(game.Workspace:GetChildren()) do
			if v.Name ~= game.Players.LocalPlayer.Name then
				if v:FindFirstChild("Humanoid") then

					-- team check
					local victimplayers = game.Players:GetPlayerFromCharacter(v)
					if victimplayers.TeamColor ~= game.Players.LocalPlayer.TeamColor then

						-- killing everyone
						local Event = game:GetService("ReplicatedStorage").Event
						Event:FireServer(
							"shootRifle",
							"",
							{
								v.Head
							}

						)
						Event:FireServer(
							"shootRifle",
							"hit",
							{
								v.Humanoid

							}

						)
					end
				end
			end
		end
	end
end)

iy.Name = "Admin"
iy.Parent = Main
iy.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
iy.Position = UDim2.new(0.0224176347, 0, 0.566470563, 0)
iy.Size = UDim2.new(0, 134, 0, 29)
iy.Font = Enum.Font.SourceSans
iy.Text = "Infinite Yield"
iy.TextColor3 = Color3.fromRGB(0, 0, 0)
iy.TextSize = 14.000
iy.MouseButton1Down:connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)
