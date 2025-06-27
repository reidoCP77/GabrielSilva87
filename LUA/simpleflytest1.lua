-- Coloque este código em um LocalScript dentro do StarterGui

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- GUI Setup
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "FlyControlGUI"

local buttons = {
    {"Direita", UDim2.new(0.75, 0, 0.5, -25)},
    {"Esquerda", UDim2.new(0.55, 0, 0.5, -25)},
    {"Cima", UDim2.new(0.65, 0, 0.4, -25)},
    {"Baixo", UDim2.new(0.65, 0, 0.6, -25)},
    {"ON", UDim2.new(0.15, 0, 0.4, -25)},
    {"OFF", UDim2.new(0.15, 0, 0.5, -25)}
}

local fly = false
local direction = Vector3.zero

-- Create buttons
for _, info in ipairs(buttons) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 80, 0, 50)
    btn.Position = info[2]
    btn.Text = info[1]
    btn.Name = info[1]
    btn.Parent = screenGui
    btn.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    btn.TextColor3 = Color3.new(1, 1, 1)
end

-- Créditos
local credit = Instance.new("TextLabel", screenGui)
credit.Size = UDim2.new(0, 200, 0, 25)
credit.Position = UDim2.new(0.01, 0, 0.9, 0)
credit.Text = "Créditos: GabrielBStar2"
credit.BackgroundTransparency = 1
credit.TextColor3 = Color3.new(1, 1, 1)
credit.TextScaled = true

-- Fly loop
RunService.RenderStepped:Connect(function()
    if fly then
        local cam = workspace.CurrentCamera
        local move = cam.CFrame:VectorToWorldSpace(direction)
        hrp.Velocity = move * 50
    end
end)

-- Button functions
screenGui.ON.MouseButton1Click:Connect(function()
    fly = true
    hrp.Anchored = false
    hrp.Velocity = Vector3.zero
end)

screenGui.OFF.MouseButton1Click:Connect(function()
    fly = false
    hrp.Velocity = Vector3.zero
end)

screenGui.Direita.MouseButton1Down:Connect(function()
    direction = Vector3.new(1, 0, 0)
end)

screenGui.Esquerda.MouseButton1Down:Connect(function()
    direction = Vector3.new(-1, 0, 0)
end)

screenGui.Cima.MouseButton1Down:Connect(function()
    direction = Vector3.new(0, 1, 0)
end)

screenGui.Baixo.MouseButton1Down:Connect(function()
    direction = Vector3.new(0, -1, 0)
end)

-- Reset direction on button release
local function resetDirection()
    direction = Vector3.zero
end

screenGui.Direita.MouseButton1Up:Connect(resetDirection)
screenGui.Esquerda.MouseButton1Up:Connect(resetDirection)
screenGui.Cima.MouseButton1Up:Connect(resetDirection)
screenGui.Baixo.MouseButton1Up:Connect(resetDirection)