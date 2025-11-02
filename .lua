print ("🔑key datockac")
local CORRECT_KEY = "datockac"

-- code của mày (hub tổng hợp) dán vô đây
local USER_CODE = [[
--// Lâm Vĩ Redz V5 Tổng Hợp Hub (No Key)
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/daucobonhi/UiRedzV5/main/DemoUi.lua"))()

local Window = redzlib:MakeWindow({
    Title = "DacCauHub",
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
    -- Basic sanity checks: avoid trying to load HTML pages or very short responses
    if type(body) ~= "string" then
        warn("safeLoad: unexpected body type from", url)
        return
    end
    local lower = string.lower(body)
    if lower:match("<html") or lower:match("<!doctype") or #body < 10 then
        warn("safeLoad: fetched content doesn't look like Lua (HTML or too short):", url)
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

local function makeCallback(urlOrFunc, opts)
    -- accepts either a URL string (fetched via safeLoad) or a function (executed directly)
    opts = opts or {}
    if type(urlOrFunc) == "function" then
        return function()
            if opts.waitForGame then
                repeat task.wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer
            end
            if opts.setup then
                for k, v in pairs(opts.setup) do
                    getgenv()[k] = v
                end
            end
            local ok, err = pcall(urlOrFunc)
            if not ok then warn("Callback function error:", err) end
        end
    else
        return function()
            if opts.waitForGame then
                repeat task.wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer
            end
            if opts.setup then
                for k, v in pairs(opts.setup) do
                    getgenv()[k] = v
                end
            end
            safeLoad(urlOrFunc, opts)
        end
    end
end

-- Tabs
local Tab0 = Window:MakeTab({"Violence District", "target"})
local Tab1 = Window:MakeTab({"Grow a Garden", "leaf"})
local Tab2 = Window:MakeTab({"99 Đêm", "moon"})
local Tab3 = Window:MakeTab({"Steal a Brainot", "brain"})
local Tab4 = Window:MakeTab({"Plant vs Brainot", "tree"})
local Tab5 = Window:MakeTab({"Script Linh Tinh", "code"})
local Tab6 = Window:MakeTab({"Blox Fruits", "sword"})
local Tab7 = Window:MakeTab({"Kaitun Blox Fruits", "zap"})
local Tab8 = Window:MakeTab({"Script Tổng Hợp", "list"})
local Tab9 = Window:MakeTab({"Misc", "crosshair"})

-- Bảng chứa toàn bộ script tổng hợp
local Scripts = {
    {tab = Tab6, name = "Thinh Limited", url = "https://raw.githubusercontent.com/thunhchk/thinhlimeted/refs/heads/main/tthinhlimeted.lua"},
    {tab = Tab5, name = "godmode ALL game", url = "https://raw.githubusercontent.com/Rawbr10/Roblox-Scripts/refs/heads/main/God%20Mode%20Script%20Universal"},
    {tab = Tab5, name = "Bất tử 99 đêm", url = "https://raw.githubusercontent.com/ProBaconHub/DATABASE/refs/heads/main/99%20Nights%20in%20the%20Forest/Infinite%20Health.lua"},
    {tab = Tab6, name = "Maru Hub", url = "https://raw.githubusercontent.com/thunhchk/Maruvietsub/refs/heads/main/maruhubthinh.txt"},
    {tab = Tab5, name = "MM2 Hub", url = "https://raw.githubusercontent.com/NexusScripts212/Roblox/refs/heads/main/Mm2"},
    {tab = Tab7, name = "Farm Chest Thinh Lo", url = "https://raw.githubusercontent.com/thunhchk/Farmchest/refs/heads/main/thinhtp.txt"},
    {tab = Tab6, name = "Cat Egg v6", url = "https://raw.githubusercontent.com/thunhchk/Categgv6/refs/heads/main/categgv6beta.lua"},
    {tab = Tab1, name = "Speed Hub", url = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"},
    {tab = Tab6, name = "Hop Server", url = "https://raw.githubusercontent.com/thunhchk/Hopsever/refs/heads/main/categghop.txt"},
    {tab = Tab6, name = "Banana Hub", url = "https://raw.githubusercontent.com/thunhchk/Bananacat/refs/heads/main/testhub.lua"},
    {tab = Tab2, name = "Foxname 99 Đêm", url = "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"},
    {tab = Tab3, name = "Tigy", url = "https://raw.githubusercontent.com/Tigyiscute/tigystealabrainrotscript/refs/heads/main/TigysScript"},
    {tab = Tab4, name = "Saki Hub", url = "https://saki-hub.vercel.app/pvb.lua"},
    {tab = Tab5, name = "Fly Thịnh", url = "https://raw.githubusercontent.com/thunhchk/Flythinh/refs/heads/main/Flythinhv1.lua"},
    {tab = Tab2, name = "99 Đêm Thịnh", url = "https://raw.githubusercontent.com/thunhchk/99nigth/refs/heads/main/99nightthinh.lua"},
    {tab = Tab7, name = "Kaitun Thịnh", url = "https://raw.githubusercontent.com/thunhchk/Kaitunbf/refs/heads/main/thinhkaitunbf.txt"},
    {tab = Tab6, name = "Doremon v2", url = "https://raw.githubusercontent.com/KiddoHiru/BloxFruits/main/MasterHub.lua"},
    {tab = Tab6, name = "Zen Hub", url = "https://zuwz.me/Ls-Zee-Hub"},
    {tab = Tab6, name = "W Azure", url = "https://api.luarmor.net/files/v3/loaders/85e904ae1ff30824c1aa007fc7324f8f.lua"},
    {tab = Tab5, name = "Hoho Hub", url = "https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"},
    {tab = Tab6, name = "Blue X Hub", url = "https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/Main.lua"},
    {tab = Tab5, name = "Blue X tìm trái cây", url = "https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/FindFruits.lua"},
    {tab = Tab6, name = "Quantum ", url = "https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"},
    {tab = Tab6, name = "Thunder Hub", url = "https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua"},
    {tab = Tab6, name = "Tboy Roblox", url = "https://raw.githubusercontent.com/TBoyRoblox727/TBoyRobloxYTB/refs/heads/main/TBeoMainBF.lua"},
    {tab = Tab6, name = "Xeter V3", url = "https://raw.githubusercontent.com/TlDinhKhoi/Xeter/refs/heads/main/Main.lua"},
    {tab = Tab7, name = "Yiner Hub", url = "https://raw.githubusercontent.com/Dev-Yiner/Yiner-Hub/refs/heads/main/KaitunOfTheSkies.lua"},
    {tab = Tab6, name = "Ngọc Bổng", url = "https://raw.githubusercontent.com/ngocbonggaming/script/refs/heads/main/NgocBongVn.lua"},
    {tab = Tab6, name = "Hiru Hub", url = "https://raw.githubusercontent.com/KiddoHiru/BloxFruits/main/Source.lua"},
    {tab = Tab1, name = "OMG Hub", url = "https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"},
    {tab = Tab6, name = "Zis Roblox", url = "https://raw.githubusercontent.com/LuaCrack/Zis/refs/heads/main/ZisBVn"},
    {tab = Tab6, name = "Đạt Thg", url = "https://raw.githubusercontent.com/LuaCrack/DatThg/refs/heads/main/DatThgV2"},
    {tab = Tab6, name = "HNC Hub", url = "https://raw.githubusercontent.com/hnc-roblox/HNCHubOnTop/refs/heads/main/HNC_Roblox.lua"},
    {tab = Tab6, name = "Teddy Hub", url = "https://raw.githubusercontent.com/Teddyseetink/Haidepzai/refs/heads/main/TeddyHub.lua"},
    {tab = Tab8, name = "Tổng hợp Tboy Roblox", url = "https://raw.githubusercontent.com/TBoyRoblox727/TBoyRobloxYTB/refs/heads/main/AllScriptBF.txt"},
    {tab = Tab8, name = "Tổng hợp Tuấn Anh IOS", url = "https://raw.githubusercontent.com/AnhDzaiScript/TuanAnhIOSNew/refs/heads/main/TuanAnhIOS-TongHop.Lua"},
    {tab = Tab6, name = "Astra Hub", url = "https://raw.githubusercontent.com/Overgustx2/Main/refs/heads/main/BloxFruits_25.html"},
    {tab = Tab9, name = "FixLag TDT", url = "https://raw.githubusercontent.com/TRANDUYTHINH/scriptdt/refs/heads/main/Output%20(3).lua"},
    {tab = Tab6, name = "Hop Boss(key)", url = "https://raw.githubusercontent.com/Teddyseetink/Haidepzai/refs/heads/main/TEDDYHUB-FREEMIUM"},
    {tab = Tab6, name = "TDT Hub", url = "https://pandadevelopment.net/virtual/file/2a2ea2a6d621379a"},
    {tab = Tab7, name = "KaiTun TDT", url = "https://raw.githubusercontent.com/TRANDUYTHINH/scriptdt/refs/heads/main/7bc2bab10110ef77%20(1).lua"},
    {tab = Tab7, name = "Farm Chest TDT", url = "https://raw.githubusercontent.com/TRANDUYTHINH/scriptdt/refs/heads/main/Output%20(3).lua"},
    {tab = Tab6, name = "TrongNguyen Hub", url = "https://raw.githubusercontent.com/trongdeptraihucscript/Script-BloxFruit/refs/heads/main/TrongNguyenSkidder.lua"},
    {tab = Tab7, name = "Kaitun prehistoric", url = "https://raw.githubusercontent.com/Xero2409/XeroHub/refs/heads/main/main.lua"},
    {tab = Tab0, name = "Violece District pc", url = "https://raw.githubusercontent.com/G06Raider/VD/refs/heads/main/main.lua"},
    {tab = Tab0, name = "violence district pe", url = "https://gist.githubusercontent.com/imhimelnanocruzscript-gif/bd47612c0473adcfe197f3cdc72f8f62/raw/0c570048c6f006b14a2f8ccae65a3d87be6b3dae/gistfile1.txt"},
    {tab = Tab9, name = "Fly animation", url = function()
        local UserInputService = game:GetService("UserInputService")
        local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
        if isMobile then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/MobileFly.lua"))()
        else
            loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/FlyR15.lua"))()
        end
    end},
    {tab = Tab9, name = "WallHop", url = "https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"},
    {tab = Tab9, name = "Infinite Yield", url = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {tab = Tab9, name = "Sonic Animation", url = "https://pastebin.com/raw/dzAfxfmz"},
    {tab = Tab9, name = "HitBBox", url = "https://pastefy.app/ItfO0tdg/raw"},
    {tab = Tab9, name = "Troll R15", url = "https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Bfe%20r15%20animation%20player%5D.lua"},
    {tab = Tab9, name = "làm quả lọ", url = "https://raw.githubusercontent.com/ShutUpJamesTheLoserAlt/fes/refs/heads/main/e"},
    {tab = Tab9, name = "tua ngược", url = "https://mscripts.vercel.app/scfiles/reverse-script.lua"},
    {tab = Tab9, name = "move hand PE", url = "https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty45.lua"},
    {tab = Tab8, name = "Tổng hợp độc lạ(error)", url = function()
        -- lightweight demo: show a notification and a small loading GUI
        pcall(function()
            game.StarterGui:SetCore("SendNotification", {Title = "Notification", Text = "Enjoy using the animation script by alip", Icon = "rbxassetid://7072718364", Duration = 5})
            local player = game.Players.LocalPlayer
            if not player then return end
            local gui = Instance.new("ScreenGui")
            gui.Name = "LoadingGUI"
            gui.Parent = player:WaitForChild("PlayerGui")
            gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            local frame = Instance.new("Frame", gui)
            frame.AnchorPoint = Vector2.new(0.5, 0.5)
            frame.Position = UDim2.new(0.5, 0, 0.5, 0)
            frame.Size = UDim2.new(0, 200, 0, 200)
            frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
            local corner = Instance.new("UICorner", frame)
            corner.CornerRadius = UDim.new(0, 25)
            local img = Instance.new("ImageLabel", frame)
            img.Name = "loadingCircle"
            img.AnchorPoint = Vector2.new(0.5, 0.5)
            img.Position = UDim2.new(0.5, 0, 0.4, 0)
            img.Size = UDim2.new(0, 70, 0, 70)
            img.Image = "rbxassetid://133898459740182"
            img.BackgroundTransparency = 1
            local txt = Instance.new("TextLabel", frame)
            txt.AnchorPoint = Vector2.new(0.5, 1)
            txt.Position = UDim2.new(0.5, 0, 1, -10)
            txt.Size = UDim2.new(1, 0, 0, 30)
            txt.Text = "Wait a minute"
            txt.TextColor3 = Color3.fromRGB(255,255,255)
            txt.BackgroundTransparency = 1
            txt.TextScaled = true
            txt.Font = Enum.Font.Gotham
            -- simple spinner
            local ts = game:GetService("TweenService")
            local running = true
            spawn(function()
                while running do
                    local t = ts:Create(img, TweenInfo.new(1, Enum.EasingStyle.Linear), {Rotation = img.Rotation + 360})
                    t:Play()
                    t.Completed:Wait()
                end
            end)
            task.delay(3, function() running = false end)
        end)
    end},
{tab = Tab9, name = "FixLag DucLuong", url = "https://raw.githubusercontent.com/Luongdaynetroi/Free/refs/heads/main/FixLag/roblox/.lua",


},

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
Print "lccdnctrqqn?"
