local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Cria a ScreenGui principal
local speedGui = Instance.new("ScreenGui")
speedGui.Name = "SpeedJumpGUI"
speedGui.Parent = playerGui

-- Cria o Frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 300, 0, 250)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = speedGui

-- Título
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Text = "Controles do Jogador"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Parent = mainFrame

-- Divisória
local divider = Instance.new("Frame")
divider.Name = "Divider"
divider.Size = UDim2.new(1, 0, 0, 2)
divider.Position = UDim2.new(0, 0, 0, 40)
divider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
divider.BorderSizePixel = 0
divider.Parent = mainFrame

-- Controle de velocidade
local speedLabel = Instance.new("TextLabel")
speedLabel.Name = "SpeedLabel"
speedLabel.Size = UDim2.new(1, -20, 0, 20)
speedLabel.Position = UDim2.new(0, 10, 0, 50)
speedLabel.Text = "Velocidade: 16"
speedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.BackgroundTransparency = 1
speedLabel.Font = Enum.Font.Gotham
speedLabel.Parent = mainFrame

local speedSlider = Instance.new("TextBox")
speedSlider.Name = "SpeedSlider"
speedSlider.Size = UDim2.new(1, -20, 0, 30)
speedSlider.Position = UDim2.new(0, 10, 0, 70)
speedSlider.Text = "16"
speedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
speedSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
speedSlider.BorderSizePixel = 0
speedSlider.Font = Enum.Font.Gotham
speedSlider.Parent = mainFrame

-- Controle de altura do pulo
local jumpLabel = Instance.new("TextLabel")
jumpLabel.Name = "JumpLabel"
jumpLabel.Size = UDim2.new(1, -20, 0, 20)
jumpLabel.Position = UDim2.new(0, 10, 0, 110)
jumpLabel.Text = "Altura do Pulo: 50"
jumpLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
jumpLabel.TextXAlignment = Enum.TextXAlignment.Left
jumpLabel.BackgroundTransparency = 1
jumpLabel.Font = Enum.Font.Gotham
jumpLabel.Parent = mainFrame

local jumpSlider = Instance.new("TextBox")
jumpSlider.Name = "JumpSlider"
jumpSlider.Size = UDim2.new(1, -20, 0, 30)
jumpSlider.Position = UDim2.new(0, 10, 0, 130)
jumpSlider.Text = "50"
jumpSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
jumpSlider.BorderSizePixel = 0
jumpSlider.Font = Enum.Font.Gotham
jumpSlider.Parent = mainFrame

-- Campo de teleporte
local teleportLabel = Instance.new("TextLabel")
teleportLabel.Name = "TeleportLabel"
teleportLabel.Size = UDim2.new(1, -20, 0, 20)
teleportLabel.Position = UDim2.new(0, 10, 0, 170)
teleportLabel.Text = "Teleportar para (X,Y,Z):"
teleportLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
teleportLabel.TextXAlignment = Enum.TextXAlignment.Left
teleportLabel.BackgroundTransparency = 1
teleportLabel.Font = Enum.Font.Gotham
teleportLabel.Parent = mainFrame

local teleportField = Instance.new("TextBox")
teleportField.Name = "TeleportField"
teleportField.Size = UDim2.new(1, -20, 0, 30)
teleportField.Position = UDim2.new(0, 10, 0, 190)
teleportField.PlaceholderText = "Ex: 100, 5, 50"
teleportField.Text = ""
teleportField.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportField.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
teleportField.BorderSizePixel = 0
teleportField.Font = Enum.Font.Gotham
teleportField.Parent = mainFrame

-- Botão de teleporte
local teleportButton = Instance.new("TextButton")
teleportButton.Name = "TeleportButton"
teleportButton.Size = UDim2.new(1, -20, 0, 30)
teleportButton.Position = UDim2.new(0, 10, 0, 230)
teleportButton.Text = "Teleportar"
teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
teleportButton.AutoButtonColor = true
teleportButton.Font = Enum.Font.GothamBold
teleportButton.Parent = mainFrame

-- Funções de atualização
local function updateSpeed()
    local speed = tonumber(speedSlider.Text) or 16
    player.Character.Humanoid.WalkSpeed = speed
    speedLabel.Text = "Velocidade: " .. tostring(speed)
end

local function updateJumpPower()
    local jumpPower = tonumber(jumpSlider.Text) or 50
    player.Character.Humanoid.JumpPower = jumpPower
    jumpLabel.Text = "Altura do Pulo: " .. tostring(jumpPower)
end

local function teleportPlayer()
    local coordsText = teleportField.Text
    local x, y, z = coordsText:match("([%-%d%.]+)%s*,%s*([%-%d%.]+)%s*,%s*([%-%d%.]+)")
    
    if x and y and z then
        local position = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
        player.Character:MoveTo(position)
    else
        teleportField.Text = "Formato inválido!" 
        task.wait(1)
        teleportField.Text = ""
    end
end

-- Conecta eventos
speedSlider.FocusLost:Connect(updateSpeed)
jumpSlider.FocusLost:Connect(updateJumpPower)
teleportButton.MouseButton1Click:Connect(teleportPlayer)
teleportField.Focused:Connect(function()
    if teleportField.Text == "Formato inválido!" then
        teleportField.Text = ""
    end
end)

-- Atualiza valores iniciais
player.CharacterAdded:Connect(function()
    updateSpeed()
    updateJumpPower()
end)