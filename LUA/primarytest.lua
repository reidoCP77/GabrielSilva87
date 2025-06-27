local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ChatGUI"
screenGui.Parent = playerGui

-- Cria o frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0.7, 0, 0.7, 0)
mainFrame.Size = UDim2.new(0.25, 0, 0.25, 0)
mainFrame.Parent = screenGui

-- Adiciona cantos arredondados
local uICorner = Instance.new("UICorner")
uICorner.CornerRadius = UDim.new(0.1, 0)
uICorner.Parent = mainFrame

-- Cria o cabeçalho
local header = Instance.new("Frame")
header.Name = "Header"
header.BackgroundColor3 = Color3.fromRGB(30, 64, 175)
header.BorderSizePixel = 0
header.Size = UDim2.new(1, 0, 0.2, 0)
header.Parent = mainFrame

local headerText = Instance.new("TextLabel")
headerText.Name = "HeaderText"
headerText.Text = "Chat Rápido"
headerText.TextColor3 = Color3.fromRGB(255, 255, 255)
headerText.TextSize = 18
headerText.Font = Enum.Font.GothamBold
headerText.BackgroundTransparency = 1
headerText.Position = UDim2.new(0.1, 0, 0.15, 0)
headerText.Size = UDim2.new(0.8, 0, 0.7, 0)
headerText.Parent = header

-- Cria o campo de texto
local textBoxFrame = Instance.new("Frame")
textBoxFrame.Name = "TextBoxFrame"
textBoxFrame.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
textBoxFrame.Position = UDim2.new(0.05, 0, 0.25, 0)
textBoxFrame.Size = UDim2.new(0.9, 0, 0.3, 0)
textBoxFrame.Parent = mainFrame

local textBoxUICorner = Instance.new("UICorner")
textBoxUICorner.CornerRadius = UDim.new(0.05, 0)
textBoxUICorner.Parent = textBoxFrame

local textBox = Instance.new("TextBox")
textBox.Name = "ChatTextBox"
textBox.PlaceholderText = "Digite sua mensagem..."
textBox.Text = ""
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.TextSize = 14
textBox.Font = Enum.Font.Gotham
textBox.BackgroundTransparency = 1
textBox.Position = UDim2.new(0.05, 0, 0.1, 0)
textBox.Size = UDim2.new(0.9, 0, 0.8, 0)
textBox.Parent = textBoxFrame

-- Cria o botão de enviar
local sendButton = Instance.new("TextButton")
sendButton.Name = "SendButton"
sendButton.Text = "Enviar Mensagem"
sendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
sendButton.TextSize = 14
sendButton.Font = Enum.Font.GothamBold
sendButton.BackgroundColor3 = Color3.fromRGB(30, 64, 175)
sendButton.Position = UDim2.new(0.25, 0, 0.6, 0)
sendButton.Size = UDim2.new(0.5, 0, 0.15, 0)
sendButton.Parent = mainFrame

local buttonUICorner = Instance.new("UICorner")
buttonUICorner.CornerRadius = UDim.new(0.1, 0)
buttonUICorner.Parent = sendButton

-- Adiciona efeito de hover no botão
sendButton.MouseEnter:Connect(function()
    game:GetService("TweenService"):Create(
        sendButton,
        TweenInfo.new(0.2),
        {BackgroundColor3 = Color3.fromRGB(40, 80, 200)}
    ):Play()
end)

sendButton.MouseLeave:Connect(function()
    game:GetService("TweenService"):Create(
        sendButton,
        TweenInfo.new(0.2),
        {BackgroundColor3 = Color3.fromRGB(30, 64, 175)}
    ):Play()
end)

-- Função para enviar a mensagem quando o botão é clicado
local function sendMessage()
    local message = textBox.Text
    if message ~= "" then
        -- Envia a mensagem para o chat do Roblox
        game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(message, "All")
        textBox.Text = ""
    end
end

sendButton.Activated:Connect(sendMessage)

-- Permite enviar também pressionando Enter
textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        sendMessage()
    end
end)