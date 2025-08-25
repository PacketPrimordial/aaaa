-- Load Ash-Libs GUI
local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/BloodLetters/Ash-Libs/refs/heads/main/source.lua"))()

GUI:CreateMain({
    Name = "Exodus | Brainrot Jenga Tower!",
    title = "Exodus GUI",
    ToggleUI = "K",
    Theme = {
        Background = Color3.fromRGB(25, 25, 35),
        Secondary = Color3.fromRGB(35, 35, 45),
        Accent = Color3.fromRGB(138, 43, 226),
        Text = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(180, 180, 180),
        Border = Color3.fromRGB(50, 50, 60),
        NavBackground = Color3.fromRGB(20, 20, 30)
    }
})

local main = GUI:CreateTab("Main", "home")
GUI:CreateSection({
    parent = main, 
    text = "Teleport Section"
})

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Player = game.Players.LocalPlayer
local teleportToggle = false
local targetPosition = Vector3.new(0.0.0)

local function tweenToPosition(position)
    if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        local HRP = Player.Character.HumanoidRootPart
        local tween = TweenService:Create(HRP, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {CFrame = CFrame.new(position)})
        tween:Play()
    end
end

-- Continuous teleport loop
RunService.RenderStepped:Connect(function()
    if teleportToggle then
        tweenToPosition(targetPosition)
    end
end)

GUI:CreateToggle({
    parent = main, 
    text = "Farm Toggle", 
    default = false, 
    callback = function(state)
        teleportToggle = state
    end
})
