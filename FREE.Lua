local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Bersihin UI lama kalo ada
if PlayerGui:FindFirstChild("AresKeySystem_UI") then
	PlayerGui.AresKeySystem_UI:Destroy()
end

-- ==========================================
-- SCREEN GUI & SETUP
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AresKeySystem_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local CustomFont = Enum.Font.FredokaOne
local GeneratedRandomKey = "" -- Penyimpanan Key Random

-- ==========================================
-- FLOATING ICON (MUTER-MUTER)
-- ==========================================
local FloatingIcon = Instance.new("ImageButton")
FloatingIcon.Name = "KeySystemIcon"
FloatingIcon.Size = UDim2.new(0, 50, 0, 50)
FloatingIcon.Position = UDim2.new(0.05, 0, 0.4, 0)
FloatingIcon.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
FloatingIcon.Image = "rbxassetid://94158239411156"
FloatingIcon.AnchorPoint = Vector2.new(0.5, 0.5)
FloatingIcon.Active = true
FloatingIcon.Draggable = true
FloatingIcon.Parent = ScreenGui

Instance.new("UICorner", FloatingIcon).CornerRadius = UDim.new(0, 12)
local IconStroke = Instance.new("UIStroke", FloatingIcon)
IconStroke.Thickness = 1.8
IconStroke.Color = Color3.fromRGB(80, 80, 90)

local isSpinning = true
local currentRotation = 0

RunService.RenderStepped:Connect(function(delta)
	if isSpinning then
		currentRotation = (currentRotation + (120 * delta)) % 360
		FloatingIcon.Rotation = currentRotation
	end
end)

-- ==========================================
-- MAIN FRAME KEY SYSTEM
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "KeyMainFrame"
MainFrame.Size = UDim2.new(0, 360, 0, 210)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 28)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 1.5
MainStroke.Color = Color3.fromRGB(55, 55, 65)

-- Close Button Header
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 28, 0, 28)
CloseBtn.Position = UDim2.new(1, -33, 0, 8)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
CloseBtn.Font = CustomFont
CloseBtn.TextSize = 14

-- ==========================================
-- TAB 1: SUBMIT KEY TAB
-- ==========================================
local SubmitTab = Instance.new("Frame", MainFrame)
SubmitTab.Name = "SubmitTab"
SubmitTab.Size = UDim2.new(1, 0, 1, 0)
SubmitTab.BackgroundTransparency = 1

local TitleBar = Instance.new("TextLabel", SubmitTab)
TitleBar.Size = UDim2.new(1, -40, 0, 35)
TitleBar.Position = UDim2.new(0, 15, 0, 8)
TitleBar.BackgroundTransparency = 1
TitleBar.Text = "Ares Key System"
TitleBar.TextColor3 = Color3.fromRGB(240, 240, 240)
TitleBar.Font = CustomFont
TitleBar.TextSize = 18
TitleBar.TextXAlignment = Enum.TextXAlignment.Left

local StatusLabel = Instance.new("TextLabel", SubmitTab)
StatusLabel.Size = UDim2.new(1, -30, 0, 20)
StatusLabel.Position = UDim2.new(0, 15, 0, 38)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Silakan masukkan key untuk melanjutkan"
StatusLabel.TextColor3 = Color3.fromRGB(130, 130, 140)
StatusLabel.Font = CustomFont
StatusLabel.TextSize = 11
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

local InputBox = Instance.new("TextBox", SubmitTab)
InputBox.Name = "KeyInput"
InputBox.Size = UDim2.new(1, -30, 0, 42)
InputBox.Position = UDim2.new(0, 15, 0, 68)
InputBox.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
InputBox.PlaceholderText = "submit keys..."
InputBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
InputBox.Text = ""
InputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
InputBox.Font = CustomFont
InputBox.TextSize = 14

Instance.new("UICorner", InputBox).CornerRadius = UDim.new(0, 8)
local InputStroke = Instance.new("UIStroke", InputBox)
InputStroke.Thickness = 1
InputStroke.Color = Color3.fromRGB(50, 50, 60)

local InputPadding = Instance.new("UIPadding", InputBox)
InputPadding.PaddingLeft = UDim.new(0, 12)

local CheckKeyBtn = Instance.new("TextButton", SubmitTab)
CheckKeyBtn.Size = UDim2.new(0.46, -5, 0, 40)
CheckKeyBtn.Position = UDim2.new(0, 15, 0, 125)
CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
CheckKeyBtn.Text = "check key"
CheckKeyBtn.TextColor3 = Color3.fromRGB(230, 230, 240)
CheckKeyBtn.Font = CustomFont
CheckKeyBtn.TextSize = 13
Instance.new("UICorner", CheckKeyBtn).CornerRadius = UDim.new(0, 8)

local GetKeyBtn = Instance.new("TextButton", SubmitTab)
GetKeyBtn.Size = UDim2.new(0.46, -5, 0, 40)
GetKeyBtn.Position = UDim2.new(0.54, 0, 0, 125)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
GetKeyBtn.Text = "Free Key Here"
GetKeyBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
GetKeyBtn.Font = CustomFont
GetKeyBtn.TextSize = 13
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 8)

-- ==========================================
-- TAB 2: WAITING FOR KEY TAB
-- ==========================================
local WaitingTab = Instance.new("Frame", MainFrame)
WaitingTab.Name = "WaitingTab"
WaitingTab.Size = UDim2.new(1, 0, 1, 0)
WaitingTab.BackgroundTransparency = 1
WaitingTab.Visible = false

local WaitingTitle = Instance.new("TextLabel", WaitingTab)
WaitingTitle.Size = UDim2.new(1, -40, 0, 35)
WaitingTitle.Position = UDim2.new(0, 15, 0, 8)
WaitingTitle.BackgroundTransparency = 1
WaitingTitle.Text = "Waiting For Key..."
WaitingTitle.TextColor3 = Color3.fromRGB(255, 200, 80)
WaitingTitle.Font = CustomFont
WaitingTitle.TextSize = 18
WaitingTitle.TextXAlignment = Enum.TextXAlignment.Left

local KeyDisplayLabel = Instance.new("TextBox", WaitingTab)
KeyDisplayLabel.Size = UDim2.new(1, -30, 0, 42)
KeyDisplayLabel.Position = UDim2.new(0, 15, 0, 55)
KeyDisplayLabel.BackgroundColor3 = Color3.fromRGB(32, 32, 38)
KeyDisplayLabel.Text = "Generating Key..."
KeyDisplayLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
KeyDisplayLabel.Font = CustomFont
KeyDisplayLabel.TextSize = 12
KeyDisplayLabel.ClearTextOnFocus = false
KeyDisplayLabel.TextEditable = false

Instance.new("UICorner", KeyDisplayLabel).CornerRadius = UDim.new(0, 8)
local KeyDisplayStroke = Instance.new("UIStroke", KeyDisplayLabel)
KeyDisplayStroke.Thickness = 1
KeyDisplayStroke.Color = Color3.fromRGB(60, 60, 75)

local CopyKeyBtn = Instance.new("TextButton", WaitingTab)
CopyKeyBtn.Size = UDim2.new(0.46, -5, 0, 38)
CopyKeyBtn.Position = UDim2.new(0, 15, 0, 110)
CopyKeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
CopyKeyBtn.Text = "copy key"
CopyKeyBtn.TextColor3 = Color3.fromRGB(230, 230, 240)
CopyKeyBtn.Font = CustomFont
CopyKeyBtn.TextSize = 12
Instance.new("UICorner", CopyKeyBtn).CornerRadius = UDim.new(0, 8)

local AutoUseBtn = Instance.new("TextButton", WaitingTab)
AutoUseBtn.Size = UDim2.new(0.46, -5, 0, 38)
AutoUseBtn.Position = UDim2.new(0.54, 0, 0, 110)
AutoUseBtn.BackgroundColor3 = Color3.fromRGB(45, 80, 50)
AutoUseBtn.Text = "auto input"
AutoUseBtn.TextColor3 = Color3.fromRGB(200, 255, 200)
AutoUseBtn.Font = CustomFont
AutoUseBtn.TextSize = 12
Instance.new("UICorner", AutoUseBtn).CornerRadius = UDim.new(0, 8)

local BackBtn = Instance.new("TextButton", WaitingTab)
BackBtn.Size = UDim2.new(1, -30, 0, 28)
BackBtn.Position = UDim2.new(0, 15, 0, 156)
BackBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
BackBtn.Text = "← back to submit"
BackBtn.TextColor3 = Color3.fromRGB(150, 150, 160)
BackBtn.Font = CustomFont
BackBtn.TextSize = 11
Instance.new("UICorner", BackBtn).CornerRadius = UDim.new(0, 6)

-- ==========================================
-- LOGIKA RANDOM KEY GENERATOR & EVENT
-- ==========================================

local function GenerateRandomKey()
	local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local code = ""
	for i = 1, 6 do
		local rand = math.random(1, #chars)
		code = code .. string.sub(chars, rand, rand)
	end
	return "FREE/ARES-" .. code
end

FloatingIcon.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
	isSpinning = MainFrame.Visible
end)

CloseBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	isSpinning = false
end)

GetKeyBtn.MouseButton1Click:Connect(function()
	SubmitTab.Visible = false
	WaitingTab.Visible = true
	
	KeyDisplayLabel.Text = "Generating Key..."
	KeyDisplayLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
	
	task.wait(0.8)
	GeneratedRandomKey = GenerateRandomKey()
	KeyDisplayLabel.Text = GeneratedRandomKey
	KeyDisplayLabel.TextColor3 = Color3.fromRGB(100, 220, 150)
end)

BackBtn.MouseButton1Click:Connect(function()
	WaitingTab.Visible = false
	SubmitTab.Visible = true
end)

CopyKeyBtn.MouseButton1Click:Connect(function()
	if GeneratedRandomKey ~= "" and setclipboard then
		setclipboard(GeneratedRandomKey)
		CopyKeyBtn.Text = "copied!"
		task.wait(1)
		CopyKeyBtn.Text = "copy key"
	end
end)

AutoUseBtn.MouseButton1Click:Connect(function()
	if GeneratedRandomKey ~= "" then
		InputBox.Text = GeneratedRandomKey
		WaitingTab.Visible = false
		SubmitTab.Visible = true
		StatusLabel.Text = "Key otomatis terisi! Silakan check key."
		StatusLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
	end
end)

CheckKeyBtn.MouseButton1Click:Connect(function()
	if InputBox.Text == GeneratedRandomKey and GeneratedRandomKey ~= "" then
		StatusLabel.Text = "Key Valid! Memuat Script..."
		StatusLabel.TextColor3 = Color3.fromRGB(80, 220, 120)
		
		task.wait(1)
		ScreenGui:Destroy()
		
		-- Eksekusi script utama jika key benar
		loadstring(game:HttpGet("https://raw.githubusercontent.com/GGSIHLUH/Steal-underwater-egg/refs/heads/main/Source.Lua"))()
	else
		StatusLabel.Text = "Key Salah / Belum dibuat!"
		StatusLabel.TextColor3 = Color3.fromRGB(240, 80, 80)
	end
end)
