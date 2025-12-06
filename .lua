-- filename:
-- version: lua51
-- line: [0, 0] id: 0
local r0_0 = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local function r1_0(r0_10)
  -- line: [0, 0] id: 10
  for r4_10, r5_10 in ipairs(game:GetDescendants()) do
    if (r5_10:IsA("Highlight") or r5_10:IsA("BillboardGui")) and r5_10.Name == r0_10 then
      r5_10:Destroy()
    end
  end
end
local r2_0 = 2.5
local r3_0 = nil
local r4_0 = 3
(function()
  -- line: [0, 0] id: 1
  local r0_1 = game:GetService("Players")
  local r1_1 = game:GetService("TweenService")
  local r2_1 = game:GetService("RunService")
  local r3_1 = game:GetService("UserInputService")
  local r4_1 = r0_1.LocalPlayer
  if not r4_1 then
    warn("LocalPlayer is nil!")
    return
  end
  local r5_1 = r4_1:WaitForChild("PlayerGui")
  local r6_1 = false
  local r7_1 = false
  local r8_1 = Instance.new("ScreenGui")
  r8_1.Name = "EmoteGui"
  r8_1.ResetOnSpawn = false
  r8_1.Parent = r5_1
  local r9_1 = Instance.new("Frame")
  r9_1.Name = "Emote"
  local r10_1 = UDim2.new(0, 600, 0, 300)
  r9_1.Size = r10_1
  r9_1.AnchorPoint = Vector2.new(0.5, 0.5)
  r9_1.Position = UDim2.new(0.5, 0, 0.5, 0)
  r9_1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
  r9_1.BorderSizePixel = 0
  r9_1.Visible = false
  r9_1.Parent = r8_1
  local r11_1 = Instance.new("UICorner")
  r11_1.CornerRadius = UDim.new(0, 15)
  r11_1.Parent = r9_1
  local r12_1 = Instance.new("UIGradient")
  r12_1.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 35, 35)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 15, 15))
  })
  r12_1.Parent = r9_1
  local r13_1 = Instance.new("Frame")
  r13_1.Name = "Shadow"
  r13_1.Size = r10_1
  r13_1.Position = UDim2.new(0, 5, 0, 5)
  r13_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  r13_1.BackgroundTransparency = 0.5
  r13_1.BorderSizePixel = 0
  r13_1.ZIndex = r9_1.ZIndex - 1
  r13_1.Parent = r9_1
  local r14_1 = Instance.new("UICorner")
  r14_1.CornerRadius = r11_1.CornerRadius
  r14_1.Parent = r13_1
  local r15_1 = Instance.new("TextLabel")
  r15_1.Name = "TitleLabel"
  r15_1.Text = "Emotes"
  r15_1.Size = UDim2.new(1, 0, 0, 30)
  r15_1.Position = UDim2.new(0, 0, 0, 0)
  r15_1.BackgroundTransparency = 1
  r15_1.TextColor3 = Color3.fromRGB(255, 255, 255)
  r15_1.Font = Enum.Font.GothamBold
  r15_1.TextScaled = true
  r15_1.Parent = r9_1
  local r16_1 = Instance.new("ScrollingFrame")
  r16_1.Name = "EmoteScroll"
  r16_1.Size = UDim2.new(1, -20, 1, -45)
  r16_1.Position = UDim2.new(0, 10, 0, 35)
  r16_1.BackgroundTransparency = 1
  r16_1.BorderSizePixel = 0
  r16_1.CanvasSize = UDim2.new(0, 0, 0, 0)
  r16_1.Parent = r9_1
  local r17_1 = Instance.new("UIGridLayout")
  r17_1.CellSize = UDim2.new(0, 50, 0, 50)
  r17_1.CellPadding = UDim2.new(0, 8, 0, 8)
  r17_1.SortOrder = Enum.SortOrder.LayoutOrder
  r17_1.Parent = r16_1
  r17_1:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    -- line: [0, 0] id: 7
    r16_1.CanvasSize = UDim2.new(0, 0, 0, r17_1.AbsoluteContentSize.Y)
  end)
  local function r18_1()
    -- line: [0, 0] id: 2
    if r7_1 then
      return
    end
    r7_1 = true
    r9_1.Visible = true
    r9_1.BackgroundTransparency = 1
    r9_1.Size = UDim2.new(0, 0, 0, 0)
    r9_1.AnchorPoint = Vector2.new(0.5, 0.5)
    r9_1.Position = UDim2.new(0.5, 0, 0.5, 0)
    local r1_2 = r1_1:Create(r9_1, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
      Size = UDim2.new(0, 50, 0, 25),
      BackgroundTransparency = 0,
    })
    r1_2:Play()
    r1_2.Completed:Wait()
    local r2_2 = r1_1:Create(r9_1, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
      Size = r10_1,
    })
    r2_2:Play()
    r2_2.Completed:Wait()
    r7_1 = false
  end
  local function r19_1()
    -- line: [0, 0] id: 9
    if r7_1 then
      return
    end
    r7_1 = true
    local r1_9 = r1_1:Create(r9_1, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
      Size = UDim2.new(0, 50, 0, 25),
    })
    r1_9:Play()
    r1_9.Completed:Wait()
    local r2_9 = r1_1:Create(r9_1, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
      Size = UDim2.new(0, 0, 0, 0),
      BackgroundTransparency = 1,
    })
    r2_9:Play()
    r2_9.Completed:Wait()
    r9_1.Visible = false
    r9_1.BackgroundTransparency = 0
    r9_1.Size = r10_1
    r7_1 = false
  end
  local function r20_1(r0_3)
    -- line: [0, 0] id: 3
    local r1_3 = Instance.new("TextButton")
    r1_3.Name = "EmoteButton_" .. r0_3
    r1_3.Size = UDim2.new(0, 50, 0, 50)
    r1_3.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
    r1_3.Text = r0_3
    r1_3.Font = Enum.Font.GothamBold
    r1_3.TextScaled = true
    r1_3.TextColor3 = Color3.fromRGB(240, 240, 240)
    r1_3.BorderSizePixel = 0
    r1_3.AutoButtonColor = false
    r1_3.Parent = r16_1
    local r2_3 = Instance.new("UICorner")
    r2_3.CornerRadius = UDim.new(0, 10)
    r2_3.Parent = r1_3
    local r3_3 = Instance.new("UIStroke")
    r3_3.Thickness = 2
    r3_3.Color = Color3.fromRGB(30, 30, 30)
    r3_3.Parent = r1_3
    local r4_3 = TweenInfo.new(0.15, Enum.EasingStyle.Quad)
    r1_3.MouseEnter:Connect(function()
      -- line: [0, 0] id: 6
      r1_1:Create(r1_3, r4_3, {
        BackgroundColor3 = Color3.fromRGB(75, 75, 75),
      }):Play()
    end)
    r1_3.MouseLeave:Connect(function()
      -- line: [0, 0] id: 4
      r1_1:Create(r1_3, r4_3, {
        BackgroundColor3 = Color3.fromRGB(55, 55, 55),
      }):Play()
    end)
    r1_3.MouseButton1Click:Connect(function()
      -- line: [0, 0] id: 5
      game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack({
        "PlayEmote",
        "Animations",
        r0_3
      }))
      r6_1 = true
      r19_1()
    end)
  end
  for r25_1, r26_1 in ipairs(r4_1:WaitForChild("PlayerData"):WaitForChild("Purchased"):WaitForChild("Emotes"):GetChildren()) do
    r20_1(r26_1.Name)
  end
  local r22_1 = Instance.new("ImageButton")
  r22_1.Name = "ToggleButton"
  r22_1.Size = UDim2.new(0, 50, 0, 50)
  r22_1.Position = UDim2.new(1, -320, 0, -50)
  r22_1.BackgroundTransparency = 1
  r22_1.Image = "rbxassetid://117823860306601"
  r22_1.Parent = r8_1
  local r23_1 = Instance.new("UICorner")
  r23_1.CornerRadius = UDim.new(1, 0)
  r23_1.Parent = r22_1
  local r24_1 = Instance.new("UIStroke")
  r24_1.Thickness = 2
  r24_1.Color = Color3.fromRGB(30, 30, 30)
  r24_1.Parent = r22_1
  r22_1.MouseButton1Click:Connect(function()
    -- line: [0, 0] id: 8
    if r7_1 then
      return
    end
    if r6_1 then
      for r4_8, r5_8 in ipairs(r4_1:WaitForChild("PlayerData"):WaitForChild("Purchased"):WaitForChild("Emotes"):GetChildren()) do
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack({
          "StopEmote",
          "Animations",
          r5_8.Name
        }))
      end
      r6_1 = false
      r19_1()
    elseif r9_1.Visible then
      r19_1()
    else
      r18_1()
    end
  end)
end)()
if game.PlaceId == 18687417158 then
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Hello!",
    Text = "Welcome to B0bby Hub!",
    Image = "",
    Duration = 5,
  })
  wait(2)
  game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Script Loading..",
    Text = "Please wait for the script to load.",
    Image = "",
    Duration = 5,
  })
end
(function()
  -- line: [0, 0] id: 11
  local r0_11 = r0_0
  local r2_11 = {
    Name = "��B0bbyHub / Forsaken",
    Icon = 106975314970201,
    LoadingTitle = "��B0bbyhub / Forsaken",
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
      Invite = "v9sSBezmyy",
      RememberJoins = true,
    },
    KeySystem = false,
  }
  r2_11.KeySettings = {
    Title = "B0bbyhub | Keysystem",
    Subtitle = "Get Key at Our discord server!",
    Note = "Get the key at discord.gg/v9sSBezmyy",
    FileName = "BombbombBobbyKey",
    SaveKey = true,
    GrabKeyFromSite = false,
    Key = {
      "IFarted",
      "BOBISCOOL",
      "Samuelspizzatrip",
      "BOBBYHUBKEYWJJEBEKEI1827272",
      " BOBBYHUBKEYWJJEBEKEI1827272",
      "BOBBYHUBKEYWJJEBEKEI1827272 "
    },
  }
  r0_11 = r0_11:CreateWindow(r2_11)
  local r1_11 = r0_11:CreateTab("Main", "home")
  r2_11 = r0_11:CreateTab("Stamina", "accessibility")
  local r3_11 = r0_11:CreateTab("Effects", "wand-sparkles")
  local r4_11 = r0_11:CreateTab("Generators", "cpu")
  local r5_11 = r0_11:CreateTab("Aimbot / Player", "crosshair")
  local r6_11 = r0_11:CreateTab("Fun", "smile")
  local r7_11 = r0_11:CreateTab("Credits", "clipboard")
  local r8_11 = r0_11:CreateTab("Settings", "settings")
  r0_0:Notify({
    Title = "Made by Bob.47",
    Content = "Cool",
    Duration = 6.5,
    Image = "flame",
  })
  local r9_11 = r1_11:CreateSection("Esp")
  local r10_11 = nil
  local r11_11 = nil
  local r12_11 = nil
  local r13_11 = false
  local r14_11 = workspace.Map.Ingame
  local r15_11 = r1_11:CreateToggle({
    Name = "Killer | Esp",
    CurrentValue = false,
    Flag = "ToggleKIlllerESP1",
    Callback = function(r0_125)
      -- line: [0, 0] id: 125
      local r2_125 = nil -- notice: implicit variable refs by block#[2]
      if r0_125 then
        local r1_125 = workspace.Players.Killers
        r2_125 = game.Workspace:WaitForChild("Players")
        local r3_125 = game:GetService("RunService")
        local function r4_125(r0_132, r1_132, r2_132)
          -- line: [0, 0] id: 132
          local r3_132 = r0_132:FindFirstChild("Highlight")
          if not r3_132 then
            r3_132 = Instance.new("Highlight")
            r3_132.Name = "KillerESP"
            r3_132.Parent = r0_132
            r3_132.Adornee = r0_132
          end
          r3_132.FillTransparency = 0.5
          r3_132.FillColor = r2_132
          r3_132.OutlineColor = r1_132
          r3_132.OutlineTransparency = 0
        end
        local function r5_125(r0_126, r1_126, r2_126)
          -- line: [0, 0] id: 126
          local r3_126 = r0_126:FindFirstChildOfClass("BillboardGui")
          if not r3_126 then
            r3_126 = Instance.new("BillboardGui")
            r3_126.Adornee = r0_126
            r3_126.Name = "KillerESP"
            r3_126.Size = UDim2.new(0, 100, 0, 25)
            r3_126.AlwaysOnTop = true
            r3_126.Parent = r0_126.Parent
            r3_126.StudsOffset = Vector3.new(0, 2, 0)
            local r4_126 = Instance.new("TextLabel")
            r4_126.Size = UDim2.new(1, 0, 1, 0)
            r4_126.BackgroundTransparency = 1
            r4_126.TextScaled = true
            r4_126.TextColor3 = r2_126
            r4_126.Text = r1_126
            r4_126.Font = Enum.Font.Antique
            r4_126.Parent = r3_126
          else
            r3_126.TextLabel.Text = r1_126
            r3_126.TextLabel.TextColor3 = r2_126
            r3_126.TextLabel.Font = Enum.Font.Antique
            r3_126.StudsOffset = Vector3.new(0, 2, 0)
          end
        end
        local function r6_125(r0_129)
          -- line: [0, 0] id: 129
          if r0_129:FindFirstChildOfClass("Humanoid") and r0_129:FindFirstChild("HumanoidRootPart") then
            r4_125(r0_129, Color3.fromRGB(255, 0, 0), Color3.fromRGB(150, 0, 0))
            r5_125(r0_129:FindFirstChild("HumanoidRootPart"), r0_129.Name, Color3.fromRGB(255, 0, 0))
          end
        end
        local function r7_125()
          -- line: [0, 0] id: 128
          local r0_128 = r2_125:FindFirstChild("Killers")
          if r0_128 then
            for r4_128, r5_128 in pairs(r0_128:GetChildren()) do
              r6_125(r5_128)
            end
          end
        end
        r7_125()
        r10_11 = r1_125.ChildAdded:Connect(r7_125)
        r10_11 = r2_125.DescendantAdded:Connect(function(r0_127)
          -- line: [0, 0] id: 127
          if r0_127.Parent and r0_127.Parent.Name == "Killers" then
            r6_125(r0_127)
          end
        end)
        r10_11 = r2_125.DescendantRemoving:Connect(function(r0_130)
          -- line: [0, 0] id: 130
          if r0_130:IsA("Model") and r0_130.Name == "Killers" then
            r0_130.AncestryChanged:Connect(function(r0_131, r1_131)
              -- line: [0, 0] id: 131
              if r1_131 then
                r6_125(r0_130)
              end
            end)
          end
        end)
        -- close: r1_125
      else
        r2_125 = "KillerESP"
        r1_0(r2_125)
        r10_11:Disconnect()
        r10_11 = nil
      end
    end,
  })
  local r16_11 = false
  local r17_11 = {}
  local r18_11 = r1_11:CreateToggle({
    Name = "Generator | ESP",
    CurrentValue = false,
    Flag = "GeneratorToggleESP1",
    Callback = function(r0_74)
      -- line: [0, 0] id: 74
      r16_11 = r0_74
      local r2_74 = nil -- notice: implicit variable refs by block#[11]
      if r16_11 then
        r2_74 = workspace:WaitForChild("Map"):WaitForChild("Ingame")
        local r3_74 = 1
        local r4_74 = nil
        local function r5_74()
          -- line: [0, 0] id: 80
          r4_74 = r2_74:FindFirstChild("Map")
          return r4_74
        end
        local function r6_74(r0_81, r1_81, r2_81)
          -- line: [0, 0] id: 81
          local r3_81 = r0_81:FindFirstChild("GeneratorHigh")
          if not r3_81 then
            r3_81 = Instance.new("Highlight")
            r3_81.Name = "GeneratorHigh"
            r3_81.Parent = r0_81
            r3_81.Adornee = r0_81
          end
          r3_81.FillColor = Color3.new(r1_81[1], r1_81[2], r1_81[3])
          r3_81.OutlineColor = Color3.new(r2_81[1], r2_81[2], r2_81[3])
        end
        local function r7_74(r0_77)
          -- line: [0, 0] id: 77
          local r1_77 = r0_77:FindFirstChild("Main")
          if not r1_77 then
            return
          end
          local r2_77 = r1_77:FindFirstChild("GeneratorHighBillboard")
          if not r2_77 then
            r2_77 = Instance.new("BillboardGui")
            r2_77.Name = "GeneratorHighBillboard"
            r2_77.Adornee = r1_77
            r2_77.Size = UDim2.new(0, 150, 0, 30)
            r2_77.AlwaysOnTop = true
            r2_77.Parent = r1_77
            local r3_77 = Instance.new("TextLabel")
            r3_77.Name = "GeneratorTextLabel"
            r3_77.Size = UDim2.new(0.8, 0, 0.8, 0)
            r3_77.BackgroundTransparency = 1
            r3_77.TextScaled = true
            r3_77.Font = Enum.Font.Antique
            r3_77.Text = "Initializing..."
            r3_77.TextColor3 = Color3.new(1, 1, 1)
            r3_77.Parent = r2_77
          end
          local r3_77 = r2_77:FindFirstChild("GeneratorTextLabel")
          if not r3_77 then
            return
          end
          local r4_77 = r1_77:FindFirstChild("generatorActivate") ~= nil
          if r4_77 then
            r3_77.Text = "Generator: Fixed"
            r3_77.TextColor3 = Color3.new(0, 0.5, 0)
            r6_74(r0_77, {
              0,
              0.5,
              0
            }, {
              0,
              1,
              0
            })
          else
            r3_77.Text = "Generator: Not Fixed"
            r3_77.TextColor3 = Color3.new(0.8, 0, 0)
            r6_74(r0_77, {
              0.5,
              0,
              0
            }, {
              1,
              0,
              0
            })
          end
          r0_77:SetAttribute("GeneratorState", r4_77)
        end
        local function r8_74()
          -- line: [0, 0] id: 75
          local r0_75 = r5_74()
          if r0_75 then
            for r4_75, r5_75 in ipairs(r0_75:GetChildren()) do
              if r5_75.Name == "Generator" and r5_75:IsA("Model") then
                r7_74(r5_75)
              end
            end
          end
        end
        local function r9_74()
          -- line: [0, 0] id: 76
          for r3_76, r4_76 in ipairs(r17_11) do
            if r4_76 then
              r4_76:Disconnect()
            end
          end
          r17_11 = {}
        end
        local function r10_74()
          -- line: [0, 0] id: 78
          while r16_11 do
            task.wait(1)
            local r0_78 = r5_74()
            if r0_78 then
              r8_74()
              table.insert(r17_11, r0_78.DescendantAdded:Connect(function(r0_79)
                -- line: [0, 0] id: 79
                if not r16_11 then
                  return
                end
                local r1_79 = nil
                if r0_79.Name == "Generator" and r0_79:IsA("Model") then
                  r1_79 = r0_79
                elseif r0_79.Name == "Main" and r0_79.Parent and r0_79.Parent.Name == "Generator" then
                  r1_79 = r0_79.Parent
                end
                if r1_79 then
                  r7_74(r1_79)
                end
              end))
            end
          end
        end
        r8_74()
        task.spawn(r10_74)
        while r16_11 do
          local r11_74 = r5_74()
          if r11_74 then
            for r15_74, r16_74 in ipairs(r11_74:GetChildren()) do
              if r16_74.Name == "Generator" and r16_74:IsA("Model") then
                r7_74(r16_74)
              end
            end
          end
          task.wait(r3_74)
        end
        r9_74()
        -- close: r1_74
      else
        r16_11 = false
        r2_74 = "GenESP"
        r1_0(r2_74)
      end
    end,
  })
  local r19_11 = r1_11:CreateToggle({
    Name = "Items | Esp",
    CurrentValue = false,
    Flag = "ItemToggle1Esp",
    Callback = function(r0_210)
      -- line: [0, 0] id: 210
      local r1_210 = nil -- notice: implicit variable refs by block#[2]
      local r2_210 = nil -- notice: implicit variable refs by block#[2]
      if r0_210 then
        r1_210 = game:GetService("Workspace")
        function r2_210(r0_212, r1_212, r2_212)
          -- line: [0, 0] id: 212
          if r0_212 and not r0_212:FindFirstChildOfClass("Highlight") then
            local r3_212 = Instance.new("Highlight")
            r3_212.Name = "ItemESP"
            r3_212.Parent = r0_212
            r3_212.Adornee = r0_212
            r3_212.FillTransparency = 0.75
            r3_212.FillColor = r2_212
            r3_212.OutlineColor = r1_212
            r3_212.OutlineTransparency = 0
          end
        end
        local function r3_210(r0_211, r1_211, r2_211)
          -- line: [0, 0] id: 211
          if r0_211 and not r0_211:FindFirstChildOfClass("BillboardGui") then
            local r3_211 = Instance.new("BillboardGui")
            r3_211.Name = "ItemESP"
            r3_211.Adornee = r0_211
            r3_211.Size = UDim2.new(0, 100, 0, 25)
            r3_211.AlwaysOnTop = true
            r3_211.Parent = r0_211
            local r4_211 = Instance.new("TextLabel")
            r4_211.Size = UDim2.new(1, 0, 1, 0)
            r4_211.BackgroundTransparency = 1
            r4_211.TextScaled = true
            r4_211.TextColor3 = r2_211
            r4_211.Text = r1_211
            r4_211.Font = Enum.Font.Antique
            r4_211.Parent = r3_211
          end
        end
        local function r4_210(r0_213)
          -- line: [0, 0] id: 213
          local r1_213 = r0_213:IsA("Model") and r0_213:FindFirstChildWhichIsA("BasePart")
          if r1_213 then
            local r2_213 = nil
            if r0_213.Name == "BloxyCola" then
              r2_213 = Color3.fromRGB(204, 153, 0)
            elseif r0_213.Name == "Medkit" then
              r2_213 = Color3.fromRGB(128, 0, 128)
            elseif r0_213.Name == "SubspaceTripmine" and not r0_213:IsDescendantOf(r1_210.Players.Survivors) then
              r2_213 = Color3.fromRGB(0, 191, 255)
            else
              return
            end
            r2_210(r1_213, r2_213, r2_213)
            r3_210(r1_213, r0_213.Name, r2_213)
          end
        end
        (function()
          -- line: [0, 0] id: 215
          for r3_215, r4_215 in pairs(r1_210:GetDescendants()) do
            if r4_215:IsA("Model") and (r4_215.Name == "BloxyCola" or r4_215.Name == "Medkit" or r4_215.Name == "SubspaceTripmine" and not r4_215:IsDescendantOf(r1_210.Players.Survivors)) then
              r4_210(r4_215)
            end
          end
        end)()
        r11_11 = r1_210.DescendantAdded:Connect(function(r0_216)
          -- line: [0, 0] id: 216
          if r0_216:IsA("Model") and (r0_216.Name == "BloxyCola" or r0_216.Name == "Medkit" or r0_216.Name == "SubspaceTripmine" and not r0_216:IsDescendantOf(r1_210.Players.Survivors)) then
            wait(1)
            r4_210(r0_216)
          end
        end)
        r11_11 = r1_210.DescendantRemoving:Connect(function(r0_214)
          -- line: [0, 0] id: 214
          if r0_214:IsA("Model") then
            local r1_214 = r0_214:FindFirstChildOfClass("Highlight")
            if r1_214 then
              r1_214:Destroy()
            end
            local r2_214 = r0_214:FindFirstChildOfClass("BillboardGui")
            if r2_214 then
              r2_214:Destroy()
            end
          end
        end)
        -- close: r1_210
      else
        r1_210 = r11_11
        r1_210:Disconnect()
        r1_210 = nil
        r11_11 = r1_210
        r1_210 = r1_0
        r2_210 = "ItemESP"
        r1_210(r2_210)
      end
    end,
  })
  local r20_11 = r1_11:CreateToggle({
    Name = "Survivor | Esp",
    CurrentValue = false,
    Flag = "PLAYERESPOHMYGOSHITSTOGGLEABLE",
    Callback = function(r0_141)
      -- line: [0, 0] id: 141
      r13_11 = r0_141
      local r1_141 = r13_11
      if r1_141 then
        r1_141 = workspace.Players.Survivors
        local r2_141 = game:GetService("Players")
        local function r3_141(r0_145, r1_145, r2_145)
          -- line: [0, 0] id: 145
          if r0_145 and not r0_145:FindFirstChildOfClass("Highlight") then
            local r3_145 = Instance.new("Highlight")
            r3_145.Name = "PlayerESP"
            r3_145.Parent = r0_145
            r3_145.Adornee = r0_145
            r3_145.FillTransparency = 0.75
            r3_145.FillColor = r2_145
            r3_145.OutlineColor = r1_145
            r3_145.OutlineTransparency = 0
          end
        end
        local function r4_141(r0_147, r1_147)
          -- line: [0, 0] id: 147
          local r2_147 = r0_147:FindFirstChild("Head")
          if r2_147 then
            local r3_147 = r2_147:FindFirstChild("HealthGui")
            if not r3_147 then
              r3_147 = Instance.new("BillboardGui")
              r3_147.Name = "PlayerESP"
              r3_147.Size = UDim2.new(0, 100, 0, 60)
              r3_147.AlwaysOnTop = true
              r3_147.MaxDistance = math.huge
              r3_147.Parent = r2_147
              r3_147.StudsOffset = Vector3.new(0, 3, 0)
              local r4_147 = Instance.new("TextLabel")
              r4_147.Name = "HealthLabel"
              r4_147.Size = UDim2.new(1, 0, 0.5, 0)
              r4_147.Position = UDim2.new(0, 0, 0.5, 0)
              r4_147.BackgroundTransparency = 1
              r4_147.TextScaled = true
              r4_147.Text = ""
              r4_147.TextColor3 = r1_147
              r4_147.Font = Enum.Font.Antique
              r4_147.Parent = r3_147
              local r5_147 = Instance.new("TextLabel")
              r5_147.Name = "NameLabel"
              r5_147.Size = UDim2.new(1, 0, 0.5, 0)
              r5_147.Position = UDim2.new(0, 0, 0, 0)
              r5_147.BackgroundTransparency = 1
              r5_147.TextScaled = true
              r5_147.Text = r0_147.Name
              r5_147.TextColor3 = r1_147
              r5_147.Font = Enum.Font.Antique
              r5_147.Parent = r3_147
            else
              local r4_147 = r3_147:FindFirstChild("HealthLabel")
              local r5_147 = r3_147:FindFirstChild("NameLabel")
              if r4_147 then
                r4_147.TextColor3 = r1_147
              end
              if r5_147 then
                r5_147.TextColor3 = r1_147
              end
            end
          end
        end
        local function r5_141()
          -- line: [0, 0] id: 146
          for r3_146, r4_146 in ipairs(r1_141:GetChildren()) do
            local r5_146 = r4_146
            if r5_146 then
              local r6_146 = r5_146:FindFirstChildOfClass("Humanoid")
              local r7_146 = r5_146:FindFirstChild("Head")
              if r6_146 and r7_146 then
                local r8_146 = r6_146.MaxHealth
                if r8_146 > 500 then
                  r8_146 = Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255)
                else
                  goto label_30 -- block#6 is visited secondly
                end
                r4_141(r5_146, r8_146)
                local r9_146 = r7_146:FindFirstChild("PlayerESP")
                if r9_146 then
                  local r10_146 = r9_146:FindFirstChild("HealthLabel")
                  if r10_146 then
                    r10_146.Text = math.floor(r6_146.Health) .. "/" .. r6_146.MaxHealth
                  end
                end
              end
            end
          end
        end
        local function r6_141()
          -- line: [0, 0] id: 143
          for r3_143, r4_143 in ipairs(r1_141:GetChildren()) do
            local r5_143 = r4_143
            if r5_143 and r5_143:FindFirstChildOfClass("Humanoid") then
              local r7_143 = Color3.fromRGB(128, 128, 128)
              local r8_143 = Color3.fromRGB(255, 255, 255)
              r3_141(r5_143, r8_143, r7_143)
              r4_141(r5_143, r8_143)
            end
          end
        end
        r6_141()
        r12_11 = r1_141.ChildAdded:Connect(function(r0_144)
          -- line: [0, 0] id: 144
          wait(1)
          r6_141()
        end)
        r12_11 = r1_141.ChildRemoved:Connect(function(r0_142)
          -- line: [0, 0] id: 142
          local r1_142 = r0_142:FindFirstChildOfClass("Highlight")
          if r1_142 then
            r1_142:Destroy()
          end
          local r2_142 = r0_142:FindFirstChild("Head")
          if r2_142 then
            local r3_142 = r2_142:FindFirstChild("HealthGui")
            if r3_142 then
              r3_142:Destroy()
            end
          end
        end)
        while r13_11 do
          r6_141()
          r5_141()
          wait(1)
        end
        -- close: r1_141
      else
        r1_141 = false
        r13_11 = r1_141
        r1_141 = r1_0
        r1_141("PlayerESP")
        r1_141 = r12_11
        r1_141:Disconnect()
        r1_141 = nil
        r12_11 = r1_141
      end
    end,
  })
  local r21_11 = r1_11:CreateButton({
    Name = "1x1x1x1 Zombie esp",
    Callback = function()
      -- line: [0, 0] id: 170
      local r0_170 = workspace.Map.Ingame
      local r1_170 = "1x1x1x1Zombie"
      local r2_170 = Color3.fromRGB(0, 100, 0)
      local function r3_170(r0_171)
        -- line: [0, 0] id: 171
        if r0_171 and not r0_171:FindFirstChildOfClass("Highlight") then
          local r1_171 = Instance.new("Highlight")
          r1_171.Parent = r0_171
          r1_171.Adornee = r0_171
          r1_171.FillTransparency = 0.75
          r1_171.FillColor = r2_170
          r1_171.OutlineColor = r2_170
          r1_171.OutlineTransparency = 0
          local r2_171 = Instance.new("BillboardGui")
          r2_171.Name = "ZombieLabel"
          r2_171.Size = UDim2.new(0, 100, 0, 50)
          r2_171.AlwaysOnTop = true
          r2_171.MaxDistance = math.huge
          r2_171.Parent = r0_171
          r2_171.StudsOffset = Vector3.new(0, 3, 0)
          local r3_171 = Instance.new("TextLabel")
          r3_171.Size = UDim2.new(1, 0, 1, 0)
          r3_171.BackgroundTransparency = 1
          r3_171.TextScaled = true
          r3_171.Text = "1x1x1x1 Zombie"
          r3_171.TextColor3 = Color3.fromRGB(0, 255, 0)
          r3_171.Font = Enum.Font.Antique
          r3_171.Parent = r2_171
        end
      end
      (function()
        -- line: [0, 0] id: 172
        local r0_172 = r0_170:FindFirstChild(r1_170)
        if r0_172 then
          r3_170(r0_172)
        end
      end)()
      r0_170.ChildAdded:Connect(function(r0_173)
        -- line: [0, 0] id: 173
        if r0_173.Name == r1_170 then
          r3_170(r0_173)
        end
      end)
    end,
  })
  local r22_11 = r1_11:CreateButton({
    Name = "John doe Spike esp",
    Callback = function()
      -- line: [0, 0] id: 45
      local r0_45 = workspace.Map.Ingame
      local r1_45 = "Spike"
      local r2_45 = Color3.fromRGB(255, 140, 0)
      local function r3_45(r0_46)
        -- line: [0, 0] id: 46
        if r0_46 and not r0_46:FindFirstChildOfClass("Highlight") then
          local r1_46 = Instance.new("Highlight")
          r1_46.Parent = r0_46
          r1_46.Adornee = r0_46
          r1_46.FillTransparency = 0.75
          r1_46.FillColor = r2_45
          r1_46.OutlineColor = r2_45
          r1_46.OutlineTransparency = 0
        end
      end
      (function()
        -- line: [0, 0] id: 47
        local r0_47 = r0_45:FindFirstChild(r1_45)
        if r0_47 then
          r3_45(r0_47)
        end
      end)()
      r0_45.ChildAdded:Connect(function(r0_48)
        -- line: [0, 0] id: 48
        if r0_48.Name == r1_45 then
          r3_45(r0_48)
        end
      end)
    end,
  })
  local r23_11 = r1_11:CreateButton({
    Name = "Pizza Delivery Minion esp",
    Callback = function()
      -- line: [0, 0] id: 102
      local r0_102 = workspace.Map.Ingame
      local r1_102 = "PizzaDeliveryRig"
      local r2_102 = Color3.fromRGB(139, 0, 0)
      local function r3_102(r0_103)
        -- line: [0, 0] id: 103
        if r0_103 and not r0_103:FindFirstChildOfClass("Highlight") then
          local r1_103 = Instance.new("Highlight")
          r1_103.Parent = r0_103
          r1_103.Adornee = r0_103
          r1_103.FillTransparency = 0.75
          r1_103.FillColor = r2_102
          r1_103.OutlineColor = r2_102
          r1_103.OutlineTransparency = 0
          local r2_103 = Instance.new("BillboardGui")
          r2_103.Name = "PizzaDeliveryMinionEsp"
          r2_103.Size = UDim2.new(0, 100, 0, 50)
          r2_103.AlwaysOnTop = true
          r2_103.MaxDistance = math.huge
          r2_103.Parent = r0_103
          r2_103.StudsOffset = Vector3.new(0, 3, 0)
          local r3_103 = Instance.new("TextLabel")
          r3_103.Size = UDim2.new(1, 0, 1, 0)
          r3_103.BackgroundTransparency = 1
          r3_103.TextScaled = true
          r3_103.Text = "Pizza Delivery Minion"
          r3_103.TextColor3 = Color3.fromRGB(139, 0, 0)
          r3_103.Font = Enum.Font.Antique
          r3_103.Parent = r2_103
        end
      end
      (function()
        -- line: [0, 0] id: 104
        local r0_104 = r0_102:FindFirstChild(r1_102)
        if r0_104 then
          r3_102(r0_104)
        end
      end)()
      r0_102.ChildAdded:Connect(function(r0_105)
        -- line: [0, 0] id: 105
        if r0_105.Name == r1_102 then
          r3_102(r0_105)
        end
      end)
    end,
  })
  local r24_11 = r1_11:CreateButton({
    Name = "Elliot\'s Pizza esp",
    Callback = function()
      -- line: [0, 0] id: 57
      local r0_57 = workspace.Map.Ingame
      local r1_57 = "Pizza"
      local r2_57 = Color3.fromRGB(255, 165, 0)
      local function r3_57(r0_60)
        -- line: [0, 0] id: 60
        if r0_60 and not r0_60:FindFirstChildOfClass("Highlight") then
          local r1_60 = Instance.new("Highlight")
          r1_60.Parent = r0_60
          r1_60.Adornee = r0_60
          r1_60.FillTransparency = 0.75
          r1_60.FillColor = r2_57
          r1_60.OutlineColor = r2_57
          r1_60.OutlineTransparency = 0
          local r2_60 = Instance.new("BillboardGui")
          r2_60.Name = "PizzaLabel"
          r2_60.Size = UDim2.new(0, 100, 0, 50)
          r2_60.AlwaysOnTop = true
          r2_60.MaxDistance = math.huge
          r2_60.Parent = r0_60
          r2_60.StudsOffset = Vector3.new(0, 3, 0)
          local r3_60 = Instance.new("TextLabel")
          r3_60.Size = UDim2.new(1, 0, 1, 0)
          r3_60.BackgroundTransparency = 1
          r3_60.TextScaled = true
          r3_60.Text = "Pizza"
          r3_60.TextColor3 = Color3.fromRGB(255, 140, 0)
          r3_60.Font = Enum.Font.Antique
          r3_60.Parent = r2_60
        end
      end
      (function()
        -- line: [0, 0] id: 58
        local r0_58 = r0_57:FindFirstChild(r1_57)
        if r0_58 then
          r3_57(r0_58)
        end
      end)()
      r0_57.ChildAdded:Connect(function(r0_59)
        -- line: [0, 0] id: 59
        if r0_59.Name == r1_57 then
          r3_57(r0_59)
        end
      end)
    end,
  })
  local r25_11 = r1_11:CreateButton({
    Name = "Builderman Sentry/Dispenser esp",
    Callback = function()
      -- line: [0, 0] id: 120
      local r0_120 = workspace.Map.Ingame
      local r1_120 = {
        "BuildermanSentryEffectRange",
        "BuildermanSentry"
      }
      local r2_120 = {
        "BuildermanDispenserEffectRange",
        "BuildermanDispenser"
      }
      local r3_120 = Color3.fromRGB(0, 0, 255)
      local r4_120 = Color3.fromRGB(255, 0, 0)
      local r5_120 = Color3.fromRGB(0, 255, 0)
      local function r6_120(r0_123, r1_123, r2_123)
        -- line: [0, 0] id: 123
        if r0_123 and not r0_123:FindFirstChildOfClass("Highlight") then
          local r3_123 = Instance.new("Highlight")
          r3_123.Parent = r0_123
          r3_123.Adornee = r0_123
          r3_123.FillTransparency = 0.75
          r3_123.FillColor = r1_123
          r3_123.OutlineColor = r1_123
          r3_123.OutlineTransparency = 0
          local r4_123 = Instance.new("BillboardGui")
          r4_123.Name = r2_123 .. "Label"
          r4_123.Size = UDim2.new(0, 100, 0, 50)
          r4_123.AlwaysOnTop = true
          r4_123.MaxDistance = math.huge
          r4_123.Parent = r0_123
          r4_123.StudsOffset = Vector3.new(0, 3, 0)
          local r5_123 = Instance.new("TextLabel")
          r5_123.Size = UDim2.new(1, 0, 1, 0)
          r5_123.BackgroundTransparency = 1
          r5_123.TextScaled = true
          r5_123.Text = r2_123
          r5_123.TextColor3 = r1_123
          r5_123.Font = Enum.Font.Antique
          r5_123.Parent = r4_123
        end
      end
      local function r7_120(r0_122, r1_122, r2_122)
        -- line: [0, 0] id: 122
        for r6_122, r7_122 in ipairs(r0_122) do
          local r8_122 = r0_120:FindFirstChild(r7_122)
          if r8_122 then
            r6_120(r8_122, r1_122, r2_122)
          end
        end
      end
      r7_120(r1_120, r3_120, "Sentry")
      r7_120(r2_120, r5_120, "Dispenser")
      r0_120.ChildAdded:Connect(function(r0_121)
        -- line: [0, 0] id: 121
        if r0_121.Name == "BuildermanSentry" or r0_121.Name == "BuildermanSentryEffectRange" then
          r6_120(r0_121, r3_120, "Sentry")
        elseif r0_121.Name == "BuildermanDispenser" or r0_121.Name == "BuildermanDispenserEffectRange" then
          r6_120(r0_121, r5_120, "Dispenser")
        end
      end)
    end,
  })
  local r26_11 = r1_11:CreateButton({
    Name = "Respawn point Esp",
    Callback = function()
      -- line: [0, 0] id: 152
      local r0_152 = workspace.Map.Ingame
      local function r1_152(r0_153)
        -- line: [0, 0] id: 153
        if r0_153 and not r0_153:FindFirstChildWhichIsA("BillboardGui") then
          local r1_153 = r0_153.Name:match("^(.-)RespawnLocation") or "Unknown"
          local r2_153 = Instance.new("BillboardGui")
          r2_153.Name = r1_153 .. "Label"
          r2_153.Size = UDim2.new(0, 150, 0, 50)
          r2_153.AlwaysOnTop = true
          r2_153.MaxDistance = math.huge
          r2_153.Parent = r0_153
          r2_153.StudsOffset = Vector3.new(0, 3, 0)
          local r3_153 = Instance.new("TextLabel")
          r3_153.Size = UDim2.new(1, 0, 1, 0)
          r3_153.BackgroundTransparency = 1
          r3_153.TextScaled = true
          r3_153.Text = r1_153 .. " Respawn Point"
          r3_153.TextColor3 = Color3.fromRGB(80, 80, 80)
          r3_153.Font = Enum.Font.Antique
          r3_153.Parent = r2_153
        end
      end
      local function r2_152(r0_155)
        -- line: [0, 0] id: 155
        if r0_155 and r0_155.Name:find("RespawnLocation") then
          r1_152(r0_155)
        end
      end
      for r6_152, r7_152 in ipairs(r0_152:GetChildren()) do
        r2_152(r7_152)
      end
      r0_152.ChildAdded:Connect(function(r0_154)
        -- line: [0, 0] id: 154
        r2_152(r0_154)
      end)
    end,
  })
  local r27_11 = r1_11:CreateSection("other")
  local r28_11 = game.Players.LocalPlayer
  local r29_11 = nil
  local r30_11 = false
  local function r31_11(r0_88)
    -- line: [0, 0] id: 88
    local r1_88 = r0_88:FindFirstChildOfClass("Humanoid")
    if not r1_88 then
      return
    end
    Instance.new("Animation").AnimationId = "rbxassetid://75804462760596"
    r29_11 = (r1_88:FindFirstChildOfClass("Animator") or r1_88:WaitForChild("Animator")):LoadAnimation(r2_88)
    if r30_11 then
      r29_11:Play()
      task.wait(0.00025)
      r29_11:AdjustSpeed(0)
    end
  end
  local r32_11 = r1_11:CreateToggle({
    Name = "Invisibility",
    CurrentValue = false,
    Callback = function(r0_217)
      -- line: [0, 0] id: 217
      r30_11 = r0_217
      if r29_11 then
        if r0_217 then
          r29_11:Play()
          task.wait(0.00025)
          r29_11:AdjustSpeed(0)
        else
          r29_11:Stop()
        end
      end
    end,
  })
  if r28_11.Character then
    r31_11(r28_11.Character)
  end
  r28_11.CharacterAdded:Connect(r31_11)
  local r33_11 = r1_11:CreateButton({
    Name = "Instant Proximity prompt (Instant interaction)",
    Callback = function()
      -- line: [0, 0] id: 83
      local r0_83 = next
      local r1_83, r2_83 = workspace:GetDescendants()
      for r3_83, r4_83 in r0_83, r1_83, r2_83 do
        if r4_83:IsA("ProximityPrompt") then
          r4_83.PromptButtonHoldBegan:Connect(function()
            -- line: [0, 0] id: 86
            if r4_83.HoldDuration <= 0 then
              return
            end
            fireproximityprompt(r4_83, 0)
          end)
        end
        -- close: r3_83
      end
      workspace.DescendantAdded:Connect(function(r0_84)
        -- line: [0, 0] id: 84
        if r0_84:IsA("ProximityPrompt") then
          r0_84.PromptButtonHoldBegan:Connect(function()
            -- line: [0, 0] id: 85
            if r0_84.HoldDuration <= 0 then
              return
            end
            fireproximityprompt(r0_84, 0)
          end)
        end
      end)
    end,
  })
  local r34_11 = game:GetService("Lighting")
  local r35_11 = r1_11:CreateButton({
    Name = "Fullbright",
    Callback = function()
      -- line: [0, 0] id: 20
      game.workspace.Map.Ingame.ChildAdded:Connect(function()
        -- line: [0, 0] id: 21
        r34_11.TimeOfDay = "12:00:00"
        r34_11.FogStart = 100000
        r34_11.FogEnd = 300000
        r34_11.FogColor = Color3.fromRGB(255, 255, 255)
        r34_11.GlobalShadows = true
        r34_11.Technology = Enum.Technology.Future
        r34_11.Ambient = Color3.fromRGB(230, 230, 230)
        r34_11.OutdoorAmbient = Color3.fromRGB(220, 220, 220)
        r34_11.Brightness = 3
        r34_11.EnvironmentDiffuseScale = 1.5
        r34_11.EnvironmentSpecularScale = 2
        r34_11.ClockTime = 12
      end)
    end,
  })
  local function r36_11()
    -- line: [0, 0] id: 82
    local r0_82 = game:GetService("ReplicatedStorage").Modules.StatusEffects.Stunned
    if r0_82 then
      r0_82:Destroy()
    else
      r0_0:Notify({
        Title = "Already unstunable",
        Content = "Your already unstunable. no need to activate it again.",
        Duration = 3,
        Image = "shield-off",
      })
    end
  end
  local r37_11 = r1_11:CreateButton({
    Name = "Anti Stun",
    Callback = function()
      -- line: [0, 0] id: 133
      r36_11()
    end,
  })
  local r38_11 = false
  local r39_11 = r1_11:CreateToggle({
    Name = "Item Aura",
    CurrentValue = false,
    Flag = "ToggleItemAura",
    Callback = function(r0_37)
      -- line: [0, 0] id: 37
      r38_11 = r0_37
      task.spawn(function()
        -- line: [0, 0] id: 38
        while r38_11 do
          local r0_38 = ipairs
          for r3_38, r4_38 in r0_38(workspace.Map.Ingame:GetChildren()) do
            if r4_38:FindFirstChild("ItemRoot") and r4_38.ItemRoot:FindFirstChild("ProximityPrompt") then
              fireproximityprompt(r4_38.ItemRoot.ProximityPrompt)
            end
          end
          task.wait(1)
        end
      end)
    end,
  })
  local r40_11 = r2_11:CreateParagraph({
    Title = "Note:",
    Content = "Might not work on free executors.",
  })
  local r41_11 = r2_11:CreateToggle({
    Name = "Infinite Stamina",
    CurrentValue = false,
    Flag = "Toggleinfiuddynitestamina",
    Callback = function(r0_70)
      -- line: [0, 0] id: 70
      stam = r0_70
      local r1_70 = require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
      local r2_70 = nil
      r2_70 = game:GetService("RunService").Heartbeat:Connect(function()
        -- line: [0, 0] id: 71
        if not stam then
          r2_70:Disconnect()
          r1_70.StaminaLossDisabled = nil
          return
        end
        r1_70.StaminaLossDisabled = function()
          -- line: [0, 0] id: 72
        end
      end)
    end,
  })
  local function r42_11()
    -- line: [0, 0] id: 15
    local r1_15 = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local r2_15 = Instance.new("ScreenGui")
    r2_15.Name = "BobbyScreengui"
    r2_15.Parent = r1_15
    r2_15.ResetOnSpawn = false
    local r3_15 = Instance.new("ImageButton")
    r3_15.Name = "ToggleButton"
    r3_15.Parent = r2_15
    r3_15.Position = UDim2.new(0.65, 0.3, -0.15, 0)
    r3_15.Size = UDim2.new(0, 60, 0, 60)
    r3_15.BackgroundTransparency = 1
    r3_15.Image = "rbxassetid://105780464700717"
    r3_15.Draggable = true
    r3_15.MouseButton1Click:Connect(function()
      -- line: [0, 0] id: 16
      r0_0:SetVisibility(true)
    end)
  end
  r42_11()
  local r43_11 = r3_11:CreateButton({
    Name = "Remove Subspaced effect",
    Callback = function()
      -- line: [0, 0] id: 176
      local r0_176 = game:GetService("ReplicatedStorage").Modules.StatusEffects.SurvivorExclusive:FindFirstChild("Subspaced")
      if r0_176 then
        r0_176:Destroy()
      else
        r0_0:Notify({
          Title = "Its already removed:",
          Content = "No need to remove it again",
          Duration = 3,
          Image = 4483362458,
        })
      end
    end,
  })
  local r44_11 = r3_11:CreateButton({
    Name = "Remove Glitched effect",
    Callback = function()
      -- line: [0, 0] id: 17
      local r0_17 = game:GetService("ReplicatedStorage").Modules.StatusEffects.KillerExclusive:FindFirstChild("Glitched")
      if r0_17 then
        r0_17:Destroy()
      else
        r0_0:Notify({
          Title = "Its already removed:",
          Content = "No need to remove it again",
          Duration = 3,
          Image = 4483362458,
        })
      end
    end,
  })
  local r45_11 = r3_11:CreateButton({
    Name = "Remove Blindness effect",
    Callback = function()
      -- line: [0, 0] id: 52
      local r0_52 = game:GetService("ReplicatedStorage").Modules.StatusEffects:FindFirstChild("Blindness")
      if r0_52 then
        r0_52:Destroy()
      else
        r0_0:Notify({
          Title = "its Already Removed",
          Content = "Blindness effect is Already removed, No need to do it again.",
          Duration = 3,
          Image = 4483362458,
        })
      end
    end,
  })
  local r46_11 = r3_11:CreateButton({
    Name = "Remove Slowness effect",
    Callback = function()
      -- line: [0, 0] id: 24
      local r0_24 = game:GetService("ReplicatedStorage").Modules.StatusEffects:FindFirstChild("Slowness")
      if r0_24 then
        game:GetService("ReplicatedStorage").Modules.StatusEffects.Slateskin:Destroy()
        r0_24:Destroy()
      else
        r0_0:Notify({
          Title = "Its Already Removed",
          Content = "Slowness effect Already Removed, No need to do it again.",
          Duration = 3,
          Image = 4483362458,
        })
      end
    end,
  })
  local r47_11 = r3_11:CreateButton({
    Name = "Remove Nausea Effect",
    Callback = function()
      -- line: [0, 0] id: 124
      local r0_124 = game:GetService("ReplicatedStorage").Modules.StatusEffects:FindFirstChild("Nausea")
      if r0_124 then
        r0_124:Destroy()
      else
        r0_0:Notify({
          Title = "Already Removed",
          Content = "Nausea effect is already removed.",
          Duration = 3,
          Image = 4483362458,
        })
      end
    end,
  })
  local r48_11 = r3_11:CreateButton({
    Name = "Remove Confusion Effect",
    Callback = function()
      -- line: [0, 0] id: 73
      local r0_73 = game:GetService("ReplicatedStorage").Modules.StatusEffects:FindFirstChild("Confusion")
      if r0_73 then
        r0_73:Destroy()
      else
        r0_0:Notify({
          Title = "Already Removed",
          Content = "Confusion effect is already removed.",
          Duration = 3,
          Image = 4483362458,
        })
      end
    end,
  })
  local r49_11 = r4_11:CreateToggle({
    Name = "Auto generator Fix",
    CurrentValue = false,
    Flag = "AutogeneratorFiCoooollx",
    Callback = function(r0_14)
      -- line: [0, 0] id: 14
      r3_0 = r0_14
      if r3_0 then
        while r3_0 do
          local r1_14 = pairs
          for r4_14, r5_14 in r1_14(game.Workspace.Map.Ingame.Map:GetChildren()) do
            if r5_14.Name == "Generator" then
              r5_14:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
            end
          end
          wait(r2_0)
        end
      else
        r3_0 = false
      end
    end,
  })
  local r50_11 = r4_11:CreateSlider({
    Name = "Delay Range",
    Range = {
      3,
      10
    },
    Increment = 0.5,
    Suffix = "Seconds",
    CurrentValue = 2.5,
    Flag = "SliderGeneratorCYcfjiuustom",
    Callback = function(r0_40)
      -- line: [0, 0] id: 40
      r2_0 = r0_40
    end,
  })
  local r51_11 = r4_11:CreateDivider()
  local r52_11 = nil
  local r53_11 = r4_11:CreateToggle({
    Name = "Instant Fix generator (GUI button)",
    CurrentValue = false,
    Flag = "Toggleihhgtuhinstan",
    Callback = function(r0_89)
      -- line: [0, 0] id: 89
      local r1_89 = nil -- notice: implicit variable refs by block#[2, 3]
      if r0_89 then
        r52_11 = Instance.new("ScreenGui")
        r1_89 = Instance.new("TextButton")
        local r2_89 = Instance.new("UICorner")
        local r3_89 = Instance.new("UIStroke")
        r52_11.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        r52_11.ResetOnSpawn = false
        r1_89.Size = UDim2.new(0, 100, 0, 50)
        r1_89.Font = Enum.Font.FredokaOne
        r1_89.Position = UDim2.new(0.5, -50, 0.8, 0)
        r1_89.Text = "Instant fix"
        r1_89.BackgroundColor3 = Color3.fromRGB(0, 119, 255)
        r1_89.TextColor3 = Color3.fromRGB(255, 255, 255)
        r1_89.Parent = r52_11
        r1_89.Draggable = true
        r1_89.TextSize = 15
        r2_89.CornerRadius = UDim.new(0, 20)
        r2_89.Parent = r1_89
        r3_89.Thickness = 2
        r3_89.Color = Color3.fromRGB(0, 0, 0)
        r3_89.Parent = r1_89
        r3_89.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local r4_89 = false
        local r5_89 = 2.5
        r1_89.MouseEnter:Connect(function()
          -- line: [0, 0] id: 90
          r1_89.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
        end)
        r1_89.MouseLeave:Connect(function()
          -- line: [0, 0] id: 92
          r1_89.BackgroundColor3 = Color3.fromRGB(0, 119, 255)
        end)
        r1_89.MouseButton1Click:Connect(function()
          -- line: [0, 0] id: 91
          if not r4_89 then
            r4_89 = true
            for r3_91, r4_91 in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
              if r4_91.Name == "Generator" then
                r4_91:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
              end
            end
            local r0_91 = r5_89
            while 0 < r0_91 do
              r1_89.Text = string.format("%.1f", r0_91)
              task.wait(0.1)
              r0_91 = r0_91 - 0.1
            end
            r4_89 = false
            r1_89.Text = "Instant fix"
          end
        end)
        -- close: r1_89
      else
        r1_89 = r52_11
        if r1_89 then
          r1_89 = r52_11
          r1_89:Destroy()
          r1_89 = nil
          r52_11 = r1_89
        end
      end
    end,
  })
  local r54_11 = false
  local r55_11 = r4_11:CreateKeybind({
    Name = "Instant Fix Generator Keybind",
    CurrentKeybind = "Q",
    HoldToInteract = false,
    Flag = "KeybindInstantfixgen",
    Callback = function()
      -- line: [0, 0] id: 200
      if not r54_11 then
        r54_11 = true
        for r3_200, r4_200 in pairs(game.Workspace.Map.Ingame.Map:GetChildren()) do
          if r4_200.Name == "Generator" then
            r4_200:WaitForChild("Remotes"):WaitForChild("RE"):FireServer()
          end
        end
        task.wait(2.5)
        r54_11 = false
      end
    end,
  })
  local r56_11 = r5_11:CreateParagraph({
    Title = "Note:",
    Content = "if your brain is too small to understand the \'Survivor aimbot\' and \'Killer aimbot\' so the killer aimbot is aimbot but for killers and survivor aimbot is aimbot but for survivors i made them separate so you can choose.",
  })
  local r57_11 = false
  local r58_11 = {}
  local r59_11 = false
  local r60_11 = nil
  local r61_11 = game:GetService("Players")
  local r62_11 = game:GetService("Workspace")
  local r63_11 = game:GetService("RunService")
  local r64_11 = r61_11.LocalPlayer
  local r65_11 = 0.25
  local r66_11 = 0.1
  local r67_11 = {
    "rbxassetid://87259391926321",
    "rbxassetid://106014898528300",
    "rbxassetid://87259391926321",
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
    "rbxassetid://71685573690338",
    "rbxassetid://129843313690921",
    "rbxassetid://97623143664485",
    "rbxassetid://129843313690921",
    "rbxassetid://136007065400978",
    "rbxassetid://136007065400978",
    "rbxassetid://86096387000557",
    "rbxassetid://86096387000557",
    "rbxassetid://108807732150251",
    "rbxassetid://138040001965654",
    "rbxassetid://73502073176819",
    "rbxassetid://129843313690921",
    "rbxassetid://97623143664485",
    "rbxassetid://129843313690921",
    "rbxassetid://97623143664485",
    "rbxassetid://97623143664485",
    "rbxassetid://97623143664485",
    "rbxassetid://86709774283672",
    "rbxassetid://106014898528300",
    "rbxassetid://87259391926321",
    "rbxassetid://140703210927645",
    "rbxassetid://96173857867228",
    "rbxassetid://121255898612475",
    "rbxassetid://98031287364865",
    "rbxassetid://119462383658044",
    "rbxassetid://77448521277146",
    "rbxassetid://77448521277146",
    "rbxassetid://103741352379819",
    "rbxassetid://119462383658044",
    "rbxassetid://131696603025265",
    "rbxassetid://122503338277352",
    "rbxassetid://97648548303678",
    "rbxassetid://133491532453922"
  }
  local function r68_11(r0_101)
    -- line: [0, 0] id: 101
    for r4_101, r5_101 in ipairs(r67_11) do
      if r0_101 == r5_101 then
        return true
      end
    end
    return false
  end
  local function r69_11()
    -- line: [0, 0] id: 150
    for r3_150, r4_150 in ipairs(r62_11.Players.Killers:GetChildren()) do
      if r4_150:FindFirstChild("HumanoidRootPart") then
        return r4_150
      end
    end
    return nil
  end
  local function r70_11()
    -- line: [0, 0] id: 148
    r60_11 = r69_11()
    if r60_11 then
      r59_11 = true
      task.delay(2, function()
        -- line: [0, 0] id: 149
        r59_11 = false
        r60_11 = nil
      end)
    end
  end
  local function r71_11(r0_12)
    -- line: [0, 0] id: 12
    local r1_12 = r0_12:FindFirstChild("Humanoid") or r0_12:WaitForChild("Humanoid", 5)
    if r1_12 then
      table.insert(r58_11, r1_12.AnimationPlayed:Connect(function(r0_13)
        -- line: [0, 0] id: 13
        if r57_11 and r0_13.Animation and r68_11(r0_13.Animation.AnimationId) then
          r70_11()
        end
      end))
    end
  end
  local function r72_11()
    -- line: [0, 0] id: 93
    r57_11 = true
    table.insert(r58_11, r63_11.RenderStepped:Connect(function()
      -- line: [0, 0] id: 94
      if r59_11 and r60_11 and r60_11:FindFirstChild("HumanoidRootPart") then
        local r0_94 = r60_11.HumanoidRootPart
        local r4_94 = r62_11.CurrentCamera
        r4_94.CFrame = r4_94.CFrame:Lerp(CFrame.new(r4_94.CFrame.Position, r0_94.Position + r0_94.Velocity * r65_11), r66_11)
      end
    end))
    if r64_11.Character then
      r71_11(r64_11.Character)
    end
    table.insert(r58_11, r64_11.CharacterAdded:Connect(function(r0_95)
      -- line: [0, 0] id: 95
      r71_11(r0_95)
    end))
  end
  local function r73_11()
    -- line: [0, 0] id: 56
    r57_11 = false
    r59_11 = false
    r60_11 = nil
    for r3_56, r4_56 in ipairs(r58_11) do
      if r4_56.Connected then
        r4_56:Disconnect()
      end
    end
    r58_11 = {}
  end
  local r74_11 = r5_11:CreateToggle({
    Name = "Survivor Aimbot",
    CurrentValue = false,
    Flag = "ToggleSURGUGFHBIDCWVKO",
    Callback = function(r0_157)
      -- line: [0, 0] id: 157
      if r0_157 then
        r72_11()
      else
        r73_11()
      end
    end,
  })
  local r75_11 = r5_11:CreateSlider({
    Name = "Survivor\'s Aimbot Prediction",
    Range = {
      0.25,
      1
    },
    Increment = 0.25,
    Suffix = "Prediction",
    CurrentValue = 0.25,
    Flag = "SliderSuvrivrolrlsider",
    Callback = function(r0_156)
      -- line: [0, 0] id: 156
      r65_11 = r0_156
    end,
  })
  local r76_11 = r5_11:CreateSlider({
    Name = "Survivor\'s Aimbot Smoothness",
    Range = {
      0.05,
      1
    },
    Increment = 0.05,
    Suffix = "Smoothness",
    CurrentValue = 0.1,
    Flag = "CoolSmoothnessFlag",
    Callback = function(r0_177)
      -- line: [0, 0] id: 177
      r66_11 = r0_177
    end,
  })
  local r77_11 = r5_11:CreateDivider()
  local r78_11 = false
  local r79_11 = {}
  local r80_11 = false
  local r81_11 = nil
  local r82_11 = game:GetService("Players")
  local r83_11 = game:GetService("Workspace")
  local r84_11 = game:GetService("RunService")
  local r85_11 = r82_11.LocalPlayer
  local r86_11 = 0.25
  local r87_11 = 0.1
  local r88_11 = {
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
    "rbxassetid://100592913030351",
    "rbxassetid://121293883585738",
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
    "rbxassetid://82113744478546",
    "rbxassetid://118298475669935",
    "rbxassetid://126681776859538",
    "rbxassetid://129976080405072",
    "rbxassetid://109667959938617",
    "rbxassetid://74707328554358",
    "rbxassetid://133336594357903",
    "rbxassetid://86204001129974",
    "rbxassetid://82113744478546",
    "rbxassetid://118298475669935",
    "rbxassetid://124243639579224",
    "rbxassetid://70371667919898",
    "rbxassetid://131543461321709",
    "rbxassetid://136323728355613",
    "rbxassetid://109230267448394",
    "rbxassetid://109230267448394",
    "rbxassetid://109230267448394",
    "rbxassetid://109230267448394",
    "rbxassetid://109230267448394",
    "rbxassetid://109230267448394",
    "rbxassetid://109230267448394",
    "rbxassetid://109230267448394",
    "rbxassetid://109230267448394",
    "rbxassetid://109230267448394",
    "rbxassetid://109230267448394",
    "rbxassetid://109230267448394",
    "rbxassetid://109230267448394"
  }
  local function r89_11(r0_168)
    -- line: [0, 0] id: 168
    for r4_168, r5_168 in ipairs(r88_11) do
      if r0_168 == r5_168 then
        return true
      end
    end
    return false
  end
  local function r90_11()
    -- line: [0, 0] id: 43
    local r1_43 = math.huge
    local r2_43 = r85_11.Character
    local r3_43 = r2_43 and r2_43:FindFirstChild("HumanoidRootPart") and r2_43.HumanoidRootPart.Position
    local r0_43 = nil -- notice: implicit variable refs by block#[11]
    if r3_43 then
      for r7_43, r8_43 in ipairs(r82_11:GetPlayers()) do
        if r8_43 ~= r85_11 and r8_43.Character and r8_43.Character:FindFirstChild("HumanoidRootPart") then
          local r10_43 = (r8_43.Character.HumanoidRootPart.Position - r3_43).Magnitude
          if r10_43 < r1_43 then
            r0_43 = r8_43
            r1_43 = r10_43
          end
        end
      end
    end
    return r0_43
  end
  local function r91_11()
    -- line: [0, 0] id: 26
    r81_11 = r90_11()
    if r81_11 then
      r80_11 = true
      task.delay(2, function()
        -- line: [0, 0] id: 27
        r80_11 = false
        r81_11 = nil
      end)
    end
  end
  local function r92_11(r0_41)
    -- line: [0, 0] id: 41
    local r1_41 = r0_41:WaitForChild("Humanoid")
    if r1_41 then
      table.insert(r79_11, r1_41.AnimationPlayed:Connect(function(r0_42)
        -- line: [0, 0] id: 42
        if r78_11 and r0_42.Animation and r89_11(r0_42.Animation.AnimationId) then
          r91_11()
        end
      end))
    end
  end
  local function r93_11()
    -- line: [0, 0] id: 135
    r78_11 = true
    table.insert(r79_11, r84_11.RenderStepped:Connect(function()
      -- line: [0, 0] id: 137
      if r80_11 and r81_11 and r81_11.Character and r81_11.Character:FindFirstChild("HumanoidRootPart") then
        local r0_137 = r81_11.Character.HumanoidRootPart
        local r4_137 = r83_11.CurrentCamera
        r4_137.CFrame = r4_137.CFrame:Lerp(CFrame.new(r4_137.CFrame.Position, r0_137.Position + r0_137.Velocity * r86_11), r87_11)
      end
    end))
    if r85_11.Character then
      r92_11(r85_11.Character)
    end
    table.insert(r79_11, r85_11.CharacterAdded:Connect(function(r0_136)
      -- line: [0, 0] id: 136
      r92_11(r0_136)
    end))
  end
  local function r94_11()
    -- line: [0, 0] id: 108
    r78_11 = false
    r80_11 = false
    r81_11 = nil
    for r3_108, r4_108 in ipairs(r79_11) do
      if r4_108.Connected then
        r4_108:Disconnect()
      end
    end
    r79_11 = {}
  end
  local r95_11 = r5_11:CreateToggle({
    Name = "Killer Aimbot",
    CurrentValue = false,
    Flag = "SliderYgdyhbujkillerrrrS",
    Callback = function(r0_169)
      -- line: [0, 0] id: 169
      if r0_169 then
        r93_11()
      else
        r94_11()
      end
    end,
  })
  local r96_11 = r5_11:CreateSlider({
    Name = "Killer\'s Aimbot Prediction",
    Range = {
      0.25,
      1
    },
    Increment = 0.25,
    Suffix = "Prediction",
    CurrentValue = 0.25,
    Flag = "SliderSyxfyr",
    Callback = function(r0_44)
      -- line: [0, 0] id: 44
      r86_11 = r0_44
    end,
  })
  local r97_11 = r5_11:CreateSlider({
    Name = "Killer\'s Aimbot Smoothness",
    Range = {
      0.05,
      1
    },
    Increment = 0.05,
    Suffix = "Smoothness",
    CurrentValue = 0.1,
    Flag = "KillerSmoothnessFlag",
    Callback = function(r0_107)
      -- line: [0, 0] id: 107
      r87_11 = r0_107
    end,
  })
  local r98_11 = r5_11:CreateParagraph({
    Title = "Note:",
    Content = "Prediction from 0.25-0.5 is recommended.",
  })
  local r99_11 = r5_11:CreateDivider()
  local r100_11 = r5_11:CreateButton({
    Name = "Dusekarr Switchable Aimbot",
    Callback = function()
      -- line: [0, 0] id: 178
      local r0_178 = game.Players.LocalPlayer
      local r1_178 = Instance.new("ScreenGui")
      r1_178.Parent = r0_178:WaitForChild("PlayerGui")
      local r2_178 = Instance.new("TextButton")
      r2_178.Parent = r1_178
      r2_178.Size = UDim2.new(0, 200, 0, 50)
      r2_178.Position = UDim2.new(0.5, -100, 0.1, 0)
      r2_178.Text = "Target: Survivors"
      r2_178.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
      r2_178.TextColor3 = Color3.new(1, 1, 1)
      r2_178.Font = Enum.Font.SourceSansBold
      r2_178.TextSize = 24
      r2_178.Draggable = true
      local r3_178 = "Survivor"
      local r4_178 = 0.25
      local r5_178 = game:GetService("RunService")
      local r7_178 = (r0_178.Character or r0_178.CharacterAdded:Wait()):WaitForChild("Humanoid")
      local r8_178 = r7_178:FindFirstChildOfClass("Animator") or r7_178:WaitForChild("Animator")
      local function r9_178()
        -- line: [0, 0] id: 179
        local r0_179 = workspace.CurrentCamera
        return Vector2.new(r0_179.ViewportSize.X / 2, r0_179.ViewportSize.Y / 2)
      end
      local function r10_178()
        -- line: [0, 0] id: 186
        local r1_186 = math.huge
        local r2_186 = workspace.CurrentCamera
        local r3_186 = r9_178()
        local r0_186 = nil -- notice: implicit variable refs by block#[8]
        for r7_186, r8_186 in pairs(game.Players:GetPlayers()) do
          if r8_186 ~= r0_178 and r8_186.Character and r8_186.Character:FindFirstChild("HumanoidRootPart") then
            local r9_186, r10_186 = r2_186:WorldToViewportPoint(r8_186.Character.HumanoidRootPart.Position)
            if r10_186 then
              local r11_186 = (r3_186 - Vector2.new(r9_186.X, r9_186.Y)).magnitude
              if r11_186 < r1_186 then
                r1_186 = r11_186
                r0_186 = r8_186
              end
            end
          end
        end
        return r0_186
      end
      local function r11_178()
        -- line: [0, 0] id: 180
        local r0_180 = workspace:WaitForChild("Players"):WaitForChild("Killers")
        local r1_180 = nil
        local r2_180 = math.huge
        local r3_180 = workspace.CurrentCamera
        local r4_180 = r9_178()
        for r8_180, r9_180 in pairs(r0_180:GetChildren()) do
          if r9_180:IsA("Model") and r9_180:FindFirstChild("HumanoidRootPart") then
            local r10_180 = r3_180:WorldToScreenPoint(r9_180.HumanoidRootPart.Position)
            local r11_180 = (r4_180 - Vector2.new(r10_180.X, r10_180.Y)).magnitude
            if r11_180 < r2_180 then
              r2_180 = r11_180
              r1_180 = r9_180
            end
          end
        end
        return r1_180
      end
      local r12_178 = nil
      local r13_178 = nil
      local function r14_178()
        -- line: [0, 0] id: 187
        if r12_178 then
          r12_178:Disconnect()
          r12_178 = nil
        end
        local r0_187 = r10_178()
        if r0_187 and r0_187.Character and r0_187.Character:FindFirstChild("HumanoidRootPart") then
          r12_178 = r5_178.RenderStepped:Connect(function()
            -- line: [0, 0] id: 189
            if r0_187 and r0_187.Character and r0_187.Character:FindFirstChild("HumanoidRootPart") then
              local r0_189 = r0_187.Character.HumanoidRootPart
              workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, r0_189.Position + r0_189.Velocity * r4_178)
            end
          end)
          task.delay(2, function()
            -- line: [0, 0] id: 188
            if r12_178 then
              r12_178:Disconnect()
              r12_178 = nil
            end
          end)
        end
      end
      local function r15_178()
        -- line: [0, 0] id: 182
        if r13_178 then
          r13_178:Disconnect()
          r13_178 = nil
        end
        local r0_182 = r11_178()
        if r0_182 and r0_182:FindFirstChild("HumanoidRootPart") then
          r13_178 = r5_178.RenderStepped:Connect(function()
            -- line: [0, 0] id: 183
            if r0_182 and r0_182:FindFirstChild("HumanoidRootPart") then
              local r0_183 = r0_182.HumanoidRootPart
              workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, r0_183.Position + r0_183.Velocity * r4_178)
            end
          end)
          task.delay(2, function()
            -- line: [0, 0] id: 184
            if r13_178 then
              r13_178:Disconnect()
              r13_178 = nil
            end
          end)
        end
      end
      local function r16_178()
        -- line: [0, 0] id: 185
        if r12_178 then
          r12_178:Disconnect()
          r12_178 = nil
        end
        if r13_178 then
          r13_178:Disconnect()
          r13_178 = nil
        end
        if r3_178 == "Survivor" then
          r14_178()
        else
          r15_178()
        end
      end
      r2_178.MouseButton1Click:Connect(function()
        -- line: [0, 0] id: 190
        if r3_178 == "Survivor" then
          r3_178 = "Killer"
          r2_178.Text = "Target: Killer"
          r2_178.BackgroundColor3 = Color3.fromRGB(220, 0, 0)
        else
          r3_178 = "Survivor"
          r2_178.Text = "Target: Survivors"
          r2_178.BackgroundColor3 = Color3.fromRGB(34, 139, 34)
        end
      end)
      r8_178.AnimationPlayed:Connect(function(r0_181)
        -- line: [0, 0] id: 181
        if r0_181.Animation and r0_181.Animation.AnimationId == "rbxassetid://77894750279891" then
          r16_178()
        end
      end)
    end,
  })
  local r101_11 = r5_11:CreateSection("Auto / Experimental")
  local r102_11 = false
  local r103_11 = nil
  local r104_11 = r5_11:CreateButton({
    Name = "Auto chance coinflip",
    Callback = function()
      -- line: [0, 0] id: 18
      local r0_18 = game:GetService("Players")
      local r2_18 = {
        [1] = "UseActorAbility",
        [2] = "CoinFlip",
      }
      local r7_18 = r0_18.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainUI"):WaitForChild("AbilityContainer"):WaitForChild("Shoot"):WaitForChild("Charges")
      while tonumber(r7_18.Text) ~= r4_0 do
        local r8_18 = game:GetService("ReplicatedStorage")
        r8_18 = r8_18:WaitForChild("Modules")
        r8_18 = r8_18:WaitForChild("Network")
        r8_18:WaitForChild("RemoteEvent"):FireServer(unpack(r2_18))
        wait(2)
      end
    end,
  })
  local r105_11 = r5_11:CreateSlider({
    Name = "Choose the range",
    Range = {
      1,
      3
    },
    Increment = 1,
    Suffix = "Coinflips",
    CurrentValue = 3,
    Flag = "SliderCoinflip",
    Callback = function(r0_39)
      -- line: [0, 0] id: 39
      r4_0 = r0_39
    end,
  })
  local r106_11 = r5_11:CreateDivider()
  local r107_11 = r5_11:CreateParagraph({
    Title = "Note:",
    Content = "Don\'t use auto Slash killer when your the killer, it will cuase you to auto click (but if your c00lkid then nah)",
  })
  local r108_11 = 10
  local r109_11 = r5_11:CreateToggle({
    Name = "Auto shedletsky slash killer",
    CurrentValue = false,
    Flag = "ToggleAutoSlash",
    Callback = function(r0_197)
      -- line: [0, 0] id: 197
      if r0_197 then
        local r1_197 = game:GetService("RunService")
        local r2_197 = nil
        local r3_197 = {
          "UseActorAbility",
          "Slash"
        }
        r2_197 = r1_197.Heartbeat:Connect(function()
          -- line: [0, 0] id: 198
          for r3_198, r4_198 in ipairs(workspace.Players.Killers:GetChildren()) do
            if r4_198:IsA("Model") and r4_198.PrimaryPart and (r4_198.PrimaryPart.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude <= r108_11 then
              game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(r3_197))
            end
          end
        end)
        -- close: r1_197
      else
        connection:Disconnect()
      end
    end,
  })
  local r110_11 = r5_11:CreateSlider({
    Name = "Auto slash Distance",
    Range = {
      5,
      20
    },
    Increment = 5,
    Suffix = "Studs",
    CurrentValue = 10,
    Flag = "sliderForAutoslash",
    Callback = function(r0_23)
      -- line: [0, 0] id: 23
      r108_11 = r0_23
    end,
  })
  local r111_11 = r5_11:CreateDivider()
  local r112_11 = false
  local r113_11 = r5_11:CreateToggle({
    Name = "Auto Tp to Pizza",
    CurrentValue = false,
    Flag = "PizzaTeleportToggle",
    Callback = function(r0_192)
      -- line: [0, 0] id: 192
      r112_11 = r0_192
      local r2_192 = game:GetService("Players").LocalPlayer
      local r3_192 = workspace.Map.Ingame
      local r4_192 = "Pizza"
      local r5_192 = 0.5
      local r6_192 = 1
      local function r7_192(r0_193)
        -- line: [0, 0] id: 193
        if not r0_193 then
          return
        end
        local r1_193 = r2_192.Character
        if not r1_193 then
          return
        end
        local r2_193 = r1_193:FindFirstChild("HumanoidRootPart")
        if not r2_193 then
          return
        end
        local r3_193 = r2_193.Position
        wait(r6_192)
        if r0_193 and r0_193:IsDescendantOf(r3_192) then
          r2_193.CFrame = r0_193.CFrame
        end
        wait(r5_192)
        r2_193.CFrame = CFrame.new(r3_193)
      end
      local function r8_192()
        -- line: [0, 0] id: 195
        while r112_11 do
          local r0_195 = r3_192:FindFirstChild(r4_192)
          if r0_195 then
            r7_192(r0_195)
          end
          wait(1)
        end
      end
      if r112_11 then
        r8_192()
      end
      r3_192.ChildAdded:Connect(function(r0_194)
        -- line: [0, 0] id: 194
        if r0_194.Name == r4_192 and r112_11 then
          r8_192()
        end
      end)
    end,
  })
  local r114_11 = nil
  local r115_11 = 5
  local r116_11 = r5_11:CreateToggle({
    Name = "Auto Block as guest (experimental, Basically bad)",
    CurrentValue = false,
    Flag = "ToggleAutoBlock",
    Callback = function(r0_35)
      -- line: [0, 0] id: 35
      if r0_35 then
        local r1_35 = game:GetService("RunService")
        local r2_35 = {
          "UseActorAbility",
          "Block"
        }
        r114_11 = r1_35.Heartbeat:Connect(function()
          -- line: [0, 0] id: 36
          for r3_36, r4_36 in ipairs(workspace.Players.Killers:GetChildren()) do
            if r4_36:IsA("Model") and r4_36.PrimaryPart and (r4_36.PrimaryPart.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude <= r115_11 then
              game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(r2_35))
            end
          end
        end)
        -- close: r1_35
      else
        r114_11:Disconnect()
      end
    end,
  })
  local r117_11 = r5_11:CreateSlider({
    Name = "Guest block Distance",
    Range = {
      5,
      30
    },
    Increment = 5,
    Suffix = "Studs",
    CurrentValue = 10,
    Flag = "GuestblockSlider",
    Callback = function(r0_49)
      -- line: [0, 0] id: 49
      r115_11 = r0_49
    end,
  })
  local r118_11 = r5_11:CreateToggle({
    Name = "Auto 1x1x1x1 Popup",
    CurrentValue = false,
    Flag = "Toggle1x1Popupboi",
    Callback = function(r0_50)
      -- line: [0, 0] id: 50
      local r1_50 = game:GetService("VirtualInputManager")
      local r2_50 = true
      local function r3_50()
        -- line: [0, 0] id: 51
        while r2_50 do
          local r0_51 = game:GetService("Players").LocalPlayer
          for r5_51, r6_51 in ipairs(r0_51.PlayerGui.TemporaryUI:GetChildren()) do
            if r6_51.Name == "1x1x1x1Popup" then
              local r7_51 = r6_51.AbsolutePosition.X + r6_51.AbsoluteSize.X / 2
              local r8_51 = r6_51.AbsolutePosition.Y + r6_51.AbsoluteSize.Y / 2 + 50
              r1_50:SendMouseButtonEvent(r7_51, r8_51, Enum.UserInputType.MouseButton1.Value, true, r0_51.PlayerGui, 1)
              r1_50:SendMouseButtonEvent(r7_51, r8_51, Enum.UserInputType.MouseButton1.Value, false, r0_51.PlayerGui, 1)
            end
          end
          task.wait(0.1)
        end
      end
      if r0_50 then
        r2_50 = true
        spawn(r3_50)
      else
        r2_50 = false
      end
    end,
  })
  local r119_11 = nil
  local r120_11 = nil
  local r121_11 = r5_11:CreateToggle({
    Name = "Auto Ghostburger At lms",
    CurrentValue = false,
    Flag = "ToggleAutoGhostBurger",
    Callback = function(r0_138)
      -- line: [0, 0] id: 138
      local r1_138 = {
        [1] = "UseActorAbility",
        [2] = "Ghostburger",
      }
      local r2_138 = workspace.Players:FindFirstChild("Survivors")
      if r0_138 then
        local function r3_138()
          -- line: [0, 0] id: 139
          if r2_138 and #r2_138:GetChildren() == 1 then
            game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(r1_138))
          end
        end
        if r2_138 then
          r119_11 = r2_138.ChildAdded:Connect(r3_138)
          r120_11 = r2_138.ChildRemoved:Connect(r3_138)
        end
        if r2_138 then
          r3_138()
        end
      else
        if r119_11 then
          r119_11:Disconnect()
          r119_11 = nil
        end
        if r120_11 then
          r120_11:Disconnect()
          r120_11 = nil
        end
      end
    end,
  })
  local r122_11 = r5_11:CreateSection("Other Blatant Stuff that are character Specific also")
  local r123_11 = game:GetService("Players")
  local r124_11 = game:GetService("RunService")
  local r125_11 = game:GetService("Workspace")
  local r126_11 = r123_11.LocalPlayer
  local r127_11 = false
  local r128_11 = r5_11:CreateToggle({
    Name = "Homing Tripmine missiles",
    CurrentValue = false,
    Flag = "SkibdiTripminetoggle",
    Callback = function(r0_19)
      -- line: [0, 0] id: 19
      r127_11 = r0_19
    end,
  })
  local function r129_11()
    -- line: [0, 0] id: 134
    local r0_134 = r125_11:FindFirstChild("Players") and r125_11.Players:FindFirstChild("Killers")
    if not r0_134 then
      return nil
    end
    for r4_134, r5_134 in ipairs(r0_134:GetChildren()) do
      if r5_134:FindFirstChildWhichIsA("Humanoid") then
        return r5_134
      end
    end
    return nil
  end
  r124_11.Heartbeat:Connect(function()
    -- line: [0, 0] id: 30
    if not r127_11 then
      return
    end
    local r0_30 = r125_11:FindFirstChild("Map")
    if not r0_30 then
      return
    end
    local r1_30 = r0_30:FindFirstChild("Ingame")
    if not r1_30 then
      return
    end
    local r2_30 = r1_30:FindFirstChild("SubspaceTripmine")
    local r3_30 = r2_30 and r2_30:FindFirstChild("SubspaceCenter")
    if r3_30 and r3_30:IsA("BasePart") and not r3_30:FindFirstChild("SetupComplete") then
      if r126_11.Character and r126_11.Character:IsAncestorOf(r3_30) then
        return
      end
      local r4_30 = Instance.new("BoolValue")
      r4_30.Name = "SetupComplete"
      r4_30.Parent = r3_30
      local r5_30 = Instance.new("BodyPosition")
      r5_30.MaxForce = Vector3.new(1000000, 1000000, 1000000)
      r5_30.D = 1000
      r5_30.P = 10000
      r5_30.Position = r3_30.Position + Vector3.new(0, 4, 0)
      r5_30.Parent = r3_30
      local r6_30 = nil
      r6_30 = r124_11.Heartbeat:Connect(function()
        -- line: [0, 0] id: 31
        if not r3_30 or not r3_30.Parent then
          r6_30:Disconnect()
          return
        end
        local r0_31 = r129_11()
        if r0_31 then
          local r1_31 = r0_31:FindFirstChild("Torso") or r0_31:FindFirstChild("UpperTorso") or r0_31:FindFirstChild("HumanoidRootPart")
          if r1_31 then
            r5_30.Position = r1_31.Position + Vector3.new(0, 2, 0)
          end
        end
      end)
      -- close: r4_30
    end
  end)
  local function r130_11(r0_61, r1_61)
    -- line: [0, 0] id: 61
    local r2_61 = game.Players.LocalPlayer
    local r3_61 = r2_61:WaitForChild("PlayerGui")
    local r4_61 = r3_61:FindFirstChild("ScreenGui")
    if not r4_61 then
      r4_61 = Instance.new("ScreenGui")
      r4_61.Name = "ScreenGui"
      r4_61.Parent = r3_61
    end
    local r5_61 = Instance.new("ImageButton")
    r5_61.Size = UDim2.new(0, 100, 0, 100)
    r5_61.Position = UDim2.new(0.5, -50, 0.5, -50)
    r5_61.Image = r0_61
    r5_61.BackgroundTransparency = 1
    r5_61.Parent = r4_61
    local r6_61 = Instance.new("Animation")
    r6_61.AnimationId = r1_61
    local r7_61 = r2_61.Character or r2_61.CharacterAdded:Wait()
    r5_61.MouseButton1Click:Connect(function()
      -- line: [0, 0] id: 67
      local r0_67 = r7_61:FindFirstChildOfClass("Humanoid")
      if r0_67 then
        r0_67:LoadAnimation(r6_61):Play()
      else
        warn("Skibdi")
      end
    end)
    local r9_61 = game:GetService("UserInputService")
    local r10_61 = nil
    local r11_61 = nil
    local r12_61 = nil
    local r13_61 = nil
    local function r14_61(r0_63)
      -- line: [0, 0] id: 63
      local r1_63 = r0_63.Position - r12_61
      r5_61.Position = UDim2.new(r13_61.X.Scale, r13_61.X.Offset + r1_63.X, r13_61.Y.Scale, r13_61.Y.Offset + r1_63.Y)
    end
    r5_61.InputBegan:Connect(function(r0_64)
      -- line: [0, 0] id: 64
      if r0_64.UserInputType == Enum.UserInputType.MouseButton1 or r0_64.UserInputType == Enum.UserInputType.Touch then
        r10_61 = true
        r12_61 = r0_64.Position
        r13_61 = r5_61.Position
        r0_64.Changed:Connect(function()
          -- line: [0, 0] id: 65
          if r0_64.UserInputState == Enum.UserInputState.End then
            r10_61 = false
          end
        end)
      end
    end)
    r5_61.InputChanged:Connect(function(r0_62)
      -- line: [0, 0] id: 62
      if r0_62.UserInputType == Enum.UserInputType.MouseMovement or r0_62.UserInputType == Enum.UserInputType.Touch then
        r11_61 = r0_62
      end
    end)
    r9_61.InputChanged:Connect(function(r0_66)
      -- line: [0, 0] id: 66
      if r0_66 == r11_61 and r10_61 then
        r14_61(r0_66)
      end
    end)
  end
  local r131_11 = r6_11:CreateButton({
    Name = "Fake Punch Button",
    Callback = function()
      -- line: [0, 0] id: 199
      r130_11("rbxassetid://110895402653848", "rbxassetid://87259391926321")
    end,
  })
  local r132_11 = r6_11:CreateButton({
    Name = "Fake block button",
    Callback = function()
      -- line: [0, 0] id: 151
      r130_11("rbxassetid://85125497005042", "rbxassetid://72722244508749")
    end,
  })
  local r133_11 = r6_11:CreateSection("flip")
  local r134_11 = r6_11:CreateButton({
    Name = "Backflip Button",
    Callback = function()
      -- line: [0, 0] id: 201
      local r1_201 = game.Players.LocalPlayer:WaitForChild("PlayerGui")
      local r2_201 = r1_201:FindFirstChild("ScreenGui")
      if not r2_201 then
        r2_201 = Instance.new("ScreenGui")
        r2_201.Name = "ScreenGui"
        r2_201.Parent = r1_201
      end
      local r3_201 = Instance.new("ImageButton")
      r3_201.Size = UDim2.new(0, 100, 0, 100)
      r3_201.Position = UDim2.new(0.5, -50, 0.5, -50)
      r3_201.Image = "rbxassetid://108983136200755"
      r3_201.BackgroundTransparency = 1
      r3_201.Parent = r2_201
      r3_201.MouseButton1Click:Connect(function()
        -- line: [0, 0] id: 203
        local r0_203 = game.Players.LocalPlayer
        local r1_203 = r0_203.Character or r0_203.CharacterAdded:Wait()
        local r2_203 = r1_203:WaitForChild("HumanoidRootPart")
        local r3_203 = r1_203:WaitForChild("Humanoid")
        r3_203:ChangeState(Enum.HumanoidStateType.Physics)
        r3_203:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        r3_203:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
        r3_203:SetStateEnabled(Enum.HumanoidStateType.Running, false)
        r3_203:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        r3_203:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
        (function()
          -- line: [0, 0] id: 204
          local r0_204 = 0.45
          local r1_204 = 120
          local r2_204 = r2_203.CFrame
          local r3_204 = -r2_204.LookVector
          local r4_204 = Vector3.new(0, 1, 0)
          task.spawn(function()
            -- line: [0, 0] id: 205
            local r0_205 = tick()
            for r4_205 = 1, r1_204, 1 do
              local r5_205 = r4_205 / r1_204
              r2_203.CFrame = CFrame.new((r2_204.Position + r3_204 * 35 * r5_205 + r4_204 * 4 * (r5_205 - r5_205 ^ 2) * 10)) * r2_204.Rotation * CFrame.Angles(-math.rad((r4_205 * 360 / r1_204)), 0, 0)
              local r11_205 = r0_204 / r1_204 * r4_205 - tick() - r0_205
              if r11_205 > 0 then
                task.wait(r11_205)
              end
            end
            r2_203.CFrame = CFrame.new((r2_204.Position + r3_204 * 35)) * r2_204.Rotation
            r3_203:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
            r3_203:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
            r3_203:SetStateEnabled(Enum.HumanoidStateType.Running, true)
            r3_203:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            r3_203:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
            r3_203:ChangeState(Enum.HumanoidStateType.Running)
          end)
        end)()
      end)
      local r4_201 = game:GetService("UserInputService")
      local r5_201 = nil
      local r6_201 = nil
      local r7_201 = nil
      local r8_201 = nil
      local function r9_201(r0_202)
        -- line: [0, 0] id: 202
        local r1_202 = r0_202.Position - r7_201
        r3_201.Position = UDim2.new(r8_201.X.Scale, r8_201.X.Offset + r1_202.X, r8_201.Y.Scale, r8_201.Y.Offset + r1_202.Y)
      end
      r3_201.InputBegan:Connect(function(r0_208)
        -- line: [0, 0] id: 208
        if r0_208.UserInputType == Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch then
          r5_201 = true
          r7_201 = r0_208.Position
          r8_201 = r3_201.Position
          r0_208.Changed:Connect(function()
            -- line: [0, 0] id: 209
            if r0_208.UserInputState == Enum.UserInputState.End then
              r5_201 = false
            end
          end)
        end
      end)
      r3_201.InputChanged:Connect(function(r0_207)
        -- line: [0, 0] id: 207
        if r0_207.UserInputType == Enum.UserInputType.MouseMovement or Enum.UserInputType.Touch then
          r6_201 = r0_207
        end
      end)
      r4_201.InputChanged:Connect(function(r0_206)
        -- line: [0, 0] id: 206
        if r0_206 == r6_201 and r5_201 then
          r9_201(r0_206)
        end
      end)
    end,
  })
  local r135_11 = r6_11:CreateButton({
    Name = "FrontFlip Button",
    Callback = function()
      -- line: [0, 0] id: 111
      local r1_111 = game.Players.LocalPlayer:WaitForChild("PlayerGui")
      local r2_111 = r1_111:FindFirstChild("ScreenGui")
      if not r2_111 then
        r2_111 = Instance.new("ScreenGui")
        r2_111.Name = "ScreenGui"
        r2_111.Parent = r1_111
      end
      local r3_111 = Instance.new("ImageButton")
      r3_111.Size = UDim2.new(0, 100, 0, 100)
      r3_111.Position = UDim2.new(0.5, -50, 0.5, -50)
      r3_111.Image = "rbxassetid://106469685305878"
      r3_111.BackgroundTransparency = 1
      r3_111.Parent = r2_111
      r3_111.MouseButton1Click:Connect(function()
        -- line: [0, 0] id: 117
        local r0_117 = game.Players.LocalPlayer
        local r1_117 = r0_117.Character or r0_117.CharacterAdded:Wait()
        local r2_117 = r1_117:WaitForChild("HumanoidRootPart")
        local r3_117 = r1_117:WaitForChild("Humanoid")
        r3_117:ChangeState(Enum.HumanoidStateType.Physics)
        r3_117:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        r3_117:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
        r3_117:SetStateEnabled(Enum.HumanoidStateType.Running, false)
        r3_117:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        r3_117:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
        (function()
          -- line: [0, 0] id: 118
          local r0_118 = 0.45
          local r1_118 = 120
          local r2_118 = r2_117.CFrame
          local r3_118 = r2_118.LookVector
          local r4_118 = Vector3.new(0, 1, 0)
          task.spawn(function()
            -- line: [0, 0] id: 119
            local r0_119 = tick()
            for r4_119 = 1, r1_118, 1 do
              local r5_119 = r4_119 / r1_118
              r2_117.CFrame = CFrame.new((r2_118.Position + r3_118 * 35 * r5_119 + r4_118 * 4 * (r5_119 - r5_119 ^ 2) * 10)) * r2_118.Rotation * CFrame.Angles(-math.rad((r4_119 * 360 / r1_118)), 0, 0)
              local r11_119 = r0_118 / r1_118 * r4_119 - tick() - r0_119
              if r11_119 > 0 then
                task.wait(r11_119)
              end
            end
            r2_117.CFrame = CFrame.new((r2_118.Position + r3_118 * 35)) * r2_118.Rotation
            r3_117:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
            r3_117:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
            r3_117:SetStateEnabled(Enum.HumanoidStateType.Running, true)
            r3_117:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            r3_117:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
            r3_117:ChangeState(Enum.HumanoidStateType.Running)
          end)
        end)()
      end)
      local r4_111 = game:GetService("UserInputService")
      local r5_111 = nil
      local r6_111 = nil
      local r7_111 = nil
      local r8_111 = nil
      local function r9_111(r0_115)
        -- line: [0, 0] id: 115
        local r1_115 = r0_115.Position - r7_111
        r3_111.Position = UDim2.new(r8_111.X.Scale, r8_111.X.Offset + r1_115.X, r8_111.Y.Scale, r8_111.Y.Offset + r1_115.Y)
      end
      r3_111.InputBegan:Connect(function(r0_112)
        -- line: [0, 0] id: 112
        if r0_112.UserInputType == Enum.UserInputType.MouseButton1 or r0_112.UserInputType == Enum.UserInputType.Touch then
          r5_111 = true
          r7_111 = r0_112.Position
          r8_111 = r3_111.Position
          r0_112.Changed:Connect(function()
            -- line: [0, 0] id: 113
            if r0_112.UserInputState == Enum.UserInputState.End then
              r5_111 = false
            end
          end)
        end
      end)
      r3_111.InputChanged:Connect(function(r0_114)
        -- line: [0, 0] id: 114
        if r0_114.UserInputType == Enum.UserInputType.MouseMovement or r0_114.UserInputType == Enum.UserInputType.Touch then
          r6_111 = r0_114
        end
      end)
      r4_111.InputChanged:Connect(function(r0_116)
        -- line: [0, 0] id: 116
        if r0_116 == r6_111 and r5_111 then
          r9_111(r0_116)
        end
      end)
    end,
  })
  local r136_11 = r6_11:CreateKeybind({
    Name = "Frontflip Keybind",
    CurrentKeybind = "P",
    HoldToInteract = false,
    Flag = "KeybindFrontflip",
    Callback = function()
      -- line: [0, 0] id: 97
      local r0_97 = game.Players.LocalPlayer
      local r1_97 = r0_97.Character or r0_97.CharacterAdded:Wait()
      local r2_97 = r1_97:WaitForChild("HumanoidRootPart")
      local r3_97 = r1_97:WaitForChild("Humanoid")
      r3_97:ChangeState(Enum.HumanoidStateType.Physics)
      r3_97:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
      r3_97:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
      r3_97:SetStateEnabled(Enum.HumanoidStateType.Running, false)
      r3_97:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
      r3_97:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
      (function()
        -- line: [0, 0] id: 98
        local r0_98 = 0.45
        local r1_98 = 120
        local r2_98 = r2_97.CFrame
        local r3_98 = r2_98.LookVector
        local r4_98 = Vector3.new(0, 1, 0)
        task.spawn(function()
          -- line: [0, 0] id: 99
          local r0_99 = tick()
          for r4_99 = 1, r1_98, 1 do
            local r5_99 = r4_99 / r1_98
            r2_97.CFrame = CFrame.new((r2_98.Position + r3_98 * 35 * r5_99 + r4_98 * 4 * (r5_99 - r5_99 ^ 2) * 10)) * r2_98.Rotation * CFrame.Angles(-math.rad((r4_99 * 360 / r1_98)), 0, 0)
            local r11_99 = r0_98 / r1_98 * r4_99 - tick() - r0_99
            if r11_99 > 0 then
              task.wait(r11_99)
            end
          end
          r2_97.CFrame = CFrame.new((r2_98.Position + r3_98 * 35)) * r2_98.Rotation
          r3_97:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
          r3_97:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
          r3_97:SetStateEnabled(Enum.HumanoidStateType.Running, true)
          r3_97:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
          r3_97:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
          r3_97:ChangeState(Enum.HumanoidStateType.Running)
        end)
      end)()
    end,
  })
  local r137_11 = r6_11:CreateKeybind({
    Name = "Backflip Keybind",
    CurrentKeybind = "L",
    HoldToInteract = false,
    Flag = "KeybindBaxlflip",
    Callback = function()
      -- line: [0, 0] id: 158
      local r0_158 = game.Players.LocalPlayer
      local r1_158 = r0_158.Character or r0_158.CharacterAdded:Wait()
      local r2_158 = r1_158:WaitForChild("HumanoidRootPart")
      local r3_158 = r1_158:WaitForChild("Humanoid")
      r3_158:ChangeState(Enum.HumanoidStateType.Physics)
      r3_158:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
      r3_158:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
      r3_158:SetStateEnabled(Enum.HumanoidStateType.Running, false)
      r3_158:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
      r3_158:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
      (function()
        -- line: [0, 0] id: 161
        local r0_161 = 0.45
        local r1_161 = 120
        local r2_161 = r2_158.CFrame
        local r3_161 = -r2_161.LookVector
        local r4_161 = Vector3.new(0, 1, 0)
        task.spawn(function()
          -- line: [0, 0] id: 162
          local r0_162 = tick()
          for r4_162 = 1, r1_161, 1 do
            local r5_162 = r4_162 / r1_161
            r2_158.CFrame = CFrame.new((r2_161.Position + r3_161 * 35 * r5_162 + r4_161 * 4 * (r5_162 - r5_162 ^ 2) * 10)) * r2_161.Rotation * CFrame.Angles(-math.rad((r4_162 * 360 / r1_161)), 0, 0)
            local r11_162 = r0_161 / r1_161 * r4_162 - tick() - r0_162
            if r11_162 > 0 then
              task.wait(r11_162)
            end
          end
          r2_158.CFrame = CFrame.new((r2_161.Position + r3_161 * 35)) * r2_161.Rotation
          r3_158:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
          r3_158:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
          r3_158:SetStateEnabled(Enum.HumanoidStateType.Running, true)
          r3_158:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
          r3_158:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
          r3_158:ChangeState(Enum.HumanoidStateType.Running)
        end)
      end)()
      local r5_158 = game:GetService("UserInputService")
      local r6_158 = nil
      local r7_158 = nil
      local r8_158 = nil
      local r9_158 = nil
      local function r10_158(r0_160)
        -- line: [0, 0] id: 160
        local r1_160 = r0_160.Position - r8_158
        imageButton.Position = UDim2.new(r9_158.X.Scale, r9_158.X.Offset + r1_160.X, r9_158.Y.Scale, r9_158.Y.Offset + r1_160.Y)
      end
      imageButton.InputBegan:Connect(function(r0_164)
        -- line: [0, 0] id: 164
        if r0_164.UserInputType == Enum.UserInputType.MouseButton1 or Enum.UserInputType.Touch then
          r6_158 = true
          r8_158 = r0_164.Position
          r9_158 = imageButton.Position
          r0_164.Changed:Connect(function()
            -- line: [0, 0] id: 165
            if r0_164.UserInputState == Enum.UserInputState.End then
              r6_158 = false
            end
          end)
        end
      end)
      imageButton.InputChanged:Connect(function(r0_159)
        -- line: [0, 0] id: 159
        if r0_159.UserInputType == Enum.UserInputType.MouseMovement or Enum.UserInputType.Touch then
          r7_158 = r0_159
        end
      end)
      r5_158.InputChanged:Connect(function(r0_163)
        -- line: [0, 0] id: 163
        if r0_163 == r7_158 and r6_158 then
          r10_158(r0_163)
        end
      end)
    end,
  })
  local r138_11 = r6_11:CreateSection("Fe Animations")
  local r139_11 = nil
  local r140_11 = r6_11:CreateToggle({
    Name = "Masterbait",
    CurrentValue = false,
    Flag = "MasterbaitToggle",
    Callback = function(r0_167)
      -- line: [0, 0] id: 167
      local r1_167 = game.Players.LocalPlayer
      local r3_167 = (r1_167.Character or r1_167.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid")
      if r3_167 and r139_11 and r139_11.IsPlaying then
        r139_11:Stop()
      end
      -- warn: not visited block [6]
      -- block#6:
      -- r4_167 = Instance.new("Animation")
      -- r4_167.AnimationId = "rbxassetid://72042024"
      -- -- <empty>
      -- _u0 = r3_167:LoadAnimation(r4_167)
      -- -- <empty>
      -- _u0.Looped = true
      -- _u0:Play()
      -- goto label_48
    end,
  })
  local r141_11 = r6_11:CreateToggle({
    Name = "Arms-out Spin",
    CurrentValue = false,
    Flag = "ArmsOutSpinToggle",
    Callback = function(r0_110)
      -- line: [0, 0] id: 110
      local r1_110 = game.Players.LocalPlayer
      local r3_110 = (r1_110.Character or r1_110.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid")
      if r3_110 and r139_11 and r139_11.IsPlaying then
        r139_11:Stop()
      end
      -- warn: not visited block [6]
      -- block#6:
      -- r4_110 = Instance.new("Animation")
      -- r4_110.AnimationId = "rbxassetid://235542946"
      -- -- <empty>
      -- _u0 = r3_110:LoadAnimation(r4_110)
      -- _u0:Play()
      -- goto label_46
    end,
  })
  local r142_11 = r6_11:CreateToggle({
    Name = "Spinning Hands",
    CurrentValue = false,
    Flag = "SpinningHandsToggle",
    Callback = function(r0_28)
      -- line: [0, 0] id: 28
      local r1_28 = game.Players.LocalPlayer
      local r3_28 = (r1_28.Character or r1_28.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid")
      if r3_28 and r139_11 and r139_11.IsPlaying then
        r139_11:Stop()
      end
      -- warn: not visited block [6]
      -- block#6:
      -- r4_28 = Instance.new("Animation")
      -- r4_28.AnimationId = "rbxassetid://259438880"
      -- -- <empty>
      -- _u0 = r3_28:LoadAnimation(r4_28)
      -- -- <empty>
      -- _u0.Looped = true
      -- _u0:Play()
      -- goto label_48
    end,
  })
  local r143_11 = r6_11:CreateToggle({
    Name = "Jumping Jacks",
    CurrentValue = false,
    Flag = "JumpingJacksToggle",
    Callback = function(r0_100)
      -- line: [0, 0] id: 100
      local r1_100 = game.Players.LocalPlayer
      local r3_100 = (r1_100.Character or r1_100.CharacterAdded:Wait()):FindFirstChildOfClass("Humanoid")
      if r3_100 and r139_11 and r139_11.IsPlaying then
        r139_11:Stop()
      end
      -- warn: not visited block [6]
      -- block#6:
      -- r4_100 = Instance.new("Animation")
      -- r4_100.AnimationId = "rbxassetid://429681631"
      -- -- <empty>
      -- _u0 = r3_100:LoadAnimation(r4_100)
      -- -- <empty>
      -- _u0.Looped = true
      -- _u0:Play()
      -- goto label_48
    end,
  })
  local r144_11 = r6_11:CreateButton({
    Name = "slide button",
    Callback = function()
      -- line: [0, 0] id: 53
      local r0_53 = game.Players.LocalPlayer
      local r1_53 = r0_53:WaitForChild("PlayerGui")
      local r2_53 = r1_53:FindFirstChild("ScreenGui")
      if not r2_53 then
        r2_53 = Instance.new("ScreenGui")
        r2_53.Name = "ScreenGui"
        r2_53.Parent = r1_53
      end
      local r3_53 = Instance.new("ImageButton")
      r3_53.Size = UDim2.new(0, 100, 0, 100)
      r3_53.Position = UDim2.new(0.5, -50, 0.5, -50)
      r3_53.Image = "rbxassetid://110777561976075"
      r3_53.BackgroundTransparency = 1
      r3_53.Parent = r2_53
      r3_53.Draggable = true
      r3_53.MouseButton1Click:Connect(function()
        -- line: [0, 0] id: 54
        local r0_54 = r0_53.Character or r0_53.CharacterAdded:Wait()
        local r1_54 = r0_54:WaitForChild("HumanoidRootPart")
        local r2_54 = r0_54:WaitForChild("Humanoid")
        local r3_54 = Instance.new("Animation")
        r3_54.AnimationId = "rbxassetid://182749109"
        local r4_54 = r2_54:LoadAnimation(r3_54)
        r4_54:Play()
        local r11_54 = game:GetService("TweenService"):Create(r1_54, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
          CFrame = r1_54.CFrame * CFrame.new(0, 0, -20),
        })
        r11_54:Play()
        r11_54.Completed:Connect(function()
          -- line: [0, 0] id: 55
          r4_54:Stop()
        end)
      end)
    end,
  })
  local r145_11 = r6_11:CreateSection("Animation Packs")
  local function r146_11(r0_32, r1_32, r2_32)
    -- line: [0, 0] id: 32
    local r3_32 = game.Players.LocalPlayer
    local r4_32 = r3_32.Character or r3_32.CharacterAdded:Wait()
    local r5_32 = r4_32:WaitForChild("Humanoid")
    local r6_32 = r4_32:WaitForChild("HumanoidRootPart")
    local r7_32 = r5_32:WaitForChild("Animator")
    local function r8_32(r0_33)
      -- line: [0, 0] id: 33
      local r1_33 = Instance.new("Animation")
      r1_33.AnimationId = r0_33
      return r7_32:LoadAnimation(r1_33)
    end
    local r9_32 = r8_32(r0_32)
    local r10_32 = r8_32(r1_32)
    local r11_32 = r8_32(r2_32)
    game:GetService("RunService").Heartbeat:Connect(function()
      -- line: [0, 0] id: 34
      local r0_34 = r6_32.Velocity.Magnitude
      if r0_34 < 1 and not r9_32.IsPlaying then
        r9_32:Play()
        r10_32:Stop(0.2)
        r11_32:Stop(0.2)
      elseif r0_34 >= 20 and not r11_32.IsPlaying then
        r11_32:Play()
        r9_32:Stop(0.2)
        r10_32:Stop(0.2)
      elseif not r10_32.IsPlaying then
        r10_32:Play()
        r9_32:Stop(0.2)
        r11_32:Stop(0.2)
      end
    end)
  end
  local r147_11 = r6_11:CreateButton({
    Name = "2017 animation Pack",
    Callback = function()
      -- line: [0, 0] id: 166
      r146_11("rbxassetid://124622205682529", "rbxassetid://99127941563341", "rbxassetid://99159420513149")
    end,
  })
  local r148_11 = r6_11:CreateButton({
    Name = "Stalker animation pack",
    Callback = function()
      -- line: [0, 0] id: 191
      r146_11("rbxassetid://135419935358802", "rbxassetid://95469909855529", "rbxassetid://109671225388655")
    end,
  })
  local r149_11 = r6_11:CreateButton({
    Name = "Chill animation pack",
    Callback = function()
      -- line: [0, 0] id: 87
      r146_11("rbxassetid://132811450080149", "rbxassetid://90163253241107", "rbxassetid://96194626828153")
    end,
  })
  local r150_11 = r6_11:CreateButton({
    Name = "John doe\'s animation pack",
    Callback = function()
      -- line: [0, 0] id: 106
      r146_11("rbxassetid://105880087711722", "rbxassetid://81193817424328", "rbxassetid://132653655520682")
    end,
  })
  local r151_11 = r6_11:CreateButton({
    Name = "C00lkid\'s animation pack",
    Callback = function()
      -- line: [0, 0] id: 196
      r146_11("rbxassetid://18885903667", "rbxassetid://18885906143", "rbxassetid://96571077893813")
    end,
  })
  local r152_11 = r6_11:CreateButton({
    Name = "Noli\'s animation pack",
    Callback = function()
      -- line: [0, 0] id: 140
      r146_11("rbxassetid://83465205704188", "rbxassetid://116353529220765", "rbxassetid://117451341682452")
    end,
  })
  local r153_11 = r6_11:CreateButton({
    Name = "Cool animation pack",
    Callback = function()
      -- line: [0, 0] id: 68
      r146_11("rbxassetid://115268929362938", "rbxassetid://123678890237669", "rbxassetid://132086389849889")
    end,
  })
  local r154_11 = r6_11:CreateButton({
    Name = "Bludude\'s animation pack",
    Callback = function()
      -- line: [0, 0] id: 69
      r146_11("rbxassetid://115268929362938I", "rbxassetid://18885906143", "rbxassetid://96571077893813")
    end,
  })
  local r155_11 = r6_11:CreateButton({
    Name = "Jeff the killer animation pack",
    Callback = function()
      -- line: [0, 0] id: 174
      local r0_174 = game.Players.LocalPlayer
      local r2_174 = (r0_174.Character or r0_174.CharacterAdded:Wait()):WaitForChild("Humanoid")
      local r4_174 = Instance.new("Animation")
      r4_174.AnimationId = "rbxassetid://252557606"
      local r5_174 = nil
      local r7_174 = Instance.new("Animation")
      r7_174.AnimationId = "rbxassetid://124622205682529"
      local r8_174 = nil
      r2_174.Running:Connect(function(r0_175)
        -- line: [0, 0] id: 175
        if r0_175 > 0 then
          if r8_174 and r8_174.IsPlaying then
            r8_174:Stop()
          end
          if not r5_174 or not r5_174.IsPlaying then
            r5_174 = r2_174:LoadAnimation(r4_174)
            r5_174.Looped = true
            r5_174:Play()
          end
        else
          if r5_174 and r5_174.IsPlaying then
            r5_174:Stop()
          end
          if not r8_174 or not r8_174.IsPlaying then
            r8_174 = r2_174:LoadAnimation(r7_174)
            r8_174.Looped = true
            r8_174:Play()
          end
        end
      end)
    end,
  })
  local r156_11 = r7_11:CreateParagraph({
    Title = "Note:",
    Content = "If you have any suggestions or to report smh, Please Suggest it on our discord.",
  })
  local r159_11 = "CreateLabel"
  r159_11 = "hiiamcool0066_17937: a special guy(helped through alot)"
  local r157_11 = r7_11:[r159_11](r159_11, 81011198561140, Color3.fromRGB(90, 90, 90), false)
  local r160_11 = "CreateLabel"
  r160_11 = "Creator: Bob.47"
  local r158_11 = r7_11:[r160_11](r160_11, 70727208556993, Color3.fromRGB(90, 90, 90), false)
  local r161_11 = "CreateLabel"
  r161_11 = "doitenroi_9941: helped me through setting up the discord server"
  r159_11 = r7_11:[r161_11](r161_11, 111385007873003, Color3.fromRGB(90, 90, 90), false)
  r160_11 = r8_11:CreateButton({
    Name = "Unload the Gui ",
    Callback = function()
      -- line: [0, 0] id: 25
      r0_0:Destroy()
      local r0_25 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("EmoteGui")
      if r0_25 then
        r0_25:Destroy()
      end
      local r1_25 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("BobbyScreengui")
      if r1_25 then
        r1_25:Destroy()
      end
    end,
  })
  r161_11 = r8_11:CreateSection("Themes")
  local r162_11 = r8_11:CreateButton({
    Name = "Set Default theme",
    Callback = function()
      -- line: [0, 0] id: 22
      r0_11.ModifyTheme("Default")
    end,
  })
  local r165_11 = {
    Name = "Set AmberGlow theme",
    Callback = function()
      -- line: [0, 0] id: 29
      r0_11.ModifyTheme("AmberGlow")
    end,
  }
  local r163_11 = r8_11:CreateButton(r165_11)
  local r164_11 = r8_11:CreateToggle({
    Name = "Remove \'B0bby\' Button",
    CurrentValue = false,
    Flag = "Toggle910",
    Callback = function(r0_109)
      -- line: [0, 0] id: 109
      if r0_109 then
        local r1_109 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("BobbyScreengui")
        if r1_109 then
          r1_109:Destroy()
        end
      else
        r42_11()
      end
    end,
  })
  function r165_11()
    -- line: [0, 0] id: 96
    -- notice: unreachable block#1
    while true do
      game:GetService("TextChatService").ChatWindowConfiguration.Enabled = true
      wait(10)
    end
    goto label_10 -- block#1 is visited secondly
  end
end)()
