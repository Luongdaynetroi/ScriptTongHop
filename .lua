-- Lâm Vĩ KeyUI v2.1 (SaveKey Mode) — Theme: tối + gradient tím-xanh
-- Tính năng:
--  • Ô nhập key + nút "Nhấn để vô UI"
--  • Bên phải: nút "Auto vào UI" (bật/tắt, lưu trạng thái)
--  • Nếu nhập đúng key 1 lần -> lần sau UI chuyển sang mini "Enter để vô"
--  • Lưu key thật (file) nếu executor hỗ trợ, fallback lưu state vào Player attribute
--  • Animation mượt, pcall bảo vệ, GUI đặt trong PlayerGui (an toàn hơn CoreGui)
-- Cấu hình nhanh:
local CORRECT_KEY = "datockac"                -- key đúng để test
local SAVE_KEY_FILE = "LamVi_KeyUI_savedkey.txt"     -- file lưu key (plaintext)
local STATE_FILE = "LamVi_KeyUI_state.json"         -- file lưu flags {accepted, auto}
local SAVE_KEY_MODE = true                        -- true = lưu key thật (m yêu cầu)
local USER_CODE = [[
--// Lâm Vĩ Redz V5 Tổng Hợp Hub (No Key)
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/daucobonhi/UiRedzV5/main/DemoUi.lua"))()

local Window = redzlib:MakeWindow({
    Title = "DacCauHub",
    SubTitle = "Make by DucLuong",
    SaveFolder = "TongHopHubDucLuong",
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
local Tab1 = Window:MakeTab({"FixLag", "leaf"})
local Tab2 = Window:MakeTab({"99 Đêm", "moon"})
local Tab3 = Window:MakeTab({"Steal a Brainot", "brain"})
local Tab4 = Window:MakeTab({"Plant vs Brainot/fisch", "tree"})
local Tab5 = Window:MakeTab({"code linh tinh", "code"})
local Tab6 = Window:MakeTab({"Blox Fruits", "sword"})
local Tab7 = Window:MakeTab({"Kaitun Blox Fruits", "zap"})
local Tab8 = Window:MakeTab({"Script Tổng Hợp", "list"})
local Tab9 = Window:MakeTab({"Misc", "crosshair"})
local Tab10 = Window:MakeTab({"Animation", "game"})

-- Bảng chứa toàn bộ script tổng hợp
local Scripts = {
    {tab = Tab10, name = "mOS(giống IY)", url = "https://raw.githubusercontent.com/formidy/morfOS/refs/heads/main/main.lua"},
    {tab = Tab5, name = "Aim LSM", url = "https://raw.githubusercontent.com/learningpythonuntilimakeanapi-art/lns-hub-free/refs/heads/main/obfuscated%20lns%20free.lua"},
    {tab = Tab6, name = "Thinh Limited", url = "https://raw.githubusercontent.com/thunhchk/thinhlimeted/refs/heads/main/tthinhlimeted.lua"},
    {tab = Tab5, name = "godmode ALL game", url = "https://raw.githubusercontent.com/Rawbr10/Roblox-Scripts/refs/heads/main/God%20Mode%20Script%20Universal"},
    {tab = Tab2, name = "Bất tử 99 đêm", url = "https://raw.githubusercontent.com/ProBaconHub/DATABASE/refs/heads/main/99%20Nights%20in%20the%20Forest/Infinite%20Health.lua"},
    {tab = Tab6, name = "Maru Hub", url = "https://raw.githubusercontent.com/thunhchk/Maruvietsub/refs/heads/main/maruhubthinh.txt"},
    {tab = Tab5, name = "MM2 Hub", url = "https://raw.githubusercontent.com/NexusScripts212/Roblox/refs/heads/main/Mm2"},
    {tab = Tab7, name = "Farm Chest Thinh Lo", url = "https://raw.githubusercontent.com/thunhchk/Farmchest/refs/heads/main/thinhtp.txt"},
    {tab = Tab6, name = "Cat Egg v6", url = "https://raw.githubusercontent.com/thunhchk/Categgv6/refs/heads/main/categgv6beta.lua"},
    {tab = Tab2, name = "Speed Hub", url = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"},
    {tab = Tab2, name = "Nhấn để copy key speed hub", url = function() 
        setclipboard("rMChVgMZYJYHMGNtMvYkvDKasUFztRuG") end},
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
    {tab = Tab2, name = "OMG Hub", url = "https://raw.githubusercontent.com/Omgshit/Scripts/main/MainLoader.lua"},
    {tab = Tab6, name = "Zis Roblox", url = "https://raw.githubusercontent.com/LuaCrack/Zis/refs/heads/main/ZisBVn"},
    {tab = Tab6, name = "Đạt Thg", url = "https://raw.githubusercontent.com/LuaCrack/DatThg/refs/heads/main/DatThgV2"},
    {tab = Tab6, name = "HNC Hub", url = "https://raw.githubusercontent.com/hnc-roblox/HNCHubOnTop/refs/heads/main/HNC_Roblox.lua"},
    {tab = Tab6, name = "Teddy Hub", url = "https://raw.githubusercontent.com/Teddyseetink/Haidepzai/refs/heads/main/TeddyHub.lua"},
    {tab = Tab8, name = "Tổng hợp Tboy Roblox", url = "https://raw.githubusercontent.com/TBoyRoblox727/TBoyRobloxYTB/refs/heads/main/AllScriptBF.txt"},
    {tab = Tab8, name = "Tổng hợp Tuấn Anh IOS", url = "https://raw.githubusercontent.com/AnhDzaiScript/TuanAnhIOSNew/refs/heads/main/TuanAnhIOS-TongHop.Lua"},
    {tab = Tab6, name = "Astra Hub", url = "https://raw.githubusercontent.com/Overgustx2/Main/refs/heads/main/BloxFruits_25.html"},
    {tab = Tab1, name = "FixLag TDT", url = "https://raw.githubusercontent.com/TRANDUYTHINH/scriptdt/refs/heads/main/Output%20(3).lua"},
    {tab = Tab6, name = "Hop Boss(key)", url = "https://raw.githubusercontent.com/Teddyseetink/Haidepzai/refs/heads/main/TEDDYHUB-FREEMIUM"},
    {tab = Tab6, name = "TDT Hub", url = "https://pandadevelopment.net/virtual/file/2a2ea2a6d621379a"},
    {tab = Tab7, name = "KaiTun TDT", url = "https://raw.githubusercontent.com/TRANDUYTHINH/scriptdt/refs/heads/main/7bc2bab10110ef77%20(1).lua"},
    {tab = Tab7, name = "Farm Chest TDT", url = "https://raw.githubusercontent.com/TRANDUYTHINH/scriptdt/refs/heads/main/Output%20(3).lua"},
    {tab = Tab6, name = "TrongNguyen Hub", url = "https://raw.githubusercontent.com/trongdeptraihucscript/Script-BloxFruit/refs/heads/main/TrongNguyenSkidder.lua"},
    {tab = Tab7, name = "Kaitun prehistoric", url = "https://raw.githubusercontent.com/Xero2409/XeroHub/refs/heads/main/main.lua"},
    {tab = Tab0, name = "Violece District pc", url = "https://raw.githubusercontent.com/G06Raider/VD/refs/heads/main/main.lua"},
    {tab = Tab0, name = "violence district pe", url = "https://gist.githubusercontent.com/imhimelnanocruzscript-gif/bd47612c0473adcfe197f3cdc72f8f62/raw/0c570048c6f006b14a2f8ccae65a3d87be6b3dae/gistfile1.txt"},
    {tab = Tab10, name = "Fly animation", url = function()
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
    {tab = Tab10, name = "Sonic Animation", url = "https://pastebin.com/raw/dzAfxfmz"},
    {tab = Tab9, name = "HitBBox", url = "https://pastefy.app/ItfO0tdg/raw"},
    {tab = Tab9, name = "Troll R15", url = "https://raw.githubusercontent.com/Boxten-Keyes/music/refs/heads/main/music%23%5Bscripts%5D/music%23%5Bmiscellaneous%5D/music%23%5Bfe%20r15%20animation%20player%5D.lua"},
    {tab = Tab9, name = "lọ nằm", url = "https://raw.githubusercontent.com/ShutUpJamesTheLoserAlt/fes/refs/heads/main/e"},
    {tab = Tab9, name = "tua ngược", url = "https://mscripts.vercel.app/scfiles/reverse-script.lua"},
    {tab = Tab9, name = "move hand PE", url = "https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty45.lua"},
    {tab = Tab5, name = "Aim", url = "https://apigetunx.vercel.app/UNX.lua"},
    {tab = Tab1, name = "FixLag DucLuong", url = "https://raw.githubusercontent.com/Luongdaynetroi/Free/refs/heads/main/FixLag/roblox/.lua"},
    {tab = Tab9, name = "JumpScare", url = "https://raw.githubusercontent.com/TheqopThe/robax/refs/heads/main/jumpscare.lua"},
    {tab = Tab10, name = "Ghost animation R6", url = function()
        pcall(function()
            local s = game:HttpGet('https://raw.githubusercontent.com/Fe-ProjectR/FE-Files/refs/heads/main/Fe%20gale.lua', true)
            local f = loadstring(s)
            if f then f('cool') end
        end)
    end},
    {tab = Tab10, name = "angle visual", url = "https://raw.githubusercontent.com/nicolasbarbosa323/the-angel/refs/heads/main/The%20Angel.txt"},
    {tab = Tab10, name = "Fly R6", url = "https://gist.githubusercontent.com/JungleScripts/775c6366d91d39fe2633c5805a1d0c23/raw/c8de949402393510a27bcf4482c957b6c3bed2c2/gistfile1.txt"},
    {tab = Tab5, name = "copy console", url = "https://raw.githubusercontent.com/Luongdaynetroi/CopyConsoleF9/refs/heads/main/.lua"},
    {tab = Tab5, name = "keyboard PE", url = "https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"},
    {tab = Tab10, name = "lọ v1", url = function()
        pcall(function()
            local s = game:HttpGet('https://pastefy.app/wa3v2Vgm/raw', true)
            local f = loadstring(s)
            if f then f('Spider Script') end
        end)
    end},
    {tab = Tab10, name = "the flash", url = "https://rawscripts.net/raw/Universal-Script-Wally-West-Roblox-51462"},
    {tab = Tab3, name = "vn hub", url = "https://raw.githubusercontent.com/replit8173/VietnamHub/refs/heads/main/VietnamseHub.lua"},
    {tab = Tab5, name = "GiantFe", url = "https://rawscripts.net/raw/Just-a-baseplate.-Just-A-Baseplate-Huge-Giant-39127"},
    {tab = Tab5, name = "Fling", url = "https://rawscripts.net/raw/Universal-Script-Fling-Gui-Op-47914"},
    {tab = Tab5, name = "invisible FE", url = "https://rawscripts.net/raw/Universal-Script-Awesome-Invisible-man-21074"},
    {tab = Tab1, name = "Fps Boost", url = function()
            -- Lightweight inline setup for GraphicsTuner, then load the remote tuner script.
            pcall(function()
                getgenv().GraphicsTuner = {
                    Settings = {
                        GraphicsDestruction = {
                            RemoveParticles = true,
                            RemoveTrails = true,
                            RemoveBeams = true,
                            RemoveLights = true,
                            RemoveTextures = true,
                            RemoveDecals = true,
                            RemoveClothes = true,
                            RemoveAccessories = true,
                            RemoveSky = true,
                            RemoveAtmosphere = true,
                            RemoveClouds = true,
                            RemovePostEffects = true,
                            MuteSounds = true,
                            DisableExplosions = true,
                        },
                        Graphics = {
                            MinimalQuality = true,
                            NoShadows = true,
                            NoReflections = true,
                            SimplifyMaterials = true,
                            CompatibilityMode = true,
                            FullBright = true,
                            RemoveFog = true,
                        },
                        Performance = {
                            UnlockFPS = true,
                            FPSCap = 999,
                            DevConsoleBoost = true,
                            GarbageCollection = true,
                            GCInterval = 30,
                            ClearNilInstances = true,
                            OptimizePhysics = true,
                            SimplifyMeshes = true,
                            MinimalCollision = true,
                            BatchSize = 1000,
                        },
                        Player = {
                            ProtectSelf = true,
                            SimplifyOthers = false,
                        },
                        Display = {
                            ShowFPS = true,
                            ShowMemory = true,
                            ShowPing = true,
                            ShowDestroyed = true,
                            Position = "TopRight",
                            Transparency = 0.15,
                        }
                    }
                }
                -- Prefer safeLoad if available in this scope, otherwise fallback to direct HttpGet+loadstring
                if type(safeLoad) == "function" then
                    safeLoad("https://raw.githubusercontent.com/Diffone7/r/refs/heads/main/GraphicsTuner/dotrblx")
                else
                    local ok, body = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/Diffone7/r/refs/heads/main/GraphicsTuner/dotrblx", true) end)
                    if ok and type(body) == "string" then
                        local f, e = loadstring(body)
                        if f then pcall(f) end
                    end
                end
            end)
        end},
    {tab = Tab2, name = "H4x", url = "https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua"},
    {tab = Tab4, name = "Blue x", url = "https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/Main.lua"},
    {tab = Tab4, name = "Tokaruun", url = "https://raw.githubusercontent.com/tokaruun/plantvsbrainrot/refs/heads/main/script.lua"},
    {tab = Tab8, name = "HieuDRG", url = "https://raw.githubusercontent.com/phanhieu18032011-rgb/HieuDRG/refs/heads/main/HieuDRGHubtonghop%20(2).lua"},
    {tab = Tab0, name = "77wiki", url = "https://raw.githubusercontent.com/areyourealforme/77wiki/refs/heads/main/violencedistrict.lua"},
    {tab = Tab0, name = "77wiki pre", url = "https://raw.githubusercontent.com/areyourealforme/77wiki/refs/heads/main/premium/violencedistrict.lua"},
    {tab = Tab7, name = "Auto Race Ghoul/Cyborg TDT", url = function()
        getgenv().Team = "Marines"
        getgenv().Hide_UI = false
        _G.Config = {
            Main = {
                ["Auto Start"] = true,
                ["Choose Mode"] = "Auto Ghoul", --// Auto Cyborg
                ["Buy Sword Legendary"] = true,
                ["Buy Haki Color"] = true
            },
            Misc = {
                ["Select Weapon"] = "Melee",
                ["Tweem Speed"] = 350,
                ["FPS Boost"] = false,
                ["Auto Rejoin"] = true,
                ["White Screen"] = false
            }
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TRANDUYTHINH/scriptdt/refs/heads/main/autoracequy-robot.txt"))()
    end},
    {tab = Tab2, name = "Foxname", url = "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"},
    {tab = Tab2, name = "Lan HUB Auto candy lẹ lẹ không fix", url = "https://raw.githubusercontent.com/Wrate/99-Night-In-The-Forest/refs/heads/main/MainLoader"},
    {tab = Tab2, name = "Dupe candy(fast)", url = "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/dupecandyidklol.lua"},
    {tab = Tab5, name = "giant big jacket", url = "https://pastefy.app/nuefMy0Y/raw"},
    {tab = Tab5, name = "emotes UI", url = "https://api.droply.fun/raw/Emotes.lua"},
    {tab = Tab5, name = "Nhấn để copy key emotes UI", url = function()
        setclipboard("DROPLY-88UIP@!") 
    end},
    {tab = Tab5, name = "Tong Hop Aim Game Ban Sung", url = "https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/main.lua"},
    {tab = Tab4, name = "fisch", url = "https://raw.githubusercontent.com/Hjgyhfyh/Scripts-roblox/refs/heads/main/Fish%20Incremental.txt"},
    {tab = Tab6, name = "centrel Universal", url = "https://raw.githubusercontent.com/SC4213/SCS3/refs/heads/main/README.md"},
    {tab = Tab5, name = "CongDongVN tele", url = "https://gist.githubusercontent.com/thienbaogold1211-arch/1bf959b72123225fb99a5fb232453e1d/raw/fe95ac89264ae8d32ff75bb1b3c527387c09fe9b/BDVN2.lua"},
    {tab = Tab2, name = "Meow Gaming Server VIP", url = "https://raw.githubusercontent.com/anuragaming1/Meow_gaming/refs/heads/main/Servervip.lua.txt"},
}

-- Thêm toàn bộ script vô UI
for _, s in ipairs(Scripts) do
    s.tab:AddButton({s.name, makeCallback(s.url, {waitForGame = true})})
end

print("✅ DucLuong Hub (Redz UI) Loaded - yes Key")

]]

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

-- Env check
local player = Players.LocalPlayer
if not player then
    warn("LamVi KeyUI: LocalPlayer chưa sẵn sàng.")
    return
end
local PlayerGui = player:WaitForChild("PlayerGui")

-- File API guard (executor-dependent)
local function canWriteFiles()
    return type(writefile) == "function" and type(isfile) == "function" and type(readfile) == "function"
end

-- Save / Load state (accepted + auto). Uses file if supported, otherwise Player attribute.
local function saveState(state)
    local ok, err
    if canWriteFiles() then
        ok, err = pcall(function()
            writefile(STATE_FILE, HttpService:JSONEncode(state))
        end)
        if not ok then warn("SaveState failed:", err) end
    else
        pcall(function()
            player:SetAttribute("LamVi_KeyUI_state", HttpService:JSONEncode(state))
        end)
    end
end

local function loadState()
    local state = {accepted = false, auto = false}
    if canWriteFiles() and isfile(STATE_FILE) then
        local ok, data = pcall(readfile, STATE_FILE)
        if ok and data and tostring(data) ~= "" then
            pcall(function()
                local t = HttpService:JSONDecode(data)
                if type(t) == "table" then
                    state.accepted = not not t.accepted
                    state.auto = not not t.auto
                end
            end)
        end
    else
        local attr = player:GetAttribute("LamVi_KeyUI_state")
        if attr then
            pcall(function()
                local t = HttpService:JSONDecode(attr)
                if type(t) == "table" then
                    state.accepted = not not t.accepted
                    state.auto = not not t.auto
                end
            end)
        end
    end
    return state
end

-- Save/load actual key (plaintext) if SAVE_KEY_MODE true
local function saveKeyPlain(k)
    if not SAVE_KEY_MODE then return false end
    if canWriteFiles() then
        local ok, err = pcall(function() writefile(SAVE_KEY_FILE, tostring(k)) end)
        if not ok then warn("saveKeyPlain failed:", err) end
        return ok
    else
        -- fallback store in attribute (plaintext) — session only
        pcall(function() player:SetAttribute("LamVi_KeyUI_savedkey", tostring(k)) end)
        return false
    end
end

local function loadSavedKeyPlain()
    if canWriteFiles() and isfile(SAVE_KEY_FILE) then
        local ok, data = pcall(readfile, SAVE_KEY_FILE)
        if ok and data then
            return tostring(data):gsub("^%s*(.-)%s*$", "%1")
        end
        return nil
    else
        local attr = player:GetAttribute("LamVi_KeyUI_savedkey")
        if attr then return tostring(attr):gsub("^%s*(.-)%s*$", "%1") end
        return nil
    end
end

-- safe destroy helper
local function safeDestroy(inst)
    pcall(function() if inst and inst.Parent then inst:Destroy() end end)
end

-- make blur
local blur
pcall(function()
    blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = Lighting
    TweenService:Create(blur, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {Size = 16}):Play()
end)

-- create GUI in PlayerGui
local gui = Instance.new("ScreenGui")
gui.Name = "LamVi_KeyUI_v2_1"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

-- background
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.fromRGB(8,8,10)
bg.BackgroundTransparency = 0.12
bg.BorderSizePixel = 0

local grad = Instance.new("UIGradient", bg)
grad.Rotation = 45
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30,12,60)), -- deep purple
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(48,22,90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(18,60,78))  -- teal-ish
}

-- container (center)
local frame = Instance.new("Frame", bg)
frame.Size = UDim2.new(0, 560, 0, 260)
frame.Position = UDim2.new(0.5, -280, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(18,18,22)
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
local corner = Instance.new("UICorner", frame); corner.CornerRadius = UDim.new(0, 16)
local stroke = Instance.new("UIStroke", frame); stroke.Thickness = 1; stroke.Transparency = 0.6; stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- subtle glow (image)
local glow = Instance.new("ImageLabel", frame)
glow.AnchorPoint = Vector2.new(0.5,0.5)
glow.Position = UDim2.new(0.5, 0, 0.5, 0)
glow.Size = UDim2.new(1,80,1,80)
glow.Image = "rbxassetid://5554236805"
glow.BackgroundTransparency = 1
glow.ImageTransparency = 0.7
glow.ZIndex = -1

-- Title + subtitle
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, -32, 0, 44)
title.Position = UDim2.new(0, 16, 0, 12)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(245,245,250)
title.Text = "Lâm Vĩ KeyUI™ v2.1 — Pro Theme"
title.TextXAlignment = Enum.TextXAlignment.Left

local subtitle = Instance.new("TextLabel", frame)
subtitle.Size = UDim2.new(1, -32, 0, 18)
subtitle.Position = UDim2.new(0, 16, 0, 46)
subtitle.BackgroundTransparency = 1
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 13
subtitle.TextColor3 = Color3.fromRGB(180,180,200)
subtitle.Text = "Nhập key 1 lần. Lần sau chỉ cần nhấn Enter hoặc bật Auto để vô thẳng."

-- left area (input)
local left = Instance.new("Frame", frame)
left.Size = UDim2.new(0.68, -20, 1, -80)
left.Position = UDim2.new(0, 16, 0, 76)
left.BackgroundTransparency = 1

local inputBox = Instance.new("TextBox", left)
inputBox.Size = UDim2.new(1, 0, 0, 50)
inputBox.Position = UDim2.new(0, 0, 0, 0)
inputBox.PlaceholderText = "Nhập key của mày..."
inputBox.BackgroundColor3 = Color3.fromRGB(28,28,36)
inputBox.TextColor3 = Color3.fromRGB(240,240,245)
inputBox.Font = Enum.Font.Gotham
inputBox.TextSize = 18
inputBox.ClearTextOnFocus = false
local inputCorner = Instance.new("UICorner", inputBox); inputCorner.CornerRadius = UDim.new(0,10)
local inputStroke = Instance.new("UIStroke", inputBox); inputStroke.Thickness = 1; inputStroke.Transparency = 0.7

local enterBtn = Instance.new("TextButton", left)
enterBtn.Size = UDim2.new(0.46, 0, 0, 40)
enterBtn.Position = UDim2.new(0.54, 0, 0, 60)
enterBtn.BackgroundColor3 = Color3.fromRGB(90,160,255)
enterBtn.Font = Enum.Font.GothamBold
enterBtn.TextSize = 16
enterBtn.Text = "Nhấn để vô UI"
enterBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", enterBtn).CornerRadius = UDim.new(0,10)
local enterStroke = Instance.new("UIStroke", enterBtn); enterStroke.Thickness = 0.8; enterStroke.Transparency = 0.65

local status = Instance.new("TextLabel", left)
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 0, 110)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(255,120,120)
status.Text = ""

-- right area (auto toggle + hint)
local right = Instance.new("Frame", frame)
right.Size = UDim2.new(0.32, -20, 1, -80)
right.Position = UDim2.new(0.68, 8, 0, 76)
right.BackgroundTransparency = 1

local autoLabel = Instance.new("TextLabel", right)
autoLabel.Size = UDim2.new(1, -8, 0, 22)
autoLabel.Position = UDim2.new(0, 4, 0, 0)
autoLabel.BackgroundTransparency = 1
autoLabel.Font = Enum.Font.Gotham
autoLabel.TextSize = 14
autoLabel.TextColor3 = Color3.fromRGB(210,210,220)
autoLabel.Text = "Auto vào UI khi join"

local autoToggle = Instance.new("TextButton", right)
autoToggle.Size = UDim2.new(0, 120, 0, 36)
autoToggle.Position = UDim2.new(1, -12, 0, 30)
autoToggle.AnchorPoint = Vector2.new(1,0)
autoToggle.BackgroundColor3 = Color3.fromRGB(80,80,90)
autoToggle.Font = Enum.Font.GothamBold
autoToggle.TextSize = 15
autoToggle.Text = "OFF"
autoToggle.TextColor3 = Color3.fromRGB(220,220,220)
Instance.new("UICorner", autoToggle).CornerRadius = UDim.new(0,10)

local autoHint = Instance.new("TextLabel", right)
autoHint.Size = UDim2.new(1, -8, 0, 52)
autoHint.Position = UDim2.new(0, 4, 0, 72)
autoHint.BackgroundTransparency = 1
autoHint.Font = Enum.Font.Gotham
autoHint.TextSize = 13
autoHint.TextColor3 = Color3.fromRGB(170,170,190)
autoHint.Text = "Khi bật, nếu trước đó m đã nhập key, UI sẽ tự chạy khi vào game."

local savedLabel = Instance.new("TextLabel", frame)
savedLabel.Size = UDim2.new(0.46, 0, 0, 18)
savedLabel.Position = UDim2.new(0.52, 0, 0.88, 0)
savedLabel.BackgroundTransparency = 1
savedLabel.Font = Enum.Font.Gotham
savedLabel.TextSize = 12
savedLabel.TextColor3 = Color3.fromRGB(170,170,190)
savedLabel.Text = ""

-- mini UI after accepted
local miniFrame = Instance.new("Frame", gui)
miniFrame.Size = UDim2.new(0, 360, 0, 88)
miniFrame.Position = UDim2.new(0.5, -180, 1.05, 0)
miniFrame.BackgroundColor3 = Color3.fromRGB(20,20,26)
miniFrame.AnchorPoint = Vector2.new(0.5,0)
local miniCorner = Instance.new("UICorner", miniFrame); miniCorner.CornerRadius = UDim.new(0, 12)
miniFrame.Visible = false

local miniLabel = Instance.new("TextLabel", miniFrame)
miniLabel.Size = UDim2.new(1, -20, 0, 28)
miniLabel.Position = UDim2.new(0, 10, 0, 8)
miniLabel.BackgroundTransparency = 1
miniLabel.Font = Enum.Font.Gotham
miniLabel.TextSize = 16
miniLabel.TextColor3 = Color3.fromRGB(235,235,240)
miniLabel.Text = "Đã nhập key trước đó"

local miniBtn = Instance.new("TextButton", miniFrame)
miniBtn.Size = UDim2.new(0.52, -12, 0, 36)
miniBtn.Position = UDim2.new(0.5, 8, 0, 44)
miniBtn.AnchorPoint = Vector2.new(0.5,0)
miniBtn.BackgroundColor3 = Color3.fromRGB(80, 150, 255)
miniBtn.Font = Enum.Font.GothamBold
miniBtn.TextSize = 14
miniBtn.Text = "Enter để vô"
miniBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0,10)

local miniAutoToggle = Instance.new("TextButton", miniFrame)
miniAutoToggle.Size = UDim2.new(0.22, 0, 0, 28)
miniAutoToggle.Position = UDim2.new(1, -12, 0, 8)
miniAutoToggle.AnchorPoint = Vector2.new(1,0)
miniAutoToggle.BackgroundColor3 = Color3.fromRGB(86,86,96)
miniAutoToggle.Font = Enum.Font.GothamBold
miniAutoToggle.TextSize = 12
miniAutoToggle.Text = "OFF"
miniAutoToggle.TextColor3 = Color3.fromRGB(220,220,220)
Instance.new("UICorner", miniAutoToggle).CornerRadius = UDim.new(0,8)

-- toggle visuals helper
local function setToggleVisual(btn, on)
    if on then
        btn.BackgroundColor3 = Color3.fromRGB(80,190,120)
        btn.Text = "ON"
    else
        btn.BackgroundColor3 = Color3.fromRGB(86,86,96)
        btn.Text = "OFF"
    end
end

-- Load previous state + saved key
local state = loadState() -- table {accepted,bool, auto,bool}
local savedKey = loadSavedKeyPlain()
-- If saved key matches CORRECT_KEY then accept
if savedKey and tostring(savedKey) == tostring(CORRECT_KEY) then
    state.accepted = true
end

-- set visuals
setToggleVisual(autoToggle, state.auto)
setToggleVisual(miniAutoToggle, state.auto)
if canWriteFiles() then savedLabel.Text = "Autosave: bật (file supported)" else savedLabel.Text = "Autosave: tắt (session-only)" end

-- safe runner for USER_CODE
local function safeRunUserCode()
    if not USER_CODE or type(USER_CODE) ~= "string" then
        warn("USER_CODE missing or not a string.")
        return
    end
    local loader = loadstring or load
    if type(loader) ~= "function" then
        warn("No loader available in this env.")
        return
    end

    -- destroy GUI + blur safely
    pcall(function()
        if blur and blur.Parent then blur:Destroy() end
        if gui and gui.Parent then gui:Destroy() end
    end)

    -- execute safely
    local ok, err = pcall(function()
        local f, e = loader(USER_CODE)
        if not f then error(e) end
        f()
    end)
    if not ok then
        warn("Error running USER_CODE:", err)
    end
end

-- acceptance flow (enterBtn)
local function acceptKeyFlow()
    pcall(function()
        local raw = tostring(inputBox.Text or "")
        local k = string.gsub(raw, "^%s*(.-)%s*$", "%1")
        if k == tostring(CORRECT_KEY) then
            status.TextColor3 = Color3.fromRGB(120,240,140)
            status.Text = "✔️ Key đúng, đang lưu và load..."
            state.accepted = true
            -- save key if mode on
            if SAVE_KEY_MODE then saveKeyPlain(k) end
            saveState(state)
            -- animate out frame
            pcall(function()
                TweenService:Create(frame, TweenInfo.new(0.45, Enum.EasingStyle.Quad), {Position = UDim2.new(0.5, -280, -0.6, 0)}):Play()
            end)
            task.wait(0.45)
            safeRunUserCode()
        else
            status.TextColor3 = Color3.fromRGB(255,120,120)
            status.Text = "❌ Sai key, thử lại."
            -- small shake
            pcall(function()
                local orig = frame.Position
                TweenService:Create(frame, TweenInfo.new(0.06), {Position = orig + UDim2.new(0,10,0,0)}):Play()
                task.wait(0.06)
                TweenService:Create(frame, TweenInfo.new(0.06), {Position = orig - UDim2.new(0,10,0,0)}):Play()
                task.wait(0.06)
                TweenService:Create(frame, TweenInfo.new(0.06), {Position = orig}):Play()
            end)
        end
    end)
end

-- mini enter flow
local function miniEnterFlow()
    pcall(function()
        miniBtn.Text = "Đang load..."
        miniBtn.Active = false
        task.delay(0.18, function()
            safeRunUserCode()
        end)
    end)
end

-- events
enterBtn.MouseButton1Click:Connect(function() pcall(acceptKeyFlow) end)
miniBtn.MouseButton1Click:Connect(function() pcall(miniEnterFlow) end)
inputBox.FocusLost:Connect(function(enter) if enter then pcall(acceptKeyFlow) end end)

autoToggle.MouseButton1Click:Connect(function()
    state.auto = not state.auto
    setToggleVisual(autoToggle, state.auto)
    setToggleVisual(miniAutoToggle, state.auto)
    saveState(state)
end)
miniAutoToggle.MouseButton1Click:Connect(function()
    state.auto = not state.auto
    setToggleVisual(autoToggle, state.auto)
    setToggleVisual(miniAutoToggle, state.auto)
    saveState(state)
end)

-- initial display behavior
if state.accepted then
    -- show mini UI
    frame.Visible = false
    miniFrame.Visible = true
    pcall(function()
        TweenService:Create(miniFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Position = UDim2.new(0.5, -180, 0.82, -80)}):Play()
    end)
    -- auto run if enabled
    if state.auto then
        task.delay(0.7, function()
            if miniFrame and miniFrame.Parent then pcall(miniEnterFlow) end
        end)
    end
else
    -- normal full UI
    frame.Visible = true
    miniFrame.Visible = false
    pcall(function()
        frame.Position = UDim2.new(0.5, -280, 1.2, 0)
        TweenService:Create(frame, TweenInfo.new(0.7, Enum.EasingStyle.Quint), {Position = UDim2.new(0.5, -280, 0.5, -130)}):Play()
    end)
end

-- cleanup blur on destroy
gui.Destroying:Connect(function()
    pcall(function() if blur and blur.Parent then blur:Destroy() end end)
end)

-- optional: expose function to clear saved key/state (dev)
-- usage: require or paste call to clearSavedState() in executor console to clear
local function clearSavedState()
    pcall(function()
        if canWriteFiles() then
            if isfile(SAVE_KEY_FILE) then pcall(function() writefile(SAVE_KEY_FILE, "") end) end
            if isfile(STATE_FILE) then pcall(function() writefile(STATE_FILE, "") end) end
        else
            player:SetAttribute("LamVi_KeyUI_savedkey", nil)
            player:SetAttribute("LamVi_KeyUI_state", nil)
        end
    end)
end

-- nice done
print("LamVi KeyUI v2.1 loaded. Theme 3 active.")
