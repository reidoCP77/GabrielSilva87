local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local UIS = game:GetService("UserInputService")

local mainFrame = script.Parent
local toggleButton = mainFrame:WaitForChild("ToggleButton")
local creditsFrame = mainFrame:WaitForChild("CreditsFrame")
local characterFrame = mainFrame:WaitForChild("CharacterFrame")
local speedBox = characterFrame:WaitForChild("SpeedSlider")
local jumpBox = characterFrame:WaitForChild("JumpSlider")

local dragging, dragInput, dragStart, startPos

local function update(input)
	local delta = input.Position - dragStart
	mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
		startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

mainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

local visible = true
toggleButton.Text = "Esconder"
toggleButton.MouseButton1Click:Connect(function()
	visible = not visible
	mainFrame.Visible = visible
	if visible then
		toggleButton.Text = "Esconder"
	else
		toggleButton.Text = "Mostrar"
	end
end)

speedBox.FocusLost:Connect(function()
	local speed = tonumber(speedBox.Text)
	if speed then
		humanoid.WalkSpeed = speed
	end
end)

jumpBox.FocusLost:Connect(function()
	local jump = tonumber(jumpBox.Text)
	if jump then
		humanoid.JumpPower = jump
	end
end)