local function createSurfaceGui(player)
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local rootPart = character:WaitForChild("Head")
	
	local existingGui = rootPart:FindFirstChild("HeadSurfaceGui")
	if not existingGui then
		
		local gui = Instance.new("SurfaceGui")
		gui.AlwaysOnTop = true
		gui.Face = Enum.NormalId.Top
		gui.CanvasSize = Vector2.new(100, 100) 
		gui.Parent = rootPart
	
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, 0, 1, 0)
		label.BackgroundColor3 = Color3.new(1, 1, 1)
		label.TextScaled = true
		label.BorderSizePixel = 0
		label.Parent = gui
		label.Text = ""
		label.Transparency = 0.9
		
		local faces = {Enum.NormalId.Back, Enum.NormalId.Bottom, Enum.NormalId.Front, Enum.NormalId.Left, Enum.NormalId.Right}
		for _, face in ipairs(faces) do
			local gui = Instance.new("SurfaceGui")
			gui.AlwaysOnTop = true
			gui.Face = face 
			gui.CanvasSize = Vector2.new(100, 100)
			gui.Parent = rootPart

			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(1, 0, 1, 0)
			label.BorderSizePixel = 0
			label.BackgroundColor3 = Color3.new(1, 1, 1)
			label.TextScaled = true
			label.Text = ""
			label.Parent = gui
			label.Transparency = 0.9
		end
	end
end

for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
	createSurfaceGui(player)
end

game:GetService("Players").PlayerAdded:Connect(function(player)
	createSurfaceGui(player)
end)