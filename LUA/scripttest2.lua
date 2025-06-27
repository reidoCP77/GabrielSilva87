local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local CreditsButton = Instance.new("TextButton")
local CharacterButton = Instance.new("TextButton")
local CreditText = Instance.new("TextLabel")
local CharacterSection = Instance.new("Frame")
local SpeedSlider = Instance.new("TextBox")
local JumpHeightSlider = Instance.new("TextBox")

-- Propriedades do ScreenGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Propriedades do MainFrame
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- Botão de Créditos
CreditsButton.Size = UDim2.new(0, 100, 0, 50)
CreditsButton.Position = UDim2.new(0, 10, 0, 10)
CreditsButton.Text = "Créditos"
CreditsButton.Parent = MainFrame

-- Botão de Personagem
CharacterButton.Size = UDim2.new(0, 100, 0, 50)
CharacterButton.Position = UDim2.new(0, 10, 0, 70)
CharacterButton.Text = "Personagem"
CharacterButton.Parent = MainFrame

-- Texto de Créditos
CreditText.Size = UDim2.new(0, 280, 0, 50)
CreditText.Position = UDim2.new(0, 10, 0, 130)
CreditText.Text = "Créditos: GabrielBStar2"
CreditText.TextColor3 = Color3.new(1, 1, 1)
CreditText.Parent = MainFrame

-- Seção de Personagem
CharacterSection.Size = UDim2.new(0, 280, 0, 100)
CharacterSection.Position = UDim2.new(0, 10, 0, 200)
CharacterSection.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
CharacterSection.Parent = MainFrame

-- Slider de Velocidade
SpeedSlider.Size = UDim2.new(0, 250, 0, 30)
SpeedSlider.Position = UDim2.new(0, 15, 0, 5)
SpeedSlider.Text = "Velocidade"
SpeedSlider.Parent = CharacterSection

-- Slider de Altura do Pulo
JumpHeightSlider.Size = UDim2.new(0, 250, 0, 30)
JumpHeightSlider.Position = UDim2.new(0, 15, 0, 40)
JumpHeightSlider.Text = "Altura do Pulo"
JumpHeightSlider.Parent = CharacterSection

-- Função para escondendo/mostrando o GUI
local function toggleVisibility()
    MainFrame.Visible = not MainFrame.Visible
end

-- Fechando o GUI com a tecla "H"
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.H then
        toggleVisibility()
    end
end)

-- Configurar funções para ajustar a velocidade e altura do pulo
-- Adicione seu código aqui para manipular o personagem.