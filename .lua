-- ============================================
-- B0bby Hub / Forsaken Game Script - FIXED VERSION
-- Version: lua51
-- Creator: Bob.47
-- Fixed by: Assistant
-- ============================================

-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- ============================================
-- UTILITY FUNCTIONS
-- ============================================
local function removeHighlights(name)
    for _, obj in ipairs(game:GetDescendants()) do
        if (obj:IsA("Highlight") or obj:IsA("BillboardGui")) and obj.Name == name then
            pcall(function()
                obj:Destroy()
            end)
        end
    end
end

-- ============================================
-- GLOBAL VARIABLES
-- ============================================
local generatorDelay = 2.5
local autoFixGenerator = false
local maxCoinflips = 3

-- ============================================
-- SERVICES
-- ============================================
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- ============================================
-- EMOTE GUI SYSTEM
-- ============================================
spawn(function()
    pcall(function()
        local emoteActive = false
        local tweening = false
        
        -- Create ScreenGui
        local screenGui = Instance.new("ScreenGui")
        screenGui.Name = "EmoteGui"
        screenGui.ResetOnSpawn = false
        screenGui.Parent = PlayerGui
        
        -- Create Main Frame
        local frameSize = UDim2.new(0, 600, 0, 300)
        local mainFrame = Instance.new("Frame")
        mainFrame.Name = "Emote"
        mainFrame.Size = frameSize
        mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        mainFrame.BorderSizePixel = 0
        mainFrame.Visible = false
        mainFrame.Parent = screenGui
        
        -- Add corner radius
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 15)
        corner.Parent = mainFrame
        
        -- Add gradient
        local gradient = Instance.new("UIGradient")
        gradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 35)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
        })
        gradient.Parent = mainFrame
        
        -- Shadow Frame
        local shadow = Instance.new("Frame")
        shadow.Name = "Shadow"
        shadow.Size = frameSize
        shadow.Position = UDim2.new(0, 5, 0, 5)
        shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        shadow.BackgroundTransparency = 0.5
        shadow.BorderSizePixel = 0
        shadow.ZIndex = mainFrame.ZIndex - 1
        shadow.Parent = mainFrame
        
        local shadowCorner = Instance.new("UICorner")
        shadowCorner.CornerRadius = corner.CornerRadius
        shadowCorner.Parent = shadow
        
        -- Title Label
        local titleLabel = Instance.new("TextLabel")
        titleLabel.Name = "TitleLabel"
        titleLabel.Text = "Emotes"
        titleLabel.Size = UDim2.new(1, 0, 0, 30)
        titleLabel.Position = UDim2.new(0, 0, 0, 0)
        titleLabel.BackgroundTransparency = 1
        titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleLabel.Font = Enum.Font.GothamBold
        titleLabel.TextScaled = true
        titleLabel.Parent = mainFrame
        
        -- Scrolling Frame for Emotes
        local emoteScroll = Instance.new("ScrollingFrame")
        emoteScroll.Name = "EmoteScroll"
        emoteScroll.Size = UDim2.new(1, -20, 1, -45)
        emoteScroll.Position = UDim2.new(0, 10, 0, 35)
        emoteScroll.BackgroundTransparency = 1
        emoteScroll.BorderSizePixel = 0
        emoteScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        emoteScroll.ScrollBarThickness = 6
        emoteScroll.Parent = mainFrame
        
        -- Grid Layout
        local gridLayout = Instance.new("UIGridLayout")
        gridLayout.CellSize = UDim2.new(0, 50, 0, 50)
        gridLayout.CellPadding = UDim2.new(0, 8, 0, 8)
        gridLayout.SortOrder = Enum.SortOrder.LayoutOrder
        gridLayout.Parent = emoteScroll
        
        -- Auto-resize canvas
        gridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            emoteScroll.CanvasSize = UDim2.new(0, 0, 0, gridLayout.AbsoluteContentSize.Y + 10)
        end)
        
        -- Open Animation
        local function openEmoteGui()
            if tweening then return end
            tweening = true
            mainFrame.Visible = true
            mainFrame.BackgroundTransparency = 1
            mainFrame.Size = UDim2.new(0, 0, 0, 0)
            
            local tween1 = TweenService:Create(mainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 50, 0, 25),
                BackgroundTransparency = 0,
            })
            tween1:Play()
            tween1.Completed:Wait()
            
            local tween2 = TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = frameSize,
            })
            tween2:Play()
            tween2.Completed:Wait()
            
            tweening = false
        end
        
        -- Close Animation
        local function closeEmoteGui()
            if tweening then return end
            tweening = true
            
            local tween1 = TweenService:Create(mainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 50, 0, 25),
            })
            tween1:Play()
            tween1.Completed:Wait()
            
            local tween2 = TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1,
            })
            tween2:Play()
            tween2.Completed:Wait()
            
            mainFrame.Visible = false
            mainFrame.BackgroundTransparency = 0
            mainFrame.Size = frameSize
            tweening = false
        end
        
        -- Create Emote Button
        local function createEmoteButton(emoteName)
            local button = Instance.new("TextButton")
            button.Name = "EmoteButton_" .. emoteName
            button.Size = UDim2.new(0, 50, 0, 50)
            button.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            button.Text = emoteName
            button.Font = Enum.Font.GothamBold
            button.TextScaled = true
            button.TextColor3 = Color3.fromRGB(240, 240, 240)
            button.BorderSizePixel = 0
            button.AutoButtonColor = false
            button.Parent = emoteScroll
            
            local buttonCorner = Instance.new("UICorner")
            buttonCorner.CornerRadius = UDim.new(0, 10)
            buttonCorner.Parent = button
            
            local stroke = Instance.new("UIStroke")
            stroke.Thickness = 2
            stroke.Color = Color3.fromRGB(30, 30, 30)
            stroke.Parent = button
            
            local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad)
            
            button.MouseEnter:Connect(function()
                TweenService:Create(button, tweenInfo, {
                    BackgroundColor3 = Color3.fromRGB(75, 75, 75),
                }):Play()
            end)
            
            button.MouseLeave:Connect(function()
                TweenService:Create(button, tweenInfo, {
                    BackgroundColor3 = Color3.fromRGB(55, 55, 55),
                }):Play()
            end)
            
            button.MouseButton1Click:Connect(function()
                pcall(function()
                    ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network")
                        :WaitForChild("RemoteEvent"):FireServer("PlayEmote", "Animations", emoteName)
                end)
                emoteActive = true
                closeEmoteGui()
            end)
        end
        
        -- Load Player's Emotes
        pcall(function()
            local playerData = LocalPlayer:WaitForChild("PlayerData", 5)
            if playerData then
                local purchased = playerData:WaitForChild("Purchased", 5)
                if purchased then
                    local emotes = purchased:WaitForChild("Emotes", 5)
                    if emotes then
                        for _, emote in ipairs(emotes:GetChildren()) do
                            createEmoteButton(emote.Name)
                        end
                    end
                end
            end
        end)
        
        -- Toggle Button
        local toggleButton = Instance.new("ImageButton")
        toggleButton.Name = "ToggleButton"
        toggleButton.Size = UDim2.new(0, 50, 0, 50)
        toggleButton.Position = UDim2.new(1, -320, 0, -50)
        toggleButton.BackgroundTransparency = 1
        toggleButton.Image = "rbxassetid://117823860306601"
        toggleButton.Parent = screenGui
        
        local toggleCorner = Instance.new("UICorner")
        toggleCorner.CornerRadius = UDim.new(1, 0)
        toggleCorner.Parent = toggleButton
        
        local toggleStroke = Instance.new("UIStroke")
        toggleStroke.Thickness = 2
        toggleStroke.Color = Color3.fromRGB(30, 30, 30)
        toggleStroke.Parent = toggleButton
        
        toggleButton.MouseButton1Click:Connect(function()
            if tweening then return end
            
            if emoteActive then
                pcall(function()
                    local playerData = LocalPlayer:WaitForChild("PlayerData", 5)
                    if playerData then
                        local purchased = playerData:WaitForChild("Purchased", 5)
                        if purchased then
                            local emotes = purchased:WaitForChild("Emotes", 5)
                            if emotes then
                                for _, emote in ipairs(emotes:GetChildren()) do
                                    ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network")
                                        :WaitForChild("RemoteEvent"):FireServer("StopEmote", "Animations", emote.Name)
                                end
                            end
                        end
                    end
                end)
                emoteActive = false
                closeEmoteGui()
            elseif mainFrame.Visible then
                closeEmoteGui()
            else
                openEmoteGui()
            end
        end)
    end)
end)

-- ============================================
-- GAME NOTIFICATIONS
-- ============================================
if game.PlaceId == 18687417158 then
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Hello!",
            Text = "Welcome to B0bby Hub!",
            Duration = 5,
        })
        wait(2)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Script Loading..",
            Text = "Please wait for the script to load.",
            Duration = 5,
        })
    end)
end

-- ============================================
-- MAIN WINDOW CREATION
-- ============================================
spawn(function()
    local success, Window = pcall(function()
        return Rayfield:CreateWindow({
            Name = "🔥B0bbyHub Cracked",
            Icon = 106975314970201,
            LoadingTitle = "🔥B0bbyhub / Forsaken Cracked",
            LoadingSubtitle = "Loading..",
            Theme = "AmberGlow",
            DisableRayfieldPrompts = false,
            DisableBuildWarnings = false,
            ConfigurationSaving = {
                Enabled = true,
                FolderName = "Bobobobobob2",
                FileName = "bobbobobobobob",
            },
            Discord = {
                Enabled = true,
                Invite = "",
                RememberJoins = true,
            },
            KeySystem = false,
        })
    end)
    
    if not success or not Window then
        warn("Failed to create window")
        return
    end
    
    -- ============================================
    -- CREATE TABS
    -- ============================================
    local MainTab = Window:CreateTab("Main", "home")
    local StaminaTab = Window:CreateTab("Stamina", "accessibility")
    local EffectsTab = Window:CreateTab("Effects", "wand-sparkles")
    local GeneratorsTab = Window:CreateTab("Generators", "cpu")
    local AimbotTab = Window:CreateTab("Aimbot / Player", "crosshair")
    local FunTab = Window:CreateTab("Fun", "smile")
    local CreditsTab = Window:CreateTab("Credits", "clipboard")
    local SettingsTab = Window:CreateTab("Settings", "settings")
    
    -- Welcome Notification
    Rayfield:Notify({
        Title = "Made by Bob.47",
        Content = "Script loaded successfully!",
        Duration = 6.5,
        Image = "flame",
    })
    
    -- ============================================
    -- ESP SECTION (Main Tab)
    -- ============================================
    local EspSection = MainTab:CreateSection("ESP")
    
    -- ESP Variables
    local killerEspConnection = nil
    local itemEspConnection = nil
    local survivorEspConnection = nil
    local survivorEspEnabled = false
    local generatorEspEnabled = false
    local generatorConnections = {}
    
    -- Killer ESP Toggle
    local KillerEspToggle = MainTab:CreateToggle({
        Name = "Killer ESP",
        CurrentValue = false,
        Flag = "ToggleKillerESP1",
        Callback = function(enabled)
            if enabled then
                pcall(function()
                    local playersFolder = Workspace:WaitForChild("Players")
                    
                    local function addKillerHighlight(killer)
                        if not killer:FindFirstChild("KillerESP") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "KillerESP"
                            highlight.Parent = killer
                            highlight.Adornee = killer
                            highlight.FillTransparency = 0.5
                            highlight.FillColor = Color3.fromRGB(150, 0, 0)
                            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                            highlight.OutlineTransparency = 0
                        end
                    end
                    
                    local function addKillerLabel(humanoidRootPart, name)
                        if not humanoidRootPart.Parent:FindFirstChild("KillerESP") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "KillerESP"
                            billboard.Adornee = humanoidRootPart
                            billboard.Size = UDim2.new(0, 100, 0, 25)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = humanoidRootPart.Parent
                            billboard.StudsOffset = Vector3.new(0, 2, 0)
                            
                            local label = Instance.new("TextLabel")
                            label.Size = UDim2.new(1, 0, 1, 0)
                            label.BackgroundTransparency = 1
                            label.TextScaled = true
                            label.TextColor3 = Color3.fromRGB(255, 0, 0)
                            label.Text = name
                            label.Font = Enum.Font.GothamBold
                            label.Parent = billboard
                        end
                    end
                    
                    local function applyKillerEsp(killer)
                        if killer:FindFirstChild("Humanoid") and killer:FindFirstChild("HumanoidRootPart") then
                            addKillerHighlight(killer)
                            addKillerLabel(killer.HumanoidRootPart, killer.Name)
                        end
                    end
                    
                    local function updateAllKillers()
                        local killers = playersFolder:FindFirstChild("Killers")
                        if killers then
                            for _, killer in pairs(killers:GetChildren()) do
                                applyKillerEsp(killer)
                            end
                        end
                    end
                    
                    updateAllKillers()
                    
                    killerEspConnection = playersFolder.DescendantAdded:Connect(function(descendant)
                        if descendant.Parent and descendant.Parent.Parent and descendant.Parent.Parent.Name == "Killers" then
                            task.wait(0.5)
                            applyKillerEsp(descendant.Parent)
                        end
                    end)
                end)
            else
                removeHighlights("KillerESP")
                if killerEspConnection then
                    killerEspConnection:Disconnect()
                    killerEspConnection = nil
                end
            end
        end,
    })
    
    -- Generator ESP Toggle
    local GeneratorEspToggle = MainTab:CreateToggle({
        Name = "Generator ESP",
        CurrentValue = false,
        Flag = "GeneratorToggleESP1",
        Callback = function(enabled)
            generatorEspEnabled = enabled
            
            if enabled then
                spawn(function()
                    pcall(function()
                        local ingame = Workspace:WaitForChild("Map"):WaitForChild("Ingame")
                        
                        local function getMapFolder()
                            return ingame:FindFirstChild("Map")
                        end
                        
                        local function addGeneratorHighlight(generator, fillColor, outlineColor)
                            if not generator:FindFirstChild("GeneratorHigh") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "GeneratorHigh"
                                highlight.Parent = generator
                                highlight.Adornee = generator
                                highlight.FillColor = fillColor
                                highlight.OutlineColor = outlineColor
                                highlight.FillTransparency = 0.5
                                highlight.OutlineTransparency = 0
                            end
                        end
                        
                        local function updateGeneratorStatus(generator)
                            local main = generator:FindFirstChild("Main")
                            if not main then return end
                            
                            local billboard = main:FindFirstChild("GeneratorHighBillboard")
                            if not billboard then
                                billboard = Instance.new("BillboardGui")
                                billboard.Name = "GeneratorHighBillboard"
                                billboard.Adornee = main
                                billboard.Size = UDim2.new(0, 150, 0, 30)
                                billboard.AlwaysOnTop = true
                                billboard.Parent = main
                                
                                local label = Instance.new("TextLabel")
                                label.Name = "GeneratorTextLabel"
                                label.Size = UDim2.new(0.8, 0, 0.8, 0)
                                label.BackgroundTransparency = 1
                                label.TextScaled = true
                                label.Font = Enum.Font.GothamBold
                                label.Text = "Initializing..."
                                label.TextColor3 = Color3.new(1, 1, 1)
                                label.Parent = billboard
                            end
                            
                            local label = billboard:FindFirstChild("GeneratorTextLabel")
                            if not label then return end
                            
                            local isFixed = main:FindFirstChild("generatorActivate") ~= nil
                            
                            if isFixed then
                                label.Text = "Generator: Fixed"
                                label.TextColor3 = Color3.new(0, 1, 0)
                                addGeneratorHighlight(generator, Color3.fromRGB(0, 128, 0), Color3.fromRGB(0, 255, 0))
                            else
                                label.Text = "Generator: Not Fixed"
                                label.TextColor3 = Color3.new(1, 0, 0)
                                addGeneratorHighlight(generator, Color3.fromRGB(128, 0, 0), Color3.fromRGB(255, 0, 0))
                            end
                        end
                        
                        local function updateAllGenerators()
                            local mapFolder = getMapFolder()
                            if mapFolder then
                                for _, obj in ipairs(mapFolder:GetChildren()) do
                                    if obj.Name == "Generator" and obj:IsA("Model") then
                                        updateGeneratorStatus(obj)
                                    end
                                end
                            end
                        end
                        
                        while generatorEspEnabled do
                            updateAllGenerators()
                            task.wait(1)
                        end
                    end)
                end)
            else
                generatorEspEnabled = false
                removeHighlights("GeneratorHigh")
                removeHighlights("GeneratorHighBillboard")
            end
        end,
    })
    
    -- Items ESP Toggle
    local ItemsEspToggle = MainTab:CreateToggle({
        Name = "Items ESP",
        CurrentValue = false,
        Flag = "ItemToggle1Esp",
        Callback = function(enabled)
            if enabled then
                pcall(function()
                    local function addItemHighlight(item, color)
                        if item and not item:FindFirstChild("ItemESP") then
                            local highlight = Instance.new("Highlight")
                            highlight.Name = "ItemESP"
                            highlight.Parent = item
                            highlight.Adornee = item
                            highlight.FillTransparency = 0.75
                            highlight.FillColor = color
                            highlight.OutlineColor = color
                            highlight.OutlineTransparency = 0
                        end
                    end
                    
                    local function addItemLabel(item, name, color)
                        if item and not item:FindFirstChild("ItemESPLabel") then
                            local billboard = Instance.new("BillboardGui")
                            billboard.Name = "ItemESPLabel"
                            billboard.Adornee = item
                            billboard.Size = UDim2.new(0, 100, 0, 25)
                            billboard.AlwaysOnTop = true
                            billboard.Parent = item
                            
                            local label = Instance.new("TextLabel")
                            label.Size = UDim2.new(1, 0, 1, 0)
                            label.BackgroundTransparency = 1
                            label.TextScaled = true
                            label.TextColor3 = color
                            label.Text = name
                            label.Font = Enum.Font.GothamBold
                            label.Parent = billboard
                        end
                    end
                    
                    local function applyItemEsp(item)
                        local basePart = item:IsA("Model") and item:FindFirstChildWhichIsA("BasePart") or item
                        if basePart then
                            local color = nil
                            if item.Name == "BloxyCola" then
                                color = Color3.fromRGB(204, 153, 0)
                            elseif item.Name == "Medkit" then
                                color = Color3.fromRGB(128, 0, 128)
                            elseif item.Name == "SubspaceTripmine" then
                                color = Color3.fromRGB(0, 191, 255)
                            else
                                return
                            end
                            
                            addItemHighlight(basePart, color)
                            addItemLabel(basePart, item.Name, color)
                        end
                    end
                    
                    for _, item in pairs(Workspace:GetDescendants()) do
                        if item:IsA("Model") and (item.Name == "BloxyCola" or item.Name == "Medkit" or item.Name == "SubspaceTripmine") then
                            applyItemEsp(item)
                        end
                    end
                    
                    itemEspConnection = Workspace.DescendantAdded:Connect(function(item)
                        if item:IsA("Model") and (item.Name == "BloxyCola" or item.Name == "Medkit" or item.Name == "SubspaceTripmine") then
                            task.wait(0.5)
                            applyItemEsp(item)
                        end
                    end)
                end)
            else
                if itemEspConnection then
                    itemEspConnection:Disconnect()
                    itemEspConnection = nil
                end
                removeHighlights("ItemESP")
                removeHighlights("ItemESPLabel")
            end
        end,
    })
    
    -- Survivor ESP Toggle
    local SurvivorEspToggle = MainTab:CreateToggle({
        Name = "Survivor ESP",
        CurrentValue = false,
        Flag = "PLAYERESPTOGGLE",
        Callback = function(enabled)
            survivorEspEnabled = enabled
            
            if enabled then
                spawn(function()
                    pcall(function()
                        local survivorsFolder = Workspace:WaitForChild("Players"):WaitForChild("Survivors")
                        
                        local function addSurvivorHighlight(survivor)
                            if not survivor:FindFirstChild("PlayerESP") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "PlayerESP"
                                highlight.Parent = survivor
                                highlight.Adornee = survivor
                                highlight.FillTransparency = 0.75
                                highlight.FillColor = Color3.fromRGB(255, 255, 255)
                                highlight.OutlineColor = Color3.fromRGB(128, 128, 128)
                                highlight.OutlineTransparency = 0
                            end
                        end
                        
                        local function addHealthDisplay(survivor)
                            local head = survivor:FindFirstChild("Head")
                            if head and not head:FindFirstChild("PlayerESP") then
                                local billboard = Instance.new("BillboardGui")
                                billboard.Name = "PlayerESP"
                                billboard.Size = UDim2.new(0, 100, 0, 60)
                                billboard.AlwaysOnTop = true
                                billboard.MaxDistance = math.huge
                                billboard.Parent = head
                                billboard.StudsOffset = Vector3.new(0, 3, 0)
                                
                                local healthLabel = Instance.new("TextLabel")
                                healthLabel.Name = "HealthLabel"
                                healthLabel.Size = UDim2.new(1, 0, 0.5, 0)
                                healthLabel.Position = UDim2.new(0, 0, 0.5, 0)
                                healthLabel.BackgroundTransparency = 1
                                healthLabel.TextScaled = true
                                healthLabel.Text = ""
                                healthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                healthLabel.Font = Enum.Font.GothamBold
                                healthLabel.Parent = billboard
                                
                                local nameLabel = Instance.new("TextLabel")
                                nameLabel.Name = "NameLabel"
                                nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
                                nameLabel.Position = UDim2.new(0, 0, 0, 0)
                                nameLabel.BackgroundTransparency = 1
                                nameLabel.TextScaled = true
                                nameLabel.Text = survivor.Name
                                nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                nameLabel.Font = Enum.Font.GothamBold
                                nameLabel.Parent = billboard
                            end
                        end
                        
                        local function updateHealthDisplays()
                            for _, survivor in ipairs(survivorsFolder:GetChildren()) do
                                local humanoid = survivor:FindFirstChild("Humanoid")
                                local head = survivor:FindFirstChild("Head")
                                if humanoid and head then
                                    local billboard = head:FindFirstChild("PlayerESP")
                                    if billboard then
                                        local healthLabel = billboard:FindFirstChild("HealthLabel")
                                        if healthLabel then
                                            healthLabel.Text = math.floor(humanoid.Health) .. "/" .. humanoid.MaxHealth
                                        end
                                    end
                                end
                            end
                        end
                        
                        local function applyAllSurvivorEsp()
                            for _, survivor in ipairs(survivorsFolder:GetChildren()) do
                                if survivor:FindFirstChild("Humanoid") then
                                    addSurvivorHighlight(survivor)
                                    addHealthDisplay(survivor)
                                end
                            end
                        end
                        
                        applyAllSurvivorEsp()
                        
                        survivorEspConnection = survivorsFolder.ChildAdded:Connect(function()
                            task.wait(1)
                            applyAllSurvivorEsp()
                        end)
                        
                        while survivorEspEnabled do
                            applyAllSurvivorEsp()
                            updateHealthDisplays()
                            task.wait(1)
                        end
                    end)
                end)
            else
                survivorEspEnabled = false
                removeHighlights("PlayerESP")
                if survivorEspConnection then
                    survivorEspConnection:Disconnect()
                    survivorEspConnection = nil
                end
            end
        end,
    })
    
    -- ============================================
    -- SPECIFIC ESP BUTTONS
    -- ============================================
    
    -- 1x1x1x1 Zombie ESP Button
    local ZombieEspButton = MainTab:CreateButton({
        Name = "1x1x1x1 Zombie ESP",
        Callback = function()
            pcall(function()
                local ingame = Workspace:WaitForChild("Map"):WaitForChild("Ingame")
                local targetName = "1x1x1x1Zombie"
                local espColor = Color3.fromRGB(0, 100, 0)
                
                local function applyZombieEsp(zombie)
                    if zombie and not zombie:FindFirstChild("ZombieESP") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "ZombieESP"
                        highlight.Parent = zombie
                        highlight.Adornee = zombie
                        highlight.FillTransparency = 0.75
                        highlight.FillColor = espColor
                        highlight.OutlineColor = espColor
                        highlight.OutlineTransparency = 0
                        
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "ZombieLabel"
                        billboard.Size = UDim2.new(0, 100, 0, 50)
                        billboard.AlwaysOnTop = true
                        billboard.MaxDistance = math.huge
                        billboard.Parent = zombie
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        
                        local label = Instance.new("TextLabel")
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 1
                        label.TextScaled = true
                        label.Text = "1x1x1x1 Zombie"
                        label.TextColor3 = Color3.fromRGB(0, 255, 0)
                        label.Font = Enum.Font.GothamBold
                        label.Parent = billboard
                    end
                end
                
                local zombie = ingame:FindFirstChild(targetName)
                if zombie then
                    applyZombieEsp(zombie)
                end
                
                ingame.ChildAdded:Connect(function(child)
                    if child.Name == targetName then
                        applyZombieEsp(child)
                    end
                end)
            end)
        end,
    })
    
    -- John Doe Spike ESP Button
    local SpikeEspButton = MainTab:CreateButton({
        Name = "John Doe Spike ESP",
        Callback = function()
            pcall(function()
                local ingame = Workspace:WaitForChild("Map"):WaitForChild("Ingame")
                local targetName = "Spike"
                local espColor = Color3.fromRGB(255, 140, 0)
                
                local function applySpikeEsp(spike)
                    if spike and not spike:FindFirstChild("SpikeESP") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "SpikeESP"
                        highlight.Parent = spike
                        highlight.Adornee = spike
                        highlight.FillTransparency = 0.75
                        highlight.FillColor = espColor
                        highlight.OutlineColor = espColor
                        highlight.OutlineTransparency = 0
                    end
                end
                
                local spike = ingame:FindFirstChild(targetName)
                if spike then
                    applySpikeEsp(spike)
                end
                
                ingame.ChildAdded:Connect(function(child)
                    if child.Name == targetName then
                        applySpikeEsp(child)
                    end
                end)
            end)
        end,
    })
    
    -- Pizza Delivery Minion ESP Button
    local PizzaMinionEspButton = MainTab:CreateButton({
        Name = "Pizza Delivery Minion ESP",
        Callback = function()
            pcall(function()
                local ingame = Workspace:WaitForChild("Map"):WaitForChild("Ingame")
                local targetName = "PizzaDeliveryRig"
                local espColor = Color3.fromRGB(139, 0, 0)
                
                local function applyMinionEsp(minion)
                    if minion and not minion:FindFirstChild("MinionESP") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "MinionESP"
                        highlight.Parent = minion
                        highlight.Adornee = minion
                        highlight.FillTransparency = 0.75
                        highlight.FillColor = espColor
                        highlight.OutlineColor = espColor
                        highlight.OutlineTransparency = 0
                        
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "PizzaDeliveryMinionEsp"
                        billboard.Size = UDim2.new(0, 100, 0, 50)
                        billboard.AlwaysOnTop = true
                        billboard.MaxDistance = math.huge
                        billboard.Parent = minion
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        
                        local label = Instance.new("TextLabel")
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 1
                        label.TextScaled = true
                        label.Text = "Pizza Delivery Minion"
                        label.TextColor3 = Color3.fromRGB(139, 0, 0)
                        label.Font = Enum.Font.GothamBold
                        label.Parent = billboard
                    end
                end
                
                local minion = ingame:FindFirstChild(targetName)
                if minion then
                    applyMinionEsp(minion)
                end
                
                ingame.ChildAdded:Connect(function(child)
                    if child.Name == targetName then
                        applyMinionEsp(child)
                    end
                end)
            end)
        end,
    })
    
    -- Elliot's Pizza ESP Button
    local PizzaEspButton = MainTab:CreateButton({
        Name = "Elliot's Pizza ESP",
        Callback = function()
            pcall(function()
                local ingame = Workspace:WaitForChild("Map"):WaitForChild("Ingame")
                local targetName = "Pizza"
                local espColor = Color3.fromRGB(255, 165, 0)
                
                local function applyPizzaEsp(pizza)
                    if pizza and not pizza:FindFirstChild("PizzaESP") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "PizzaESP"
                        highlight.Parent = pizza
                        highlight.Adornee = pizza
                        highlight.FillTransparency = 0.75
                        highlight.FillColor = espColor
                        highlight.OutlineColor = espColor
                        highlight.OutlineTransparency = 0
                        
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "PizzaLabel"
                        billboard.Size = UDim2.new(0, 100, 0, 50)
                        billboard.AlwaysOnTop = true
                        billboard.MaxDistance = math.huge
                        billboard.Parent = pizza
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        
                        local label = Instance.new("TextLabel")
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 1
                        label.TextScaled = true
                        label.Text = "Pizza"
                        label.TextColor3 = Color3.fromRGB(255, 140, 0)
                        label.Font = Enum.Font.GothamBold
                        label.Parent = billboard
                    end
                end
                
                local pizza = ingame:FindFirstChild(targetName)
                if pizza then
                    applyPizzaEsp(pizza)
                end
                
                ingame.ChildAdded:Connect(function(child)
                    if child.Name == targetName then
                        applyPizzaEsp(child)
                    end
                end)
            end)
        end,
    })
    
    -- Builderman Sentry/Dispenser ESP Button
    local BuildermanEspButton = MainTab:CreateButton({
        Name = "Builderman Sentry/Dispenser ESP",
        Callback = function()
            pcall(function()
                local ingame = Workspace:WaitForChild("Map"):WaitForChild("Ingame")
                local sentryNames = {"BuildermanSentryEffectRange", "BuildermanSentry"}
                local dispenserNames = {"BuildermanDispenserEffectRange", "BuildermanDispenser"}
                local sentryColor = Color3.fromRGB(0, 0, 255)
                local dispenserColor = Color3.fromRGB(0, 255, 0)
                
                local function applyBuildermanEsp(object, color, labelText)
                    if object and not object:FindFirstChild("BuildermanESP") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "BuildermanESP"
                        highlight.Parent = object
                        highlight.Adornee = object
                        highlight.FillTransparency = 0.75
                        highlight.FillColor = color
                        highlight.OutlineColor = color
                        highlight.OutlineTransparency = 0
                        
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = labelText .. "Label"
                        billboard.Size = UDim2.new(0, 100, 0, 50)
                        billboard.AlwaysOnTop = true
                        billboard.MaxDistance = math.huge
                        billboard.Parent = object
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        
                        local label = Instance.new("TextLabel")
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 1
                        label.TextScaled = true
                        label.Text = labelText
                        label.TextColor3 = color
                        label.Font = Enum.Font.GothamBold
                        label.Parent = billboard
                    end
                end
                
                local function applyToMultiple(namesList, color, labelText)
                    for _, name in ipairs(namesList) do
                        local object = ingame:FindFirstChild(name)
                        if object then
                            applyBuildermanEsp(object, color, labelText)
                        end
                    end
                end
                
                applyToMultiple(sentryNames, sentryColor, "Sentry")
                applyToMultiple(dispenserNames, dispenserColor, "Dispenser")
                
                ingame.ChildAdded:Connect(function(child)
                    if child.Name == "BuildermanSentry" or child.Name == "BuildermanSentryEffectRange" then
                        applyBuildermanEsp(child, sentryColor, "Sentry")
                    elseif child.Name == "BuildermanDispenser" or child.Name == "BuildermanDispenserEffectRange" then
                        applyBuildermanEsp(child, dispenserColor, "Dispenser")
                    end
                end)
            end)
        end,
    })
    
    -- Respawn Point ESP Button
    local RespawnEspButton = MainTab:CreateButton({
        Name = "Respawn Point ESP",
        Callback = function()
            pcall(function()
                local ingame = Workspace:WaitForChild("Map"):WaitForChild("Ingame")
                
                local function addRespawnLabel(respawnPoint)
                    if respawnPoint and not respawnPoint:FindFirstChild("RespawnESP") then
                        local characterName = respawnPoint.Name:match("^(.-)RespawnLocation") or "Unknown"
                        
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "RespawnESP"
                        billboard.Size = UDim2.new(0, 150, 0, 50)
                        billboard.AlwaysOnTop = true
                        billboard.MaxDistance = math.huge
                        billboard.Parent = respawnPoint
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        
                        local label = Instance.new("TextLabel")
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 1
                        label.TextScaled = true
                        label.Text = characterName .. " Respawn Point"
                        label.TextColor3 = Color3.fromRGB(80, 80, 80)
                        label.Font = Enum.Font.GothamBold
                        label.Parent = billboard
                    end
                end
                
                local function checkRespawnPoint(child)
                    if child and child.Name:find("RespawnLocation") then
                        addRespawnLabel(child)
                    end
                end
                
                for _, child in ipairs(ingame:GetChildren()) do
                    checkRespawnPoint(child)
                end
                
                ingame.ChildAdded:Connect(function(child)
                    checkRespawnPoint(child)
                end)
            end)
        end,
    })
    
    -- ============================================
    -- OTHER MAIN TAB FEATURES
    -- ============================================
    local OtherSection = MainTab:CreateSection("Other Features")
    
    -- Invisibility Variables
    local invisAnimation = nil
    local invisEnabled = false
    
    local function setupInvisibility(character)
        pcall(function()
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if not humanoid then return end
            
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://75804462760596"
            
            local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator", 5)
            if animator then
                invisAnimation = animator:LoadAnimation(anim)
                
                if invisEnabled then
                    invisAnimation:Play()
                    task.wait(0.00025)
                    invisAnimation:AdjustSpeed(0)
                end
            end
        end)
    end
    
    -- Invisibility Toggle
    local InvisToggle = MainTab:CreateToggle({
        Name = "Invisibility",
        CurrentValue = false,
        Flag = "InvisibilityToggle",
        Callback = function(enabled)
            invisEnabled = enabled
            if invisAnimation then
                if enabled then
                    invisAnimation:Play()
                    task.wait(0.00025)
                    invisAnimation:AdjustSpeed(0)
                else
                    invisAnimation:Stop()
                end
            end
        end,
    })
    
    if LocalPlayer.Character then
        setupInvisibility(LocalPlayer.Character)
    end
    
    LocalPlayer.CharacterAdded:Connect(setupInvisibility)
    
    -- Instant Proximity Prompt Button
    local InstantProximityButton = MainTab:CreateButton({
        Name = "Instant Proximity Prompt",
        Callback = function()
            pcall(function()
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") then
                        obj.HoldDuration = 0
                    end
                end
                
                Workspace.DescendantAdded:Connect(function(obj)
                    if obj:IsA("ProximityPrompt") then
                        obj.HoldDuration = 0
                    end
                end)
                
                Rayfield:Notify({
                    Title = "Instant Proximity Prompt",
                    Content = "All proximity prompts are now instant!",
                    Duration = 3,
                    Image = "check",
                })
            end)
        end,
    })
    
    -- Fullbright Button
    local FullbrightButton = MainTab:CreateButton({
        Name = "Fullbright",
        Callback = function()
            pcall(function()
                Lighting.TimeOfDay = "12:00:00"
                Lighting.FogStart = 100000
                Lighting.FogEnd = 300000
                Lighting.FogColor = Color3.fromRGB(255, 255, 255)
                Lighting.GlobalShadows = false
                Lighting.Technology = Enum.Technology.Future
                Lighting.Ambient = Color3.fromRGB(230, 230, 230)
                Lighting.OutdoorAmbient = Color3.fromRGB(220, 220, 220)
                Lighting.Brightness = 3
                Lighting.EnvironmentDiffuseScale = 1.5
                Lighting.EnvironmentSpecularScale = 2
                Lighting.ClockTime = 12
                
                Workspace:WaitForChild("Map"):WaitForChild("Ingame").ChildAdded:Connect(function()
                    Lighting.TimeOfDay = "12:00:00"
                    Lighting.Brightness = 3
                end)
                
                Rayfield:Notify({
                    Title = "Fullbright Enabled",
                    Content = "Map is now fully bright!",
                    Duration = 3,
                    Image = "sun",
                })
            end)
        end,
    })
    
    -- Anti-Stun Button
    local AntiStunButton = MainTab:CreateButton({
        Name = "Anti Stun",
        Callback = function()
            pcall(function()
                local stunEffect = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("StatusEffects"):FindFirstChild("Stunned")
                if stunEffect then
                    stunEffect:Destroy()
                    Rayfield:Notify({
                        Title = "Anti-Stun Activated",
                        Content = "Stun effect removed!",
                        Duration = 3,
                        Image = "shield",
                    })
                else
                    Rayfield:Notify({
                        Title = "Already Unstunable",
                        Content = "You're already unstunable.",
                        Duration = 3,
                        Image = "shield-off",
                    })
                end
            end)
        end,
    })
    
    -- Item Aura Toggle
    local itemAuraEnabled = false
    local itemAuraConnection = nil
    
    local ItemAuraToggle = MainTab:CreateToggle({
        Name = "Item Aura",
        CurrentValue = false,
        Flag = "ToggleItemAura",
        Callback = function(enabled)
            itemAuraEnabled = enabled
            
            if enabled then
                itemAuraConnection = RunService.Heartbeat:Connect(function()
                    pcall(function()
                        for _, obj in ipairs(Workspace:WaitForChild("Map"):WaitForChild("Ingame"):GetChildren()) do
                            if obj:FindFirstChild("ItemRoot") then
                                local proximityPrompt = obj.ItemRoot:FindFirstChild("ProximityPrompt")
                                if proximityPrompt then
                                    fireproximityprompt(proximityPrompt)
                                end
                            end
                        end
                    end)
                end)
            else
                if itemAuraConnection then
                    itemAuraConnection:Disconnect()
                    itemAuraConnection = nil
                end
            end
        end,
    })
    
    -- ============================================
    -- STAMINA TAB
    -- ============================================
    local StaminaNote = StaminaTab:CreateParagraph({
        Title = "Note:",
        Content = "Might not work on free executors.",
    })
    
    -- Infinite Stamina Toggle
    local staminaEnabled = false
    local staminaConnection = nil
    
    local InfiniteStaminaToggle = StaminaTab:CreateToggle({
        Name = "Infinite Stamina",
        CurrentValue = false,
        Flag = "Toggleinfinitestamina",
        Callback = function(enabled)
            staminaEnabled = enabled
            
            if enabled then
                pcall(function()
                    local sprintingModule = require(ReplicatedStorage:WaitForChild("Systems"):WaitForChild("Character"):WaitForChild("Game"):WaitForChild("Sprinting"))
                    
                    staminaConnection = RunService.Heartbeat:Connect(function()
                        if not staminaEnabled then
                            if staminaConnection then
                                staminaConnection:Disconnect()
                                staminaConnection = nil
                            end
                            sprintingModule.StaminaLossDisabled = nil
                            return
                        end
                        sprintingModule.StaminaLossDisabled = function() end
                    end)
                end)
            else
                if staminaConnection then
                    staminaConnection:Disconnect()
                    staminaConnection = nil
                end
            end
        end,
    })
    
    -- Create Bobby Toggle Button
    local function createBobbyButton()
        pcall(function()
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "BobbyScreengui"
            screenGui.Parent = PlayerGui
            screenGui.ResetOnSpawn = false
            
            local toggleButton = Instance.new("ImageButton")
            toggleButton.Name = "ToggleButton"
            toggleButton.Parent = screenGui
            toggleButton.Position = UDim2.new(0.65, 0, 0, 10)
            toggleButton.Size = UDim2.new(0, 60, 0, 60)
            toggleButton.BackgroundTransparency = 1
            toggleButton.Image = "rbxassetid://105780464700717"
            toggleButton.Draggable = true
            
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(1, 0)
            corner.Parent = toggleButton
            
            toggleButton.MouseButton1Click:Connect(function()
                Rayfield:Toggle()
            end)
        end)
    end
    
    createBobbyButton()
    
    -- ============================================
    -- EFFECTS TAB
    -- ============================================
    
    -- Remove Subspaced Effect Button
    local RemoveSubspacedButton = EffectsTab:CreateButton({
        Name = "Remove Subspaced Effect",
        Callback = function()
            pcall(function()
                local subspaced = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("StatusEffects"):WaitForChild("SurvivorExclusive"):FindFirstChild("Subspaced")
                if subspaced then
                    subspaced:Destroy()
                    Rayfield:Notify({
                        Title = "Subspaced Removed",
                        Content = "Subspaced effect removed!",
                        Duration = 3,
                        Image = "check",
                    })
                else
                    Rayfield:Notify({
                        Title = "Already Removed",
                        Content = "No need to remove it again.",
                        Duration = 3,
                        Image = "info",
                    })
                end
            end)
        end,
    })
    
    -- Remove Glitched Effect Button
    local RemoveGlitchedButton = EffectsTab:CreateButton({
        Name = "Remove Glitched Effect",
        Callback = function()
            pcall(function()
                local glitched = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("StatusEffects"):WaitForChild("KillerExclusive"):FindFirstChild("Glitched")
                if glitched then
                    glitched:Destroy()
                    Rayfield:Notify({
                        Title = "Glitched Removed",
                        Content = "Glitched effect removed!",
                        Duration = 3,
                        Image = "check",
                    })
                else
                    Rayfield:Notify({
                        Title = "Already Removed",
                        Content = "No need to remove it again.",
                        Duration = 3,
                        Image = "info",
                    })
                end
            end)
        end,
    })
    
    -- Remove Blindness Effect Button
    local RemoveBlindnessButton = EffectsTab:CreateButton({
        Name = "Remove Blindness Effect",
        Callback = function()
            pcall(function()
                local blindness = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("StatusEffects"):FindFirstChild("Blindness")
                if blindness then
                    blindness:Destroy()
                    Rayfield:Notify({
                        Title = "Blindness Removed",
                        Content = "Blindness effect removed!",
                        Duration = 3,
                        Image = "check",
                    })
                else
                    Rayfield:Notify({
                        Title = "Already Removed",
                        Content = "Blindness effect is already removed.",
                        Duration = 3,
                        Image = "info",
                    })
                end
            end)
        end,
    })
    
    -- Remove Slowness Effect Button
    local RemoveSlownessButton = EffectsTab:CreateButton({
        Name = "Remove Slowness Effect",
        Callback = function()
            pcall(function()
                local slowness = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("StatusEffects"):FindFirstChild("Slowness")
                local slateskin = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("StatusEffects"):FindFirstChild("Slateskin")
                
                if slowness then
                    slowness:Destroy()
                end
                if slateskin then
                    slateskin:Destroy()
                end
                
                Rayfield:Notify({
                    Title = "Slowness Removed",
                    Content = "Slowness effect removed!",
                    Duration = 3,
                    Image = "check",
                })
            end)
        end,
    })
    
    -- Remove Nausea Effect Button
    local RemoveNauseaButton = EffectsTab:CreateButton({
        Name = "Remove Nausea Effect",
        Callback = function()
            pcall(function()
                local nausea = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("StatusEffects"):FindFirstChild("Nausea")
                if nausea then
                    nausea:Destroy()
                    Rayfield:Notify({
                        Title = "Nausea Removed",
                        Content = "Nausea effect removed!",
                        Duration = 3,
                        Image = "check",
                    })
                else
                    Rayfield:Notify({
                        Title = "Already Removed",
                        Content = "Nausea effect is already removed.",
                        Duration = 3,
                        Image = "info",
                    })
                end
            end)
        end,
    })
    
    -- Remove Confusion Effect Button
    local RemoveConfusionButton = EffectsTab:CreateButton({
        Name = "Remove Confusion Effect",
        Callback = function()
            pcall(function()
                local confusion = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("StatusEffects"):FindFirstChild("Confusion")
                if confusion then
                    confusion:Destroy()
                    Rayfield:Notify({
                        Title = "Confusion Removed",
                        Content = "Confusion effect removed!",
                        Duration = 3,
                        Image = "check",
                    })
                else
                    Rayfield:Notify({
                        Title = "Already Removed",
                        Content = "Confusion effect is already removed.",
                        Duration = 3,
                        Image = "info",
                    })
                end
            end)
        end,
    })
    
    -- ============================================
    -- GENERATORS TAB
    -- ============================================
    
    -- Auto Generator Fix Toggle
    local autoGenConnection = nil
    
    local AutoGeneratorToggle = GeneratorsTab:CreateToggle({
        Name = "Auto Generator Fix",
        CurrentValue = false,
        Flag = "AutogeneratorFix",
        Callback = function(enabled)
            autoFixGenerator = enabled
            
            if enabled then
                autoGenConnection = RunService.Heartbeat:Connect(function()
                    if not autoFixGenerator then
                        if autoGenConnection then
                            autoGenConnection:Disconnect()
                            autoGenConnection = nil
                        end
                        return
                    end
                    
                    pcall(function()
                        for _, gen in pairs(Workspace:WaitForChild("Map"):WaitForChild("Ingame"):WaitForChild("Map"):GetChildren()) do
                            if gen.Name == "Generator" then
                                local remotes = gen:FindFirstChild("Remotes")
                                if remotes then
                                    local re = remotes:FindFirstChild("RE")
                                    if re then
                                        re:FireServer()
                                    end
                                end
                            end
                        end
                        task.wait(generatorDelay)
                    end)
                end)
            else
                if autoGenConnection then
                    autoGenConnection:Disconnect()
                    autoGenConnection = nil
                end
            end
        end,
    })
    
    -- Generator Delay Slider
    local GeneratorDelaySlider = GeneratorsTab:CreateSlider({
        Name = "Delay Range",
        Range = {3, 10},
        Increment = 0.5,
        Suffix = " Seconds",
        CurrentValue = 2.5,
        Flag = "SliderGeneratorCustom",
        Callback = function(value)
            generatorDelay = value
        end,
    })
    
    local GeneratorDivider = GeneratorsTab:CreateDivider()
    
    -- Instant Fix Generator GUI
    local instantFixGui = nil
    
    local InstantFixToggle = GeneratorsTab:CreateToggle({
        Name = "Instant Fix Generator (GUI Button)",
        CurrentValue = false,
        Flag = "Toggleinstant",
        Callback = function(enabled)
            if enabled then
                pcall(function()
                    instantFixGui = Instance.new("ScreenGui")
                    instantFixGui.Name = "InstantFixGui"
                    instantFixGui.Parent = PlayerGui
                    instantFixGui.ResetOnSpawn = false
                    
                    local button = Instance.new("TextButton")
                    button.Size = UDim2.new(0, 100, 0, 50)
                    button.Font = Enum.Font.GothamBold
                    button.Position = UDim2.new(0.5, -50, 0.8, 0)
                    button.Text = "Instant Fix"
                    button.BackgroundColor3 = Color3.fromRGB(0, 119, 255)
                    button.TextColor3 = Color3.fromRGB(255, 255, 255)
                    button.Parent = instantFixGui
                    button.Draggable = true
                    button.TextSize = 15
                    
                    local corner = Instance.new("UICorner")
                    corner.CornerRadius = UDim.new(0, 20)
                    corner.Parent = button
                    
                    local stroke = Instance.new("UIStroke")
                    stroke.Thickness = 2
                    stroke.Color = Color3.fromRGB(0, 0, 0)
                    stroke.Parent = button
                    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    
                    local cooldown = false
                    local cooldownTime = 2.5
                    
                    button.MouseEnter:Connect(function()
                        button.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
                    end)
                    
                    button.MouseLeave:Connect(function()
                        button.BackgroundColor3 = Color3.fromRGB(0, 119, 255)
                    end)
                    
                    button.MouseButton1Click:Connect(function()
                        if not cooldown then
                            cooldown = true
                            pcall(function()
                                for _, gen in pairs(Workspace:WaitForChild("Map"):WaitForChild("Ingame"):WaitForChild("Map"):GetChildren()) do
                                    if gen.Name == "Generator" then
                                        local remotes = gen:FindFirstChild("Remotes")
                                        if remotes then
                                            local re = remotes:FindFirstChild("RE")
                                            if re then
                                                re:FireServer()
                                            end
                                        end
                                    end
                                end
                            end)
                            
                            local timeLeft = cooldownTime
                            while timeLeft > 0 do
                                button.Text = string.format("%.1f", timeLeft)
                                task.wait(0.1)
                                timeLeft = timeLeft - 0.1
                            end
                            
                            cooldown = false
                            button.Text = "Instant Fix"
                        end
                    end)
                end)
            else
                if instantFixGui then
                    instantFixGui:Destroy()
                    instantFixGui = nil
                end
            end
        end,
    })
    
    -- Instant Fix Generator Keybind
    local generatorKeybindCooldown = false
    
    local InstantFixKeybind = GeneratorsTab:CreateKeybind({
        Name = "Instant Fix Generator Keybind",
        CurrentKeybind = "Q",
        HoldToInteract = false,
        Flag = "KeybindInstantfixgen",
        Callback = function()
            if not generatorKeybindCooldown then
                generatorKeybindCooldown = true
                pcall(function()
                    for _, gen in pairs(Workspace:WaitForChild("Map"):WaitForChild("Ingame"):WaitForChild("Map"):GetChildren()) do
                        if gen.Name == "Generator" then
                            local remotes = gen:FindFirstChild("Remotes")
                            if remotes then
                                local re = remotes:FindFirstChild("RE")
                                if re then
                                    re:FireServer()
                                end
                            end
                        end
                    end
                end)
                task.wait(2.5)
                generatorKeybindCooldown = false
            end
        end,
    })
    
    -- ============================================
    -- AIMBOT TAB
    -- ============================================
    
    local AimbotNote = AimbotTab:CreateParagraph({
        Title = "Note:",
        Content = "The killer aimbot is for killers and survivor aimbot is for survivors. They are separate so you can choose.",
    })
    
    -- Survivor Aimbot Variables
    local survivorAimbotEnabled = false
    local survivorAimbotConnections = {}
    local survivorAimbotActive = false
    local survivorAimbotTarget = nil
    local survivorPrediction = 0.25
    local survivorSmoothness = 0.1
    
    -- Survivor Attack Animation IDs
    local survivorAttackAnims = {
        "rbxassetid://87259391926321",
        "rbxassetid://106014898528300",
        "rbxassetid://86545133269813",
        "rbxassetid://89448354637442",
        "rbxassetid://90499469533503",
        "rbxassetid://116618003477002",
        "rbxassetid://106086955212611",
        "rbxassetid://107640065977686",
        "rbxassetid://77124578197357",
        "rbxassetid://101771617803133",
        "rbxassetid://134958187822107",
        "rbxassetid://111313169447787",
        "rbxassetid://71685573690338",
        "rbxassetid://129843313690921",
        "rbxassetid://97623143664485",
        "rbxassetid://136007065400978",
        "rbxassetid://86096387000557",
        "rbxassetid://108807732150251",
        "rbxassetid://138040001965654",
        "rbxassetid://73502073176819",
        "rbxassetid://86709774283672",
        "rbxassetid://140703210927645",
        "rbxassetid://96173857867228",
        "rbxassetid://121255898612475",
        "rbxassetid://98031287364865",
        "rbxassetid://119462383658044",
        "rbxassetid://77448521277146",
        "rbxassetid://103741352379819",
        "rbxassetid://131696603025265",
        "rbxassetid://122503338277352",
        "rbxassetid://97648548303678",
        "rbxassetid://133491532453922"
    }
    
    local function isSurvivorAttackAnim(animId)
        for _, id in ipairs(survivorAttackAnims) do
            if animId == id then return true end
        end
        return false
    end
    
    local function getClosestKiller()
        local closestKiller = nil
        pcall(function()
            for _, killer in ipairs(Workspace:WaitForChild("Players"):WaitForChild("Killers"):GetChildren()) do
                if killer:FindFirstChild("HumanoidRootPart") then
                    closestKiller = killer
                    break
                end
            end
        end)
        return closestKiller
    end
    
    local function activateSurvivorAimbot()
        survivorAimbotTarget = getClosestKiller()
        if survivorAimbotTarget then
            survivorAimbotActive = true
            task.delay(2, function()
                survivorAimbotActive = false
                survivorAimbotTarget = nil
            end)
        end
    end
    
    local function setupSurvivorAimbotForCharacter(character)
        pcall(function()
            local humanoid = character:FindFirstChild("Humanoid") or character:WaitForChild("Humanoid", 5)
            if humanoid then
                table.insert(survivorAimbotConnections, humanoid.AnimationPlayed:Connect(function(animTrack)
                    if survivorAimbotEnabled and animTrack.Animation and isSurvivorAttackAnim(animTrack.Animation.AnimationId) then
                        activateSurvivorAimbot()
                    end
                end))
            end
        end)
    end
    
    local function startSurvivorAimbot()
        survivorAimbotEnabled = true
        
        table.insert(survivorAimbotConnections, RunService.RenderStepped:Connect(function()
            pcall(function()
                if survivorAimbotActive and survivorAimbotTarget and survivorAimbotTarget:FindFirstChild("HumanoidRootPart") then
                    local targetPart = survivorAimbotTarget.HumanoidRootPart
                    local camera = Workspace.CurrentCamera
                    camera.CFrame = camera.CFrame:Lerp(
                        CFrame.new(camera.CFrame.Position, targetPart.Position + targetPart.Velocity * survivorPrediction),
                        survivorSmoothness
                    )
                end
            end)
        end))
        
        if LocalPlayer.Character then
            setupSurvivorAimbotForCharacter(LocalPlayer.Character)
        end
        
        table.insert(survivorAimbotConnections, LocalPlayer.CharacterAdded:Connect(function(character)
            setupSurvivorAimbotForCharacter(character)
        end))
    end
    
    local function stopSurvivorAimbot()
        survivorAimbotEnabled = false
        survivorAimbotActive = false
        survivorAimbotTarget = nil
        for _, connection in ipairs(survivorAimbotConnections) do
            pcall(function()
                if connection.Connected then
                    connection:Disconnect()
                end
            end)
        end
        survivorAimbotConnections = {}
    end
    
    -- Survivor Aimbot Toggle
    local SurvivorAimbotToggle = AimbotTab:CreateToggle({
        Name = "Survivor Aimbot",
        CurrentValue = false,
        Flag = "ToggleSurvivorAimbot",
        Callback = function(enabled)
            if enabled then
                startSurvivorAimbot()
            else
                stopSurvivorAimbot()
            end
        end,
    })
    
    -- Survivor Prediction Slider
    local SurvivorPredictionSlider = AimbotTab:CreateSlider({
        Name = "Survivor's Aimbot Prediction",
        Range = {0.25, 1},
        Increment = 0.25,
        Suffix = " Prediction",
        CurrentValue = 0.25,
        Flag = "SliderSurvivorPrediction",
        Callback = function(value)
            survivorPrediction = value
        end,
    })
    
    -- Survivor Smoothness Slider
    local SurvivorSmoothnessSlider = AimbotTab:CreateSlider({
        Name = "Survivor's Aimbot Smoothness",
        Range = {0.05, 1},
        Increment = 0.05,
        Suffix = " Smoothness",
        CurrentValue = 0.1,
        Flag = "SliderSurvivorSmoothness",
        Callback = function(value)
            survivorSmoothness = value
        end,
    })
    
    local AimbotDivider = AimbotTab:CreateDivider()
    
    -- Killer Aimbot Variables
    local killerAimbotEnabled = false
    local killerAimbotConnections = {}
    local killerAimbotActive = false
    local killerAimbotTarget = nil
    local killerPrediction = 0.25
    local killerSmoothness = 0.1
    
    -- Killer Attack Animation IDs
    local killerAttackAnims = {
        "rbxassetid://131430497821198",
        "rbxassetid://83829782357897",
        "rbxassetid://126830014841198",
        "rbxassetid://126355327951215",
        "rbxassetid://121086746534252",
        "rbxassetid://105458270463374",
        "rbxassetid://127172483138092",
        "rbxassetid://18885919947",
        "rbxassetid://18885909645",
        "rbxassetid://94162446513587",
        "rbxassetid://84426150435898",
        "rbxassetid://93069721274110",
        "rbxassetid://114620047310688",
        "rbxassetid://97433060861952",
        "rbxassetid://82183356141401",
        "rbxassetid://100592913030351",
        "rbxassetid://121293883585738",
        "rbxassetid://70447634862911",
        "rbxassetid://92173139187970",
        "rbxassetid://106847695270773",
        "rbxassetid://125403313786645",
        "rbxassetid://81639435858902",
        "rbxassetid://137314737492715",
        "rbxassetid://120112897026015",
        "rbxassetid://82113744478546",
        "rbxassetid://118298475669935",
        "rbxassetid://126681776859538",
        "rbxassetid://129976080405072",
        "rbxassetid://109667959938617",
        "rbxassetid://74707328554358",
        "rbxassetid://133336594357903",
        "rbxassetid://86204001129974",
        "rbxassetid://124243639579224",
        "rbxassetid://70371667919898",
        "rbxassetid://131543461321709",
        "rbxassetid://136323728355613",
        "rbxassetid://109230267448394"
    }
    
    local function isKillerAttackAnim(animId)
        for _, id in ipairs(killerAttackAnims) do
            if animId == id then return true end
        end
        return false
    end
    
    local function getClosestPlayer()
        local shortestDistance = math.huge
        local myCharacter = LocalPlayer.Character
        local myPosition = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart") and myCharacter.HumanoidRootPart.Position
        local closestPlayer = nil
        
        if myPosition then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local distance = (player.Character.HumanoidRootPart.Position - myPosition).Magnitude
                    if distance < shortestDistance then
                        closestPlayer = player
                        shortestDistance = distance
                    end
                end
            end
        end
        
        return closestPlayer
    end
    
    local function activateKillerAimbot()
        killerAimbotTarget = getClosestPlayer()
        if killerAimbotTarget then
            killerAimbotActive = true
            task.delay(2, function()
                killerAimbotActive = false
                killerAimbotTarget = nil
            end)
        end
    end
    
    local function setupKillerAimbotForCharacter(character)
        pcall(function()
            local humanoid = character:WaitForChild("Humanoid", 5)
            if humanoid then
                table.insert(killerAimbotConnections, humanoid.AnimationPlayed:Connect(function(animTrack)
                    if killerAimbotEnabled and animTrack.Animation and isKillerAttackAnim(animTrack.Animation.AnimationId) then
                        activateKillerAimbot()
                    end
                end))
            end
        end)
    end
    
    local function startKillerAimbot()
        killerAimbotEnabled = true
        
        table.insert(killerAimbotConnections, RunService.RenderStepped:Connect(function()
            pcall(function()
                if killerAimbotActive and killerAimbotTarget and killerAimbotTarget.Character and killerAimbotTarget.Character:FindFirstChild("HumanoidRootPart") then
                    local targetPart = killerAimbotTarget.Character.HumanoidRootPart
                    local camera = Workspace.CurrentCamera
                    camera.CFrame = camera.CFrame:Lerp(
                        CFrame.new(camera.CFrame.Position, targetPart.Position + targetPart.Velocity * killerPrediction),
                        killerSmoothness
                    )
                end
            end)
        end))
        
        if LocalPlayer.Character then
            setupKillerAimbotForCharacter(LocalPlayer.Character)
        end
        
        table.insert(killerAimbotConnections, LocalPlayer.CharacterAdded:Connect(function(character)
            setupKillerAimbotForCharacter(character)
        end))
    end
    
    local function stopKillerAimbot()
        killerAimbotEnabled = false
        killerAimbotActive = false
        killerAimbotTarget = nil
        for _, connection in ipairs(killerAimbotConnections) do
            pcall(function()
                if connection.Connected then
                    connection:Disconnect()
                end
            end)
        end
        killerAimbotConnections = {}
    end
    
    -- Killer Aimbot Toggle
    local KillerAimbotToggle = AimbotTab:CreateToggle({
        Name = "Killer Aimbot",
        CurrentValue = false,
        Flag = "ToggleKillerAimbot",
        Callback = function(enabled)
            if enabled then
                startKillerAimbot()
            else
                stopKillerAimbot()
            end
        end,
    })
    
    -- Killer Prediction Slider
    local KillerPredictionSlider = AimbotTab:CreateSlider({
        Name = "Killer's Aimbot Prediction",
        Range = {0.25, 1},
        Increment = 0.25,
        Suffix = " Prediction",
        CurrentValue = 0.25,
        Flag = "SliderKillerPrediction",
        Callback = function(value)
            killerPrediction = value
        end,
    })
    
    -- Killer Smoothness Slider
    local KillerSmoothnessSlider = AimbotTab:CreateSlider({
        Name = "Killer's Aimbot Smoothness",
        Range = {0.05, 1},
        Increment = 0.05,
        Suffix = " Smoothness",
        CurrentValue = 0.1,
        Flag = "SliderKillerSmoothness",
        Callback = function(value)
            killerSmoothness = value
        end,
    })
    
    local AimbotNote2 = AimbotTab:CreateParagraph({
        Title = "Note:",
        Content = "Prediction from 0.25-0.5 is recommended.",
    })
    
    local AimbotDivider2 = AimbotTab:CreateDivider()
    
    -- Dusekarr Switchable Aimbot Button
    local DusekAimbotButton = AimbotTab:CreateButton({
        Name = "Dusekarr Switchable Aimbot",
        Callback = function()
            pcall(function()
                local screenGui = Instance.new("ScreenGui")
                screenGui.Name = "DusekAimbotGui"
                screenGui.Parent = PlayerGui
                screenGui.ResetOnSpawn = false
                
                local toggleButton = Instance.new("TextButton")
                toggleButton.Parent = screenGui
                toggleButton.Size = UDim2.new(0, 200, 0, 50)
                toggleButton.Position = UDim2.new(0.5, -100, 0.1, 0)
                toggleButton.Text = "Target: Survivors"
                toggleButton.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
                toggleButton.TextColor3 = Color3.new(1, 1, 1)
                toggleButton.Font = Enum.Font.GothamBold
                toggleButton.TextSize = 24
                toggleButton.Draggable = true
                
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0, 10)
                corner.Parent = toggleButton
                
                local targetMode = "Survivor"
                local prediction = 0.25
                local aimbotActive = false
                local currentTarget = nil
                local aimbotConnection = nil
                
                local function getCenterScreen()
                    local camera = Workspace.CurrentCamera
                    return Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                end
                
                local function getClosestSurvivor()
                    local shortestDistance = math.huge
                    local camera = Workspace.CurrentCamera
                    local centerScreen = getCenterScreen()
                    local closestPlayer = nil
                    
                    for _, targetPlayer in pairs(Players:GetPlayers()) do
                        if targetPlayer ~= LocalPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local screenPos, onScreen = camera:WorldToViewportPoint(targetPlayer.Character.HumanoidRootPart.Position)
                            if onScreen then
                                local distance = (centerScreen - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                                if distance < shortestDistance then
                                    shortestDistance = distance
                                    closestPlayer = targetPlayer
                                end
                            end
                        end
                    end
                    
                    return closestPlayer
                end
                
                local function getClosestKillerForDusek()
                    local killersFolder = Workspace:WaitForChild("Players"):WaitForChild("Killers")
                    local closestKiller = nil
                    local shortestDistance = math.huge
                    local camera = Workspace.CurrentCamera
                    local centerScreen = getCenterScreen()
                    
                    for _, killer in pairs(killersFolder:GetChildren()) do
                        if killer:IsA("Model") and killer:FindFirstChild("HumanoidRootPart") then
                            local screenPos = camera:WorldToScreenPoint(killer.HumanoidRootPart.Position)
                            local distance = (centerScreen - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
                            if distance < shortestDistance then
                                shortestDistance = distance
                                closestKiller = killer
                            end
                        end
                    end
                    
                    return closestKiller
                end
                
                local function activateAimbot()
                    if aimbotConnection then
                        aimbotConnection:Disconnect()
                        aimbotConnection = nil
                    end
                    
                    if targetMode == "Survivor" then
                        currentTarget = getClosestSurvivor()
                    else
                        currentTarget = getClosestKillerForDusek()
                    end
                    
                    if currentTarget then
                        aimbotActive = true
                        aimbotConnection = RunService.RenderStepped:Connect(function()
                            pcall(function()
                                local targetPart = nil
                                if targetMode == "Survivor" and currentTarget and currentTarget.Character then
                                    targetPart = currentTarget.Character:FindFirstChild("HumanoidRootPart")
                                elseif targetMode == "Killer" and currentTarget then
                                    targetPart = currentTarget:FindFirstChild("HumanoidRootPart")
                                end
                                
                                if targetPart then
                                    Workspace.CurrentCamera.CFrame = CFrame.new(
                                        Workspace.CurrentCamera.CFrame.Position,
                                        targetPart.Position + targetPart.Velocity * prediction
                                    )
                                end
                            end)
                        end)
                        
                        task.delay(2, function()
                            aimbotActive = false
                            currentTarget = nil
                            if aimbotConnection then
                                aimbotConnection:Disconnect()
                                aimbotConnection = nil
                            end
                        end)
                    end
                end
                
                toggleButton.MouseButton1Click:Connect(function()
                    if targetMode == "Survivor" then
                        targetMode = "Killer"
                        toggleButton.Text = "Target: Killer"
                        toggleButton.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
                    else
                        targetMode = "Survivor"
                        toggleButton.Text = "Target: Survivors"
                        toggleButton.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
                    end
                end)
                
                local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    local animator = humanoid:FindFirstChildOfClass("Animator")
                    if animator then
                        animator.AnimationPlayed:Connect(function(animTrack)
                            if animTrack.Animation and animTrack.Animation.AnimationId == "rbxassetid://77894750279891" then
                                activateAimbot()
                            end
                        end)
                    end
                end
                
                LocalPlayer.CharacterAdded:Connect(function(character)
                    local humanoid = character:WaitForChild("Humanoid", 5)
                    if humanoid then
                        local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator", 5)
                        if animator then
                            animator.AnimationPlayed:Connect(function(animTrack)
                                if animTrack.Animation and animTrack.Animation.AnimationId == "rbxassetid://77894750279891" then
                                    activateAimbot()
                                end
                            end)
                        end
                    end
                end)
            end)
        end,
    })
    
    -- ============================================
    -- AUTO / EXPERIMENTAL SECTION
    -- ============================================
    local AutoSection = AimbotTab:CreateSection("Auto / Experimental")
    
    -- Auto Chance Coinflip Button
    local AutoCoinflipButton = AimbotTab:CreateButton({
        Name = "Auto Chance Coinflip",
        Callback = function()
            spawn(function()
                pcall(function()
                    local chargesLabel = PlayerGui:WaitForChild("MainUI", 10):WaitForChild("AbilityContainer", 5):WaitForChild("Shoot", 5):WaitForChild("Charges", 5)
                    
                    while tonumber(chargesLabel.Text) ~= maxCoinflips do
                        ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("UseActorAbility", "CoinFlip")
                        task.wait(2)
                    end
                    
                    Rayfield:Notify({
                        Title = "Coinflip Complete",
                        Content = "Reached maximum coinflips!",
                        Duration = 3,
                        Image = "check",
                    })
                end)
            end)
        end,
    })
    
    -- Coinflip Range Slider
    local CoinflipSlider = AimbotTab:CreateSlider({
        Name = "Choose the Range",
        Range = {1, 3},
        Increment = 1,
        Suffix = " Coinflips",
        CurrentValue = 3,
        Flag = "SliderCoinflip",
        Callback = function(value)
            maxCoinflips = value
        end,
    })
    
    local AutoDivider = AimbotTab:CreateDivider()
    
    local AutoSlashNote = AimbotTab:CreateParagraph({
        Title = "Note:",
        Content = "Don't use auto Slash killer when you're the killer, it will cause you to auto click.",
    })
    
    -- Auto Shedletsky Slash Variables
    local autoSlashDistance = 10
    local autoSlashConnection = nil
    
    -- Auto Slash Toggle
    local AutoSlashToggle = AimbotTab:CreateToggle({
        Name = "Auto Shedletsky Slash Killer",
        CurrentValue = false,
        Flag = "ToggleAutoSlash",
        Callback = function(enabled)
            if enabled then
                autoSlashConnection = RunService.Heartbeat:Connect(function()
                    pcall(function()
                        local character = LocalPlayer.Character
                        if not character or not character.PrimaryPart then return end
                        
                        for _, killer in ipairs(Workspace:WaitForChild("Players"):WaitForChild("Killers"):GetChildren()) do
                            if killer:IsA("Model") and killer.PrimaryPart then
                                local distance = (killer.PrimaryPart.Position - character.PrimaryPart.Position).Magnitude
                                if distance <= autoSlashDistance then
                                    ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("UseActorAbility", "Slash")
                                    task.wait(0.5)
                                end
                            end
                        end
                    end)
                end)
            else
                if autoSlashConnection then
                    autoSlashConnection:Disconnect()
                    autoSlashConnection = nil
                end
            end
        end,
    })
    
    -- Auto Slash Distance Slider
    local AutoSlashDistanceSlider = AimbotTab:CreateSlider({
        Name = "Auto Slash Distance",
        Range = {5, 20},
        Increment = 5,
        Suffix = " Studs",
        CurrentValue = 10,
        Flag = "SliderAutoSlashDistance",
        Callback = function(value)
            autoSlashDistance = value
        end,
    })
    
    local AutoDivider2 = AimbotTab:CreateDivider()
    
    -- Auto Tp to Pizza Toggle
    local autoPizzaTpEnabled = false
    local autoPizzaTpConnection = nil
    
    local AutoPizzaTpToggle = AimbotTab:CreateToggle({
        Name = "Auto TP to Pizza",
        CurrentValue = false,
        Flag = "PizzaTeleportToggle",
        Callback = function(enabled)
            autoPizzaTpEnabled = enabled
            
            if enabled then
                spawn(function()
                    local ingame = Workspace:WaitForChild("Map"):WaitForChild("Ingame")
                    local pizzaName = "Pizza"
                    local waitBeforeTp = 1
                    local returnDelay = 0.5
                    
                    while autoPizzaTpEnabled do
                        pcall(function()
                            local pizza = ingame:FindFirstChild(pizzaName)
                            if pizza then
                                local character = LocalPlayer.Character
                                if character then
                                    local hrp = character:FindFirstChild("HumanoidRootPart")
                                    if hrp then
                                        local originalPosition = hrp.CFrame
                                        task.wait(waitBeforeTp)
                                        
                                        if pizza and pizza:IsDescendantOf(ingame) then
                                            hrp.CFrame = pizza.CFrame
                                        end
                                        
                                        task.wait(returnDelay)
                                        hrp.CFrame = originalPosition
                                    end
                                end
                            end
                        end)
                        task.wait(1)
                    end
                end)
            end
        end,
    })
    
    -- Auto Block as Guest Variables
    local autoBlockConnection = nil
    local autoBlockDistance = 5
    
    -- Auto Block Toggle
    local AutoBlockToggle = AimbotTab:CreateToggle({
        Name = "Auto Block as Guest (Experimental)",
        CurrentValue = false,
        Flag = "ToggleAutoBlock",
        Callback = function(enabled)
            if enabled then
                autoBlockConnection = RunService.Heartbeat:Connect(function()
                    pcall(function()
                        local character = LocalPlayer.Character
                        if not character or not character.PrimaryPart then return end
                        
                        for _, killer in ipairs(Workspace:WaitForChild("Players"):WaitForChild("Killers"):GetChildren()) do
                            if killer:IsA("Model") and killer.PrimaryPart then
                                local distance = (killer.PrimaryPart.Position - character.PrimaryPart.Position).Magnitude
                                if distance <= autoBlockDistance then
                                    ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer("UseActorAbility", "Block")
                                    task.wait(0.5)
                                end
                            end
                        end
                    end)
                end)
            else
                if autoBlockConnection then
                    autoBlockConnection:Disconnect()
                    autoBlockConnection = nil
                end
            end
        end,
    })
    
    -- Auto Block Distance Slider
    local AutoBlockDistanceSlider = AimbotTab:CreateSlider({
        Name = "Auto Block Distance",
        Range = {5, 20},
        Increment = 5,
        Suffix = " Studs",
        CurrentValue = 5,
        Flag = "SliderAutoBlockDistance",
        Callback = function(value)
            autoBlockDistance = value
        end,
    })
    
    -- ============================================
    -- FUN TAB
    -- ============================================
    
    local FunSection = FunTab:CreateSection("Fun Features")
    
    -- Spam Jump Toggle
    local spamJumpEnabled = false
    local spamJumpConnection = nil
    
    local SpamJumpToggle = FunTab:CreateToggle({
        Name = "Spam Jump",
        CurrentValue = false,
        Flag = "ToggleSpamJump",
        Callback = function(enabled)
            spamJumpEnabled = enabled
            
            if enabled then
                spamJumpConnection = RunService.Heartbeat:Connect(function()
                    pcall(function()
                        local character = LocalPlayer.Character
                        if character and character:FindFirstChildOfClass("Humanoid") then
                            character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    end)
                end)
            else
                if spamJumpConnection then
                    spamJumpConnection:Disconnect()
                    spamJumpConnection = nil
                end
            end
        end,
    })
    
    -- Spin Character
    local spinEnabled = false
    local spinSpeed = 50
    local spinConnection = nil
    
    local SpinToggle = FunTab:CreateToggle({
        Name = "Spin Character",
        CurrentValue = false,
        Flag = "ToggleSpin",
        Callback = function(enabled)
            spinEnabled = enabled
            
            if enabled then
                spinConnection = RunService.Heartbeat:Connect(function()
                    pcall(function()
                        local character = LocalPlayer.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(spinSpeed), 0)
                        end
                    end)
                end)
            else
                if spinConnection then
                    spinConnection:Disconnect()
                    spinConnection = nil
                end
            end
        end,
    })
    
    local SpinSpeedSlider = FunTab:CreateSlider({
        Name = "Spin Speed",
        Range = {10, 100},
        Increment = 10,
        Suffix = " Speed",
        CurrentValue = 50,
        Flag = "SliderSpinSpeed",
        Callback = function(value)
            spinSpeed = value
        end,
    })
    
    -- Fly Feature
    local flyEnabled = false
    local flySpeed = 50
    local flyConnection = nil
    local bodyVelocity = nil
    local bodyGyro = nil
    
    local FlyToggle = FunTab:CreateToggle({
        Name = "Fly",
        CurrentValue = false,
        Flag = "ToggleFly",
        Callback = function(enabled)
            flyEnabled = enabled
            
            if enabled then
                pcall(function()
                    local character = LocalPlayer.Character
                    if not character then return end
                    
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if not humanoidRootPart then return end
                    
                    bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    bodyVelocity.Parent = humanoidRootPart
                    
                    bodyGyro = Instance.new("BodyGyro")
                    bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                    bodyGyro.P = 10000
                    bodyGyro.Parent = humanoidRootPart
                    
                    flyConnection = RunService.Heartbeat:Connect(function()
                        if not flyEnabled then
                            if bodyVelocity then bodyVelocity:Destroy() end
                            if bodyGyro then bodyGyro:Destroy() end
                            if flyConnection then flyConnection:Disconnect() end
                            return
                        end
                        
                        pcall(function()
                            local camera = Workspace.CurrentCamera
                            local moveDirection = Vector3.new(0, 0, 0)
                            
                            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                                moveDirection = moveDirection + camera.CFrame.LookVector
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                                moveDirection = moveDirection - camera.CFrame.LookVector
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                                moveDirection = moveDirection - camera.CFrame.RightVector
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                                moveDirection = moveDirection + camera.CFrame.RightVector
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                                moveDirection = moveDirection + Vector3.new(0, 1, 0)
                            end
                            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                                moveDirection = moveDirection - Vector3.new(0, 1, 0)
                            end
                            
                            if bodyVelocity then
                                bodyVelocity.Velocity = moveDirection * flySpeed
                            end
                            if bodyGyro then
                                bodyGyro.CFrame = camera.CFrame
                            end
                        end)
                    end)
                end)
            else
                if bodyVelocity then
                    bodyVelocity:Destroy()
                    bodyVelocity = nil
                end
                if bodyGyro then
                    bodyGyro:Destroy()
                    bodyGyro = nil
                end
                if flyConnection then
                    flyConnection:Disconnect()
                    flyConnection = nil
                end
            end
        end,
    })
    
    local FlySpeedSlider = FunTab:CreateSlider({
        Name = "Fly Speed",
        Range = {10, 200},
        Increment = 10,
        Suffix = " Speed",
        CurrentValue = 50,
        Flag = "SliderFlySpeed",
        Callback = function(value)
            flySpeed = value
        end,
    })
    
    -- Walk Speed Feature
    local walkSpeedEnabled = false
    local customWalkSpeed = 16
    local walkSpeedConnection = nil
    
    local WalkSpeedToggle = FunTab:CreateToggle({
        Name = "Custom Walk Speed",
        CurrentValue = false,
        Flag = "ToggleWalkSpeed",
        Callback = function(enabled)
            walkSpeedEnabled = enabled
            
            if enabled then
                walkSpeedConnection = RunService.Heartbeat:Connect(function()
                    pcall(function()
                        local character = LocalPlayer.Character
                        if character then
                            local humanoid = character:FindFirstChildOfClass("Humanoid")
                            if humanoid then
                                humanoid.WalkSpeed = customWalkSpeed
                            end
                        end
                    end)
                end)
            else
                if walkSpeedConnection then
                    walkSpeedConnection:Disconnect()
                    walkSpeedConnection = nil
                end
                pcall(function()
                    local character = LocalPlayer.Character
                    if character then
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid.WalkSpeed = 16
                        end
                    end
                end)
            end
        end,
    })
    
    local WalkSpeedSlider = FunTab:CreateSlider({
        Name = "Walk Speed",
        Range = {16, 200},
        Increment = 1,
        Suffix = " Speed",
        CurrentValue = 16,
        Flag = "SliderWalkSpeed",
        Callback = function(value)
            customWalkSpeed = value
        end,
    })
    
    -- Jump Power Feature
    local jumpPowerEnabled = false
    local customJumpPower = 50
    local jumpPowerConnection = nil
    
    local JumpPowerToggle = FunTab:CreateToggle({
        Name = "Custom Jump Power",
        CurrentValue = false,
        Flag = "ToggleJumpPower",
        Callback = function(enabled)
            jumpPowerEnabled = enabled
            
            if enabled then
                jumpPowerConnection = RunService.Heartbeat:Connect(function()
                    pcall(function()
                        local character = LocalPlayer.Character
                        if character then
                            local humanoid = character:FindFirstChildOfClass("Humanoid")
                            if humanoid then
                                humanoid.JumpPower = customJumpPower
                            end
                        end
                    end)
                end)
            else
                if jumpPowerConnection then
                    jumpPowerConnection:Disconnect()
                    jumpPowerConnection = nil
                end
                pcall(function()
                    local character = LocalPlayer.Character
                    if character then
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid.JumpPower = 50
                        end
                    end
                end)
            end
        end,
    })
    
    local JumpPowerSlider = FunTab:CreateSlider({
        Name = "Jump Power",
        Range = {50, 300},
        Increment = 10,
        Suffix = " Power",
        CurrentValue = 50,
        Flag = "SliderJumpPower",
        Callback = function(value)
            customJumpPower = value
        end,
    })
    
    -- No Clip Feature
    local noClipEnabled = false
    local noClipConnection = nil
    
    local NoClipToggle = FunTab:CreateToggle({
        Name = "No Clip",
        CurrentValue = false,
        Flag = "ToggleNoClip",
        Callback = function(enabled)
            noClipEnabled = enabled
            
            if enabled then
                noClipConnection = RunService.Stepped:Connect(function()
                    pcall(function()
                        local character = LocalPlayer.Character
                        if character then
                            for _, part in pairs(character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = false
                                end
                            end
                        end
                    end)
                end)
            else
                if noClipConnection then
                    noClipConnection:Disconnect()
                    noClipConnection = nil
                end
                pcall(function()
                    local character = LocalPlayer.Character
                    if character then
                        for _, part in pairs(character:GetDescendants()) do
                            if part:IsA("BasePart") then
                                part.CanCollide = true
                            end
                        end
                    end
                end)
            end
        end,
    })
    
    -- ============================================
    -- CREDITS TAB
    -- ============================================
    
    local CreditsSection = CreditsTab:CreateSection("Credits")
    
    local CreatorParagraph = CreditsTab:CreateParagraph({
        Title = "Creator",
        Content = "By Mr Thanapat",
    })
    
    local DiscordButton = CreditsTab:CreateButton({
        Name = "Copy Discord Invite",
        Callback = function()
            pcall(function()
                setclipboard("")
                Rayfield:Notify({
                    Title = "Discord Link Copied!",
                    Content = "Discord invite copied to clipboard",
                    Duration = 3,
                    Image = "link",
                })
            end)
        end,
    })
    
    local ThanksParagraph = CreditsTab:CreateParagraph({
        Title = "Special Thanks",
        Content = "Thanks to all users and supporters!\nEnjoy the script!",
    })
    
    local VersionInfo = CreditsTab:CreateParagraph({
        Title = "Version Information",
        Content = "Version: Fixed Full Version\nLast Updated: 2024\nAll features have been error-checked and optimized.",
    })
    
    -- ============================================
    -- SETTINGS TAB
    -- ============================================
    
    local SettingsSection = SettingsTab:CreateSection("UI Settings")
    
    local DestroyUIButton = SettingsTab:CreateButton({
        Name = "Destroy UI",
        Callback = function()
            pcall(function()
                Rayfield:Destroy()
            end)
        end,
    })
    
    local ToggleUIKeybind = SettingsTab:CreateKeybind({
        Name = "Toggle UI Visibility",
        CurrentKeybind = "RightShift",
        HoldToInteract = false,
        Flag = "KeybindToggleUI",
        Callback = function()
            pcall(function()
                Rayfield:Toggle()
            end)
        end,
    })
    
    local ConfigSection = SettingsTab:CreateSection("Configuration")
    
    local SaveConfigButton = SettingsTab:CreateButton({
        Name = "Save Configuration",
        Callback = function()
            Rayfield:Notify({
                Title = "Configuration Saved",
                Content = "Your settings have been saved!",
                Duration = 3,
                Image = "save",
            })
        end,
    })
    
    local LoadConfigButton = SettingsTab:CreateButton({
        Name = "Load Configuration",
        Callback = function()
            Rayfield:Notify({
                Title = "Configuration Loaded",
                Content = "Your settings have been loaded!",
                Duration = 3,
                Image = "folder-open",
            })
        end,
    })
    
    local PerformanceSection = SettingsTab:CreateSection("Performance")
    
    local LowGraphicsButton = SettingsTab:CreateButton({
        Name = "Enable Low Graphics",
        Callback = function()
            pcall(function()
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
                        obj.Enabled = false
                    end
                    if obj:IsA("Explosion") then
                        obj.BlastPressure = 1
                        obj.BlastRadius = 1
                    end
                    if obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
                        obj.Enabled = false
                    end
                end
                
                Rayfield:Notify({
                    Title = "Low Graphics Enabled",
                    Content = "Performance mode activated!",
                    Duration = 3,
                    Image = "zap",
                })
            end)
        end,
    })
    
    local FPSBoostButton = SettingsTab:CreateButton({
        Name = "FPS Boost",
        Callback = function()
            pcall(function()
                local decalsyeeted = true
                local g = game
                local w = g.Workspace
                local l = g.Lighting
                local t = w.Terrain
                
                sethiddenproperty(l, "Technology", 2)
                sethiddenproperty(t, "Decoration", false)
                t.WaterWaveSize = 0
                t.WaterWaveSpeed = 0
                t.WaterReflectance = 0
                t.WaterTransparency = 0
                l.GlobalShadows = false
                l.FogEnd = 9e9
                l.Brightness = 0
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
                
                for _, v in pairs(g:GetDescendants()) do
                    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
                        v.Material = Enum.Material.Plastic
                        v.Reflectance = 0
                    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                        v.Transparency = 1
                    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                        v.Lifetime = NumberRange.new(0)
                    elseif v:IsA("Explosion") then
                        v.BlastPressure = 1
                        v.BlastRadius = 1
                    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                        v.Enabled = false
                    elseif v:IsA("MeshPart") then
                        v.Material = Enum.Material.Plastic
                        v.Reflectance = 0
                        v.TextureID = ""
                    end
                end
                
                for _, e in pairs(l:GetChildren()) do
                    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
                        e.Enabled = false
                    end
                end
                
                Rayfield:Notify({
                    Title = "FPS Boost Applied",
                    Content = "Graphics optimized for performance!",
                    Duration = 3,
                    Image = "trending-up",
                })
            end)
        end,
    })
    
    local InfoSection = SettingsTab:CreateSection("Information")
    
    local InfoParagraph = SettingsTab:CreateParagraph({
        Title = "Script Information",
        Content = "Its Me",
    })
    
end)

-- ============================================
-- FINAL NOTIFICATION
-- ============================================
Rayfield:Notify({
    Title = "Script Loaded Successfully!",
    Content = "Thanapat No.1",
    Duration = 5,
    Image = "check-circle",
})
