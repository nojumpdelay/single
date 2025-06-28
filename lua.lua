-- CopyLinkGui.lua
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CopyProtectedGui"
screenGui.Parent = playerGui

-- 1行目：固定テキスト（ラベル）
local label = Instance.new("TextLabel")
label.Parent = screenGui
label.Size = UDim2.new(1, 0, 0.075, 0)    -- 高さ7.5%
label.Position = UDim2.new(0, 0, 0, 0)     -- 画面上端
label.BackgroundColor3 = Color3.new(0, 0, 0)
label.BackgroundTransparency = 0.3
label.TextColor3 = Color3.new(1, 1, 1)
label.Font = Enum.Font.GothamBold
label.TextScaled = true
label.TextWrapped = true
label.Text = "下のリンクをコピーして開いてください"

-- 2行目：コピーできるけど編集禁止のTextBox
local originalText = "https://lit.link/growagardenbestscript"

local textBox = Instance.new("TextBox")
textBox.Parent = screenGui
textBox.Size = UDim2.new(1, 0, 0.075, 0)
textBox.Position = UDim2.new(0, 0, 0.08, 0)
textBox.BackgroundColor3 = Color3.new(0, 0, 0)
textBox.BackgroundTransparency = 0.3
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.Font = Enum.Font.GothamBold
textBox.TextScaled = true
textBox.TextWrapped = true
textBox.ClearTextOnFocus = false
textBox.Text = originalText

-- 編集禁止のため元のテキスト以外に変わったらすぐ戻す処理
textBox:GetPropertyChangedSignal("Text"):Connect(function()
    if textBox.Text ~= originalText then
        wait(0.05)
        textBox.Text = originalText
    end
end)

-- コピー用ボタン（押したらテキスト選択状態に）
local button = Instance.new("TextButton")
button.Parent = screenGui
button.Size = UDim2.new(0.3, 0, 0.1, 0)
button.Position = UDim2.new(0.35, 0, 0.16, 0)
button.Text = "Niggerを選択して💔"
button.BackgroundColor3 = Color3.new(0, 0.5, 1)
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.GothamBold
button.TextScaled = true

button.MouseButton1Click:Connect(function()
    textBox:CaptureFocus()
    textBox.SelectionStart = 1
    textBox.SelectionEnd = #textBox.Text
end)
