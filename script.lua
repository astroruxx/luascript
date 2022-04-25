if game.PlaceId == 155615604 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Prison life", "DarkTheme")
    --MAIN
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Humanoid")
    MainSection:NewDropdown("Give Gun", "Give localplayer a gun", {"M9", "Remington 870", "AK-47"}, function(v)
    local args = {[1] = workspace.Prison_ITEMS.giver:FindFirstChild(v).ITEMPICKUP}
    workspace.Remote.ItemHandler:InvokeServer(unpack(args))
end)
    MainSection:NewDropdown("Gun Mods", "Makes Gun op", {"M9", "Remington 870", "AK-47"}, function(v)
        local module = nil
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then 
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        end
           if module ~= nil then
               module["MaxAmmo"] = math.huge
               module["CurrentAmmo"] = math.huge
               module["StoredAmmo"] = math.huge
               module["AutoFire"] = true
               module["FireRate"] = 0.000001
           end 
        end)
    

    --PLAYER
    local Player = Window:NewTab("Player")
    local PlayerSection = Player:NewSection("Humanoid")
    --WalkSpeed
    PlayerSection:NewSlider("WalkSpeed", "Changes walkspeed of localplayer", 250, 5, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    --JumpPower
    PlayerSection:NewSlider("JumpPower", "Changes jumppower of localplayer", 250, 5, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    elseif game.PlaceId == 3956818381 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Ninja Legends", "DarkTheme")
    --MAIN
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Auto")
    MainSection:NewToggle("Auto Swing", "Make your life easier", function(v)
        getgenv().autoswing = v
        while true do
            if not getgenv().autoswing then return end
            for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:FindFirstChild("ninjitsuGain") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                    break
                end
            end
            local args = {[1] = "swingKatana"}
            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))

                wait(0.1)
            end
    end)
    MainSection:NewToggle("Auto Sell", "Auto Sell at best island", function(v)
        getgenv().autosell = v
        while true do
            if getgenv().autoswing == false then return end
            game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(0.1)
            game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
            wait(0.1)
        end
    end)
    MainSection:NewToggle("Auto Buy Sword", "Auto Buy Sword", function(v)
        getgenv().autosword = v
        while true do
            if getgenv().autosword == false then return end
            local args = {
                [1] = "buyAllSwords",
                [2] = "Ground"
            }
            
            game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(unpack(args))
    wait(0.1)            
        end
    end)

    local Info = Window:NewTab("Misc")
    local Infosection = Info:NewSection("Misc")
    Infosection:NewKeybind("Choose Keybind", "Keybind to toggle ui", Enum.KeyCode.F, function()
        Library:ToggleUI()
    end)
    Infosection:NewSlider("WalkSpeed", "Changes Local Players walkspeed", 500, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    Infosection:NewSlider("JumpPower", "Changes Local Players Jumppower", 10000, 50, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
end
