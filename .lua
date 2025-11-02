--[[ 🔐 Lâm Vĩ Key UI Xịn v2 - Blur, Animation, Modern Style ]]
local CORRECT_KEY = "datockac"

-- code của mày (hub tổng hợp) dán vô đây
local USER_CODE = [[
--// Lâm Vĩ Redz V5 Tổng Hợp Hub (No Key)
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/daucobonhi/UiRedzV5/main/DemoUi.lua"))()

local Window = redzlib:MakeWindow({
    Title = "Daccau HUb",
    SubTitle = "Make by DucLuong",
    SaveFolder = "Blox Fruits.lua"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://131151731604309", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 6) }
})

-- Helper: safeLoad để fetch + run script an toàn
local function safeLoad(url, opts)
    opts = opts or {}
    local success, body = pcall(function()
        return game:HttpGet(url, true)
    end)
    if not success then
        warn("HttpGet lỗi:", url, body)
        return
    end

    local ok, err = pcall(function()
        local f, e = loadstring(body)
        if not f then error(e) end
        f()
    end)
    if not ok then
        warn("Loadstring lỗi:", url, err)
    end
end

local function makeCallback(url, opts)
    opts = opts or {}
    return function()
        if opts.waitForGame then
            repeat task.wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer
        end
        if opts.setup then
            for k, v in pairs(opts.setup) do
                getgenv()[k] = v
            end
        end
        safeLoad(url, opts)
    end
end

-- Tabs
local Tab0 = Window:MakeTab({"MM2", "target"})
local Tab1 = Window:MakeTab({"Grow a Garden", "leaf"})
local Tab2 = Window:MakeTab({"99 Đêm", "moon"})
local Tab3 = Window:MakeTab({"Steal a Brainot", "brain"})
local Tab4 = Window:MakeTab({"Plant vs Brainot", "tree"})
local Tab5 = Window:MakeTab({"Script Linh Tinh", "code"})
local Tab6 = Window:MakeTab({"Blox Fruits", "sword"})
local Tab7 = Window:MakeTab({"Kaitun Blox Fruits", "zap"})
local Tab8 = Window:MakeTab({"Script Tổng Hợp", "list"})
local Tab9 = Window:MakeTab({"The Strongest Battlegrounds", "crosshair"})

-- Bảng chứa toàn bộ script tổng hợp
local Scripts = {
    {tab = Tab6, name = "Thinh Limited", url = "https://raw.githubusercontent.com/thunhchk/thinhlimeted/refs/heads/main/tthinhlimeted.lua"},
    {tab = Tab5, name = "Bất tử tất cả game", url = "https://raw.githubusercontent.com/Rawbr10/Roblox-Scripts/refs/heads/main/God%20Mode%20Script%20Universal"},
    {tab = Tab5, name = "Bất tử 99 đêm", url = "https://raw.githubusercontent.com/ProBaconHub/DATABASE/refs/heads/main/99%20Nights%20in%20the%20Forest/Infinite%20Health.lua"},
    {tab = Tab6, name = "Maru Hub", url = "https://raw.githubusercontent.com/thunhchk/Maruvietsub/refs/heads/main/maruhubthinh.txt"},
    {tab = Tab0, name = "MM2 Hub", url = "https://raw.githubusercontent.com/NexusScripts212/Roblox/refs/heads/main/Mm2"},
    {tab = Tab6, name = "Farm Chest", url = "https://raw.githubusercontent.com/thunhchk/Farmchest/refs/heads/main/thinhtp.txt"},
    {tab = Tab6, name = "Cat Egg v6", url = "https://raw.githubusercontent.com/thunhchk/Categgv6/refs/heads/main/categgv6beta.lua"},
    {tab = Tab1, name = "Speed Hub", url = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"},
    {tab = Tab6, name = "Hop Server", url = "https://raw.githubusercontent.com/thunhchk/Hopsever/refs/heads/main/categghop.txt"},
    {tab = Tab6, name = "Banana Hub", url = "https://raw.githubusercontent.com/thunhchk/Bananacat/refs/heads/main/testhub.lua"},
    {tab = Tab2, name = "Foxname 99 Đêm", url = "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"},
    {tab = Tab3, name = "Tigy Steal A Brainrot", url = "https://raw.githubusercontent.com/Tigyiscute/tigystealabrainrotscript/refs/heads/main/TigysScript"},
    {tab = Tab4, name = "Saki Hub", url = "https://saki-hub.vercel.app/pvb.lua"},
    {tab = Tab5, name = "Fly Thịnh", url = "https://raw.githubusercontent.com/thunhchk/Flythinh/refs/heads/main/Flythinhv1.lua"},
    {tab = Tab2, name = "99 Đêm Thịnh", url = "https://raw.githubusercontent.com/thunhchk/99nigth/refs/heads/main/99nightthinh.lua"},
    {tab = Tab7, name = "Kaitun Thịnh", url = "https://raw.githubusercontent.com/thunhchk/Kaitunbf/refs/heads/main/thinhkaitunbf.txt"},
    {tab = Tab6, name = "Doremon v2", url = "https://raw.githubusercontent.com/KiddoHiru/BloxFruits/main/MasterHub.lua"},
    {tab = Tab6, name = "Zen Hub", url = "https://zuwz.me/Ls-Zee-Hub"},
    {tab = Tab6, name = "W Azure", url = "https://api.luarmor.net/files/v3/loaders/85e904ae1ff30824c1aa007fc7324f8f.lua"},
    {tab = Tab5, name = "Hoho Hub", url = "https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"},
    {tab = Tab6, name = "Blue X Hub", url = "https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/Main.lua"},
    {tab = Tab5, name = "Blue X Finder", url = "https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/FindFruits.lua"},
    {tab = Tab6, name = "Quantum", url = "https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"},
    {tab = Tab6, name = "Thunder Hub", url = "https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua"},
    {tab = Tab6, name = "Tboy Roblox", url = "https://raw.githubusercontent.com/TBoyRoblox727/TBoyRobloxYTB/refs/heads/main/TBeoMainBF.lua"},
    {tab = Tab6, name = "Xeter V3", url = "https://raw.githubusercontent.com/TlDinhKhoi/Xeter/refs/heads/main/Main.lua"},
    {tab = Tab7, name = "Yiner Hub", url = "https://raw.githubusercontent.com/Dev-Yiner/Yiner-Hub/refs/heads/main/KaitunOfTheSkies.lua"},
    {tab = Tab6, name = "Ngọc Bổng", url = "https://raw.githubusercontent.com/ngocbonggaming/script/refs/heads/main/NgocBongVn.lua"},
    {tab = Tab6, name = "Hiru Hub", url = "https://raw.githubusercontent.com/LuaStupid/ExecuteGames/main/QuestGames.lua"},
    {tab = Tab1, name = "OMG Hub", url = "https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"},
    {tab = Tab6, name = "Zis Roblox", url = "https://raw.githubusercontent.com/LuaCrack/Zis/refs/heads/main/ZisBVn"},
    {tab = Tab6, name = "Đạt Thg", url = "https://raw.githubusercontent.com/LuaCrack/DatThg/refs/heads/main/DatThgV2"},
    {tab = Tab6, name = "HNC Hub", url = "https://raw.githubusercontent.com/hnc-roblox/HNCHubOnTop/refs/heads/main/HNC_Roblox.lua"},
    {tab = Tab6, name = "Teddy Hub", url = "https://pandadevelopment.net/virtual/file/ea696e8e7439ba51"},
    {tab = Tab8, name = "Tổng hợp Tboy Roblox", url = "https://raw.githubusercontent.com/TBoyRoblox727/TBoyRobloxYTB/refs/heads/main/AllScriptBF.txt"},
    {tab = Tab8, name = "Tổng hợp Tuấn Anh IOS", url = "https://raw.githubusercontent.com/AnhDzaiScript/TuanAnhIOSNew/refs/heads/main/TuanAnhIOS-TongHop.Lua"},
    {tab = Tab6, name = "Astra Hub", url = "https://raw.githubusercontent.com/Overgustx2/Main/refs/heads/main/BloxFruits_25.html"},
    {tab = Tab9, name = "Aimlock", url = "https://raw.githubusercontent.com/Cyborg883/TSB/refs/heads/main/CombatGui"}
}

-- Thêm toàn bộ script vô UI
for _, s in ipairs(Scripts) do
    s.tab:AddButton({s.name, makeCallback(s.url, {waitForGame = true})})
end

print("✅ DucLuong Hub (Redz UI) Loaded - yes Key")

]]

-- 🔧 Config
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

-- Blur effect
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting
TweenService:Create(blur, TweenInfo.new(1, Enum.EasingStyle.Sine), {Size = 18}):Play()

-- ScreenGui
local gui = Instance.new("ScreenGui", CoreGui)
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Name = "LamVi_KeyUI"

-- Background
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
bg.BackgroundTransparency = 0.25

-- Gradient
local grad = Instance.new("UIGradient", bg)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25,25,30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60,60,90))
}
grad.Rotation = 45

-- Main frame
local frame = Instance.new("Frame", bg)
frame.Size = UDim2.new(0, 420, 0, 240)
frame.Position = UDim2.new(0.5, -210, 0.5, -120)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.05
frame.ClipsDescendants = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)

-- Drop shadow
local shadow = Instance.new("ImageLabel", frame)
shadow.AnchorPoint = Vector2.new(0.5,0.5)
shadow.Position = UDim2.new(0.5,0,0.5,0)
shadow.Size = UDim2.new(1,40,1,40)
shadow.Image = "rbxassetid://5554236805"
shadow.ImageTransparency = 0.4
shadow.BackgroundTransparency = 1
shadow.ZIndex = -1

-- Title
local title = Instance.new("TextLabel", frame)
title.Text = "🔑 Nhập Key Truy Cập Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 0, 0, 20)
title.Size = UDim2.new(1, 0, 0, 40)

-- Input
local box = Instance.new("TextBox", frame)
box.PlaceholderText = "Nhập key của mày ở đây..."
box.Size = UDim2.new(0.9, 0, 0, 40)
box.Position = UDim2.new(0.05, 0, 0.5, -20)
box.BackgroundColor3 = Color3.fromRGB(35,35,45)
box.TextColor3 = Color3.new(1,1,1)
box.Font = Enum.Font.Gotham
box.TextSize = 18
box.ClearTextOnFocus = false
box.Text = ""
Instance.new("UICorner", box).CornerRadius = UDim.new(0,10)

-- Status
local status = Instance.new("TextLabel", frame)
status.BackgroundTransparency = 1
status.Size = UDim2.new(1,0,0,20)
status.Position = UDim2.new(0,0,1,-30)
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(255,100,100)
status.Text = ""

-- Button
local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0,120,0,36)
btn.Position = UDim2.new(0.5,-60,0.75,0)
btn.BackgroundColor3 = Color3.fromRGB(70,140,255)
btn.TextColor3 = Color3.fromRGB(255,255,255)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 16
btn.Text = "Xác Nhận"
btn.AutoButtonColor = false
Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)

-- Tween intro
frame.Position = UDim2.new(0.5, -210, 1.2, 0)
TweenService:Create(frame, TweenInfo.new(0.8, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -210, 0.5, -120)}):Play()

-- Function to load code
local function runCode()
    blur:Destroy()
    gui:Destroy()
    local ok, err = pcall(function()
        loadstring(USER_CODE)()
    end)
    if not ok then
        warn("⚠️ Lỗi khi chạy code:", err)
    end
end

btn.MouseButton1Click:Connect(function()
    local key = box.Text
    if key == CORRECT_KEY then
        status.TextColor3 = Color3.fromRGB(100,255,120)
        status.Text = "✔️ Key đúng, đang load..."
        TweenService:Create(frame, TweenInfo.new(0.6), {Position = UDim2.new(0.5, -210, -0.5, 0)}):Play()
        task.wait(0.6)
        runCode()
    else
        status.TextColor3 = Color3.fromRGB(255,120,120)
        status.Text = "❌ Sai key, thử lại đi đồ ngu."
        TweenService:Create(frame, TweenInfo.new(0.1), {Position = UDim2.new(0.5, -200, 0.5, -120)}):Play()
        task.wait(0.05)
        TweenService:Create(frame, TweenInfo.new(0.1), {Position = UDim2.new(0.5, -210, 0.5, -120)}):Play()
    end
end)

box.FocusLost:Connect(function(enter)
    if enter then
        btn.MouseButton1Click:Fire()
    end
end)
