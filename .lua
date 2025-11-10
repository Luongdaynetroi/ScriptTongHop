print ("🔑key 123")
local CORRECT_KEY = "123"
local PINK_THEME_KEY = "pink"
local BACK_TO_NORMAL_KEY = "toibingu"
local RAINBOW_THEME_KEY = "rainbow"
local VERSION = "v0.9.7"
local currentTheme = "normal" -- "normal", "pink", or "rainbow"
local pinkSubTheme = "hot" -- "hot" or "pastel"
local effectsEnabled = true -- Toggle for effects
local hologramMode = false -- Hologram mode toggle
local currentLanguage = "vn" -- "vn" or "en"
-- Persistence helpers: save/load key using executor file API when available
local SAVE_FILENAME = "DacCauHub_key.txt"
local THEME_FILENAME = "DacCauHub_theme.txt"
local function canWriteFiles()
    return type(writefile) == "function" and type(isfile) == "function" and type(readfile) == "function"
end
-- simple UI notification helper (best-effort)
local function notify(title, text, duration)
    pcall(function()
        local StarterGui = game:GetService("StarterGui")
        StarterGui:SetCore("SendNotification", {Title = title or "", Text = text or "", Duration = duration or 4})
    end)
end

local function saveKey(k)
    if not canWriteFiles() then
        notify("Lưu key", "Không hỗ trợ lưu file trên executor này.", 4)
        return false
    end
    local success, errorMsg = pcall(function() writefile(SAVE_FILENAME, tostring(k)) end)
    if not success then
        notify("Lưu key thất bại", tostring(errorMsg), 4)
        return false
    end
    notify("Lưu key", "Đã lưu key thành công.", 2)
    return true
end

local function loadSavedKey()
    if not canWriteFiles() then return nil end
    if not isfile(SAVE_FILENAME) then return nil end
    local success, data = pcall(readfile, SAVE_FILENAME)
    if not success or not data or tostring(data):gsub("%s+","")=="" then return nil end
    local s = tostring(data)
    s = string.gsub(s, "^%s*(.-)%s*$", "%1")
    return s
end

local function forgetKey()
    if not canWriteFiles() then
        notify("Xoá key", "Không hỗ trợ xóa file trên executor này.", 4)
        return false
    end
    local success, errorMsg = pcall(function()
        if type(deletefile) == 'function' then
            deletefile(SAVE_FILENAME)
        else
            -- fallback: overwrite with empty content
            writefile(SAVE_FILENAME, "")
        end
    end)
    if not success then
        notify("Xoá key thất bại", tostring(errorMsg), 4)
        return false
    end
    notify("Xoá key", "Đã xoá key.", 2)
    return true
end

local function saveTheme(theme)
    if not canWriteFiles() then
        notify("Lưu theme", "Không hỗ trợ lưu file trên executor này.", 4)
        return false
    end
    local success, errorMsg = pcall(function() writefile(THEME_FILENAME, tostring(theme)) end)
    if not success then
        notify("Lưu theme thất bại", tostring(errorMsg), 4)
        return false
    end
    return true
end

local function loadSavedTheme()
    if not canWriteFiles() then return "normal" end
    if not isfile(THEME_FILENAME) then return "normal" end
    local success, data = pcall(readfile, THEME_FILENAME)
    if not success or not data or tostring(data):gsub("%s+","")=="" then return "normal" end
    local s = tostring(data)
    s = string.gsub(s, "^%s*(.-)%s*$", "%1")
    return s
end

local function forgetTheme()
    if not canWriteFiles() then return false end
    local success, errorMsg = pcall(function()
        if type(deletefile) == 'function' then
            deletefile(THEME_FILENAME)
        else
            writefile(THEME_FILENAME, "")
        end
    end)
    if not success then
        notify("Xoá theme thất bại", tostring(errorMsg), 4)
        return false
    end
    return true
end

-- code của mày (hub tổng hợp) dán vô đây
local USER_CODE = [[
--// Lâm Vĩ Redz V5 Tổng Hợp Hub (No Key)
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/daucobonhi/UiRedzV5/main/DemoUi.lua"))()

local Window = redzlib:MakeWindow({
    Title = "DacCauHub-UPD 10/11",
    SubTitle = "Make by DucLuong KeoCon",
    SaveFolder = "TongHopHubDucLuong",
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://122930541926291", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(0, 6) }
})

local function makeCallback(urlOrFunc, opts)
    -- accepts either a URL string or a function (executed directly)
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
            local success, errorMsg = pcall(urlOrFunc)
            if not success then warn("Callback function error:", errorMsg) end
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
            loadstring(game:HttpGet(urlOrFunc, true))()
        end
    end
end

-- Tabs
local Tab0 = Window:MakeTab({"Horror game", "target"})
local Tab1 = Window:MakeTab({"FixLag", "leaf"})
local Tab2 = Window:MakeTab({"99 Đêm", "moon"})
local Tab3 = Window:MakeTab({"Steal a Brainot", "brain"})
local Tab4 = Window:MakeTab({"Plant vs Brainot/fisch", "tree"})
local Tab5 = Window:MakeTab({"linh tinh", "code"})
local Tab6 = Window:MakeTab({"Blox Fruits", "sword"})
local Tab7 = Window:MakeTab({"Kaitun Blox Fruits", "zap"})
local Tab8 = Window:MakeTab({"Tổng Hợp(Description)", "list"})
local Tab9 = Window:MakeTab({"Misc", "crosshair"})
local Tab10 = Window:MakeTab({"Animation", "game"})
local Tab11 = Window:MakeTab({"aim", "gun"})

-- Bảng chứa toàn bộ script tổng hợp
local Scripts = {
    {tab = Tab11, name = "aim FOV", url = "https://raw.githubusercontent.com/ItsIYce/Iyce/refs/heads/main/main.lua"},
    {tab = Tab5, name = "BRHaveen", url = "https://pastefy.app/d8yUjGW0/raw"},
    {tab = Tab10, name = "mOS(giống IY)", url = "https://raw.githubusercontent.com/formidy/morfOS/refs/heads/main/main.lua"},
    {tab = Tab11, name = "Aim LSM", url = "https://raw.githubusercontent.com/learningpythonuntilimakeanapi-art/lns-hub-free/refs/heads/main/obfuscated%20lns%20free.lua"},
    {tab = Tab6, name = "Thinh Limited", url = "https://raw.githubusercontent.com/thunhchk/thinhlimeted/refs/heads/main/tthinhlimeted.lua"},
    {tab = Tab5, name = "godmode ALL game", url = "https://raw.githubusercontent.com/Rawbr10/Roblox-Scripts/refs/heads/main/God%20Mode%20Script%20Universal"},
    {tab = Tab2, name = "Bất tử 99 đêm", url = "https://raw.githubusercontent.com/ProBaconHub/DATABASE/refs/heads/main/99%20Nights%20in%20the%20Forest/Infinite%20Health.lua"},
    {tab = Tab6, name = "Maru Hub", url = "https://raw.githubusercontent.com/thunhchk/Maruvietsub/refs/heads/main/maruhubthinh.txt"},
    {tab = Tab6, name = "mm2 Tora", url = "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/mm2"},
    {tab = Tab5, name = "MM2 Hub", url = "https://raw.githubusercontent.com/NexusScripts212/Roblox/refs/heads/main/Mm2"},
    {tab = Tab7, name = "Farm Chest Thinh Lo", url = "https://raw.githubusercontent.com/thunhchk/Farmchest/refs/heads/main/thinhtp.txt"},
    {tab = Tab6, name = "Cat Egg v6", url = "https://raw.githubusercontent.com/thunhchk/Categgv6/refs/heads/main/categgv6beta.lua"},
    {tab = Tab2, name = "Speed Hub", url = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"},
    {tab = Tab2, name = "Nhấn để copy key speed hub", url = function() 
        setclipboard("rMChVgMZYJYHMGNtMvYkvDKasUFztRuG") end},
    {tab = Tab9, name = "Hop Server", url = "https://raw.githubusercontent.com/thunhchk/Hopsever/refs/heads/main/categghop.txt"},
    {tab = Tab6, name = "Banana Hub", url = "https://raw.githubusercontent.com/kimprobloxdz/Banana-Free/refs/heads/main/Protected_5609200582002947.lua.txt"},
    {tab = Tab2, name = "Foxname 99 Đêm", url = "https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"},
    {tab = Tab3, name = "Tigy", url = "https://raw.githubusercontent.com/Tigyiscute/tigystealabrainrotscript/refs/heads/main/TigysScript"},
    {tab = Tab4, name = "Saki Hub", url = "https://saki-hub.vercel.app/pvb.lua"},
    {tab = Tab5, name = "Fly Thịnh", url = "https://raw.githubusercontent.com/thunhchk/Flythinh/refs/heads/main/Flythinhv1.lua"},
    {tab = Tab2, name = "99 Đêm Thịnh", url = "https://raw.githubusercontent.com/thunhchk/99nigth/refs/heads/main/99nightthinh.lua"},
    {tab = Tab7, name = "Kaitun Thịnh", url = "https://raw.githubusercontent.com/thunhchk/Kaitunbf/refs/heads/main/thinhkaitunbf.txt"},
    {tab = Tab6, name = "Doremon v2", url = "https://raw.githubusercontent.com/KiddoHiru/BloxFruits/main/MasterHub.lua"},
    {tab = Tab6, name = "Zee Hub", url = "https://zuwz.me/Ls-Zee-Hub"},
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
    {tab = Tab6, name = "Hop Boss(key)", url = function()
    repeat task.wait() until game:IsLoaded() and game:GetService("Players") and game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Teddyseetink/Haidepzai/refs/heads/main/TEDDYHUB-FREEMIUM"))()
    end},
    {tab = Tab6, name = "TDT Hub", url = "https://pandadevelopment.net/virtual/file/2a2ea2a6d621379a"},
    {tab = Tab6, name = "OK hub", url = "https://raw.githubusercontent.com/fakekuri/Okhubhere/refs/heads/main/MainBloxFruit.lua"},
    {tab = Tab7, name = "KaiTun TDT", url = "https://raw.githubusercontent.com/TRANDUYTHINH/scriptdt/refs/heads/main/7bc2bab10110ef77%20(1).lua"},
    {tab = Tab7, name = "Farm Chest TDT", url = "https://raw.githubusercontent.com/TRANDUYTHINH/scriptdt/refs/heads/main/Output%20(5).lua"},
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
    {tab = Tab9, name = "lọ nằm🐿️", url = "https://raw.githubusercontent.com/ShutUpJamesTheLoserAlt/fes/refs/heads/main/e"},
    {tab = Tab9, name = "tua ngược", url = "https://mscripts.vercel.app/scfiles/reverse-script.lua"},
    {tab = Tab9, name = "move hand PE", url = "https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty45.lua"},
    {tab = Tab11, name = "Aim", url = "https://apigetunx.vercel.app/UNX.lua"},
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
    {tab = Tab10, name = "lọ v1🐿️", url = function()
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
                    local success, body = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/Diffone7/r/refs/heads/main/GraphicsTuner/dotrblx", true) end)
                    if success and type(body) == "string" then
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
    {tab = Tab0, name = "TheMiMic", url = "https://raw.githubusercontent.com/Ukrubojvo/AntiLua/run/main.lua"},
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
    {tab = Tab10, name = "emotes UI", url = "https://api.droply.fun/raw/Emotes.lua"},
    {tab = Tab10, name = "Nhấn để copy key emotes UI", url = function()
        setclipboard("DROPLY-88UIP@!") 
    end},
    {tab = Tab11, name = "Description Aim(no safe)", url = "https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/main.lua"},
    {tab = Tab4, name = "fisch 1", url = "https://raw.githubusercontent.com/Hjgyhfyh/Scripts-roblox/refs/heads/main/Fish%20Incremental.txt"},
    {tab = Tab6, name = "centrel Universal", url = "https://raw.githubusercontent.com/SC4213/SCS3/refs/heads/main/README.md"},
    {tab = Tab5, name = "CongDongVN tele", url = "https://gist.githubusercontent.com/thienbaogold1211-arch/1bf959b72123225fb99a5fb232453e1d/raw/fe95ac89264ae8d32ff75bb1b3c527387c09fe9b/BDVN2.lua"},
    {tab = Tab9, name = "hopsever2", url = "https://raw.githubusercontent.com/anuragaming1/Meow_gaming/refs/heads/main/Servervip.lua.txt"},
    {tab = Tab9, name = "Hub lỏ", url = "https://raw.githubusercontent.com/hm5650/Brick/refs/heads/main/Brick.lua"},
    {tab = Tab4, name = "Fish it 1", url = "https://api.junkie-development.de/api/v1/luascripts/public/f9ecec6fa3ba4e7717a62cc0c25915644ad4ad7a01b09afb77a42226210884d7/download"},
    {tab = Tab6, name = "kiwi hub", url = "https://raw.githubusercontent.com/HieuDepTrai-Z/KiwiHubFree/refs/heads/main/KiwiHub.lua"},
    {tab = Tab3, name = "STB", url = "https://raw.githubusercontent.com/RHHJDJGDFJJHDFGJDGHDJHJFUHJFHUFJFHJFH/men-hub-no-fe/refs/heads/main/mennofescript.lua"},
    {tab = Tab8, name = "Funny HUB", url = "https://raw.githubusercontent.com/FoarteBine/MoldovanAdmin/refs/heads/main/main.lua"},
    {tab = Tab4, name = "Fish it 2(keyless)", url = "https://raw.githubusercontent.com/Kenniel123/Fish-It/refs/heads/main/Fish%20It"},
    {tab = Tab11, name = "heitor(rivals)", url = "https://pastebin.com/raw/cbszJ0pm"},
    {tab = Tab8, name = "Tong Hop nhu cac", url = "https://raw.githubusercontent.com/hluuvn/Games/refs/heads/main/Roblox.lua"},
    {tab = Tab0, name = "The Rake", url = "https://raw.githubusercontent.com/ZZINSWARE/The-Rake-Remastered/refs/heads/main/ZZINSWARE"},
    {tab = Tab2, name = "Auto diamond", url = function()
      getgenv().hop = "old"
getgenv().reducelag = true
getgenv().blackscreen = false
getgenv().AutoFarm = false
getgenv().autoexecuter = true
getgenv().WebhookURL = "" --If not used do not write anything
loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameFarmdiamond.lua"))()
        end},
        {tab = Tab2, name = "H4x", url = "https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader.lua"},
    {tab = Tab2, name = "AV hub", url = "https://get-avth-ontop.netlify.app/my-paste/script.lua"},
    {tab = Tab7, name = "Auto Bounty TDT", url = function()
        getgenv().Team = "Marines"
        getgenv().Hide_UI = false
        _G.Config = {
            Main = {
                ["Auto Start"] = true,
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
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TRANDUYTHINH/scriptdt/refs/heads/main/autobounty.txt"))()
    end},
    {tab = Tab7, name = "Quarzty", url = function()
        getgenv().Mode = "OneClick"
getgenv().Setting = {
    ["Team"] = "Pirates", -- Options "Pirates", "Marines"
    ["FucusOnLevel"] = true,
    ["Fruits"] = {  -- setting for fruits u want
        ["Primary"] = { -- if current fruit is not in this list, eat/buy
            "Dough-Dough",
            "Dragon-Dragon",
            "Buddha-Buddha",
            -- u can configs add mores/remove and must end with , (comma symbol)
        },
        ["Normal"] = { -- it just a normal fruit list
            "Flame-Flame",
            "Light-Light",
            "Magma-Magma",
            -- u can configs add mores/remove and must end with , (comma symbol)
        }
        -- run this for get all fruit name `local t={};for _,v in pairs(game.ReplicatedStorage.Remotes.CommF_:InvokeServer("GetFruits"))do table.insert(t,`"{v.Name}"`)end;setclipboard(table.concat(t, "\n"))`
    },
    ["IdleCheck"] = 150, -- every (x) seconds if not moving rejoin
};
loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/QuartyzScript/main/Loader.lua"))()
    end},
    {tab = Tab8, name = "149 script all game", url = "https://pastefy.app/Eo5kbR4u/raw"},
    {tab = Tab8, name = "Skibidi HUB", url = "https://pastefy.app/3wbcKaDv/raw"},
    {tab = Tab3, name = "chili hub", url = "https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"},
    {tab = Tab7, name = "Auto ghoul race v1+v2", url = "https://pandadevelopment.net/virtual/file/98663465d41d463c"},
    {tab = Tab6, name = "Gravity HUB", url = "https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/Main.lua"},
    {tab = Tab1, name = "BloxTrap?", url = function()
        getgenv().autosetup = {
            path = 'Bloxstrap',
            setup = true --> init after installation
        }

        loadstring(game:HttpGet('https://raw.githubusercontent.com/new-qwertyui/Bloxstrap/refs/heads/main/Main/Bloxstrap.lua', true))()
    end},
    {tab = Tab10, name = "fe schlep", url = "https://pastebin.com/raw/U9pCGZSM"},
    {tab = Tab8, name = "BloxSCript", url = "https://github.com/Luongdaynetroi/ScriptTongHop/blob/main/BloxScript"},
    
    
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
local UserInputService = game:GetService("UserInputService")

-- Blur effect với animation mượt hơn
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = Lighting
TweenService:Create(blur, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 20}):Play()

-- ScreenGui
local gui = Instance.new("ScreenGui", CoreGui)
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Name = "LamVi_KeyUI"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Background với gradient đẹp hơn
local bg = Instance.new("Frame", gui)
bg.Size = UDim2.fromScale(1, 1)
bg.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
bg.BackgroundTransparency = 0.2
bg.ZIndex = 0

-- Animated gradient background
local grad = Instance.new("UIGradient", bg)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 15, 35)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 25, 50)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 20, 40))
}
grad.Rotation = 45

-- Color Shift Theme - đổi màu gradient theo thời gian
spawn(function()
    local hue = 0
    while gui.Parent do
        hue = (hue + 1) % 360
        local color1 = Color3.fromHSV(hue / 360, 0.6, 0.15)
        local color2 = Color3.fromHSV((hue + 60) / 360, 0.6, 0.2)
        local color3 = Color3.fromHSV((hue + 120) / 360, 0.6, 0.15)
        grad.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, color1),
            ColorSequenceKeypoint.new(0.5, color2),
            ColorSequenceKeypoint.new(1, color3)
        }
        grad.Rotation = (grad.Rotation + 0.5) % 360
        task.wait(0.05)
    end
end)

-- Dynamic Background Particles
local backgroundParticles = {}
local particleSpeed = 1
spawn(function()
    for i = 1, 20 do
        local particle = Instance.new("Frame", bg)
        particle.Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6))
        particle.Position = UDim2.new(0, math.random(0, 1920), 0, math.random(0, 1080))
        particle.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
        particle.BackgroundTransparency = 0.7
        particle.BorderSizePixel = 0
        particle.ZIndex = 0
        Instance.new("UICorner", particle).CornerRadius = UDim.new(0, 2)
        
        local velocityX = math.random(-50, 50)
        local velocityY = math.random(-50, 50)
        
        table.insert(backgroundParticles, {
            frame = particle,
            vx = velocityX,
            vy = velocityY
        })
    end
    
    while gui.Parent do
        for _, p in ipairs(backgroundParticles) do
            if p.frame.Parent then
                local currentPos = p.frame.Position
                local newX = currentPos.X.Offset + p.vx * particleSpeed * 0.1
                local newY = currentPos.Y.Offset + p.vy * particleSpeed * 0.1
                
                -- Wrap around screen
                if newX > 1920 then newX = 0 end
                if newX < 0 then newX = 1920 end
                if newY > 1080 then newY = 0 end
                if newY < 0 then newY = 1080 end
                
                p.frame.Position = UDim2.new(0, newX, 0, newY)
            end
        end
        task.wait(0.02)
    end
end)

-- Function to speed up particles (khi nhập đúng key)
local function speedUpParticles()
    particleSpeed = 5
    spawn(function()
        task.wait(2)
        particleSpeed = 1
    end)
end

-- Main frame với shadow đẹp hơn
local frame = Instance.new("Frame", bg)
frame.Size = UDim2.new(0, 480, 0, 320)
frame.Position = UDim2.new(0.5, -240, 0.5, -160)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1
frame.ClipsDescendants = true
frame.ZIndex = 1
local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 18)

-- Holographic Effect - Scan lines
local scanLine = Instance.new("Frame", frame)
scanLine.Size = UDim2.new(1, 0, 0, 2)
scanLine.Position = UDim2.new(0, 0, 0, 0)
scanLine.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
scanLine.BackgroundTransparency = 0.8
scanLine.BorderSizePixel = 0
scanLine.ZIndex = 20
scanLine.Visible = false

spawn(function()
    while frame.Parent do
        if scanLine.Visible then
            scanLine.Position = UDim2.new(0, 0, 0, 0)
            TweenService:Create(scanLine, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                Position = UDim2.new(0, 0, 1, 0)
            }):Play()
            task.wait(2)
        else
            task.wait(0.1)
        end
    end
end)

-- Neon Glow Pulse
local neonGlow = Instance.new("UIStroke", frame)
neonGlow.Color = Color3.fromRGB(100, 150, 255)
neonGlow.Thickness = 3
neonGlow.Transparency = 0.5
neonGlow.LineJoinMode = Enum.LineJoinMode.Round

spawn(function()
    while frame.Parent do
        TweenService:Create(neonGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 0.2,
            Thickness = 4
        }):Play()
        task.wait(1.5)
        TweenService:Create(neonGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 0.5,
            Thickness = 3
        }):Play()
        task.wait(1.5)
    end
end)

-- Border glow effect
local borderGlow = Instance.new("UIStroke", frame)
borderGlow.Color = Color3.fromRGB(100, 150, 255)
borderGlow.Thickness = 2
borderGlow.Transparency = 0.7
borderGlow.LineJoinMode = Enum.LineJoinMode.Round

-- Animate border glow
spawn(function()
    while frame.Parent do
        TweenService:Create(borderGlow, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.3}):Play()
        task.wait(2)
        TweenService:Create(borderGlow, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.7}):Play()
        task.wait(2)
    end
end)

-- Enhanced shadow
local shadow = Instance.new("ImageLabel", frame)
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
shadow.Size = UDim2.new(1, 50, 1, 50)
shadow.Image = "rbxassetid://5554236805"
shadow.ImageTransparency = 0.5
shadow.BackgroundTransparency = 1
shadow.ZIndex = -1

-- Title với gradient text
local titleBg = Instance.new("Frame", frame)
titleBg.Size = UDim2.new(1, 0, 0, 60)
titleBg.Position = UDim2.new(0, 0, 0, 0)
titleBg.BackgroundTransparency = 1
titleBg.ZIndex = 2

local title = Instance.new("TextLabel", titleBg)
title.Text = ""
title.Font = Enum.Font.GothamBold
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 0, 0, 15)
title.Size = UDim2.new(1, 0, 0, 35)
title.ZIndex = 3

-- Glow Text Effect
local titleGlow = Instance.new("UIStroke", title)
titleGlow.Color = Color3.fromRGB(100, 150, 255)
titleGlow.Thickness = 2
titleGlow.Transparency = 0.5
titleGlow.LineJoinMode = Enum.LineJoinMode.Round

spawn(function()
    while title.Parent do
        TweenService:Create(titleGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 0.2,
            Thickness = 3
        }):Play()
        task.wait(1.5)
        TweenService:Create(titleGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Transparency = 0.5,
            Thickness = 2
        }):Play()
        task.wait(1.5)
    end
end)

-- Gradient Text Animation
local titleGradient = Instance.new("UIGradient", title)
titleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
}

spawn(function()
    local offset = 0
    while title.Parent do
        offset = (offset + 0.02) % 1
        titleGradient.Offset = Vector2.new(offset - 0.5, 0)
        task.wait(0.05)
    end
end)

-- Typing effect cho title
local titleText = "🔐 Nhập Key Truy Cập"
spawn(function()
    for i = 1, #titleText do
        title.Text = titleText:sub(1, i)
        task.wait(0.05)
    end
end)

-- Language Toggle Button
local languageBtn = Instance.new("TextButton", titleBg)
languageBtn.Size = UDim2.new(0, 30, 0, 20)
languageBtn.Position = UDim2.new(1, -35, 0, 5)
languageBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
languageBtn.Text = currentLanguage == "vn" and "VN" or "EN"
languageBtn.Font = Enum.Font.GothamBold
languageBtn.TextSize = 12
languageBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
languageBtn.AutoButtonColor = false
languageBtn.ZIndex = 4
Instance.new("UICorner", languageBtn).CornerRadius = UDim.new(0, 6)

languageBtn.MouseButton1Click:Connect(function()
    currentLanguage = currentLanguage == "vn" and "en" or "vn"
    languageBtn.Text = currentLanguage == "vn" and "VN" or "EN"

    -- Update all text elements based on language
    if currentLanguage == "vn" then
        title.Text = "🔐 Nhập Key Truy Cập"
        box.PlaceholderText = "Nhập key của bạn..."
        subtitle.Text = "DacCauHub - Make by DucLuong • " .. VERSION
        btn.Text = "Xác Nhận"
        discordBtn.Text = "📋 Copy Discord Invite Link"
        discordDesc.Text = "Tải script miễn phí, hỗ trợ & cập nhật"
        rememberMeLabel.Text = "Ghi nhớ key"
        feedbackTitle.Text = "💬 Góp ý & Phản hồi"
        feedbackBox.PlaceholderText = "Nhập góp ý của bạn,game bạn muốn thêm?"
        feedbackBtn.Text = "📤 Gửi góp ý"
        -- Update tooltips
        toggleTooltip.Text = "Bật/Tắt Hiệu Ứng"
        hologramTooltip.Text = "Chế Độ Hologram"
        pinkSubThemeTooltip.Text = "Sub-Theme Hồng"
        colorPickerTooltip.Text = "Màu Tùy Chỉnh"
        matrixRainTooltip.Text = "Mưa Matrix"
        discordTooltip.Text = "Tham gia cộng đồng script miễn phí"
        colorPickerTitle.Text = "Chọn Màu Tùy Chỉnh"
        -- Update existing status text
        status.Text = status.Text:gsub("Valid key", "Key hợp lệ"):gsub("Invalid key", "Key không hợp lệ"):gsub("Copied", "Đã copy"):gsub("Failed", "Thất bại"):gsub("Correct key, loading", "Key đúng, đang load"):gsub("Wrong key", "Sai key"):gsub("Please enter a key", "Vui lòng nhập key"):gsub("Switched to pink theme", "Đã chuyển sang theme hồng"):gsub("Rainbow Mode activated", "Đã bật Rainbow Mode"):gsub("Cyberpunk Mode activated", "Đã bật Cyberpunk Mode"):gsub("Back to normal theme", "Quay lại theme ban đầu"):gsub("Saved key, loading", "Key đã lưu, đang load"):gsub("Key copied", "Đã copy key"):gsub("Cannot copy", "Không thể copy"):gsub("No key to copy", "Không có key để copy"):gsub("Opening Discord", "Đang mở Discord"):gsub("Cannot open Discord", "Không thể mở Discord"):gsub("Failed to copy link", "Không thể copy link"):gsub("Discord link copied", "Đã copy link Discord")
    else
        title.Text = "🔐 Enter Access Key"
        box.PlaceholderText = "Enter your key..."
        subtitle.Text = "DacCauHub - Made by DucLuong • " .. VERSION
        btn.Text = "Confirm"
        discordBtn.Text = "📋 Copy Discord Invite Link"
        discordDesc.Text = "Get free scripts, support & updates"
        rememberMeLabel.Text = "Remember key"
        feedbackTitle.Text = "💬 Feedback & Suggestions"
        feedbackBox.PlaceholderText = "Enter your feedback..."
        feedbackBtn.Text = "📤 Send Feedback"
        -- Update tooltips
        toggleTooltip.Text = "Toggle Effects"
        hologramTooltip.Text = "Toggle Hologram"
        pinkSubThemeTooltip.Text = "Pink Sub-Theme"
        colorPickerTooltip.Text = "Custom Colors"
        matrixRainTooltip.Text = "Matrix Rain"
        discordTooltip.Text = "Join community Free cilent nokey and script"
        colorPickerTitle.Text = "Choose Custom Color"
        -- Update existing status text
        status.Text = status.Text:gsub("Key hợp lệ", "Valid key"):gsub("Key không hợp lệ", "Invalid key"):gsub("Đã copy", "Copied"):gsub("Thất bại", "Failed"):gsub("Key đúng, đang load", "Correct key, loading"):gsub("Sai key", "Wrong key"):gsub("Vui lòng nhập key", "Please enter a key"):gsub("Đã chuyển sang theme hồng", "Switched to pink theme"):gsub("Đã bật Rainbow Mode", "Rainbow Mode activated"):gsub("Đã bật Cyberpunk Mode", "Cyberpunk Mode activated"):gsub("Quay lại theme ban đầu", "Back to normal theme"):gsub("Key đã lưu, đang load", "Saved key, loading"):gsub("Đã copy key", "Key copied"):gsub("Không thể copy", "Cannot copy"):gsub("Không có key để copy", "No key to copy"):gsub("Đang mở Discord", "Opening Discord"):gsub("Không thể mở Discord", "Cannot open Discord"):gsub("Không thể copy link", "Failed to copy link"):gsub("Đã copy link Discord", "Discord link copied")
    end

end)

-- Subtitle với version
local subtitle = Instance.new("TextLabel", titleBg)
subtitle.Text = "DacCauHub - Make by DucLuong • " .. VERSION
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 13
subtitle.TextColor3 = Color3.fromRGB(180, 180, 200)
subtitle.BackgroundTransparency = 1
subtitle.Position = UDim2.new(0, 0, 1, -20)
subtitle.Size = UDim2.new(0.9, 0, 0, 18)
subtitle.ZIndex = 3

-- Combined Effects Button (gộp Toggle Effects, Hologram Mode, Matrix Rain)
local effectsBtn = Instance.new("TextButton", frame)
effectsBtn.Size = UDim2.new(0, 40, 0, 40)
effectsBtn.Position = UDim2.new(0, 10, 0, 10)
effectsBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
effectsBtn.Text = "⚡"
effectsBtn.Font = Enum.Font.GothamBold
effectsBtn.TextSize = 20
effectsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
effectsBtn.AutoButtonColor = false
effectsBtn.ZIndex = 15
Instance.new("UICorner", effectsBtn).CornerRadius = UDim.new(0, 8)

-- Thêm tooltip cho combined effects button
local effectsTooltip = Instance.new("TextLabel", effectsBtn)
effectsTooltip.Size = UDim2.new(0, 180, 0, 25)
effectsTooltip.Position = UDim2.new(0.5, 0, -1.2, 0)
effectsTooltip.AnchorPoint = Vector2.new(0.5, 0)
effectsTooltip.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
effectsTooltip.Text = "Toggle Effects/Hologram/Matrix"
effectsTooltip.TextColor3 = Color3.fromRGB(255, 255, 255)
effectsTooltip.TextSize = 12
effectsTooltip.Font = Enum.Font.Gotham
effectsTooltip.BackgroundTransparency = 0.1
effectsTooltip.Visible = false
effectsTooltip.ZIndex = 20
Instance.new("UICorner", effectsTooltip).CornerRadius = UDim.new(0, 6)

-- Effects button glow
local effectsGlow = Instance.new("UIStroke", effectsBtn)
effectsGlow.Color = Color3.fromRGB(100, 150, 255)
effectsGlow.Thickness = 2
effectsGlow.Transparency = 0.5

effectsBtn.MouseButton1Click:Connect(function()
    -- Cycle through modes: Normal -> Effects -> Hologram -> Matrix -> Normal
    if not effectsEnabled and not hologramMode and not matrixRainEnabled then
        -- Enable Effects
        effectsEnabled = true
        hologramMode = false
        matrixRainEnabled = false
        effectsBtn.Text = "⚡"
        effectsGlow.Color = Color3.fromRGB(100, 150, 255)
    elseif effectsEnabled and not hologramMode and not matrixRainEnabled then
        -- Enable Hologram
        effectsEnabled = false
        hologramMode = true
        matrixRainEnabled = false
        effectsBtn.Text = "👁️"
        effectsGlow.Color = Color3.fromRGB(0, 255, 255)
    elseif not effectsEnabled and hologramMode and not matrixRainEnabled then
        -- Enable Matrix Rain
        effectsEnabled = false
        hologramMode = false
        matrixRainEnabled = true
        effectsBtn.Text = "🌧️"
        effectsGlow.Color = Color3.fromRGB(0, 255, 100)
    else
        -- Back to Normal
        effectsEnabled = false
        hologramMode = false
        matrixRainEnabled = false
        effectsBtn.Text = "❌"
        effectsGlow.Color = Color3.fromRGB(255, 100, 100)
    end

    -- Apply effects
    if effectsEnabled then
        scanLine.Visible = (currentTheme == "pink" or currentTheme == "cyberpunk")
        for _, p in ipairs(backgroundParticles) do
            if p.frame.Parent then
                p.frame.Visible = true
                p.frame.Size = UDim2.new(0, math.random(3, 6), 0, math.random(3, 6))
            end
        end
        for _, col in ipairs(matrixColumns) do
            if col.label.Parent then
                col.label.Visible = false
                col.label.TextTransparency = 1
            end
        end
    elseif hologramMode then
        scanLine.Visible = true
        neonGlow.Thickness = 6
        neonGlow.Color = Color3.fromRGB(0, 255, 255)
        frame.BackgroundTransparency = 0.3
        for _, p in ipairs(backgroundParticles) do
            if p.frame.Parent then
                p.frame.Visible = false
                p.frame.Size = UDim2.new(0, 1, 0, 1)
            end
        end
        for _, col in ipairs(matrixColumns) do
            if col.label.Parent then
                col.label.Visible = false
                col.label.TextTransparency = 1
            end
        end
        -- Add hologram particles
        for i = 1, 10 do
            spawn(function()
                local holoParticle = Instance.new("Frame", frame)
                holoParticle.Size = UDim2.new(0, 2, 0, math.random(20, 40))
                holoParticle.Position = UDim2.new(math.random(), 0, math.random(), 0)
                holoParticle.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
                holoParticle.BackgroundTransparency = 0.5
                holoParticle.BorderSizePixel = 0
                holoParticle.ZIndex = 2
                Instance.new("UICorner", holoParticle).CornerRadius = UDim.new(0, 1)

                local startTime = tick()
                while hologramMode and holoParticle.Parent do
                    local elapsed = tick() - startTime
                    holoParticle.BackgroundTransparency = 0.5 + math.sin(elapsed * 5) * 0.3
                    task.wait(0.1)
                end
                holoParticle:Destroy()
            end)
        end
    elseif matrixRainEnabled then
        scanLine.Visible = false
        neonGlow.Thickness = 3
        neonGlow.Color = Color3.fromRGB(100, 150, 255)
        frame.BackgroundTransparency = 0.1
        for _, p in ipairs(backgroundParticles) do
            if p.frame.Parent then
                p.frame.Visible = false
                p.frame.Size = UDim2.new(0, 1, 0, 1)
            end
        end
        for _, col in ipairs(matrixColumns) do
            if col.label.Parent then
                col.label.Visible = true
                col.label.TextTransparency = 0.5
            end
        end
    else
        -- Disable all
        scanLine.Visible = false
        neonGlow.Thickness = 3
        neonGlow.Color = Color3.fromRGB(100, 150, 255)
        frame.BackgroundTransparency = 0.1
        for _, p in ipairs(backgroundParticles) do
            if p.frame.Parent then
                p.frame.Visible = false
                p.frame.Size = UDim2.new(0, 1, 0, 1)
            end
        end
        for _, col in ipairs(matrixColumns) do
            if col.label.Parent then
                col.label.Visible = false
                col.label.TextTransparency = 1
            end
        end
    end
end)

-- Hover effect for combined effects button
effectsBtn.MouseEnter:Connect(function()
    local tween1Success, tween1Error = pcall(function()
        TweenService:Create(effectsBtn, TweenInfo.new(0.2), {Size = UDim2.new(0, 45, 0, 45)}):Play()
    end)
    if not tween1Success then
        effectsBtn.Size = UDim2.new(0, 45, 0, 45)
    end

    if effectsGlow then
        local tween2Success, tween2Error = pcall(function()
            TweenService:Create(effectsGlow, TweenInfo.new(0.2), {Transparency = 0.2}):Play()
        end)
        if not tween2Success then
            effectsGlow.Transparency = 0.2
        end
    end

    -- Show tooltip
    if effectsTooltip then
        effectsTooltip.Visible = true
    end
end)

effectsBtn.MouseLeave:Connect(function()
    local tween1Success, tween1Error = pcall(function()
        TweenService:Create(effectsBtn, TweenInfo.new(0.2), {Size = UDim2.new(0, 40, 0, 40)}):Play()
    end)
    if not tween1Success then
        effectsBtn.Size = UDim2.new(0, 40, 0, 40)
    end

    if effectsGlow then
        local tween2Success, tween2Error = pcall(function()
            TweenService:Create(effectsGlow, TweenInfo.new(0.2), {Transparency = 0.5}):Play()
        end)
        if not tween2Success then
            effectsGlow.Transparency = 0.5
        end
    end

    -- Hide tooltip
    if effectsTooltip then
        effectsTooltip.Visible = false
    end
end)

-- Color Picker Button (right side) - cải thiện UX
local colorPickerBtn = Instance.new("TextButton", frame)
colorPickerBtn.Size = UDim2.new(0, 40, 0, 40)
colorPickerBtn.Position = UDim2.new(1, -50, 0, 10)
colorPickerBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
colorPickerBtn.Text = "🎨"
colorPickerBtn.Font = Enum.Font.GothamBold
colorPickerBtn.TextSize = 20
colorPickerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
colorPickerBtn.AutoButtonColor = false
colorPickerBtn.ZIndex = 15
Instance.new("UICorner", colorPickerBtn).CornerRadius = UDim.new(0, 8)

-- Thêm tooltip cho color picker button
local colorPickerTooltip = Instance.new("TextLabel", colorPickerBtn)
colorPickerTooltip.Size = UDim2.new(0, 140, 0, 25)
colorPickerTooltip.Position = UDim2.new(0.5, 0, -1.2, 0)
colorPickerTooltip.AnchorPoint = Vector2.new(0.5, 0)
colorPickerTooltip.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
colorPickerTooltip.Text = "Custom Colors"
colorPickerTooltip.TextColor3 = Color3.fromRGB(255, 255, 255)
colorPickerTooltip.TextSize = 12
colorPickerTooltip.Font = Enum.Font.Gotham
colorPickerTooltip.BackgroundTransparency = 0.1
colorPickerTooltip.Visible = false
colorPickerTooltip.ZIndex = 20
Instance.new("UICorner", colorPickerTooltip).CornerRadius = UDim.new(0, 6)

-- Color picker button glow
local colorPickerGlow = Instance.new("UIStroke", colorPickerBtn)
colorPickerGlow.Color = Color3.fromRGB(100, 150, 255)
colorPickerGlow.Thickness = 2
colorPickerGlow.Transparency = 0.5


-- Color Picker Popup
local colorPickerPopup = Instance.new("Frame", gui)
colorPickerPopup.Size = UDim2.new(0, 300, 0, 200)
colorPickerPopup.Position = UDim2.new(0.5, -150, 0.5, -100)
colorPickerPopup.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
colorPickerPopup.BorderSizePixel = 0
colorPickerPopup.ZIndex = 20
colorPickerPopup.Visible = false
Instance.new("UICorner", colorPickerPopup).CornerRadius = UDim.new(0, 12)

-- Color picker title
local colorPickerTitle = Instance.new("TextLabel", colorPickerPopup)
colorPickerTitle.Size = UDim2.new(1, 0, 0, 30)
colorPickerTitle.Position = UDim2.new(0, 0, 0, 0)
colorPickerTitle.BackgroundTransparency = 1
colorPickerTitle.Text = "Chọn Màu Tùy Chỉnh"
colorPickerTitle.Font = Enum.Font.GothamBold
colorPickerTitle.TextSize = 16
colorPickerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
colorPickerTitle.ZIndex = 21

-- Color grid
local colorGrid = Instance.new("Frame", colorPickerPopup)
colorGrid.Size = UDim2.new(0.9, 0, 0, 120)
colorGrid.Position = UDim2.new(0.05, 0, 0, 35)
colorGrid.BackgroundTransparency = 1
colorGrid.ZIndex = 21

local colors = {
    Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 165, 0), Color3.fromRGB(255, 255, 0),
    Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255), Color3.fromRGB(75, 0, 130),
    Color3.fromRGB(238, 130, 238), Color3.fromRGB(255, 20, 147), Color3.fromRGB(0, 255, 255),
    Color3.fromRGB(255, 255, 255), Color3.fromRGB(128, 128, 128), Color3.fromRGB(0, 0, 0)
}

local selectedColor = Color3.fromRGB(100, 150, 255)
local colorButtons = {}

for i, color in ipairs(colors) do
    local colorBtn = Instance.new("TextButton", colorGrid)
    colorBtn.Size = UDim2.new(0, 30, 0, 30)
    colorBtn.Position = UDim2.new(0, ((i-1) % 4) * 35, 0, math.floor((i-1) / 4) * 35)
    colorBtn.BackgroundColor3 = color
    colorBtn.Text = ""
    colorBtn.AutoButtonColor = false
    colorBtn.ZIndex = 22
    Instance.new("UICorner", colorBtn).CornerRadius = UDim.new(0, 4)

    colorBtn.MouseButton1Click:Connect(function()
        selectedColor = color
        -- Update selection border
        for _, btn in ipairs(colorButtons) do
            btn.BorderSizePixel = 0
        end
        colorBtn.BorderSizePixel = 2
        colorBtn.BorderColor3 = Color3.fromRGB(255, 255, 255)
    end)

    table.insert(colorButtons, colorBtn)
end

-- OK Button
local okBtn = Instance.new("TextButton", colorPickerPopup)
okBtn.Size = UDim2.new(0, 80, 0, 30)
okBtn.Position = UDim2.new(0.5, -40, 1, -35)
okBtn.BackgroundColor3 = Color3.fromRGB(70, 140, 255)
okBtn.Text = "OK"
okBtn.Font = Enum.Font.GothamBold
okBtn.TextSize = 14
okBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
okBtn.AutoButtonColor = false
okBtn.ZIndex = 21
Instance.new("UICorner", okBtn).CornerRadius = UDim.new(0, 6)

okBtn.MouseButton1Click:Connect(function()
    -- Apply selected color to current theme elements
    neonGlow.Color = selectedColor
    inputBorder.Color = selectedColor
    btn.BackgroundColor3 = selectedColor
    btnGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, selectedColor),
        ColorSequenceKeypoint.new(1, Color3.new(selectedColor.R * 0.8, selectedColor.G * 0.8, selectedColor.B * 0.8))
    }
    titleGlow.Color = selectedColor

    -- Update particles
    for _, p in ipairs(backgroundParticles) do
        if p.frame.Parent then
            p.frame.BackgroundColor3 = selectedColor
        end
    end

    -- Update sound waves
    for _, wave in ipairs(soundWaves) do
        if wave.Parent then
            wave.BackgroundColor3 = selectedColor
        end
    end

    colorPickerPopup.Visible = false
end)

colorPickerBtn.MouseButton1Click:Connect(function()
    colorPickerPopup.Visible = not colorPickerPopup.Visible
end)

-- Hover effect for color picker button (cải thiện UX với tooltip)
colorPickerBtn.MouseEnter:Connect(function()
    local tween1Success, tween1Error = pcall(function()
        TweenService:Create(colorPickerBtn, TweenInfo.new(0.2), {Size = UDim2.new(0, 45, 0, 45)}):Play()
    end)
    if not tween1Success then
        colorPickerBtn.Size = UDim2.new(0, 45, 0, 45)
    end

    if colorPickerGlow then
        local tween2Success, tween2Error = pcall(function()
            TweenService:Create(colorPickerGlow, TweenInfo.new(0.2), {Transparency = 0.2}):Play()
        end)
        if not tween2Success then
            colorPickerGlow.Transparency = 0.2
        end
    end

    -- Show tooltip
    if colorPickerTooltip then
        colorPickerTooltip.Visible = true
    end
end)

colorPickerBtn.MouseLeave:Connect(function()
    local tween1Success, tween1Error = pcall(function()
        TweenService:Create(colorPickerBtn, TweenInfo.new(0.2), {Size = UDim2.new(0, 40, 0, 40)}):Play()
    end)
    if not tween1Success then
        colorPickerBtn.Size = UDim2.new(0, 40, 0, 40)
    end

    if colorPickerGlow then
        local tween2Success, tween2Error = pcall(function()
            TweenService:Create(colorPickerGlow, TweenInfo.new(0.2), {Transparency = 0.5}):Play()
        end)
        if not tween2Success then
            colorPickerGlow.Transparency = 0.5
        end
    end

    -- Hide tooltip
    if colorPickerTooltip then
        colorPickerTooltip.Visible = false
    end
end)
subtitle.Size = UDim2.new(1, 0, 0, 18)
subtitle.ZIndex = 3

-- Unlock Icon (ẩn mặc định, chỉ hiện khi unlock)
local unlockIcon = Instance.new("TextLabel", frame)
unlockIcon.Size = UDim2.new(0, 60, 0, 60)
unlockIcon.Position = UDim2.new(0.5, -30, 0.5, -30)
unlockIcon.BackgroundTransparency = 1
unlockIcon.Text = "🔒"
unlockIcon.Font = Enum.Font.GothamBold
unlockIcon.TextSize = 40
unlockIcon.TextColor3 = Color3.fromRGB(255, 255, 255)
unlockIcon.ZIndex = 15
unlockIcon.Visible = false

-- Unlock Animation Function
local function playUnlockAnimation()
    unlockIcon.Visible = true
    unlockIcon.Text = "🔒"
    unlockIcon.Rotation = 0
    unlockIcon.Size = UDim2.new(0, 60, 0, 60)
    unlockIcon.Position = UDim2.new(0.5, -30, 0.5, -30)
    
    -- Rotate và scale
    TweenService:Create(unlockIcon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Rotation = 360,
        Size = UDim2.new(0, 80, 0, 80)
    }):Play()
    
    task.wait(0.3)
    
    -- Change to unlocked
    unlockIcon.Text = "🔓"
    unlockIcon.TextColor3 = Color3.fromRGB(100, 255, 120)
    
    -- Pulse effect
    TweenService:Create(unlockIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 100, 0, 100)
    }):Play()
    task.wait(0.2)
    TweenService:Create(unlockIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 60, 0, 60)
    }):Play()
    
    task.wait(0.5)
    unlockIcon.Visible = false
end

-- Key Strength Meter
local strengthMeterContainer = Instance.new("Frame", frame)
strengthMeterContainer.Size = UDim2.new(0.88, 0, 0, 4)
strengthMeterContainer.Position = UDim2.new(0.06, 0, 0.32, 0)
strengthMeterContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
strengthMeterContainer.BorderSizePixel = 0
strengthMeterContainer.Visible = false
strengthMeterContainer.ZIndex = 2
Instance.new("UICorner", strengthMeterContainer).CornerRadius = UDim.new(0, 2)

local strengthMeter = Instance.new("Frame", strengthMeterContainer)
strengthMeter.Size = UDim2.new(0, 0, 1, 0)
strengthMeter.Position = UDim2.new(0, 0, 0, 0)
strengthMeter.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
strengthMeter.BorderSizePixel = 0
strengthMeter.ZIndex = 3
Instance.new("UICorner", strengthMeter).CornerRadius = UDim.new(0, 2)

-- Input container với border
local inputContainer = Instance.new("Frame", frame)
inputContainer.Size = UDim2.new(0.88, 0, 0, 50)
inputContainer.Position = UDim2.new(0.06, 0, 0.35, 0)
inputContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
inputContainer.BorderSizePixel = 0
inputContainer.ZIndex = 2
local inputCorner = Instance.new("UICorner", inputContainer)
inputCorner.CornerRadius = UDim.new(0, 12)

-- Input border glow
local inputBorder = Instance.new("UIStroke", inputContainer)
inputBorder.Color = Color3.fromRGB(80, 120, 200)
inputBorder.Thickness = 1.5
inputBorder.Transparency = 0.6

-- Key Encryption Visualization
local keyDisplay = Instance.new("TextLabel", inputContainer)
keyDisplay.Size = UDim2.new(0.95, 0, 0.8, 0)
keyDisplay.Position = UDim2.new(0.025, 0, 0.1, 0)
keyDisplay.BackgroundTransparency = 1
keyDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
keyDisplay.Font = Enum.Font.Gotham
keyDisplay.TextSize = 18
keyDisplay.Text = ""
keyDisplay.ZIndex = 4
keyDisplay.Visible = false

-- Sound Wave Visualization (khai báo trước)
local soundWaveContainer = Instance.new("Frame", inputContainer)
soundWaveContainer.Size = UDim2.new(0.9, 0, 0, 20)
soundWaveContainer.Position = UDim2.new(0.05, 0, 1, 5)
soundWaveContainer.BackgroundTransparency = 1
soundWaveContainer.Visible = false
soundWaveContainer.ZIndex = 5

local soundWaves = {}
for i = 1, 10 do
    local wave = Instance.new("Frame", soundWaveContainer)
    wave.Size = UDim2.new(0, 3, 0, 0)
    wave.Position = UDim2.new(0, i * 8, 0.5, 0)
    wave.AnchorPoint = Vector2.new(0.5, 0.5)
    wave.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
    wave.BorderSizePixel = 0
    wave.ZIndex = 6
    Instance.new("UICorner", wave).CornerRadius = UDim.new(0, 2)
    table.insert(soundWaves, wave)
end

-- Input container buttons (thêm các nút tiện ích bên phải input)
local inputButtonsContainer = Instance.new("Frame", inputContainer)
inputButtonsContainer.Size = UDim2.new(0, 120, 0, 50)
inputButtonsContainer.Position = UDim2.new(1, 10, 0, 0)
inputButtonsContainer.BackgroundTransparency = 1
inputButtonsContainer.ZIndex = 4

-- Reset UI Button
local resetUIBtn = Instance.new("TextButton", inputButtonsContainer)
resetUIBtn.Size = UDim2.new(0, 25, 0, 25)
resetUIBtn.Position = UDim2.new(0, 0, 0, 0)
resetUIBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
resetUIBtn.Text = "🔄"
resetUIBtn.Font = Enum.Font.GothamBold
resetUIBtn.TextSize = 14
resetUIBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
resetUIBtn.AutoButtonColor = false
resetUIBtn.ZIndex = 5
Instance.new("UICorner", resetUIBtn).CornerRadius = UDim.new(0, 6)

resetUIBtn.MouseButton1Click:Connect(function()
    -- Reset UI to default state
    switchToNormalTheme()
    hologramMode = false
    hologramBtn.Text = "👁️‍🗨️"
    hologramGlow.Color = Color3.fromRGB(100, 150, 255)
    effectsEnabled = true
    toggleBtn.Text = "⚡"
    toggleGlow.Color = Color3.fromRGB(100, 150, 255)
    box.Text = ""
    status.Text = ""
    strengthMeterContainer.Visible = false
    progressContainer.Visible = false
    notify("UI Reset", "Đã reset UI về trạng thái mặc định.", 2)
end)

-- Show/Hide Password Button
local showPasswordBtn = Instance.new("TextButton", inputButtonsContainer)
showPasswordBtn.Size = UDim2.new(0, 25, 0, 25)
showPasswordBtn.Position = UDim2.new(0, 30, 0, 0)
showPasswordBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
showPasswordBtn.Text = "👁️"
showPasswordBtn.Font = Enum.Font.GothamBold
showPasswordBtn.TextSize = 14
showPasswordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
showPasswordBtn.AutoButtonColor = false
showPasswordBtn.ZIndex = 5
Instance.new("UICorner", showPasswordBtn).CornerRadius = UDim.new(0, 6)

local passwordVisible = false
showPasswordBtn.MouseButton1Click:Connect(function()
    passwordVisible = not passwordVisible
    showPasswordBtn.Text = passwordVisible and "🙈" or "👁️"
    -- Note: In Roblox, TextBox doesn't have a built-in password char, but we can simulate
    if passwordVisible then
        box.TextTransparency = 0
    else
        -- For password hiding, we could use a different approach, but for now just change transparency
        box.TextTransparency = 0.5
    end
end)

-- Clear Input Button
local clearInputBtn = Instance.new("TextButton", inputButtonsContainer)
clearInputBtn.Size = UDim2.new(0, 25, 0, 25)
clearInputBtn.Position = UDim2.new(0, 60, 0, 0)
clearInputBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
clearInputBtn.Text = "🗑️"
clearInputBtn.Font = Enum.Font.GothamBold
clearInputBtn.TextSize = 14
clearInputBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearInputBtn.AutoButtonColor = false
clearInputBtn.ZIndex = 5
Instance.new("UICorner", clearInputBtn).CornerRadius = UDim.new(0, 6)

clearInputBtn.MouseButton1Click:Connect(function()
    box.Text = ""
    status.Text = ""
    strengthMeterContainer.Visible = false
end)

-- Copy Key Button
local copyKeyBtn = Instance.new("TextButton", inputButtonsContainer)
copyKeyBtn.Size = UDim2.new(0, 25, 0, 25)
copyKeyBtn.Position = UDim2.new(0, 90, 0, 0)
copyKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
copyKeyBtn.Text = "📋"
copyKeyBtn.Font = Enum.Font.GothamBold
copyKeyBtn.TextSize = 14
copyKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyKeyBtn.AutoButtonColor = false
copyKeyBtn.ZIndex = 5
Instance.new("UICorner", copyKeyBtn).CornerRadius = UDim.new(0, 6)

copyKeyBtn.MouseButton1Click:Connect(function()
    if box.Text ~= "" then
        if setclipboard then
            setclipboard(box.Text)
            status.TextColor3 = Color3.fromRGB(100, 255, 120)
            status.Text = currentLanguage == "vn" and "✅ Đã copy key!" or "✅ Key copied!"
            task.wait(1.5)
            status.Text = ""
        else
            status.TextColor3 = Color3.fromRGB(255, 120, 120)
            status.Text = currentLanguage == "vn" and "❌ Không thể copy" or "❌ Cannot copy"
            task.wait(1.5)
            status.Text = ""
        end
    else
        status.TextColor3 = Color3.fromRGB(255, 180, 80)
        status.Text = currentLanguage == "vn" and "⚠️ Không có key để copy" or "⚠️ No key to copy"
        task.wait(1.5)
        status.Text = ""
    end
end)

-- Input box với enhanced animations
local box = Instance.new("TextBox", inputContainer)
box.PlaceholderText = "Nhập key của bạn..."
box.Size = UDim2.new(0.8, 0, 0.8, 0)
box.Position = UDim2.new(0.025, 0, 0.1, 0)
box.BackgroundTransparency = 1
box.TextColor3 = Color3.fromRGB(255, 255, 255)
box.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
box.Font = Enum.Font.Gotham
box.TextSize = 18
box.ClearTextOnFocus = false
box.Text = ""
box.ZIndex = 3

-- Typing animations
local typingAnimationActive = false
local lastTypingTime = 0

-- Typing glow effect
local typingGlow = Instance.new("UIStroke", inputContainer)
typingGlow.Color = Color3.fromRGB(100, 150, 255)
typingGlow.Thickness = 0
typingGlow.Transparency = 0.5
typingGlow.LineJoinMode = Enum.LineJoinMode.Round

-- Placeholder typing animation
local placeholderTexts = {
    "Nhập key của bạn...",
    "Enter your key...",
    "Type your access code...",
    "Nhập mật khẩu...",
    "Enter password..."
}
local placeholderIndex = 1
local placeholderCharIndex = 1
local placeholderDirection = 1

spawn(function()
    while box.Parent do
        if not box:IsFocused() and box.Text == "" then
            local currentText = placeholderTexts[placeholderIndex]
            if placeholderDirection == 1 then
                box.PlaceholderText = currentText:sub(1, placeholderCharIndex)
                placeholderCharIndex = placeholderCharIndex + 1
                if placeholderCharIndex > #currentText then
                    placeholderDirection = -1
                    task.wait(1)
                end
            else
                placeholderCharIndex = placeholderCharIndex - 1
                box.PlaceholderText = currentText:sub(1, placeholderCharIndex)
                if placeholderCharIndex <= 0 then
                    placeholderDirection = 1
                    placeholderIndex = (placeholderIndex % #placeholderTexts) + 1
                    task.wait(0.5)
                end
            end
            task.wait(0.08)
        else
            task.wait(0.1)
        end
    end
end)

-- Enhanced Key encryption animation + Sound Wave Visualization + Typing Effects
local showEncryption = false
local lastSoundWaveTime = 0
local typingParticles = {}
local encryptionSuccess, encryptionError = pcall(function()
    box:GetPropertyChangedSignal("Text"):Connect(function()
        local text = box.Text or ""

        -- Enhanced Sound Wave Visualization với typing particles
        if text ~= "" and #text > 0 and tick() - lastSoundWaveTime > 0.15 then
            lastSoundWaveTime = tick()
            if soundWaveContainer then
                soundWaveContainer.Visible = true
            end

            -- Create typing particles
            for i = 1, 3 do
                spawn(function()
                    local particle = Instance.new("Frame", inputContainer)
                    particle.Size = UDim2.new(0, 2, 0, 2)
                    particle.Position = UDim2.new(0.025 + math.random() * 0.95, 0, 0.1 + math.random() * 0.8, 0)
                    particle.BackgroundColor3 = Color3.fromRGB(100, 150, 255)
                    particle.BackgroundTransparency = 0.3
                    particle.BorderSizePixel = 0
                    particle.ZIndex = 4
                    Instance.new("UICorner", particle).CornerRadius = UDim.new(0.5, 0)

                    table.insert(typingParticles, particle)

                    -- Animate particle
                    local startTime = tick()
                    local velocityX = (math.random() - 0.5) * 200
                    local velocityY = (math.random() - 0.5) * 100 - 50

                    while particle.Parent and tick() - startTime < 1 do
                        local elapsed = tick() - startTime
                        local x = particle.Position.X.Offset + velocityX * elapsed * 0.01
                        local y = particle.Position.Y.Offset + velocityY * elapsed * 0.01 + 0.5 * 300 * elapsed * elapsed * 0.0001

                        particle.Position = UDim2.new(0, x, 0, y)
                        particle.BackgroundTransparency = 0.3 + elapsed * 0.7
                        particle.Size = UDim2.new(0, 2 + elapsed * 2, 0, 2 + elapsed * 2)

                        task.wait(0.02)
                    end
                    particle:Destroy()
                    for i, p in ipairs(typingParticles) do
                        if p == particle then
                            table.remove(typingParticles, i)
                            break
                        end
                    end
                end)
            end

            for i, wave in ipairs(soundWaves or {}) do
                if wave and wave.Parent then
                    local height = math.random(8, 20) * math.min(1, #text / 8)
                    local tweenSuccess, tweenError = pcall(function()
                        TweenService:Create(wave, TweenInfo.new(0.08), {
                            Size = UDim2.new(0, 3, 0, height)
                        }):Play()
                    end)
                    if not tweenSuccess then
                        wave.Size = UDim2.new(0, 3, 0, height) -- Fallback
                    end
                end
            end

            spawn(function()
                task.wait(0.4)
                for i, wave in ipairs(soundWaves or {}) do
                    if wave and wave.Parent then
                        local tweenSuccess, tweenError = pcall(function()
                            TweenService:Create(wave, TweenInfo.new(0.15), {
                                Size = UDim2.new(0, 3, 0, 0)
                            }):Play()
                        end)
                        if not tweenSuccess then
                            wave.Size = UDim2.new(0, 3, 0, 0) -- Fallback
                        end
                    end
                end
                task.wait(0.2)
                if soundWaveContainer then
                    soundWaveContainer.Visible = false
                end
            end)
        end

        -- Enhanced Key Encryption với typing glow (loại bỏ che mật khẩu)
        if text ~= "" and (text == CORRECT_KEY or text == PINK_THEME_KEY or text == BACK_TO_NORMAL_KEY or text == RAINBOW_THEME_KEY or currentTheme == "pink" or currentTheme == "rainbow") then
            showEncryption = true
        end

        if showEncryption and box.Text ~= "" then
            -- Loại bỏ che mật khẩu, chỉ giữ glow effect
            if box then
                box.TextTransparency = 0 -- Hiển thị text thật thay vì che
            end

            -- Enhanced pulse animation với glow
            spawn(function()
                for i = 1, 4 do
                    TweenService:Create(typingGlow, TweenInfo.new(0.1), {Thickness = 2}):Play()
                    task.wait(0.08)
                    TweenService:Create(typingGlow, TweenInfo.new(0.1), {Thickness = 0}):Play()
                    task.wait(0.08)
                end
            end)
        else
            if box then
                box.TextTransparency = 0
            end
            showEncryption = false
            TweenService:Create(typingGlow, TweenInfo.new(0.2), {Thickness = 0}):Play()
        end

        -- Typing glow effect based on text length
        if #text > 0 then
            local glowIntensity = math.min(1, #text / 10)
            TweenService:Create(typingGlow, TweenInfo.new(0.1), {
                Thickness = glowIntensity * 1.5,
                Transparency = 0.5 - glowIntensity * 0.3
            }):Play()
        else
            TweenService:Create(typingGlow, TweenInfo.new(0.2), {Thickness = 0}):Play()
        end
    end)
end)
if not encryptionSuccess then
    warn("Lỗi khi setup encryption animation:", encryptionError)
end

-- Enhanced Focus effect với typing animations
local focusEffectSuccess, focusEffectError = pcall(function()
    box.Focused:Connect(function()
        if inputBorder and inputContainer then
            -- Enhanced focus animation
            local tween1Success, tween1Error = pcall(function()
                TweenService:Create(inputBorder, TweenInfo.new(0.25), {
                    Transparency = 0.1,
                    Thickness = 2.5,
                    Color = Color3.fromRGB(120, 170, 255)
                }):Play()
            end)
            if not tween1Success then
                inputBorder.Transparency = 0.1
                inputBorder.Thickness = 2.5
                inputBorder.Color = Color3.fromRGB(120, 170, 255)
            end

            local tween2Success, tween2Error = pcall(function()
                TweenService:Create(inputContainer, TweenInfo.new(0.25), {
                    BackgroundColor3 = Color3.fromRGB(40, 40, 55)
                }):Play()
            end)
            if not tween2Success then
                inputContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
            end

            -- Start typing glow pulse
            typingAnimationActive = true
            spawn(function()
                while typingAnimationActive and box:IsFocused() do
                    TweenService:Create(typingGlow, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                        Transparency = 0.3
                    }):Play()
                    task.wait(0.8)
                    TweenService:Create(typingGlow, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                        Transparency = 0.6
                    }):Play()
                    task.wait(0.8)
                end
            end)

            -- Focus particles
            for i = 1, 5 do
                spawn(function()
                    local focusParticle = Instance.new("Frame", inputContainer)
                    focusParticle.Size = UDim2.new(0, 1, 0, 1)
                    focusParticle.Position = UDim2.new(math.random(), 0, math.random(), 0)
                    focusParticle.BackgroundColor3 = Color3.fromRGB(120, 170, 255)
                    focusParticle.BackgroundTransparency = 0.5
                    focusParticle.BorderSizePixel = 0
                    focusParticle.ZIndex = 4

                    local startTime = tick()
                    while focusParticle.Parent and tick() - startTime < 1 do
                        local elapsed = tick() - startTime
                        focusParticle.BackgroundTransparency = 0.5 + elapsed * 0.5
                        focusParticle.Size = UDim2.new(0, 1 + elapsed * 3, 0, 1 + elapsed * 3)
                        task.wait(0.02)
                    end
                    focusParticle:Destroy()
                end)
            end
        end
    end)

    box.FocusLost:Connect(function()
        typingAnimationActive = false
        if inputBorder and inputContainer then
            local tween1Success, tween1Error = pcall(function()
                TweenService:Create(inputBorder, TweenInfo.new(0.3), {
                    Transparency = 0.6,
                    Thickness = 1.5,
                    Color = Color3.fromRGB(80, 120, 200)
                }):Play()
            end)
            if not tween1Success then
                inputBorder.Transparency = 0.6
                inputBorder.Thickness = 1.5
                inputBorder.Color = Color3.fromRGB(80, 120, 200)
            end

            local tween2Success, tween2Error = pcall(function()
                TweenService:Create(inputContainer, TweenInfo.new(0.3), {
                    BackgroundColor3 = Color3.fromRGB(30, 30, 40)
                }):Play()
            end)
            if not tween2Success then
                inputContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
            end

            -- Stop typing glow
            TweenService:Create(typingGlow, TweenInfo.new(0.2), {
                Transparency = 0.5,
                Thickness = 0
            }):Play()
        end
    end)
end)
if not focusEffectSuccess then
    warn("Lỗi khi setup focus effects:", focusEffectError)
end

-- Real-time Key Validation với Key Strength Meter (cải thiện error handling)
local errorCount = 0
local validationSuccess, validationError = pcall(function()
    box:GetPropertyChangedSignal("Text"):Connect(function()
        local text = box.Text or ""
        local trimmed = string.gsub(text, "^%s*(.-)%s*$", "%1")

        if not status or not inputBorder or not strengthMeterContainer or not strengthMeter then
            return -- UI elements not ready
        end

        if trimmed == "" then
            status.Text = ""
            inputBorder.Color = Color3.fromRGB(80, 120, 200)
            strengthMeterContainer.Visible = false
        elseif trimmed == CORRECT_KEY then
            status.TextColor3 = Color3.fromRGB(100, 255, 120)
            status.Text = currentLanguage == "vn" and "✓ Key hợp lệ" or "✓ Valid key"
            inputBorder.Color = Color3.fromRGB(100, 255, 120)
            strengthMeterContainer.Visible = true
            strengthMeter.Size = UDim2.new(1, 0, 1, 0)
            strengthMeter.BackgroundColor3 = Color3.fromRGB(100, 255, 120)
        elseif #trimmed > 0 and #trimmed < #CORRECT_KEY then
            status.TextColor3 = Color3.fromRGB(255, 200, 100)
            status.Text = currentLanguage == "vn" and "Đang kiểm tra..." or "Checking..."
            inputBorder.Color = Color3.fromRGB(255, 200, 100)
            strengthMeterContainer.Visible = true
            local strength = #trimmed / #CORRECT_KEY
            strengthMeter.Size = UDim2.new(strength, 0, 1, 0)
            -- Màu từ đỏ -> vàng -> xanh
            if strength < 0.5 then
                strengthMeter.BackgroundColor3 = Color3.fromRGB(255, 100 + strength * 155, 100)
            else
                strengthMeter.BackgroundColor3 = Color3.fromRGB(255 - (strength - 0.5) * 310, 255, 100)
            end
        else
            status.TextColor3 = Color3.fromRGB(255, 120, 120)
            status.Text = currentLanguage == "vn" and "Key không hợp lệ" or "Invalid key"
            inputBorder.Color = Color3.fromRGB(255, 120, 120)
            strengthMeterContainer.Visible = true
            strengthMeter.Size = UDim2.new(1, 0, 1, 0)
            strengthMeter.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        end
    end)
end)
if not validationSuccess then
    warn("Lỗi khi setup key validation:", validationError)
end

-- Remember me checkbox (moved down to make space for Discord section)
local rememberMeContainer = Instance.new("Frame", frame)
rememberMeContainer.Size = UDim2.new(0.88, 0, 0, 24)
rememberMeContainer.Position = UDim2.new(0.06, 0, 0.55, 0)
rememberMeContainer.BackgroundTransparency = 1
rememberMeContainer.ZIndex = 3

local rememberMeBox = Instance.new("TextButton", rememberMeContainer)
rememberMeBox.Size = UDim2.new(0, 20, 0, 20)
rememberMeBox.Position = UDim2.new(0, 0, 0, 2)
rememberMeBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
rememberMeBox.Text = ""
rememberMeBox.AutoButtonColor = false
local rememberMeCorner = Instance.new("UICorner", rememberMeBox)
rememberMeCorner.CornerRadius = UDim.new(0, 4)

local rememberMeCheck = Instance.new("TextLabel", rememberMeBox)
rememberMeCheck.Size = UDim2.new(1, 0, 1, 0)
rememberMeCheck.BackgroundTransparency = 1
rememberMeCheck.Text = "✓"
rememberMeCheck.TextColor3 = Color3.fromRGB(100, 255, 120)
rememberMeCheck.Font = Enum.Font.GothamBold
rememberMeCheck.TextSize = 16
rememberMeCheck.Visible = false

local rememberMeLabel = Instance.new("TextLabel", rememberMeContainer)
rememberMeLabel.Size = UDim2.new(1, -30, 1, 0)
rememberMeLabel.Position = UDim2.new(0, 28, 0, 0)
rememberMeLabel.BackgroundTransparency = 1
rememberMeLabel.Text = "Ghi nhớ key"
rememberMeLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
rememberMeLabel.Font = Enum.Font.Gotham
rememberMeLabel.TextSize = 14
rememberMeLabel.TextXAlignment = Enum.TextXAlignment.Left

local rememberMeChecked = false
rememberMeBox.MouseButton1Click:Connect(function()
    rememberMeChecked = not rememberMeChecked
    rememberMeCheck.Visible = rememberMeChecked
    if rememberMeChecked then
        TweenService:Create(rememberMeBox, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 140, 80)}):Play()
    else
        TweenService:Create(rememberMeBox, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 50)}):Play()
    end
end)

-- Check if key was saved before (auto-check remember me) - cải thiện error handling
local checkSuccess, checkError = pcall(function()
    if canWriteFiles() and isfile(SAVE_FILENAME) then
        rememberMeChecked = true
        if rememberMeCheck then
            rememberMeCheck.Visible = true
        end
        if rememberMeBox then
            rememberMeBox.BackgroundColor3 = Color3.fromRGB(60, 140, 80)
        end
    end
end)
if not checkSuccess then
    warn("Lỗi khi check saved key:", checkError)
end

-- Status với icon - cải thiện với loading animation
local status = Instance.new("TextLabel", frame)
status.BackgroundTransparency = 1
status.Size = UDim2.new(1, 0, 0, 24)
status.Position = UDim2.new(0, 0, 0.75, 0)
status.Font = Enum.Font.Gotham
status.TextSize = 15
status.TextColor3 = Color3.fromRGB(255, 120, 120)
status.Text = ""
status.ZIndex = 3

-- Thêm loading indicator
local loadingIndicator = Instance.new("Frame", status)
loadingIndicator.Size = UDim2.new(0, 16, 0, 16)
loadingIndicator.Position = UDim2.new(0, -20, 0.5, 0)
loadingIndicator.AnchorPoint = Vector2.new(1, 0.5)
loadingIndicator.BackgroundTransparency = 1
loadingIndicator.Visible = false
loadingIndicator.ZIndex = 4

local loadingDot1 = Instance.new("Frame", loadingIndicator)
loadingDot1.Size = UDim2.new(0, 3, 0, 3)
loadingDot1.Position = UDim2.new(0.2, 0, 0.5, 0)
loadingDot1.AnchorPoint = Vector2.new(0.5, 0.5)
loadingDot1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
loadingDot1.BackgroundTransparency = 0.5
loadingDot1.ZIndex = 5
Instance.new("UICorner", loadingDot1).CornerRadius = UDim.new(0.5, 0)

local loadingDot2 = loadingDot1:Clone()
loadingDot2.Position = UDim2.new(0.5, 0, 0.5, 0)
loadingDot2.Parent = loadingIndicator

local loadingDot3 = loadingDot1:Clone()
loadingDot3.Position = UDim2.new(0.8, 0, 0.5, 0)
loadingDot3.Parent = loadingIndicator

-- Loading animation function
local function startLoadingAnimation()
    loadingIndicator.Visible = true
    spawn(function()
        while loadingIndicator.Visible do
            for i = 1, 3 do
                local dot = loadingIndicator["LoadingDot" .. i] or (i == 1 and loadingDot1 or i == 2 and loadingDot2 or loadingDot3)
                if dot then
                    local tweenSuccess, tweenError = pcall(function()
                        TweenService:Create(dot, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            BackgroundTransparency = 0.2
                        }):Play()
                    end)
                    if not tweenSuccess then
                        dot.BackgroundTransparency = 0.2
                    end
                end
                task.wait(0.2)
            end
            task.wait(0.2)
            for i = 1, 3 do
                local dot = loadingIndicator["LoadingDot" .. i] or (i == 1 and loadingDot1 or i == 2 and loadingDot2 or loadingDot3)
                if dot then
                    local tweenSuccess, tweenError = pcall(function()
                        TweenService:Create(dot, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                            BackgroundTransparency = 0.8
                        }):Play()
                    end)
                    if not tweenSuccess then
                        dot.BackgroundTransparency = 0.8
                    end
                end
                task.wait(0.2)
            end
        end
    end)
end

local function stopLoadingAnimation()
    loadingIndicator.Visible = false
end

-- Ripple Effect function
local function createRipple(parent, x, y)
    local ripple = Instance.new("Frame", parent)
    ripple.Size = UDim2.new(0, 0, 0, 0)
    ripple.Position = UDim2.new(0, x - 25, 0, y - 25)
    ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ripple.BackgroundTransparency = 0.7
    ripple.BorderSizePixel = 0
    ripple.ZIndex = 10
    Instance.new("UICorner", ripple).CornerRadius = UDim.new(0, 25)
    
    spawn(function()
        for i = 1, 30 do
            ripple.Size = UDim2.new(0, 50 + i * 10, 0, 50 + i * 10)
            ripple.Position = UDim2.new(0, x - 25 - i * 5, 0, y - 25 - i * 5)
            ripple.BackgroundTransparency = 0.7 + (i / 30) * 0.3
            task.wait(0.02)
        end
        ripple:Destroy()
    end)
end
-- Enhanced Discord Section - Ultra Compact Version
local discordContainer = Instance.new("Frame", frame)
discordContainer.Size = UDim2.new(0.88, 0, 0, 60)
discordContainer.Position = UDim2.new(0.06, 0, 0.6, 0)
discordContainer.BackgroundTransparency = 1
discordContainer.ZIndex = 3



-- Discord Icon
local discordIcon = Instance.new("TextLabel", discordContainer)
discordIcon.Size = UDim2.new(0, 20, 0, 20)
discordIcon.Position = UDim2.new(0, 0, 0, 0)
discordIcon.BackgroundTransparency = 1
discordIcon.Text = "💬"
discordIcon.Font = Enum.Font.GothamBold
discordIcon.TextSize = 16
discordIcon.ZIndex = 4

-- Discord description (moved up)
local discordDesc = Instance.new("TextLabel", discordContainer)
discordDesc.Size = UDim2.new(1, -25, 0, 14)
discordDesc.Position = UDim2.new(0, 25, 0, 3)
discordDesc.BackgroundTransparency = 1
discordDesc.Text = "Get free scripts, support & updates"
discordDesc.Font = Enum.Font.Gotham
discordDesc.TextSize = 11
discordDesc.TextColor3 = Color3.fromRGB(150, 150, 170)
discordDesc.TextXAlignment = Enum.TextXAlignment.Left
discordDesc.ZIndex = 4

-- Enhanced Discord Button - Full Width with New Features
local discordBtn = Instance.new("TextButton", discordContainer)
discordBtn.Size = UDim2.new(1, 0, 0, 36)
discordBtn.Position = UDim2.new(0, 0, 0, 20)
discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordBtn.Text = "📋 Copy Discord Invite Link"
discordBtn.Font = Enum.Font.GothamBold
discordBtn.TextSize = 14
discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
discordBtn.AutoButtonColor = false
discordBtn.ZIndex = 4
Instance.new("UICorner", discordBtn).CornerRadius = UDim.new(0, 10)

-- Discord button gradient
local discordGradient = Instance.new("UIGradient", discordBtn)
discordGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(88, 101, 242)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(67, 80, 200))
}
discordGradient.Rotation = 90

-- Enhanced Discord tooltip
local discordTooltip = Instance.new("TextLabel", discordBtn)
discordTooltip.Size = UDim2.new(0, 220, 0, 28)
discordTooltip.Position = UDim2.new(0.5, 0, -1.3, 0)
discordTooltip.AnchorPoint = Vector2.new(0.5, 0)
discordTooltip.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
discordTooltip.Text = "Join community Free cilent nokey and script"
discordTooltip.TextColor3 = Color3.fromRGB(255, 255, 255)
discordTooltip.TextSize = 11
discordTooltip.Font = Enum.Font.Gotham
discordTooltip.BackgroundTransparency = 0.1
discordTooltip.Visible = false
discordTooltip.ZIndex = 20
Instance.new("UICorner", discordTooltip).CornerRadius = UDim.new(0, 8)

-- Discord button glow
local discordGlow = Instance.new("UIStroke", discordBtn)
discordGlow.Color = Color3.fromRGB(114, 137, 218)
discordGlow.Thickness = 2
discordGlow.Transparency = 0.5

-- Discord link
local DISCORD_LINK = "https://discord.com/invite/tdtfreenokey"

-- Feedback Discord Webhook URL (user cần thay bằng webhook thật)
local FEEDBACK_WEBHOOK_URL = "https://discord.com/api/webhooks/1437478462884675584/PXeJ5b-ft8ZqptYUPNb81oE4vWonk6gxxj95nnoYIg-5f4qEtqbiMwS1xLpDA453j1ke" -- Thay bằng webhook thật

-- User Count Tracking Webhook URL (user cần thay bằng webhook thật)
local USER_COUNT_WEBHOOK_URL = "https://discord.com/api/webhooks/1437489597410967593/msd7PelyEuoOuOPMG18dZxDS9uRfiecMwYs4FEhTOT5Bw_gOSS-bwLKn0U91MSCNaS90" -- Thay bằng webhook thật

-- User Count File (để lưu tổng số người dùng)
local USER_COUNT_FILE = "DacCauHub_user_count.txt"

-- Function to load user count from file
local function loadUserCount()
    if not canWriteFiles() then return 0 end
    if not isfile(USER_COUNT_FILE) then return 0 end
    local success, data = pcall(readfile, USER_COUNT_FILE)
    if not success or not data then return 0 end
    local count = tonumber(data)
    return count or 0
end

-- Function to save user count to file
local function saveUserCount(count)
    if not canWriteFiles() then return false end
    local success = pcall(function() writefile(USER_COUNT_FILE, tostring(count)) end)
    return success
end

-- Function to send user count to Discord webhook
local function sendUserCountToDiscord()
    if USER_COUNT_WEBHOOK_URL == "123" then
        -- Không gửi nếu chưa cấu hình webhook
        return false
    end

    -- Tăng và lưu tổng số người dùng
    local currentCount = loadUserCount() + 1
    saveUserCount(currentCount)

    local success, errorMsg = pcall(function()
        local payload = {
            content = "",
            embeds = {{
                title = "👥 New User Started Hub",
                color = 65280, -- Green color
                fields = {
                    {
                        name = "👤 User",
                        value = game.Players.LocalPlayer.Name .. " (" .. game.Players.LocalPlayer.UserId .. ")",
                        inline = true
                    },
                    {
                        name = "🎮 Game",
                        value = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. " (" .. game.PlaceId .. ")",
                        inline = true
                    },
                    {
                        name = "⏰ Time",
                        value = os.date("%Y-%m-%d %H:%M:%S UTC"),
                        inline = true
                    },
                    {
                        name = "🎨 Theme",
                        value = currentTheme,
                        inline = true
                    },
                    {
                        name = "🌐 Executor",
                        value = (getexecutorname and getexecutorname()) or "Unknown",
                        inline = true
                    },
                    {
                        name = "📊 Total Users",
                        value = tostring(currentCount),
                        inline = true
                    }
                },
                footer = {
                    text = "DacCauHub User Tracking System"
                }
            }}
        }

        local jsonPayload = game:GetService("HttpService"):JSONEncode(payload)

        -- Send to Discord webhook
        local response = request({
            Url = USER_COUNT_WEBHOOK_URL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = jsonPayload
        })

        if response.StatusCode == 204 then
            return true
        else
            error("HTTP " .. response.StatusCode .. ": " .. (response.Body or "Unknown error"))
        end
    end)

    if success then
        return true
    else
        warn("Failed to send user count:", errorMsg)
        return false
    end
end

-- Function to send feedback to Discord webhook
local function sendFeedbackToDiscord(feedbackType, feedbackText)
    if FEEDBACK_WEBHOOK_URL == "123" then
        notify("Feedback", currentLanguage == "vn" and "Chưa cấu hình webhook Discord!" or "Discord webhook not configured!", 3)
        return false
    end

    local success, errorMsg = pcall(function()
        local payload = {
            content = "",
            embeds = {{
                title = "📬 New Feedback Received",
                color = 3447003, -- Blue color
                fields = {
                    {
                        name = "👤 User",
                        value = game.Players.LocalPlayer.Name .. " (" .. game.Players.LocalPlayer.UserId .. ")",
                        inline = true
                    },
                    {
                        name = "🎮 Game",
                        value = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. " (" .. game.PlaceId .. ")",
                        inline = true
                    },
                    {
                        name = "📝 Type",
                        value = feedbackType,
                        inline = true
                    },
                    {
                        name = "💬 Feedback",
                        value = feedbackText,
                        inline = false
                    },
                    {
                        name = "⏰ Time",
                        value = os.date("%Y-%m-%d %H:%M:%S UTC"),
                        inline = true
                    },
                    {
                        name = "🎨 Theme",
                        value = currentTheme,
                        inline = true
                    }
                },
                footer = {
                    text = "DacCauHub Feedback System"
                }
            }}
        }

        local jsonPayload = game:GetService("HttpService"):JSONEncode(payload)

        -- Send to Discord webhook
        local response = request({
            Url = FEEDBACK_WEBHOOK_URL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = jsonPayload
        })

        if response.StatusCode == 204 then
            return true
        else
            error("HTTP " .. response.StatusCode .. ": " .. (response.Body or "Unknown error"))
        end
    end)

    if success then
        return true
    else
        warn("Failed to send feedback:", errorMsg)
        return false
    end
end

-- Feedback Button (floating button bên cạnh UI)
local feedbackBtn = Instance.new("TextButton", gui)
feedbackBtn.Size = UDim2.new(0, 60, 0, 60)
feedbackBtn.Position = UDim2.new(0.5, 300, 0.5, -30) -- Bên phải UI
feedbackBtn.BackgroundColor3 = Color3.fromRGB(70, 140, 255)
feedbackBtn.Text = "💬"
feedbackBtn.Font = Enum.Font.GothamBold
feedbackBtn.TextSize = 24
feedbackBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
feedbackBtn.AutoButtonColor = false
feedbackBtn.ZIndex = 25
Instance.new("UICorner", feedbackBtn).CornerRadius = UDim.new(0, 30)

-- Feedback button glow
local feedbackBtnGlow = Instance.new("UIStroke", feedbackBtn)
feedbackBtnGlow.Color = Color3.fromRGB(100, 150, 255)
feedbackBtnGlow.Thickness = 3
feedbackBtnGlow.Transparency = 0.3

-- Feedback button gradient
local feedbackBtnGrad = Instance.new("UIGradient", feedbackBtn)
feedbackBtnGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 120, 220))
}
feedbackBtnGrad.Rotation = 90

-- Feedback Popup
local feedbackPopup = Instance.new("Frame", gui)
feedbackPopup.Size = UDim2.new(0, 350, 0, 250)
feedbackPopup.Position = UDim2.new(0.5, -175, 0.5, -125)
feedbackPopup.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
feedbackPopup.BorderSizePixel = 0
feedbackPopup.ZIndex = 30
feedbackPopup.Visible = false
Instance.new("UICorner", feedbackPopup).CornerRadius = UDim.new(0, 15)

-- Feedback popup glow
local feedbackPopupGlow = Instance.new("UIStroke", feedbackPopup)
feedbackPopupGlow.Color = Color3.fromRGB(100, 150, 255)
feedbackPopupGlow.Thickness = 2
feedbackPopupGlow.Transparency = 0.5

-- Feedback popup title
local feedbackPopupTitle = Instance.new("TextLabel", feedbackPopup)
feedbackPopupTitle.Size = UDim2.new(1, 0, 0, 40)
feedbackPopupTitle.Position = UDim2.new(0, 0, 0, 0)
feedbackPopupTitle.BackgroundTransparency = 1
feedbackPopupTitle.Text = currentLanguage == "vn" and "💬 Góp ý & Phản hồi" or "💬 Feedback & Suggestions"
feedbackPopupTitle.Font = Enum.Font.GothamBold
feedbackPopupTitle.TextSize = 18
feedbackPopupTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
feedbackPopupTitle.ZIndex = 31

-- Feedback popup textbox
local feedbackPopupBox = Instance.new("TextBox", feedbackPopup)
feedbackPopupBox.Size = UDim2.new(0.9, 0, 0, 120)
feedbackPopupBox.Position = UDim2.new(0.05, 0, 0, 50)
feedbackPopupBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
feedbackPopupBox.BorderSizePixel = 0
feedbackPopupBox.Text = ""
feedbackPopupBox.PlaceholderText = currentLanguage == "vn" and "Nhập góp ý của bạn..." or "Enter your feedback..."
feedbackPopupBox.Font = Enum.Font.Gotham
feedbackPopupBox.TextSize = 14
feedbackPopupBox.TextColor3 = Color3.fromRGB(255, 255, 255)
feedbackPopupBox.TextWrapped = true
feedbackPopupBox.MultiLine = true
feedbackPopupBox.ClearTextOnFocus = false
feedbackPopupBox.ZIndex = 31
Instance.new("UICorner", feedbackPopupBox).CornerRadius = UDim.new(0, 8)

-- Feedback popup send button
local feedbackPopupBtn = Instance.new("TextButton", feedbackPopup)
feedbackPopupBtn.Size = UDim2.new(0.9, 0, 0, 40)
feedbackPopupBtn.Position = UDim2.new(0.05, 0, 1, -50)
feedbackPopupBtn.BackgroundColor3 = Color3.fromRGB(70, 140, 255)
feedbackPopupBtn.Text = currentLanguage == "vn" and "📤 Gửi góp ý" or "📤 Send Feedback"
feedbackPopupBtn.Font = Enum.Font.GothamBold
feedbackPopupBtn.TextSize = 16
feedbackPopupBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
feedbackPopupBtn.AutoButtonColor = false
feedbackPopupBtn.ZIndex = 31
Instance.new("UICorner", feedbackPopupBtn).CornerRadius = UDim.new(0, 10)

-- Feedback popup button gradient
local feedbackPopupBtnGrad = Instance.new("UIGradient", feedbackPopupBtn)
feedbackPopupBtnGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 120, 220))
}
feedbackPopupBtnGrad.Rotation = 90

-- Feedback button click to show popup
feedbackBtn.MouseButton1Click:Connect(function()
    feedbackPopup.Visible = not feedbackPopup.Visible
    if feedbackPopup.Visible then
        feedbackPopupBox:CaptureFocus()
    end
end)

-- Feedback popup send button logic
feedbackPopupBtn.MouseButton1Click:Connect(function()
    local feedbackText = feedbackPopupBox.Text:gsub("^%s*(.-)%s*$", "%1") -- Trim whitespace

    if feedbackText == "" then
        notify("Feedback", currentLanguage == "vn" and "⚠️ Vui lòng nhập góp ý!" or "⚠️ Please enter feedback!", 3)
        return
    end

    -- Disable button during sending
    feedbackPopupBtn.Text = currentLanguage == "vn" and "📤 Đang gửi..." or "📤 Sending..."
    feedbackPopupBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

    -- Send feedback
    local success = sendFeedbackToDiscord("Góp ý", feedbackText)

    if success then
        notify("Feedback", currentLanguage == "vn" and "✅ Gửi góp ý thành công!" or "✅ Feedback sent successfully!", 3)
        feedbackPopupBox.Text = ""
        feedbackPopup.Visible = false
    else
        notify("Feedback", currentLanguage == "vn" and "❌ Gửi góp ý thất bại!" or "❌ Failed to send feedback!", 3)
    end

    -- Reset button
    feedbackPopupBtn.Text = currentLanguage == "vn" and "📤 Gửi góp ý" or "📤 Send Feedback"
    feedbackPopupBtn.BackgroundColor3 = Color3.fromRGB(70, 140, 255)
end)

-- Close popup when clicking outside
gui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
    if feedbackPopup.Visible then
        local mouse = game:GetService("Players").LocalPlayer:GetMouse()
        local popupPos = feedbackPopup.AbsolutePosition
        local popupSize = feedbackPopup.AbsoluteSize

        if mouse.X < popupPos.X or mouse.X > popupPos.X + popupSize.X or
           mouse.Y < popupPos.Y or mouse.Y > popupPos.Y + popupSize.Y then
            -- Click outside, close popup
            feedbackPopup.Visible = false
        end
    end
end)


-- Double-click detection
local lastClickTime = 0
local doubleClickThreshold = 0.3

discordBtn.MouseButton1Click:Connect(function()
    local currentTime = tick()
    local isDoubleClick = (currentTime - lastClickTime) < doubleClickThreshold
    lastClickTime = currentTime

    if isDoubleClick then
        -- Double-click: Open Discord in browser
        local success, errorMsg = pcall(function()
            if syn and syn.request then
                syn.request({
                    Url = DISCORD_LINK,
                    Method = "GET"
                })
            elseif request then
                request({
                    Url = DISCORD_LINK,
                    Method = "GET"
                })
            else
                -- Fallback: try to open URL
                game:GetService("GuiService"):OpenBrowserWindow(DISCORD_LINK)
            end
        end)

        if success then
            discordBtn.Text = "🚀 Opening Discord..."
            status.TextColor3 = Color3.fromRGB(100, 255, 120)
            status.Text = currentLanguage == "vn" and "🚀 Đang mở Discord..." or "🚀 Opening Discord..."
        else
            discordBtn.Text = "❌ Failed to open"
            status.TextColor3 = Color3.fromRGB(255, 120, 120)
            status.Text = currentLanguage == "vn" and "❌ Không thể mở Discord: " .. tostring(errorMsg) or "❌ Cannot open Discord: " .. tostring(errorMsg)
        end

        task.wait(2)
        discordBtn.Text = "📋 Copy Discord Invite Link"
        status.Text = ""
        return
    end

    -- Single-click: Copy to clipboard
    local originalText = discordBtn.Text
    discordBtn.Text = "✅ Copied!"

    -- Copy to clipboard
    if setclipboard then
        setclipboard(DISCORD_LINK)
        status.TextColor3 = Color3.fromRGB(100, 255, 120)
        status.Text = currentLanguage == "vn" and "✅ Đã copy link Discord!" or "✅ Discord link copied!"

        -- Success particles
        for i = 1, 8 do
            spawn(function()
                local particle = Instance.new("TextLabel", gui)
                particle.Size = UDim2.new(0, 15, 0, 15)
                particle.Position = UDim2.new(0.5, math.random(-100, 100), 0.5, math.random(-50, 50))
                particle.BackgroundTransparency = 1
                particle.Text = "✨"
                particle.TextColor3 = Color3.fromRGB(100, 255, 120)
                particle.Font = Enum.Font.GothamBold
                particle.TextSize = math.random(12, 18)
                particle.ZIndex = 15

                local startTime = tick()
                while particle.Parent and tick() - startTime < 1.5 do
                    local elapsed = tick() - startTime
                    particle.TextTransparency = elapsed * 0.7
                    particle.Rotation = elapsed * 360
                    task.wait(0.02)
                end
                particle:Destroy()
            end)
        end

        task.wait(1.5)
        status.Text = ""
    else
        discordBtn.Text = "❌ Failed"
        status.TextColor3 = Color3.fromRGB(255, 120, 120)
        status.Text = currentLanguage == "vn" and "❌ Không thể copy link" or "❌ Failed to copy link"
        task.wait(2)
        status.Text = ""
    end

    -- Reset button text
    task.wait(0.5)
    discordBtn.Text = originalText

    -- Enhanced click animation
    TweenService:Create(discordBtn, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0.95, 0, 0, 32)
    }):Play()
    task.wait(0.15)
    TweenService:Create(discordBtn, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(1, 0, 0, 36)
    }):Play()
end)

-- Enhanced hover effects for Discord button
discordBtn.MouseEnter:Connect(function()
    local tween1Success, tween1Error = pcall(function()
        TweenService:Create(discordBtn, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(1.05, 0, 0, 35)
        }):Play()
    end)
    if not tween1Success then
        discordBtn.Size = UDim2.new(1.05, 0, 0, 35)
    end

    if discordGlow then
        local tween2Success, tween2Error = pcall(function()
            TweenService:Create(discordGlow, TweenInfo.new(0.25), {Transparency = 0.1, Thickness = 3}):Play()
        end)
        if not tween2Success then
            discordGlow.Transparency = 0.1
            discordGlow.Thickness = 3
        end
    end

    -- Show tooltip with animation
    if discordTooltip then
        discordTooltip.Visible = true
        TweenService:Create(discordTooltip, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
    end

    -- Discord icon animation
    TweenService:Create(discordIcon, TweenInfo.new(0.3), {Rotation = 15}):Play()
end)

discordBtn.MouseLeave:Connect(function()
    local tween1Success, tween1Error = pcall(function()
        TweenService:Create(discordBtn, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(1, 0, 0, 32)
        }):Play()
    end)
    if not tween1Success then
        discordBtn.Size = UDim2.new(1, 0, 0, 32)
    end

    if discordGlow then
        local tween2Success, tween2Error = pcall(function()
            TweenService:Create(discordGlow, TweenInfo.new(0.25), {Transparency = 0.5, Thickness = 2}):Play()
        end)
        if not tween2Success then
            discordGlow.Transparency = 0.5
            discordGlow.Thickness = 2
        end
    end

    -- Hide tooltip with animation
    if discordTooltip then
        TweenService:Create(discordTooltip, TweenInfo.new(0.2), {BackgroundTransparency = 0.1}):Play()
        task.wait(0.2)
        discordTooltip.Visible = false
    end

    -- Reset Discord icon
    TweenService:Create(discordIcon, TweenInfo.new(0.3), {Rotation = 0}):Play()
end)

-- Button với gradient và hover effect
local btn = Instance.new("TextButton", frame)
btn.Size = UDim2.new(0, 160, 0, 44)
btn.Position = UDim2.new(0.5, -80, 0.85, 0)
btn.BackgroundColor3 = Color3.fromRGB(70, 140, 255)
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 17
btn.Text = "Xác Nhận"
btn.AutoButtonColor = false
btn.ZIndex = 10 -- Tăng ZIndex để đảm bảo button luôn trên cùng
btn.Visible = true -- Đảm bảo button luôn visible
local btnCorner = Instance.new("UICorner", btn)
btnCorner.CornerRadius = UDim.new(0, 12)

-- Button gradient
local btnGrad = Instance.new("UIGradient", btn)
btnGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 120, 220))
}
btnGrad.Rotation = 90

-- Button shadow
local btnShadow = Instance.new("ImageLabel", btn)
btnShadow.AnchorPoint = Vector2.new(0.5, 0.5)
btnShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
btnShadow.Size = UDim2.new(1, 10, 1, 10)
btnShadow.Image = "rbxassetid://5554236805"
btnShadow.ImageTransparency = 0.6
btnShadow.BackgroundTransparency = 1
btnShadow.ZIndex = -1

-- Particle Trail effect
local function createParticleTrail(x, y)
    local particle = Instance.new("Frame", gui)
    particle.Size = UDim2.new(0, 4, 0, 4)
    particle.Position = UDim2.new(0, x, 0, y)
    particle.BackgroundColor3 = Color3.fromRGB(70, 140, 255)
    particle.BorderSizePixel = 0
    particle.ZIndex = 6
    Instance.new("UICorner", particle).CornerRadius = UDim.new(0, 2)
    
    spawn(function()
        for i = 1, 20 do
            particle.BackgroundTransparency = i / 20
            particle.Size = UDim2.new(0, 4 + i * 0.5, 0, 4 + i * 0.5)
            task.wait(0.02)
        end
        particle:Destroy()
    end)
end

-- Button hover effect với particle trail
local btnHover = false
local lastMousePos = Vector2.new(0, 0)
btn.MouseEnter:Connect(function()
    btnHover = true
    TweenService:Create(btn, TweenInfo.new(0.2), {Size = UDim2.new(0, 170, 0, 48)}):Play()
    TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(90, 160, 255)}):Play()
    TweenService:Create(btnShadow, TweenInfo.new(0.2), {ImageTransparency = 0.4}):Play()
end)

btn.MouseLeave:Connect(function()
    btnHover = false
    TweenService:Create(btn, TweenInfo.new(0.2), {Size = UDim2.new(0, 160, 0, 44)}):Play()
    TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 140, 255)}):Play()
    TweenService:Create(btnShadow, TweenInfo.new(0.2), {ImageTransparency = 0.6}):Play()
end)

-- Ripple effect khi click button
btn.MouseButton1Click:Connect(function()
    local mouse = game:GetService("Players").LocalPlayer:GetMouse()
    local btnPos = btn.AbsolutePosition
    local btnSize = btn.AbsoluteSize
    local relativeX = mouse.X - btnPos.X
    local relativeY = mouse.Y - btnPos.Y
    createRipple(btn, relativeX, relativeY)
end)

-- Particle trail khi di chuột qua button
local lastTrailTime = 0
spawn(function()
    while btn.Parent do
        if btnHover and tick() - lastTrailTime > 0.1 then
            local btnPos = btn.AbsolutePosition
            local btnSize = btn.AbsoluteSize
            local randomX = btnPos.X + math.random(0, btnSize.X)
            local randomY = btnPos.Y + math.random(0, btnSize.Y)
            createParticleTrail(randomX, randomY)
            lastTrailTime = tick()
        end
        task.wait(0.1)
    end
end)

-- Interactive Cursor Trail (cho pink theme)
local cursorTrailActive = false
local lastCursorTrail = 0
UserInputService.InputChanged:Connect(function(input)
    if currentTheme == "pink" and input.UserInputType == Enum.UserInputType.MouseMovement then
        if tick() - lastCursorTrail > 0.05 then
            local mouse = game:GetService("Players").LocalPlayer:GetMouse()
            local trail = Instance.new("TextLabel", gui)
            trail.Size = UDim2.new(0, 20, 0, 20)
            trail.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
            trail.BackgroundTransparency = 1
            trail.Text = "💖"
            trail.TextColor3 = Color3.fromRGB(255, 105, 180)
            trail.Font = Enum.Font.GothamBold
            trail.TextSize = 15
            trail.ZIndex = 8
            
            spawn(function()
                for i = 1, 15 do
                    trail.TextTransparency = i / 15
                    trail.TextSize = trail.TextSize + 0.5
                    trail.Rotation = i * 20
                    task.wait(0.03)
                end
                trail:Destroy()
            end)
            lastCursorTrail = tick()
        end
    end
end)

-- Progress bar (hidden by default)
local progressContainer = Instance.new("Frame", frame)
progressContainer.Size = UDim2.new(0.88, 0, 0, 6)
progressContainer.Position = UDim2.new(0.06, 0, 0.78, 0)
progressContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
progressContainer.BorderSizePixel = 0
progressContainer.Visible = false
progressContainer.ZIndex = 4
local progressContainerCorner = Instance.new("UICorner", progressContainer)
progressContainerCorner.CornerRadius = UDim.new(0, 3)

local progressBar = Instance.new("Frame", progressContainer)
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.Position = UDim2.new(0, 0, 0, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(70, 140, 255)
progressBar.BorderSizePixel = 0
progressBar.ZIndex = 5
local progressBarCorner = Instance.new("UICorner", progressBar)
progressBarCorner.CornerRadius = UDim.new(0, 3)

-- Progress bar gradient
local progressGrad = Instance.new("UIGradient", progressBar)
progressGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 150, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 120, 220))
}
progressGrad.Rotation = 0

-- Loading percentage text
local progressText = Instance.new("TextLabel", progressContainer)
progressText.Size = UDim2.new(1, 0, 1, 0)
progressText.Position = UDim2.new(0, 0, 0, 0)
progressText.BackgroundTransparency = 1
progressText.Text = "0%"
progressText.TextColor3 = Color3.fromRGB(255, 255, 255)
progressText.Font = Enum.Font.GothamBold
progressText.TextSize = 12
progressText.ZIndex = 6

-- Function to animate progress bar với percentage
local function animateProgress(duration)
    progressContainer.Visible = true
    progressBar.Size = UDim2.new(0, 0, 1, 0)
    progressText.Text = "0%"
    local startTime = tick()
    spawn(function()
        while tick() - startTime < duration do
            local progress = (tick() - startTime) / duration
            progressBar.Size = UDim2.new(progress, 0, 1, 0)
            progressText.Text = math.floor(progress * 100) .. "%"
            task.wait(0.01)
        end
        progressBar.Size = UDim2.new(1, 0, 1, 0)
        progressText.Text = "100%"
    end)
end

-- Matrix Rain Toggle Button
local matrixRainBtn = Instance.new("TextButton", frame)
matrixRainBtn.Size = UDim2.new(0, 40, 0, 40)
matrixRainBtn.Position = UDim2.new(0, 10, 0, 60)
matrixRainBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
matrixRainBtn.Text = "🌧️"
matrixRainBtn.Font = Enum.Font.GothamBold
matrixRainBtn.TextSize = 20
matrixRainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
matrixRainBtn.AutoButtonColor = false
matrixRainBtn.ZIndex = 15
Instance.new("UICorner", matrixRainBtn).CornerRadius = UDim.new(0, 8)

-- Thêm tooltip cho matrix rain button
local matrixRainTooltip = Instance.new("TextLabel", matrixRainBtn)
matrixRainTooltip.Size = UDim2.new(0, 120, 0, 25)
matrixRainTooltip.Position = UDim2.new(0.5, 0, -1.2, 0)
matrixRainTooltip.AnchorPoint = Vector2.new(0.5, 0)
matrixRainTooltip.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
matrixRainTooltip.Text = "Matrix Rain"
matrixRainTooltip.TextColor3 = Color3.fromRGB(255, 255, 255)
matrixRainTooltip.TextSize = 12
matrixRainTooltip.Font = Enum.Font.Gotham
matrixRainTooltip.BackgroundTransparency = 0.1
matrixRainTooltip.Visible = false
matrixRainTooltip.ZIndex = 20
Instance.new("UICorner", matrixRainTooltip).CornerRadius = UDim.new(0, 6)

-- Matrix rain button glow
local matrixRainGlow = Instance.new("UIStroke", matrixRainBtn)
matrixRainGlow.Color = Color3.fromRGB(0, 255, 100)
matrixRainGlow.Thickness = 2
matrixRainGlow.Transparency = 0.5

local matrixRainEnabled = true
matrixRainBtn.MouseButton1Click:Connect(function()
    matrixRainEnabled = not matrixRainEnabled
    matrixRainBtn.Text = matrixRainEnabled and "🌧️" or "☀️"
    matrixRainGlow.Color = matrixRainEnabled and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 200, 0)

    -- Toggle matrix rain visibility
    for _, col in ipairs(matrixColumns) do
        if col.label.Parent then
            col.label.Visible = matrixRainEnabled
        end
    end
end)

-- Hover effect for matrix rain button
matrixRainBtn.MouseEnter:Connect(function()
    local tween1Success, tween1Error = pcall(function()
        TweenService:Create(matrixRainBtn, TweenInfo.new(0.2), {Size = UDim2.new(0, 45, 0, 45)}):Play()
    end)
    if not tween1Success then
        matrixRainBtn.Size = UDim2.new(0, 45, 0, 45)
    end

    if matrixRainGlow then
        local tween2Success, tween2Error = pcall(function()
            TweenService:Create(matrixRainGlow, TweenInfo.new(0.2), {Transparency = 0.2}):Play()
        end)
        if not tween2Success then
            matrixRainGlow.Transparency = 0.2
        end
    end

    -- Show tooltip
    if matrixRainTooltip then
        matrixRainTooltip.Visible = true
    end
end)

matrixRainBtn.MouseLeave:Connect(function()
    local tween1Success, tween1Error = pcall(function()
        TweenService:Create(matrixRainBtn, TweenInfo.new(0.2), {Size = UDim2.new(0, 40, 0, 40)}):Play()
    end)
    if not tween1Success then
        matrixRainBtn.Size = UDim2.new(0, 40, 0, 40)
    end

    if matrixRainGlow then
        local tween2Success, tween2Error = pcall(function()
            TweenService:Create(matrixRainGlow, TweenInfo.new(0.2), {Transparency = 0.5}):Play()
        end)
        if not tween2Success then
            matrixRainGlow.Transparency = 0.5
        end
    end

    -- Hide tooltip
    if matrixRainTooltip then
        matrixRainTooltip.Visible = false
    end
end)

-- Matrix Rain Effect
local matrixChars = {"0", "1", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
local matrixColumns = {}
spawn(function()
    for i = 1, 15 do
        local column = Instance.new("TextLabel", bg)
        column.Size = UDim2.new(0, 20, 0, 0)
        column.Position = UDim2.new(0, i * 120, 0, -100)
        column.BackgroundTransparency = 1
        column.Text = ""
        column.TextColor3 = Color3.fromRGB(0, 255, 100)
        column.Font = Enum.Font.Code
        column.TextSize = 14
        column.ZIndex = 0
        column.TextTransparency = 0.5
        column.Visible = matrixRainEnabled

        table.insert(matrixColumns, {
            label = column,
            speed = math.random(30, 60),
            chars = {}
        })
    end

    while gui.Parent do
        for _, col in ipairs(matrixColumns) do
            if col.label.Parent and matrixRainEnabled then
                local currentY = col.label.Position.Y.Offset
                local newY = currentY + col.speed

                -- Add new char
                if math.random() < 0.3 then
                    table.insert(col.chars, {
                        char = matrixChars[math.random(1, #matrixChars)],
                        y = 0,
                        alpha = 1
                    })
                end

                -- Update chars
                local textLines = {}
                for i, charData in ipairs(col.chars) do
                    charData.y = charData.y + col.speed
                    charData.alpha = charData.alpha - 0.02

                    if charData.alpha > 0 then
                        table.insert(textLines, charData.char)
                    else
                        table.remove(col.chars, i)
                    end
                end

                col.label.Text = table.concat(textLines, "\n")
                col.label.TextTransparency = 0.5

                if newY > 1080 then
                    col.label.Position = UDim2.new(col.label.Position.X.Scale, col.label.Position.X.Offset, 0, -100)
                    col.chars = {}
                else
                    col.label.Position = UDim2.new(col.label.Position.X.Scale, col.label.Position.X.Offset, 0, newY)
                end
            end
        end
        task.wait(0.1)
    end
end)

-- Glitch Effect function
local function createGlitchEffect()
    errorCount = errorCount + 1
    if errorCount >= 3 then
        -- RGB Split effect
        local glitchOffset = 5
        for i = 1, 3 do
            spawn(function()
                local offset = (i - 2) * glitchOffset
                TweenService:Create(frame, TweenInfo.new(0.05), {
                    Position = UDim2.new(0.5, -240 + offset, 0.5, -160)
                }):Play()
                task.wait(0.05)
                TweenService:Create(frame, TweenInfo.new(0.05), {
                    Position = UDim2.new(0.5, -240, 0.5, -160)
                }):Play()
            end)
        end
        
        -- Screen shake
        for i = 1, 5 do
            local shakeX = math.random(-10, 10)
            local shakeY = math.random(-10, 10)
            TweenService:Create(frame, TweenInfo.new(0.05), {
                Position = UDim2.new(0.5, -240 + shakeX, 0.5, -160 + shakeY)
            }):Play()
            task.wait(0.05)
        end
        TweenService:Create(frame, TweenInfo.new(0.1), {
            Position = UDim2.new(0.5, -240, 0.5, -160)
        }):Play()
    end
end

-- Smooth theme transition function (thay bằng instant set để tránh lỗi TweenService)
local function smoothTransition(targetColors, duration)
    duration = duration or 0.8

    -- Direct set colors thay vì tween (để đảm bảo hoạt động trong mọi executor)
    bg.BackgroundColor3 = targetColors.bg
    grad.Color = targetColors.grad
    frame.BackgroundColor3 = targetColors.frame
    neonGlow.Color = targetColors.neonGlow
    inputContainer.BackgroundColor3 = targetColors.inputContainer
    inputBorder.Color = targetColors.inputBorder
    btn.BackgroundColor3 = targetColors.btn
    btnGrad.Color = targetColors.btnGrad
    title.TextColor3 = targetColors.title
    subtitle.TextColor3 = targetColors.subtitle

    -- Set particle colors
    for _, p in ipairs(backgroundParticles) do
        if p.frame.Parent then
            p.frame.BackgroundColor3 = targetColors.particleColor
        end
    end

    -- Set scan line color if applicable
    if scanLine.Parent then
        scanLine.BackgroundColor3 = targetColors.scanLineColor or targetColors.neonGlow
    end

    return duration
end

-- Function to switch to pink theme (SAU KHI tất cả biến đã được khai báo)
local function switchToPinkTheme()
    currentTheme = "pink"
    saveTheme("pink")

    -- Sub-theme variants with smooth transitions
    local hotPink = Color3.fromRGB(255, 20, 147)
    local pastelPink = Color3.fromRGB(255, 182, 193)
    local lightPink = Color3.fromRGB(255, 240, 245)

    local targetColors
    if pinkSubTheme == "hot" then
        targetColors = {
            bg = Color3.fromRGB(25, 0, 15),
            grad = ColorSequence.new{
                ColorSequenceKeypoint.new(0, hotPink),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 105, 180)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203))
            },
            frame = Color3.fromRGB(255, 228, 235),
            neonGlow = hotPink,
            inputContainer = Color3.fromRGB(255, 235, 240),
            inputBorder = hotPink,
            btn = hotPink,
            btnGrad = ColorSequence.new{
                ColorSequenceKeypoint.new(0, hotPink),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180))
            },
            title = hotPink,
            subtitle = Color3.fromRGB(255, 105, 180),
            particleColor = hotPink,
            scanLineColor = hotPink
        }
    else
        targetColors = {
            bg = Color3.fromRGB(30, 18, 25),
            grad = ColorSequence.new{
                ColorSequenceKeypoint.new(0, pastelPink),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 218, 221)),
                ColorSequenceKeypoint.new(1, lightPink)
            },
            frame = lightPink,
            neonGlow = pastelPink,
            inputContainer = Color3.fromRGB(255, 250, 252),
            inputBorder = pastelPink,
            btn = pastelPink,
            btnGrad = ColorSequence.new{
                ColorSequenceKeypoint.new(0, pastelPink),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 218, 221))
            },
            title = pastelPink,
            subtitle = Color3.fromRGB(255, 218, 221),
            particleColor = pastelPink,
            scanLineColor = pastelPink
        }
    end

    -- Smooth transition
    local transitionTime = smoothTransition(targetColors)

    -- Enable effects after transition
    task.wait(transitionTime * 0.5)
    scanLine.Visible = true
    createHeartRain()

    -- Morphing UI effect
    TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 500, 0, 340)
    }):Play()
    task.wait(0.3)
    TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 480, 0, 320)
    }):Play()
end

-- Function to switch to rainbow theme with smooth transitions
local function switchToRainbowTheme()
    currentTheme = "rainbow"
    saveTheme("rainbow")

    -- Initial smooth transition to base rainbow colors
    local baseColors = {
        bg = Color3.fromRGB(15, 15, 20),
        grad = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 0.9, 0.5)),
            ColorSequenceKeypoint.new(0.5, Color3.fromHSV(0.17, 0.9, 0.6)),
            ColorSequenceKeypoint.new(1, Color3.fromHSV(0.33, 0.9, 0.5))
        },
        frame = Color3.fromHSV(0.5, 0.7, 0.35),
        neonGlow = Color3.fromHSV(0, 0.9, 1),
        inputContainer = Color3.fromHSV(0.25, 0.6, 0.4),
        inputBorder = Color3.fromHSV(0, 0.9, 1),
        btn = Color3.fromHSV(0, 0.9, 1),
        btnGrad = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromHSV(0, 0.9, 1)),
            ColorSequenceKeypoint.new(1, Color3.fromHSV(0.17, 0.9, 1))
        },
        title = Color3.fromHSV(0, 0.9, 1),
        subtitle = Color3.fromHSV(0.17, 0.9, 0.8),
        particleColor = Color3.fromHSV(0, 0.9, 1),
        scanLineColor = Color3.fromHSV(0, 0.9, 1)
    }

    -- Smooth initial transition
    local transitionTime = smoothTransition(baseColors, 0.6)

    -- Start rainbow animation after transition
    task.wait(transitionTime)

    -- Rainbow mode sẽ tự động đổi màu liên tục với nhiều hiệu ứng hơn
    spawn(function()
        while currentTheme == "rainbow" and frame.Parent do
            local hue = (tick() * 120) % 360
            local color1 = Color3.fromHSV(hue / 360, 0.9, 0.5)
            local color2 = Color3.fromHSV((hue + 60) / 360, 0.9, 0.6)
            local color3 = Color3.fromHSV((hue + 120) / 360, 0.9, 0.5)

            -- Smooth color updates
            TweenService:Create(bg, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                BackgroundColor3 = Color3.fromRGB(15, 15, 20)
            }):Play()

            TweenService:Create(grad, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, color1),
                    ColorSequenceKeypoint.new(0.5, color2),
                    ColorSequenceKeypoint.new(1, color3)
                }
            }):Play()

            TweenService:Create(frame, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                BackgroundColor3 = Color3.fromHSV((hue + 180) / 360, 0.7, 0.35)
            }):Play()

            TweenService:Create(neonGlow, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                Color = Color3.fromHSV(hue / 360, 0.9, 1)
            }):Play()

            TweenService:Create(inputContainer, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                BackgroundColor3 = Color3.fromHSV((hue + 90) / 360, 0.6, 0.4)
            }):Play()

            TweenService:Create(inputBorder, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                Color = Color3.fromHSV(hue / 360, 0.9, 1)
            }):Play()

            TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                BackgroundColor3 = Color3.fromHSV(hue / 360, 0.9, 1)
            }):Play()

            TweenService:Create(btnGrad, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromHSV(hue / 360, 0.9, 1)),
                    ColorSequenceKeypoint.new(1, Color3.fromHSV((hue + 60) / 360, 0.9, 1))
                }
            }):Play()

            TweenService:Create(title, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                TextColor3 = Color3.fromHSV(hue / 360, 0.9, 1)
            }):Play()

            TweenService:Create(titleGlow, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                Color = Color3.fromHSV(hue / 360, 0.9, 1)
            }):Play()

            -- Rainbow particles with smooth transitions
            for _, p in ipairs(backgroundParticles) do
                if p.frame.Parent then
                    TweenService:Create(p.frame, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        BackgroundColor3 = Color3.fromHSV(hue / 360, 0.9, 1)
                    }):Play()
                end
            end

            -- Rainbow sound waves
            for i, wave in ipairs(soundWaves) do
                if wave.Parent then
                    TweenService:Create(wave, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        BackgroundColor3 = Color3.fromHSV((hue + i * 30) / 360, 0.9, 1)
                    }):Play()
                end
            end

            task.wait(0.02)
        end
    end)

    -- Rainbow cursor trail
    spawn(function()
        while currentTheme == "rainbow" and frame.Parent do
            if tick() - lastCursorTrail > 0.01 then
                local mouse = game:GetService("Players").LocalPlayer:GetMouse()
                local hue = (tick() * 200) % 360
                local trail = Instance.new("TextLabel", gui)
                trail.Size = UDim2.new(0, 30, 0, 30)
                trail.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
                trail.BackgroundTransparency = 1
                trail.Text = "🌈"
                trail.TextColor3 = Color3.fromHSV(hue / 360, 1, 1)
                trail.Font = Enum.Font.GothamBold
                trail.TextSize = 22
                trail.ZIndex = 8

                spawn(function()
                    for i = 1, 25 do
                        TweenService:Create(trail, TweenInfo.new(0.015, Enum.EasingStyle.Linear), {
                            TextTransparency = i / 25,
                            TextSize = trail.TextSize + 0.4,
                            Rotation = i * 22
                        }):Play()
                        task.wait(0.015)
                    end
                    trail:Destroy()
                end)
                lastCursorTrail = tick()
            end
            task.wait(0.01)
        end
    end)

    -- Rainbow matrix rain
    spawn(function()
        while currentTheme == "rainbow" and frame.Parent do
            for _, col in ipairs(matrixColumns) do
                if col.label.Parent then
                    local hue = (tick() * 20) % 360
                    TweenService:Create(col.label, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        TextColor3 = Color3.fromHSV(hue / 360, 0.8, 0.7)
                    }):Play()
                end
            end
            task.wait(0.1)
        end
    end)

    -- Rainbow sparkle effects
    spawn(function()
        while currentTheme == "rainbow" and frame.Parent do
            local sparkle = Instance.new("TextLabel", gui)
            sparkle.Size = UDim2.new(0, 35, 0, 35)
            sparkle.Position = UDim2.new(0.5, math.random(-400, 400), 0.5, math.random(-250, 250))
            sparkle.BackgroundTransparency = 1
            sparkle.Text = "✨"
            local hue = (tick() * 150) % 360
            sparkle.TextColor3 = Color3.fromHSV(hue / 360, 1, 1)
            sparkle.Font = Enum.Font.GothamBold
            sparkle.TextSize = math.random(24, 36)
            sparkle.ZIndex = 10

            local velocityX = math.random(-200, 200)
            local velocityY = math.random(-200, 200)
            local startTime = tick()

            spawn(function()
                while sparkle.Parent do
                    local elapsed = tick() - startTime
                    local x = sparkle.Position.X.Offset + velocityX * elapsed * 0.012
                    local y = sparkle.Position.Y.Offset + velocityY * elapsed * 0.012

                    sparkle.Position = UDim2.new(0.5, x, 0.5, y)
                    sparkle.Rotation = elapsed * 180
                    sparkle.TextTransparency = math.min(1, elapsed * 0.2)
                    sparkle.TextSize = sparkle.TextSize + 0.3

                    if elapsed > 5 then
                        sparkle:Destroy()
                        break
                    end
                    task.wait(0.015)
                end
            end)
            task.wait(0.1)
        end
    end)

    -- Morphing UI effect
    TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 500, 0, 340)
    }):Play()
    task.wait(0.3)
    TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 480, 0, 320)
    }):Play()

    -- Rainbow pulse effect
    spawn(function()
        while currentTheme == "rainbow" and frame.Parent do
            local hue = (tick() * 180) % 360
            TweenService:Create(neonGlow, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Color = Color3.fromHSV(hue / 360, 1, 1),
                Thickness = 6
            }):Play()
            task.wait(0.4)
            TweenService:Create(neonGlow, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Color = Color3.fromHSV(hue / 360, 1, 1),
                Thickness = 4
            }):Play()
            task.wait(0.4)
        end
    end)
end

-- Function to switch to cyberpunk theme with smooth transitions
local function switchToCyberpunkTheme()
    currentTheme = "cyberpunk"
    saveTheme("cyberpunk")

    -- Cyberpunk target colors
    local targetColors = {
        bg = Color3.fromRGB(5, 5, 10),
        grad = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)), -- Cyan
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 0, 255)), -- Magenta
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 0)) -- Yellow
        },
        frame = Color3.fromRGB(10, 10, 20),
        neonGlow = Color3.fromRGB(0, 255, 255),
        inputContainer = Color3.fromRGB(15, 15, 25),
        inputBorder = Color3.fromRGB(255, 0, 255),
        btn = Color3.fromRGB(0, 255, 255),
        btnGrad = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
        },
        title = Color3.fromRGB(255, 255, 0),
        subtitle = Color3.fromRGB(255, 255, 100),
        particleColor = Color3.fromRGB(0, 255, 255),
        scanLineColor = Color3.fromRGB(255, 0, 255)
    }

    -- Smooth transition to cyberpunk colors
    local transitionTime = smoothTransition(targetColors, 0.7)

    -- Update neon glow thickness smoothly
    TweenService:Create(neonGlow, TweenInfo.new(transitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        Thickness = 5
    }):Play()

    -- Enable effects after transition
    task.wait(transitionTime * 0.5)
    scanLine.Visible = true

    -- Glitch text effect for title
    spawn(function()
        while currentTheme == "cyberpunk" and frame.Parent do
            TweenService:Create(title, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                Text = "🔐 Nhập Key Truy Cập"
            }):Play()
            task.wait(0.1)
            TweenService:Create(title, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                Text = "🔐 Nhập K€y Truy Cập"
            }):Play()
            task.wait(0.1)
            TweenService:Create(title, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                Text = "🔐 Nhập Key Truy Cập"
            }):Play()
            task.wait(2)
        end
    end)

    -- Electric particle effects
    spawn(function()
        while currentTheme == "cyberpunk" and frame.Parent do
            local electric = Instance.new("Frame", gui)
            electric.Size = UDim2.new(0, 2, 0, math.random(20, 50))
            electric.Position = UDim2.new(0, math.random(0, 1920), 0, math.random(0, 1080))
            electric.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
            electric.BorderSizePixel = 0
            electric.ZIndex = 1
            Instance.new("UICorner", electric).CornerRadius = UDim.new(0, 1)

            TweenService:Create(electric, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
                Size = UDim2.new(0, 2, 0, 0),
                BackgroundTransparency = 1
            }):Play()
            task.wait(0.5)
            electric:Destroy()
            task.wait(math.random(1, 3))
        end
    end)

    -- Morphing UI effect
    TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 500, 0, 340)
    }):Play()
    task.wait(0.3)
    TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 480, 0, 320)
    }):Play()
end

-- Function to switch back to normal theme with smooth transitions
local function switchToNormalTheme()
    currentTheme = "normal"
    saveTheme("normal")

    -- Normal theme target colors
    local targetColors = {
        bg = Color3.fromRGB(10, 10, 15),
        grad = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 15, 35)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 25, 50)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 20, 40))
        },
        frame = Color3.fromRGB(20, 20, 28),
        neonGlow = Color3.fromRGB(100, 150, 255),
        inputContainer = Color3.fromRGB(30, 30, 40),
        inputBorder = Color3.fromRGB(80, 120, 200),
        btn = Color3.fromRGB(70, 140, 255),
        btnGrad = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 150, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 120, 220))
        },
        title = Color3.fromRGB(255, 255, 255),
        subtitle = Color3.fromRGB(180, 180, 200),
        particleColor = Color3.fromRGB(100, 150, 255),
        scanLineColor = Color3.fromRGB(100, 150, 255)
    }

    -- Smooth transition to normal colors
    local transitionTime = smoothTransition(targetColors, 0.6)

    -- Update neon glow thickness smoothly
    TweenService:Create(neonGlow, TweenInfo.new(transitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        Thickness = 3
    }):Play()

    -- Disable effects after transition
    task.wait(transitionTime * 0.5)
    scanLine.Visible = false

    -- Morphing UI effect
    TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 500, 0, 340)
    }):Play()
    task.wait(0.3)
    TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 480, 0, 320)
    }):Play()
end

-- Sparkle/Star Particles function
local function createSparkles()
    for i = 1, 20 do
        spawn(function()
            local sparkle = Instance.new("TextLabel", gui)
            sparkle.Size = UDim2.new(0, 20, 0, 20)
            sparkle.Position = UDim2.new(0.5, math.random(-300, 300), 0.5, math.random(-200, 200))
            sparkle.BackgroundTransparency = 1
            sparkle.Text = "✨"
            sparkle.TextColor3 = Color3.fromRGB(255, 255, 200)
            sparkle.Font = Enum.Font.GothamBold
            sparkle.TextSize = math.random(15, 25)
            sparkle.ZIndex = 10
            
            local velocityX = math.random(-100, 100)
            local velocityY = math.random(-100, 100)
            local startTime = tick()
            
            spawn(function()
                while sparkle.Parent do
                    local elapsed = tick() - startTime
                    local x = sparkle.Position.X.Offset + velocityX * elapsed * 0.01
                    local y = sparkle.Position.Y.Offset + velocityY * elapsed * 0.01
                    
                    sparkle.Position = UDim2.new(0.5, x, 0.5, y)
                    sparkle.Rotation = elapsed * 180
                    sparkle.TextTransparency = math.min(1, elapsed * 0.3)
                    sparkle.TextSize = sparkle.TextSize + 0.5
                    
                    if elapsed > 3 then
                        sparkle:Destroy()
                        break
                    end
                    task.wait(0.02)
                end
            end)
        end)
        task.wait(0.1)
    end
end

-- Heart Rain Effect (cho pink theme)
local function createHeartRain()
    for i = 1, 15 do
        spawn(function()
            local heart = Instance.new("TextLabel", gui)
            heart.Size = UDim2.new(0, 30, 0, 30)
            heart.Position = UDim2.new(0, math.random(0, 1920), 0, -50)
            heart.BackgroundTransparency = 1
            heart.Text = "💖"
            heart.TextColor3 = Color3.fromRGB(255, 105, 180)
            heart.Font = Enum.Font.GothamBold
            heart.TextSize = 25
            heart.ZIndex = 5
            
            local speed = math.random(50, 100)
            local sway = math.random(-20, 20)
            local startTime = tick()
            
            spawn(function()
                while heart.Parent do
                    local elapsed = tick() - startTime
                    local x = heart.Position.X.Offset + math.sin(elapsed * 2) * sway
                    local y = heart.Position.Y.Offset + speed * elapsed * 0.1
                    
                    heart.Position = UDim2.new(0, x, 0, y)
                    heart.Rotation = math.sin(elapsed * 3) * 15
                    heart.TextTransparency = math.min(1, elapsed * 0.2)
                    
                    if y > 1130 then
                        heart:Destroy()
                        break
                    end
                    task.wait(0.05)
                end
            end)
        end)
        task.wait(0.3)
    end
end

-- Particle Explosion function
local function createParticleExplosion(x, y)
    local colors = {
        Color3.fromRGB(255, 100, 100),
        Color3.fromRGB(100, 255, 100),
        Color3.fromRGB(100, 100, 255),
        Color3.fromRGB(255, 255, 100),
        Color3.fromRGB(255, 100, 255),
        Color3.fromRGB(100, 255, 255)
    }
    
    for i = 1, 40 do
        spawn(function()
            local particle = Instance.new("Frame", gui)
            particle.Size = UDim2.new(0, math.random(6, 12), 0, math.random(6, 12))
            particle.Position = UDim2.new(0, x, 0, y)
            particle.BackgroundColor3 = colors[math.random(1, #colors)]
            particle.BorderSizePixel = 0
            particle.ZIndex = 10
            Instance.new("UICorner", particle).CornerRadius = UDim.new(0, 3)
            
            local angle = (i / 40) * math.pi * 2
            local speed = math.random(200, 400)
            local velocityX = math.cos(angle) * speed
            local velocityY = math.sin(angle) * speed
            local gravity = 300
            local startTime = tick()
            
            spawn(function()
                while particle.Parent do
                    local elapsed = tick() - startTime
                    local newX = x + velocityX * elapsed * 0.01
                    local newY = y + velocityY * elapsed * 0.01 + 0.5 * gravity * elapsed * elapsed * 0.0001
                    
                    particle.Position = UDim2.new(0, newX, 0, newY)
                    particle.Rotation = elapsed * 360
                    particle.BackgroundTransparency = math.min(1, elapsed * 0.4)
                    
                    if elapsed > 2 then
                        particle:Destroy()
                        break
                    end
                    task.wait(0.02)
                end
            end)
        end)
    end
end

-- Confetti function
local function createConfetti()
    local colors = {
        Color3.fromRGB(255, 100, 100),
        Color3.fromRGB(100, 255, 100),
        Color3.fromRGB(100, 100, 255),
        Color3.fromRGB(255, 255, 100),
        Color3.fromRGB(255, 100, 255),
        Color3.fromRGB(100, 255, 255)
    }
    
    for i = 1, 30 do
        spawn(function()
            local confetti = Instance.new("Frame", gui)
            confetti.Size = UDim2.new(0, math.random(8, 16), 0, math.random(8, 16))
            confetti.Position = UDim2.new(0.5, math.random(-200, 200), 0.5, math.random(-150, 150))
            confetti.BackgroundColor3 = colors[math.random(1, #colors)]
            confetti.BorderSizePixel = 0
            confetti.ZIndex = 10
            Instance.new("UICorner", confetti).CornerRadius = UDim.new(0, 2)
            
            local velocityX = math.random(-300, 300)
            local velocityY = math.random(-400, -200)
            local gravity = 500
            
            local startTime = tick()
            spawn(function()
                while confetti.Parent do
                    local elapsed = tick() - startTime
                    local x = confetti.Position.X.Offset + velocityX * elapsed * 0.01
                    local y = confetti.Position.Y.Offset + velocityY * elapsed * 0.01 + 0.5 * gravity * elapsed * elapsed * 0.0001
                    
                    confetti.Position = UDim2.new(0.5, x, 0.5, y)
                    confetti.Rotation = elapsed * 360
                    confetti.BackgroundTransparency = math.min(1, elapsed * 0.5)
                    
                    if elapsed > 2 then
                        confetti:Destroy()
                        break
                    end
                    task.wait(0.01)
                end
            end)
        end)
        task.wait(0.05)
    end
end

-- Smooth fade in cho background
bg.BackgroundTransparency = 1
TweenService:Create(bg, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0.2
}):Play()

-- Tween intro với bounce effect và smooth transitions
frame.Position = UDim2.new(0.5, -240, 1.5, 0)
frame.Size = UDim2.new(0, 0, 0, 0)
frame.BackgroundTransparency = 1
TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, -240, 0.5, -160),
    Size = UDim2.new(0, 480, 0, 320),
    BackgroundTransparency = 0.1
}):Play()

-- Load saved theme on startup (cải thiện error handling)
local savedTheme = loadSavedTheme()
local themeLoaded = false
local success, errorMsg = pcall(function()
    if savedTheme == "pink" then
        switchToPinkTheme()
        themeLoaded = true
    elseif savedTheme == "rainbow" then
        switchToRainbowTheme()
        themeLoaded = true
    elseif savedTheme == "cyberpunk" then
        switchToCyberpunkTheme()
        themeLoaded = true
    else
        -- Default to normal theme
        currentTheme = "normal"
        themeLoaded = true
    end
end)

if not success then
    warn("Lỗi khi load theme:", errorMsg)
    currentTheme = "normal" -- Fallback to normal theme
    notify("Lỗi theme", "Không thể tải theme đã lưu, chuyển về theme mặc định.", 3)
elseif not themeLoaded then
    currentTheme = "normal"
end

-- Auto-focus input sau khi UI load (cải thiện error handling)
task.wait(0.7)
local focusSuccess, focusError = pcall(function()
    if box and box.Parent and box:IsA("TextBox") then
        box:CaptureFocus()
    end
end)
if not focusSuccess then
    warn("Lỗi khi focus input:", focusError)
end

-- Send user count when UI loads (track new users)
spawn(function()
    local userCountSuccess = sendUserCountToDiscord()
    if userCountSuccess then
        print("✅ User count sent to Discord")
    else
        print("⚠️ Failed to send user count (webhook not configured)")
    end
end)

-- Function to load code (safe guards) - cải thiện error handling
local function runCode()
    if not USER_CODE or type(USER_CODE) ~= "string" then
        warn("USER_CODE is missing or not a string. Aborting run.")
        notify("Lỗi", "Không có mã để chạy.", 4)
        return
    end
    -- try to call loadstring or fallback to load()
    local loader = loadstring or load
    if type(loader) ~= "function" then
        warn("No loadstring/load available in this environment; cannot execute hub.")
        notify("Lỗi", "Executor không hỗ trợ loadstring.", 4)
        return
    end

    -- Kiểm tra xem UI có tồn tại không trước khi destroy
    if blur and blur.Parent then
        pcall(function() blur:Destroy() end)
    end
    if gui and gui.Parent then
        pcall(function() gui:Destroy() end)
    end

    local success, errorMsg = pcall(function()
        local f, e = loader(USER_CODE)
        if not f then
            error("Failed to load code: " .. tostring(e))
        end
        local success2, errorMsg2 = pcall(f)
        if not success2 then
            error("Failed to execute code: " .. tostring(errorMsg2))
        end
    end)
    if not success then
        warn("⚠️ Lỗi khi chạy code:", errorMsg)
        notify("Lỗi khi chạy hub", tostring(errorMsg), 6)
        -- Tạo lại UI để user có thể thử lại
        pcall(function()
            local newGui = Instance.new("ScreenGui", CoreGui)
            newGui.Name = "ErrorUI"
            local errorLabel = Instance.new("TextLabel", newGui)
            errorLabel.Size = UDim2.new(0, 400, 0, 100)
            errorLabel.Position = UDim2.new(0.5, -200, 0.5, -50)
            errorLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            errorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            errorLabel.Text = "Lỗi khi chạy hub:\n" .. tostring(errorMsg) .. "\n\nVui lòng thử lại hoặc liên hệ admin."
            errorLabel.Font = Enum.Font.Gotham
            errorLabel.TextSize = 14
            Instance.new("UICorner", errorLabel).CornerRadius = UDim.new(0, 8)
            task.wait(10)
            newGui:Destroy()
        end)
    end
end

btn.MouseButton1Click:Connect(function()
    local raw = tostring(box.Text or "")
    local key = string.gsub(raw, "^%s*(.-)%s*$", "%1") -- trim whitespace

    if key == "" then
        status.TextColor3 = Color3.fromRGB(255, 180, 80)
        status.Text = currentLanguage == "vn" and "⚠️ Vui lòng nhập key" or "⚠️ Please enter a key"
        return
    end
    
    -- Check for special keys
    if key == PINK_THEME_KEY then
        switchToPinkTheme()
        status.TextColor3 = Color3.fromRGB(255, 182, 193)
        status.Text = currentLanguage == "vn" and "🌸 Đã chuyển sang theme hồng phấn!" or "🌸 Switched to pink theme!"
        box.Text = ""
        return
    elseif key == RAINBOW_THEME_KEY then
        switchToRainbowTheme()
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        status.Text = currentLanguage == "vn" and "🌈 Đã bật Rainbow Mode!" or "🌈 Rainbow Mode activated!"
        box.Text = ""
        return
    elseif key == "cyberpunk" then
        switchToCyberpunkTheme()
        status.TextColor3 = Color3.fromRGB(0, 255, 255)
        status.Text = currentLanguage == "vn" and "⚡ Đã bật Cyberpunk Mode!" or "⚡ Cyberpunk Mode activated!"
        box.Text = ""
        return
    elseif key == BACK_TO_NORMAL_KEY then
        switchToNormalTheme()
        status.TextColor3 = Color3.fromRGB(100, 255, 120)
        status.Text = currentLanguage == "vn" and "✨ Đã quay lại theme ban đầu!" or "✨ Back to normal theme!"
        box.Text = ""
        return
    elseif (currentTheme == "pink" or currentTheme == "rainbow" or currentTheme == "cyberpunk") and key == CORRECT_KEY then
        -- Trong pink/rainbow/cyberpunk theme, nhập datockac để vào UI
        errorCount = 0
        speedUpParticles()
        playUnlockAnimation()

        -- Sparkles effect
        createSparkles()

        -- Particle Explosion từ center
        local framePos = frame.AbsolutePosition
        local frameSize = frame.AbsoluteSize
        local centerX = framePos.X + frameSize.X / 2
        local centerY = framePos.Y + frameSize.Y / 2
        createParticleExplosion(centerX, centerY)

        -- Success Animation
        local originalSize = frame.Size
        TweenService:Create(frame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 500, 0, 340)
        }):Play()
        task.wait(0.15)
        TweenService:Create(frame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = originalSize
        }):Play()

        createConfetti()

        btn.Visible = false
        progressContainer.Visible = true
        animateProgress(1.2)
        status.TextColor3 = Color3.fromRGB(100, 255, 120)
        status.Text = currentLanguage == "vn" and "✔️ Key đúng, đang load..." or "✔️ Correct key, loading..."

        if rememberMeChecked then
            local ok = pcall(function() return saveKey(key) end)
            if not ok then
                status.Text = "⚠️ Không lưu được key"
            end
        else
            pcall(function() forgetKey() end)
        end

        task.wait(0.5)
        TweenService:Create(frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -240, -0.8, 0),
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }):Play()
        TweenService:Create(bg, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            BackgroundTransparency = 1
       }):Play()
        TweenService:Create(blur, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = 0
       }):Play()

        task.wait(0.8)
        stopLoadingAnimation()
        runCode()
    elseif key == CORRECT_KEY then
        errorCount = 0 -- Reset error count
        speedUpParticles() -- Speed up background particles
        
        -- Unlock Animation
        playUnlockAnimation()
        
        -- Sparkles effect
        createSparkles()
        
        -- Particle Explosion từ center
        local framePos = frame.AbsolutePosition
        local frameSize = frame.AbsoluteSize
        local centerX = framePos.X + frameSize.X / 2
        local centerY = framePos.Y + frameSize.Y / 2
        createParticleExplosion(centerX, centerY)
        
        -- Success Animation - Scale/Pulse effect
        local originalSize = frame.Size
        TweenService:Create(frame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 500, 0, 340)
        }):Play()
        task.wait(0.15)
        TweenService:Create(frame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = originalSize
        }):Play()
        
        -- Show confetti
        createConfetti()
        
        -- Show loading với progress bar
        btn.Visible = false
        progressContainer.Visible = true
        animateProgress(1.2)
        status.TextColor3 = Color3.fromRGB(100, 255, 120)
        status.Text = currentLanguage == "vn" and "✔️ Key đúng, đang load..." or "✔️ Correct key, loading..."
        startLoadingAnimation()
        
        -- Save key nếu remember me được check
        if rememberMeChecked then
            local ok = pcall(function() return saveKey(key) end)
            if not ok then
                status.Text = "⚠️ Không lưu được key"
            end
        else
            -- Xóa key nếu không check remember me
            pcall(function() forgetKey() end)
        end
        
        -- Smooth exit animation với fade
        task.wait(0.5)
        TweenService:Create(frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, -240, -0.8, 0),
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }):Play()
        TweenService:Create(bg, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            BackgroundTransparency = 1
       }):Play()
        TweenService:Create(blur, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = 0
       }):Play()
        
        task.wait(0.8)
        stopLoadingAnimation()
        runCode()
    else
        -- Glitch effect khi nhập sai nhiều lần
        createGlitchEffect()
        
        -- Shake animation for wrong key
        status.TextColor3 = Color3.fromRGB(255, 120, 120)
        status.Text = currentLanguage == "vn" and "❌ Sai key, vui lòng thử lại." or "❌ Wrong key, please try again."
        
        local shakeAmount = 10
        for i = 1, 3 do
            TweenService:Create(frame, TweenInfo.new(0.05), {
                Position = UDim2.new(0.5, -240 + shakeAmount, 0.5, -160)
            }):Play()
            task.wait(0.05)
            TweenService:Create(frame, TweenInfo.new(0.05), {
                Position = UDim2.new(0.5, -240 - shakeAmount, 0.5, -160)
            }):Play()
            task.wait(0.05)
            shakeAmount = shakeAmount * 0.7
        end
        TweenService:Create(frame, TweenInfo.new(0.1), {
            Position = UDim2.new(0.5, -240, 0.5, -160)
        }):Play()
        
        -- Clear input after delay
        task.wait(0.5)
        box.Text = ""
    end
end)

box.FocusLost:Connect(function(enter)
    if enter then
        btn.MouseButton1Click:Fire()
    end
end)

-- If a key was stored previously and it matches, auto-run the hub (cải thiện error handling)
do
    local saved = nil
    local loadSuccess, loadError = pcall(function() saved = loadSavedKey() end)
    if not loadSuccess then
        warn("Lỗi khi load saved key:", loadError)
        notify("Lỗi", "Không thể tải key đã lưu.", 3)
    elseif saved then
        -- trim whitespace from saved key
        saved = string.gsub(saved, "^%s*(.-)%s*$", "%1")
    end
    if saved and saved == CORRECT_KEY then
        -- show positive status with progress bar
        btn.Visible = false
        progressContainer.Visible = true
        animateProgress(1.2)
        status.TextColor3 = Color3.fromRGB(100, 255, 120)
        status.Text = currentLanguage == "vn" and "✔️ Key đã lưu, đang load..." or "✔️ Saved key, loading..."
        startLoadingAnimation()

        -- Smooth exit animation với fade (cải thiện error handling)
        task.wait(0.5)
        local exitSuccess, exitError = pcall(function()
            TweenService:Create(frame, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Position = UDim2.new(0.5, -240, -0.8, 0),
                Size = UDim2.new(0, 0, 0, 0),
                BackgroundTransparency = 1
            }):Play()
            TweenService:Create(bg, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                BackgroundTransparency = 1
           }):Play()
            TweenService:Create(blur, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = 0
           }):Play()
        end)

        if not exitSuccess then
            warn("Lỗi animation exit:", exitError)
            -- Fallback: destroy UI immediately
            if frame and frame.Parent then frame:Destroy() end
            if bg and bg.Parent then bg:Destroy() end
            if blur and blur.Parent then blur:Destroy() end
        else
            task.wait(0.8)
        end

        runCode()
    end
end


-- Thêm tính năng auto-save theme khi thay đổi
local function autoSaveCurrentTheme()
    local saveSuccess, saveError = pcall(function()
        saveTheme(currentTheme)
    end)
    if not saveSuccess then
        warn("Lỗi khi auto-save theme:", saveError)
    end
end

-- Hook vào các hàm switch theme để auto-save
local originalSwitchToPink = switchToPinkTheme
switchToPinkTheme = function()
    originalSwitchToPink()
    autoSaveCurrentTheme()
end

local originalSwitchToRainbow = switchToRainbowTheme
switchToRainbowTheme = function()
    originalSwitchToRainbow()
    autoSaveCurrentTheme()
end

local originalSwitchToCyberpunk = switchToCyberpunkTheme
switchToCyberpunkTheme = function()
    originalSwitchToCyberpunk()
    autoSaveCurrentTheme()
end

local originalSwitchToNormal = switchToNormalTheme
switchToNormalTheme = function()
    originalSwitchToNormal()
    autoSaveCurrentTheme()
end

