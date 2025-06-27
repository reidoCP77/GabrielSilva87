local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BlockCreatorGUI"
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 150, 0, 50)
frame.Position = UDim2.new(0.5, -75, 0.9, -25)
frame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local button = Instance.new("TextButton")
button.Name = "CreateBlockButton"
button.Size = UDim2.new(0.9, 0, 0.9, 0)
button.Position = UDim2.new(0.05, 0, 0.05, 0)
button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
button.BorderSizePixel = 0
button.TextColor3 = Color3.new(1, 1, 1)
button.Text = "Criar Bloco"
button.Font = Enum.Font.SourceSansBold
button.TextSize = 14
button.Parent = frame

local function createBlock()
    local block = Instance.new("Part")
    block.Name = "SpawnedBlock"
    block.Size = Vector3.new(4, 4, 4)
    block.Anchored = true
    block.CanCollide = true
    block.BrickColor = BrickColor.random()
    
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    local spawnOffset = humanoidRootPart.CFrame.lookVector * 10
    block.Position = humanoidRootPart.Position + spawnOffset + Vector3.new(0, 2.5, 0)
    
    block.Parent = workspace
    
    local tweenService = game:GetService("TweenService")
    local goal = {Size = Vector3.new(4, 4, 4)}
    local info = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = tweenService:Create(block, info, goal)
    
    block.Size = Vector3.new(0.1, 0.1, 0.1)
    tween:Play()
end

button.MouseButton1Click:Connect(createBlock)

local function playSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://130785805"
    sound.Volume = 0.5
    sound.Parent = button
    sound:Play()
    delay(1, function()
        sound:Destroy()
    end)
end

button.MouseButton1Click:Connect(playSound)

game:GetService("GuiService").ScreenGuiAbsoluteSizeChanged:Connect(function()
    frame.Position = UDim2.new(0.5, -75, 0.9, -25)
end)