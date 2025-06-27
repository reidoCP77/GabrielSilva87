local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Create the main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Create the main frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 450)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -225) -- Center the frame
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- Create title bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

-- Title text
local TitleText = Instance.new("TextLabel")
TitleText.Name = "TitleText"
TitleText.Size = UDim2.new(1, -40, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "Custom GUI"
TitleText.Font = Enum.Font.GothamBold
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 18
TitleText.TextXAlignment = Enum.TextXAlignment.Left
TitleText.Parent = TitleBar

-- Close button (optional)
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.BorderSizePixel = 0
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 16
CloseButton.Parent = TitleBar

-- Make draggable
local UserInputService = game:GetService("UserInputService")
local Dragging, DragInput, DragStart, StartPos

local function Update(input)
    local delta = input.Position - DragStart
    MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        Dragging = true
        DragStart = input.Position
        StartPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        DragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == DragInput and Dragging then
        Update(input)
    end
end)

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Tab buttons
local TabContainer = Instance.new("Frame")
TabContainer.Name = "TabContainer"
TabContainer.Size = UDim2.new(1, 0, 0, 40)
TabContainer.BackgroundTransparency = 1
TabContainer.Position = UDim2.new(0, 0, 0, 40)
TabContainer.Parent = MainFrame

local PlayerTab = Instance.new("TextButton")
PlayerTab.Name = "PlayerTab"
PlayerTab.Size = UDim2.new(0.333, -2, 1, 0)
PlayerTab.Position = UDim2.new(0, 0, 0, 0)
PlayerTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PlayerTab.BorderSizePixel = 0
PlayerTab.Font = Enum.Font.GothamMedium
PlayerTab.Text = "Player"
PlayerTab.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerTab.TextSize = 14
PlayerTab.Parent = TabContainer

local ChatTab = Instance.new("TextButton")
ChatTab.Name = "ChatTab"
ChatTab.Size = UDim2.new(0.333, -2, 1, 0)
ChatTab.Position = UDim2.new(0.333, 0, 0, 0)
ChatTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ChatTab.BorderSizePixel = 0
ChatTab.Font = Enum.Font.GothamMedium
ChatTab.Text = "Chat"
ChatTab.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatTab.TextSize = 14
ChatTab.Parent = TabContainer

local CreditsTab = Instance.new("TextButton")
CreditsTab.Name = "CreditsTab"
CreditsTab.Size = UDim2.new(0.333, -2, 1, 0)
CreditsTab.Position = UDim2.new(0.666, 0, 0, 0)
CreditsTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CreditsTab.BorderSizePixel = 0
CreditsTab.Font = Enum.Font.GothamMedium
CreditsTab.Text = "Credits"
CreditsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsTab.TextSize = 14
CreditsTab.Parent = TabContainer

-- Content frame for tabs
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -20, 1, -100)
ContentFrame.Position = UDim2.new(0, 10, 0, 90)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ClipsDescendants = true
ContentFrame.Parent = MainFrame

-- Player content
local PlayerContent = Instance.new("Frame")
PlayerContent.Name = "PlayerContent"
PlayerContent.Size = UDim2.new(1, 0, 1, 0)
PlayerContent.BackgroundTransparency = 1
PlayerContent.Visible = true
PlayerContent.Parent = ContentFrame

-- Speed controller
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Name = "SpeedLabel"
SpeedLabel.Size = UDim2.new(1, 0, 0, 30)
SpeedLabel.Position = UDim2.new(0, 0, 0, 20)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "Walk Speed"
SpeedLabel.Font = Enum.Font.GothamMedium
SpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SpeedLabel.TextSize = 14
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = PlayerContent

local SpeedSlider = Instance.new("Frame")
SpeedSlider.Name = "SpeedSlider"
SpeedSlider.Size = UDim2.new(1, 0, 0, 30)
SpeedSlider.Position = UDim2.new(0, 0, 0, 50)
SpeedSlider.BackgroundTransparency = 1
SpeedSlider.Parent = PlayerContent

local SpeedValue = Instance.new("TextBox")
SpeedValue.Name = "SpeedValue"
SpeedValue.Size = UDim2.new(0.3, 0, 1, 0)
SpeedValue.Position = UDim2.new(0.7, 0, 0, 0)
SpeedValue.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SpeedValue.BorderSizePixel = 0
SpeedValue.Font = Enum.Font.GothamMedium
SpeedValue.Text = "16"
SpeedValue.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedValue.TextSize = 14
SpeedValue.Parent = SpeedSlider

local SpeedBar = Instance.new("TextBox")
SpeedBar.Name = "SpeedBar"
SpeedBar.Size = UDim2.new(0.65, 0, 0, 5)
SpeedBar.Position = UDim2.new(0, 0, 0.5, -2.5)
SpeedBar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
SpeedBar.BorderSizePixel = 0
SpeedBar.Font = Enum.Font.GothamMedium
SpeedBar.Text = ""
SpeedBar.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBar.TextSize = 14
SpeedBar.Parent = SpeedSlider

local SpeedFill = Instance.new("Frame")
SpeedFill.Name = "SpeedFill"
SpeedFill.Size = UDim2.new(0.5, 0, 1, 0)
SpeedFill.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
SpeedFill.BorderSizePixel = 0
SpeedFill.Parent = SpeedBar

local SpeedHandle = Instance.new("TextButton")
SpeedHandle.Name = "SpeedHandle"
SpeedHandle.Size = UDim2.new(0, 15, 0, 15)
SpeedHandle.Position = UDim2.new(0.5, -7.5, 0.5, -7.5)
SpeedHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpeedHandle.BorderSizePixel = 0
SpeedHandle.Text = ""
SpeedHandle.Parent = SpeedSlider

-- Functionality for speed slider
local currentlyDraggingSpeed = false
local maxSpeed = 50

local function updateSpeed()
    local percentage = SpeedFill.Size.X.Scale
    local speedValue = math.floor(percentage * maxSpeed)
    SpeedValue.Text = tostring(speedValue)
    
    -- Set the player's speed
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.WalkSpeed = speedValue
    end
end

SpeedHandle.MouseButton1Down:Connect(function()
    currentlyDraggingSpeed = true
end)

UserInputService.InputChanged:Connect(function(input)
    if currentlyDraggingSpeed and input.UserInputType == Enum.UserInputType.MouseMovement then
        local sliderPos = input.Position.X - SpeedBar.AbsolutePosition.X
        local percentage = math.clamp(sliderPos / SpeedBar.AbsoluteSize.X, 0, 1)
        SpeedFill.Size = UDim2.new(percentage, 0, 1, 0)
        SpeedHandle.Position = UDim2.new(percentage, -7.5, 0.5, -7.5)
        updateSpeed()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        currentlyDraggingSpeed = false
    end
end)

SpeedValue.FocusLost:Connect(function(enterPressed)
    local value = tonumber(SpeedValue.Text)
    if value then
        local percentage = math.clamp(value / maxSpeed, 0, 1)
        SpeedFill.Size = UDim2.new(percentage, 0, 1, 0)
        SpeedHandle.Position = UDim2.new(percentage, -7.5, 0.5, -7.5)
        updateSpeed()
    else
        SpeedValue.Text = "16"
        SpeedFill.Size = UDim2.new(0.5, 0, 1, 0)
        SpeedHandle.Position = UDim2.new(0.5, -7.5, 0.5, -7.5)
    end
end)

-- Jump power controller (similar to speed)
local JumpLabel = Instance.new("TextLabel")
JumpLabel.Name = "JumpLabel"
JumpLabel.Size = UDim2.new(1, 0, 0, 30)
JumpLabel.Position = UDim2.new(0, 0, 0, 100)
JumpLabel.BackgroundTransparency = 1
JumpLabel.Text = "Jump Power"
JumpLabel.Font = Enum.Font.GothamMedium
JumpLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
JumpLabel.TextSize = 14
JumpLabel.TextXAlignment = Enum.TextXAlignment.Left
JumpLabel.Parent = PlayerContent

local JumpSlider = Instance.new("Frame")
JumpSlider.Name = "JumpSlider"
JumpSlider.Size = UDim2.new(1, 0, 0, 30)
JumpSlider.Position = UDim2.new(0, 0, 0, 130)
JumpSlider.BackgroundTransparency = 1
JumpSlider.Parent = PlayerContent

local JumpValue = Instance.new("TextBox")
JumpValue.Name = "JumpValue"
JumpValue.Size = UDim2.new(0.3, 0, 1, 0)
JumpValue.Position = UDim2.new(0.7, 0, 0, 0)
JumpValue.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
JumpValue.BorderSizePixel = 0
JumpValue.Font = Enum.Font.GothamMedium
JumpValue.Text = "50"
JumpValue.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpValue.TextSize = 14
JumpValue.Parent = JumpSlider

local JumpBar = Instance.new("TextBox")
JumpBar.Name = "JumpBar"
JumpBar.Size = UDim2.new(0.65, 0, 0, 5)
JumpBar.Position = UDim2.new(0, 0, 0.5, -2.5)
JumpBar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
JumpBar.BorderSizePixel = 0
JumpBar.Font = Enum.Font.GothamMedium
JumpBar.Text = ""
JumpBar.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpBar.TextSize = 14
JumpBar.Parent = JumpSlider

local JumpFill = Instance.new("Frame")
JumpFill.Name = "JumpFill"
JumpFill.Size = UDim2.new(0.5, 0, 1, 0)
JumpFill.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
JumpFill.BorderSizePixel = 0
JumpFill.Parent = JumpBar

local JumpHandle = Instance.new("TextButton")
JumpHandle.Name = "JumpHandle"
JumpHandle.Size = UDim2.new(0, 15, 0, 15)
JumpHandle.Position = UDim2.new(0.5, -7.5, 0.5, -7.5)
JumpHandle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
JumpHandle.BorderSizePixel = 0
JumpHandle.Text = ""
JumpHandle.Parent = JumpSlider

-- Functionality for jump slider
local currentlyDraggingJump = false
local maxJump = 100

local function updateJump()
    local percentage = JumpFill.Size.X.Scale
    local jumpValue = math.floor(percentage * maxJump)
    JumpValue.Text = tostring(jumpValue)
    
    -- Set the player's jump power
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.JumpPower = jumpValue
    end
end

JumpHandle.MouseButton1Down:Connect(function()
    currentlyDraggingJump = true
end)

UserInputService.InputChanged:Connect(function(input)
    if currentlyDraggingJump and input.UserInputType == Enum.UserInputType.MouseMovement then
        local sliderPos = input.Position.X - JumpBar.AbsolutePosition.X
        local percentage = math.clamp(sliderPos / JumpBar.AbsoluteSize.X, 0, 1)
        JumpFill.Size = UDim2.new(percentage, 0, 1, 0)
        JumpHandle.Position = UDim2.new(percentage, -7.5, 0.5, -7.5)
        updateJump()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        currentlyDraggingJump = false
    end
end)

JumpValue.FocusLost:Connect(function(enterPressed)
    local value = tonumber(JumpValue.Text)
    if value then
        local percentage = math.clamp(value / maxJump, 0, 1)
        JumpFill.Size = UDim2.new(percentage, 0, 1, 0)
        JumpHandle.Position = UDim2.new(percentage, -7.5, 0.5, -7.5)
        updateJump()
    else
        JumpValue.Text = "50"
        JumpFill.Size = UDim2.new(0.5, 0, 1, 0)
        JumpHandle.Position = UDim2.new(0.5, -7.5, 0.5, -7.5)
    end
end)

-- Chat content
local ChatContent = Instance.new("Frame")
ChatContent.Name = "ChatContent"
ChatContent.Size = UDim2.new(1, 0, 1, 0)
ChatContent.BackgroundTransparency = 1
ChatContent.Visible = false
ChatContent.Parent = ContentFrame

local ChatLabel = Instance.new("TextLabel")
ChatLabel.Name = "ChatLabel"
ChatLabel.Size = UDim2.new(1, 0, 0, 30)
ChatLabel.Position = UDim2.new(0, 0, 0, 20)
ChatLabel.BackgroundTransparency = 1
ChatLabel.Text = "Quick Messages"
ChatLabel.Font = Enum.Font.GothamMedium
ChatLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
ChatLabel.TextSize = 14
ChatLabel.TextXAlignment = Enum.TextXAlignment.Left
ChatLabel.Parent = ChatContent

local QuickMessage1 = Instance.new("TextButton")
QuickMessage1.Name = "QuickMessage1"
QuickMessage1.Size = UDim2.new(1, 0, 0, 40)
QuickMessage1.Position = UDim2.new(0, 0, 0, 60)
QuickMessage1.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
QuickMessage1.BorderSizePixel = 0
QuickMessage1.Font = Enum.Font.GothamMedium
QuickMessage1.Text = "Hello everyone!"
QuickMessage1.TextColor3 = Color3.fromRGB(255, 255, 255)
QuickMessage1.TextSize = 14
QuickMessage1.Parent = ChatContent

local QuickMessage2 = Instance.new("TextButton")
QuickMessage2.Name = "QuickMessage2"
QuickMessage2.Size = UDim2.new(1, 0, 0, 40)
QuickMessage2.Position = UDim2.new(0, 0, 0, 110)
QuickMessage2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
QuickMessage2.BorderSizePixel = 0
QuickMessage2.Font = Enum.Font.GothamMedium
QuickMessage2.Text = "Need help with anything?"
QuickMessage2.TextColor3 = Color3.fromRGB(255, 255, 255)
QuickMessage2.TextSize = 14
QuickMessage2.Parent = ChatContent

local QuickMessage3 = Instance.new("TextButton")
QuickMessage3.Name = "QuickMessage3"
QuickMessage3.Size = UDim2.new(1, 0, 0, 40)
QuickMessage3.Position = UDim2.new(0, 0, 0, 160)
QuickMessage3.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
QuickMessage3.BorderSizePixel = 0
QuickMessage3.Font = Enum.Font.GothamMedium
QuickMessage3.Text = "Thanks for playing!"
QuickMessage3.TextColor3 = Color3.fromRGB(255, 255, 255)
QuickMessage3.TextSize = 14
QuickMessage3.Parent = ChatContent

local CustomMessage = Instance.new("Frame")
CustomMessage.Name = "CustomMessage"
CustomMessage.Size = UDim2.new(1, 0, 0, 90)
CustomMessage.Position = UDim2.new(0, 0, 0, 220)
CustomMessage.BackgroundTransparency = 1
CustomMessage.Parent = ChatContent

local MessageInput = Instance.new("TextBox")
MessageInput.Name = "MessageInput"
MessageInput.Size = UDim2.new(1, 0, 0, 40)
MessageInput.Position = UDim2.new(0, 0, 0, 0)
MessageInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MessageInput.BorderSizePixel = 0
MessageInput.Font = Enum.Font.GothamMedium
MessageInput.PlaceholderText = "Type custom message..."
MessageInput.Text = ""
MessageInput.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageInput.TextSize = 14
MessageInput.Parent = CustomMessage

local SendButton = Instance.new("TextButton")
SendButton.Name = "SendButton"
SendButton.Size = UDim2.new(1, 0, 0, 40)
SendButton.Position = UDim2.new(0, 0, 0, 50)
SendButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
SendButton.BorderSizePixel = 0
SendButton.Font = Enum.Font.GothamBold
SendButton.Text = "SEND MESSAGE"
SendButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SendButton.TextSize = 16
SendButton.Parent = CustomMessage

-- Chat functionality
local function sendChatMessage(message)
    if message and #message > 0 then
        game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer(message, "All")
    end
end

QuickMessage1.MouseButton1Click:Connect(function()
    sendChatMessage(QuickMessage1.Text)
end)

QuickMessage2.MouseButton1Click:Connect(function()
    sendChatMessage(QuickMessage2.Text)
end)

QuickMessage3.MouseButton1Click:Connect(function()
    sendChatMessage(QuickMessage3.Text)
end)

SendButton.MouseButton1Click:Connect(function()
    sendChatMessage(MessageInput.Text)
    MessageInput.Text = ""
end)

MessageInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        sendChatMessage(MessageInput.Text)
        MessageInput.Text = ""
    end
end)

-- Credits content
local CreditsContent = Instance.new("Frame")
CreditsContent.Name = "CreditsContent"
CreditsContent.Size = UDim2.new(1, 0, 1, 0)
CreditsContent.BackgroundTransparency = 1
CreditsContent.Visible = false
CreditsContent.Parent = ContentFrame

local CreditsLabel = Instance.new("TextLabel")
CreditsLabel.Name = "CreditsLabel"
CreditsLabel.Size = UDim2.new(1, 0, 0, 30)
CreditsLabel.Position = UDim2.new(0, 0, 0, 20)
CreditsLabel.BackgroundTransparency = 1
CreditsLabel.Text = "CREDITS"
CreditsLabel.Font = Enum.Font.GothamBold
CreditsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
CreditsLabel.TextSize = 18
CreditsLabel.TextXAlignment = Enum.TextXAlignment.Center
CreditsLabel.Parent = CreditsContent

local CreatorLabel = Instance.new("TextLabel")
CreatorLabel.Name = "CreatorLabel"
CreatorLabel.Size = UDim2.new(1, 0, 0, 60)
CreatorLabel.Position = UDim2.new(0, 0, 0, 70)
CreatorLabel.BackgroundTransparency = 1
CreatorLabel.Text = "Created by:"
CreatorLabel.Font = Enum.Font.GothamMedium
CreatorLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
CreatorLabel.TextSize = 16
CreatorLabel.TextXAlignment = Enum.TextXAlignment.Center
CreatorLabel.Parent = CreditsContent

local CreatorName = Instance.new("TextLabel")
CreatorName.Name = "CreatorName"
CreatorName.Size = UDim2.new(1, 0, 0, 40)
CreatorName.Position = UDim2.new(0, 0, 0, 130)
CreatorName.BackgroundTransparency = 1
CreatorName.Text = "GabrielBStar2"
CreatorName.Font = Enum.Font.GothamBold
CreatorName.TextColor3 = Color3.fromRGB(0, 120, 255)
CreatorName.TextSize = 20
CreatorName.TextXAlignment = Enum.TextXAlignment.Center
CreatorName.Parent = CreditsContent

-- Tab switching functionality
local function showTab(tabName)
    PlayerContent.Visible = tabName == "Player"
    ChatContent.Visible = tabName == "Chat"
    CreditsContent.Visible = tabName == "Credits"
    
    -- Update tab colors
    PlayerTab.BackgroundColor3 = tabName == "Player" and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(40, 40, 40)
    ChatTab.BackgroundColor3 = tabName == "Chat" and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(40, 40, 40)
    CreditsTab.BackgroundColor3 = tabName == "Credits" and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(40, 40, 40)
end

PlayerTab.MouseButton1Click:Connect(function()
    showTab("Player")
end)

ChatTab.MouseButton1Click:Connect(function()
    showTab("Chat")
end)

CreditsTab.MouseButton1Click:Connect(function()
    showTab("Credits")
end)

-- Initialize with Player tab visible
showTab("Player")