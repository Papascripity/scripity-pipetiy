local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Roblox Town", "Sentinel")

--Main
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Trolling") 



MainSection:NewButton("Invisibility U", "click U to become invisible or visible and dont hold your gun when switching ", function()
    local key = Enum.KeyCode.U -- key to toggle invisibility
--// dont edit script below
local invis_on = false
function onKeyPress(inputObject, chat)
    if chat then return end
    if inputObject.KeyCode == key then
	    invis_on = not invis_on
    	if invis_on then
            local savedpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait()
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-25.95, 84, 3537.55))
            wait(.15)
            local Seat = Instance.new('Seat', game.Workspace)
            Seat.Anchored = false
            Seat.CanCollide = false
            Seat.Name = 'invischair'
            Seat.Transparency = 1
            Seat.Position = Vector3.new(-25.95, 84, 3537.55)
            local Weld = Instance.new("Weld", Seat)
            Weld.Part0 = Seat
            Weld.Part1 = game.Players.LocalPlayer.Character:FindFirstChild("Torso") or game.Players.LocalPlayer.Character.UpperTorso
            wait()
            Seat.CFrame = savedpos
            game.StarterGui:SetCore("SendNotification", {
                Title = "Invis On";
                Duration = 1;
                Text = "";
            })
        else
            workspace:FindFirstChild('invischair'):Remove()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Invis Off";
                Duration = 1;
                Text = "";
            })
        end
    end
end

game:GetService("UserInputService").InputBegan:connect(onKeyPress)
end)

MainSection:NewButton("Esp", "Goood ESP, you can see their underwears", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
end)

MainSection:NewButton("Fly F", "Click F to turn on or off fly like Homelander", function()
    repeat wait()
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
 local mouse = game.Players.LocalPlayer:GetMouse()
 repeat wait() until mouse
 local plr = game.Players.LocalPlayer
 local torso = plr.Character.Torso
 local flying = true
 local deb = true
 local ctrl = {f = 0, b = 0, l = 0, r = 0}
 local lastctrl = {f = 0, b = 0, l = 0, r = 0}
 local maxspeed = 50
 local speed = 0
 
 function Fly()
 local bg = Instance.new("BodyGyro", torso)
 bg.P = 9e4
 bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
 bg.cframe = torso.CFrame
 local bv = Instance.new("BodyVelocity", torso)
 bv.velocity = Vector3.new(0,0.1,0)
 bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
 repeat wait()
 plr.Character.Humanoid.PlatformStand = true
 if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
 speed = speed+.5+(speed/maxspeed)
 if speed > maxspeed then
 speed = maxspeed
 end
 elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
 speed = speed-1
 if speed < 0 then
 speed = 0
 end
 end
 if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
 bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
 lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
 elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
 bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
 else
 bv.velocity = Vector3.new(0,0.1,0)
 end
 bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
 until not flying
 ctrl = {f = 0, b = 0, l = 0, r = 0}
 lastctrl = {f = 0, b = 0, l = 0, r = 0}
 speed = 0
 bg:Destroy()
 bv:Destroy()
 plr.Character.Humanoid.PlatformStand = false
 end
 mouse.KeyDown:connect(function(key)
 if key:lower() == "f" then
 if flying then flying = false
 else
 flying = true
 Fly()
 end
 elseif key:lower() == "w" then
 ctrl.f = 1
 elseif key:lower() == "s" then
 ctrl.b = -1
 elseif key:lower() == "a" then
 ctrl.l = -1
 elseif key:lower() == "d" then
 ctrl.r = 1
 end
 end)
 mouse.KeyUp:connect(function(key)
 if key:lower() == "w" then
 ctrl.f = 0
 elseif key:lower() == "s" then
 ctrl.b = 0
 elseif key:lower() == "a" then
 ctrl.l = 0
 elseif key:lower() == "d" then
 ctrl.r = 0
 end
 end)
 Fly()
  
end)

MainSection:NewButton("Noclip t", "Noclips you click T to activate it", function()
    local nckey = "t";
local nclip = false;
local lp = game.Players.LocalPlayer
local ms = lp:GetMouse()
local rm = getrawmetatable(game)
local index = rm.__index
local bv = Instance.new("BoolValue");
bv.Value = false;
setreadonly(rm,false)

rm.__index = function(self,j)
   if tostring(self) == "Part" and tostring(j) == "Anchored" then
       return index(bv,"Value")
end
   return index(self,j)
end


game:GetService("RunService").Stepped:Connect(function()
   if nclip == true then
       lp.Character.Head.CanCollide = false
       lp.Character.Torso.CanCollide = false
   end
end);

ms.KeyDown:Connect(function(k)
   if k == nckey then
       nclip = not nclip
       if nclip == true then
           print("Noclip is on.")
       else
           print("Noclip if off.")
       end
   end
end)
end)


MainSection:NewButton("Fling check the description", ":fling (Player user) doesnt work when in passive", function()
    local Player   = game.Players.LocalPlayer

repeat wait() until Player.Character

local StoredCF = Player.Character:WaitForChild('Head').CFrame
local IsTPing  = false

local function GetPlayer(String)
   String = String or 'N/A'

   for i,v in pairs(game.Players:GetPlayers()) do
       if v.Name:lower():match('^'..String:lower()) then
           return v
       end
   end

   return false
end

Player.CharacterAdded:connect(function(Char)
   if IsTPing then
       IsTPing = false
       Char:WaitForChild('Head').CFrame = StoredCF
   end
end)

Player.Chatted:connect(function(Message)
   local Target   = GetPlayer(Message:match(':fling%s*(.+)'))
   local HasDied  = false
   local PPart    = Player.Character.PrimaryPart

   StoredCF = PPart.CFrame

   if not Target then
       return
   end

   repeat wait() until Target.Character

   IsTPing = true

   Target.Character:WaitForChild('Humanoid').Died:connect(function()
       HasDied = true
   end)

   local bodyp    = Instance.new("BodyPosition",PPart)
   bodyp.D        = 0
   bodyp.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
   bodyp.P = 15000

   repeat
       game:GetService("RunService").RenderStepped:Wait()
       pcall(function()
           bodyp.Position = Target.Character.PrimaryPart.Position
       end)
   until

       HasDied == true

   pcall(function()
       bodyp:Destroy()
       Player.Character:BreakJoints()
   end)

   print('Killed')

end)
end)

MainSection:NewButton("Mouse tp G", "Click G and point with you mouse where to tp ", function()
    plr = game.Players.LocalPlayer hum = plr.Character.HumanoidRootPart mouse = plr:GetMouse() mouse.KeyDown:connect(function(key) if key == "g" then if mouse.Target then hum.CFrame = CFrame.new(mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z) end end end)
end)

MainSection:NewButton("Noclip cam", "See trough walls like homelander", function()
    for useless, garbage in next,getgc() do
        if getfenv(garbage).script == game.Players.LocalPlayer.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper and typeof(garbage) == "function" then
            for number, value in next, getconstants(garbage) do
                if tonumber(value) == 0.25 then
                    setconstant(garbage,number,0)
                elseif tonumber(value) == 0 then
                    setconstant(garbage,number,0.25)
                end
            end
        end
     end
end)

MainSection:NewToggle("Aimbot", "To use Aimbot -> mouseclick2 ", function(state)
    if state then
        local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Holding = false

_G.AimbotEnabled = true
_G.TeamCheck = false -- If set to true then the script would only lock your aim at enemy team members.
_G.AimPart = "Head" -- Where the aimbot script would lock at.
_G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.

local function GetClosestPlayer()
	local MaximumDistance = math.huge
	local Target = nil
  
  	coroutine.wrap(function()
    		wait(20); MaximumDistance = math.huge -- Reset the MaximumDistance so that the Aimbot doesn't remember it as a very small variable and stop capturing players...
  	end)()

	for _, v in next, Players:GetPlayers() do
		if v.Name ~= LocalPlayer.Name then
			if _G.TeamCheck == true then
				if v.Team ~= LocalPlayer.Team then
					if v.Character ~= nil then
						if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
							if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
								local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
								local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
								
								if VectorDistance < MaximumDistance then
									Target = v
                  							MaximumDistance = VectorDistance
								end
							end
						end
					end
				end
			else
				if v.Character ~= nil then
					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
							local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
							
							if VectorDistance < MaximumDistance then
								Target = v
               							MaximumDistance = VectorDistance
							end
						end
					end
				end
			end
		end
	end

	return Target
end

UserInputService.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
    end
end)

RunService.RenderStepped:Connect(function()
    if Holding == true and _G.AimbotEnabled == true then
        TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
    end
end)
    else
        local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Holding = false

_G.AimbotEnabled = false
_G.TeamCheck = false -- If set to true then the script would only lock your aim at enemy team members.
_G.AimPart = "Head" -- Where the aimbot script would lock at.
_G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.

local function GetClosestPlayer()
	local MaximumDistance = math.huge
	local Target = nil
  
  	coroutine.wrap(function()
    		wait(20); MaximumDistance = math.huge -- Reset the MaximumDistance so that the Aimbot doesn't remember it as a very small variable and stop capturing players...
  	end)()

	for _, v in next, Players:GetPlayers() do
		if v.Name ~= LocalPlayer.Name then
			if _G.TeamCheck == true then
				if v.Team ~= LocalPlayer.Team then
					if v.Character ~= nil then
						if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
							if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
								local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
								local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
								
								if VectorDistance < MaximumDistance then
									Target = v
                  							MaximumDistance = VectorDistance
								end
							end
						end
					end
				end
			else
				if v.Character ~= nil then
					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
							local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
							
							if VectorDistance < MaximumDistance then
								Target = v
               							MaximumDistance = VectorDistance
							end
						end
					end
				end
			end
		end
	end

	return Target
end

UserInputService.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
    end
end)

RunService.RenderStepped:Connect(function()
    if Holding == true and _G.AimbotEnabled == true then
        TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
    end
end)
    end
end)

MainSection:NewButton("Gun Mod", "Hold your gun ", function()
    for i, Module in next, getgc(true) do
        if type(Module) == "table" and rawget(Module, "maxammo") then
            Module.Damage = 9999
            Module.BulletSpeed = 100000000000
            Module.scatter = 100000000000
            Module.GunRecoil = 0
            Module.AimFov = 25
            Module.HeadMultiplier = 5
            Module.LegMultiplier = 5
            Module.TorsoMultiplier = 5
            Module.waittime = 0
            Module.auto = true
        end
    end
end)

-- local player
local Player = Window:NewTab("YOU :°")
local PlayerSection = Player:NewSection("Player")

PlayerSection:NewSlider("Flash", "Somehow the speed slide doesnt work in this game", 500, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("Jump", "Hello, homelander", 500, 50, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)


PlayerSection:NewButton("Refresh", "Refreshs player", function()
    local player = game:getService("Players").LocalPlayer
local lastPosition = player.Character.PrimaryPart.Position
player.Character:BreakJoints()
Player.CharacterAdded:connect(function(char)
if (lastPosition ~= nil) then
char:moveTo(lastPosition)
lastPosition = nil
end
end)
end)

PlayerSection:NewButton("Infinite Jump", "Be a floppy bird", function()
    local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpHeight = 50;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
end)

PlayerSection:NewButton("Full Bright", "Its time to shine", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
end)

PlayerSection:NewButton("Set Spawn check description", "cmds: .set, .unset, .goto", function()
    local plr = game.Players.LocalPlayer
local spawn
plr.Chatted:Connect(function(msg)
    if msg:sub(1,3) == "/e " then msg = msg:sub(4) end
    if msg == ".set" then
        spawn = plr.Character.HumanoidRootPart.CFrame
    elseif msg == ".unset" then
        spawn = nil
    elseif msg == ".goto" then
        if type(spawn) == "userdata" then
            plr.Character.HumanoidRootPart.CFrame = spawn
        end
    end
end)
plr.CharacterAdded:Connect(function(char)
    if type(spawn) == "userdata" then
        wait(.5)
        char:WaitForChild'HumanoidRootPart'.CFrame = spawn
    end
end)
end)

-- Localitons
local Teleports = Window:NewTab("Teleports")
local TeleportsSection = Teleports:NewSection("Places") 


TeleportsSection:NewButton("Garage", "Teleports you to the garage", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8.48568821, 6.19999886, -30.3706055, -0.986343265, -1.68068244e-08, -0.164702535, -2.35496653e-08, 1, 3.89868227e-08, 0.164702535, 4.2333081e-08, -0.986343265)
end)


TeleportsSection:NewButton("House 1", "Teleports you to House 1", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(89.8881378, 7.97247887, -34.6394806, -0.997440875, -2.90861757e-09, 0.0714958608, -1.99462313e-09, 1, 1.28552733e-08, -0.0714958608, 1.26797683e-08, -0.997440875)
end)


TeleportsSection:NewButton("House 2", "Teleports you to House 2", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(7.5273385, 7.19999886, 143.651474, -0.999262869, -1.05299293e-07, 0.0383883528, -1.04136092e-07, 1, 3.23005267e-08, -0.0383883528, 2.82791053e-08, -0.999262869)
end)


TeleportsSection:NewButton("Gas Station", "Teleports you to Gas Station", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-245.693741, 7.19999886, 194.306992, 0.999912024, -8.5648395e-09, -0.0132627944, 8.57268478e-09, 1, 5.34653766e-10, 0.0132627944, -6.48304466e-10, 0.999912024)
end)


TeleportsSection:NewButton("House 3", "Teleports you to House 3", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-58.0201187, 6, -121.940987, -0.00628870819, 2.7520116e-08, -0.999980211, 5.62610794e-08, 1, 2.71668448e-08, 0.999980211, -5.60891209e-08, -0.00628870819)
end)

TeleportsSection:NewButton("Garage 2", "Teleports you to the garage 2", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(46.5584335, 6.19999886, -118.440529, 0.999970376, -4.88078342e-08, 0.00769597897, 4.83951652e-08, 1, 5.38075895e-08, -0.00769597897, -5.34335456e-08, 0.999970376)
end)

-- Misc
local Misc = Window:NewTab("Misc")
local MiscSection = Misc:NewSection("Others scripts")

MiscSection:NewButton("Inf Yield", "Good Fe admin but idk if this will be useful", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

MiscSection:NewButton("Aimbot and esp", "Great esp and aimbot is good ", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/Miscellaneous/main/UNIVERSAL.lua"))()
end)

MiscSection:NewButton("Locally Music Player", "Hear music while playing (client sided)", function()
    Draggable = false -- True = Draggable | False = Not draggable

game:GetService("StarterGui"):SetCore("SendNotification", {
   Title = "Music Player Loaded";
   Text  = "Note: Only you can locally hear the music";
   Icon = "rbxassetid://936721732";
   Duration = math.random(4,6);
   Button1 = "Okay"
})

-- Objects

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local PlaySubmit = Instance.new("TextButton")
local AudioID = Instance.new("TextBox")
local MusicPlayer = Instance.new("TextLabel")
local StopSubmit = Instance.new("TextButton")
local PitchSubmit = Instance.new("TextButton")
local Pitch = Instance.new("TextLabel")
local DistortSubmit = Instance.new("TextButton")
local Distort = Instance.new("TextLabel")
local PitchValue = Instance.new("TextBox")
local DistortionValue = Instance.new("TextBox")
local Speed = Instance.new("TextLabel")
local SpeedValue = Instance.new("TextBox")
local SpeedSubmit = Instance.new("TextButton")
local ResetPitchSpeedDistortion = Instance.new("TextButton")
local MusicPlayer_2 = Instance.new("TextLabel")
local False = Instance.new("TextButton")
local True = Instance.new("TextButton")

-- Properties

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.105882, 0.164706, 0.207843)
Frame.Position = UDim2.new(0.00910931174, 0, 0.578864336, 0)
Frame.Size = UDim2.new(0, 182, 0, 249)
Frame.Active = Draggable
Frame.Draggable = Draggable

PlaySubmit.Name = "PlaySubmit"
PlaySubmit.Parent = Frame
PlaySubmit.BackgroundColor3 = Color3.new(0, 1, 0.0666667)
PlaySubmit.Position = UDim2.new(0.0405219793, 0, 0.333471209, 0)
PlaySubmit.Size = UDim2.new(0, 75, 0, 26)
PlaySubmit.Font = Enum.Font.ArialBold
PlaySubmit.Text = "Play"
PlaySubmit.TextColor3 = Color3.new(0, 0, 0)
PlaySubmit.TextScaled = true
PlaySubmit.TextSize = 14
PlaySubmit.TextWrapped = true

AudioID.Name = "AudioID"
AudioID.Parent = Frame
AudioID.BackgroundColor3 = Color3.new(1, 1, 1)
AudioID.Position = UDim2.new(0.106456041, 0, 0.20366402, 0)
AudioID.Size = UDim2.new(0, 142, 0, 22)
AudioID.Font = Enum.Font.ArialBold
AudioID.Text = "Audio ID"
AudioID.TextColor3 = Color3.new(0, 0, 0)
AudioID.TextScaled = true
AudioID.TextSize = 14
AudioID.TextWrapped = true

MusicPlayer.Name = "Music Player"
MusicPlayer.Parent = Frame
MusicPlayer.BackgroundColor3 = Color3.new(1, 1, 1)
MusicPlayer.Size = UDim2.new(0, 182, 0, 36)
MusicPlayer.Font = Enum.Font.ArialBold
MusicPlayer.Text = "Music Player"
MusicPlayer.TextColor3 = Color3.new(0, 0, 0)
MusicPlayer.TextScaled = true
MusicPlayer.TextSize = 14
MusicPlayer.TextWrapped = true

StopSubmit.Name = "StopSubmit"
StopSubmit.Parent = Frame
StopSubmit.BackgroundColor3 = Color3.new(1, 0, 0)
StopSubmit.Position = UDim2.new(0.541560769, 0, 0.333471209, 0)
StopSubmit.Size = UDim2.new(0, 74, 0, 26)
StopSubmit.Font = Enum.Font.ArialBold
StopSubmit.Text = "Stop"
StopSubmit.TextColor3 = Color3.new(0, 0, 0)
StopSubmit.TextScaled = true
StopSubmit.TextSize = 14
StopSubmit.TextWrapped = true

PitchSubmit.Name = "PitchSubmit"
PitchSubmit.Parent = Frame
PitchSubmit.BackgroundColor3 = Color3.new(0, 1, 0.0666667)
PitchSubmit.Position = UDim2.new(0.0405219793, 0, 0.788832068, 0)
PitchSubmit.Size = UDim2.new(0, 45, 0, 18)
PitchSubmit.Font = Enum.Font.ArialBold
PitchSubmit.Text = "Submit"
PitchSubmit.TextColor3 = Color3.new(0, 0, 0)
PitchSubmit.TextScaled = true
PitchSubmit.TextSize = 14
PitchSubmit.TextWrapped = true

Pitch.Name = "Pitch"
Pitch.Parent = Frame
Pitch.BackgroundColor3 = Color3.new(1, 1, 1)
Pitch.Position = UDim2.new(0.0405219793, 0, 0.562249005, 0)
Pitch.Size = UDim2.new(0, 45, 0, 21)
Pitch.Font = Enum.Font.ArialBold
Pitch.Text = "Pitch"
Pitch.TextColor3 = Color3.new(0, 0, 0)
Pitch.TextScaled = true
Pitch.TextSize = 14
Pitch.TextWrapped = true

DistortSubmit.Name = "DistortSubmit"
DistortSubmit.Parent = Frame
DistortSubmit.BackgroundColor3 = Color3.new(0, 1, 0.0666667)
DistortSubmit.Position = UDim2.new(0.695406854, 0, 0.788832068, 0)
DistortSubmit.Size = UDim2.new(0, 45, 0, 18)
DistortSubmit.Font = Enum.Font.ArialBold
DistortSubmit.Text = "Submit"
DistortSubmit.TextColor3 = Color3.new(0, 0, 0)
DistortSubmit.TextScaled = true
DistortSubmit.TextSize = 14
DistortSubmit.TextWrapped = true

Distort.Name = "Distort"
Distort.Parent = Frame
Distort.BackgroundColor3 = Color3.new(1, 1, 1)
Distort.Position = UDim2.new(0.700901389, 0, 0.562249005, 0)
Distort.Size = UDim2.new(0, 45, 0, 21)
Distort.Font = Enum.Font.ArialBold
Distort.Text = "Distort"
Distort.TextColor3 = Color3.new(0, 0, 0)
Distort.TextScaled = true
Distort.TextSize = 14
Distort.TextWrapped = true

PitchValue.Name = "PitchValue"
PitchValue.Parent = Frame
PitchValue.BackgroundColor3 = Color3.new(1, 1, 1)
PitchValue.Position = UDim2.new(0.0405219793, 0, 0.681575656, 0)
PitchValue.Size = UDim2.new(0, 45, 0, 16)
PitchValue.Font = Enum.Font.ArialBold
PitchValue.Text = "1"
PitchValue.TextColor3 = Color3.new(0, 0, 0)
PitchValue.TextScaled = true
PitchValue.TextSize = 14
PitchValue.TextWrapped = true

DistortionValue.Name = "DistortValue"
DistortionValue.Parent = Frame
DistortionValue.BackgroundColor3 = Color3.new(1, 1, 1)
DistortionValue.Position = UDim2.new(0.700901389, 0, 0.681575656, 0)
DistortionValue.Size = UDim2.new(0, 45, 0, 16)
DistortionValue.Font = Enum.Font.ArialBold
DistortionValue.Text = "0"
DistortionValue.TextColor3 = Color3.new(0, 0, 0)
DistortionValue.TextScaled = true
DistortionValue.TextSize = 14
DistortionValue.TextWrapped = true

Speed.Name = "Speed"
Speed.Parent = Frame
Speed.BackgroundColor3 = Color3.new(1, 1, 1)
Speed.Position = UDim2.new(0.370192319, 0, 0.562249005, 0)
Speed.Size = UDim2.new(0, 45, 0, 21)
Speed.Font = Enum.Font.ArialBold
Speed.Text = "Speed"
Speed.TextColor3 = Color3.new(0, 0, 0)
Speed.TextScaled = true
Speed.TextSize = 14
Speed.TextWrapped = true

SpeedValue.Name = "SpeedValue"
SpeedValue.Parent = Frame
SpeedValue.BackgroundColor3 = Color3.new(1, 1, 1)
SpeedValue.Position = UDim2.new(0.370192319, 0, 0.681575656, 0)
SpeedValue.Size = UDim2.new(0, 45, 0, 16)
SpeedValue.Font = Enum.Font.ArialBold
SpeedValue.Text = "1"
SpeedValue.TextColor3 = Color3.new(0, 0, 0)
SpeedValue.TextScaled = true
SpeedValue.TextSize = 14
SpeedValue.TextWrapped = true

SpeedSubmit.Name = "SpeedSubmit"
SpeedSubmit.Parent = Frame
SpeedSubmit.BackgroundColor3 = Color3.new(0, 1, 0.0666667)
SpeedSubmit.Position = UDim2.new(0.370192319, 0, 0.788832068, 0)
SpeedSubmit.Size = UDim2.new(0, 45, 0, 18)
SpeedSubmit.Font = Enum.Font.ArialBold
SpeedSubmit.Text = "Submit"
SpeedSubmit.TextColor3 = Color3.new(0, 0, 0)
SpeedSubmit.TextScaled = true
SpeedSubmit.TextSize = 14
SpeedSubmit.TextWrapped = true

ResetPitchSpeedDistortion.Name = "Reset Pitch/Speed/Distortion"
ResetPitchSpeedDistortion.Parent = Frame
ResetPitchSpeedDistortion.BackgroundColor3 = Color3.new(0, 1, 0.968628)
ResetPitchSpeedDistortion.Position = UDim2.new(0.0405219793, 0, 0.909313977, 0)
ResetPitchSpeedDistortion.Size = UDim2.new(0, 165, 0, 16)
ResetPitchSpeedDistortion.Font = Enum.Font.ArialBold
ResetPitchSpeedDistortion.Text = "Reset Pitch/Speed/Distortion"
ResetPitchSpeedDistortion.TextColor3 = Color3.new(0, 0, 0)
ResetPitchSpeedDistortion.TextScaled = true
ResetPitchSpeedDistortion.TextSize = 14
ResetPitchSpeedDistortion.TextWrapped = true

MusicPlayer_2.Name = "Music Player"
MusicPlayer_2.Parent = Frame
MusicPlayer_2.BackgroundColor3 = Color3.new(1, 1, 1)
MusicPlayer_2.Position = UDim2.new(0.0384615399, 0, 0.461847395, 0)
MusicPlayer_2.Size = UDim2.new(0, 45, 0, 18)
MusicPlayer_2.Font = Enum.Font.ArialBold
MusicPlayer_2.Text = "Loop"
MusicPlayer_2.TextColor3 = Color3.new(0, 0, 0)
MusicPlayer_2.TextScaled = true
MusicPlayer_2.TextSize = 14
MusicPlayer_2.TextWrapped = true

False.Name = "False"
False.Parent = Frame
False.BackgroundColor3 = Color3.new(1, 0, 0)
False.Position = UDim2.new(0.700901449, 0, 0.461847395, 0)
False.Size = UDim2.new(0, 45, 0, 18)
False.Font = Enum.Font.ArialBold
False.Text = "False"
False.TextColor3 = Color3.new(0, 0, 0)
False.TextScaled = true
False.TextSize = 14
False.TextWrapped = true

True.Name = "True"
True.Parent = Frame
True.BackgroundColor3 = Color3.new(0, 1, 0.0666667)
True.Position = UDim2.new(0.370192319, 0, 0.461847395, 0)
True.Size = UDim2.new(0, 45, 0, 18)
True.Font = Enum.Font.ArialBold
True.Text = "True"
True.TextColor3 = Color3.new(0, 0, 0)
True.TextScaled = true
True.TextSize = 14
True.TextWrapped = true

PlaySubmit.MouseButton1Click:connect(function()
local ClientSound = Instance.new("Sound")
ClientSound.SoundId = "http://www.roblox.com/asset/?id="..AudioID.Text
ClientSound.Volume = .5
ClientSound.Parent = workspace
ClientSound.PlaybackSpeed = 1
ClientSound:Play()
wait()
ClientSound.Name = "Music_Player"
end)

StopSubmit.MouseButton1Click:connect(function()
for i=1,25 do
workspace["Music_Player"]:Remove()
wait()
end
end)

PitchSubmit.MouseButton1Click:connect(function()
local PitchShift = Instance.new("PitchShiftSoundEffect", workspace["Music_Player"])
PitchShift.Octave = PitchValue.Text
end)

DistortSubmit.MouseButton1Click:connect(function()
local DistortionLevel = Instance.new("DistortionSoundEffect", workspace["Music_Player"])
DistortionLevel.Level = DistortionValue.Text
end)

SpeedSubmit.MouseButton1Click:connect(function()
workspace["Music_Player"].PlaybackSpeed = SpeedValue.Text
end)

True.MouseButton1Click:connect(function()
workspace["Music_Player"].Looped = true
end)

False.MouseButton1Click:connect(function()
workspace["Music_Player"].Looped = false
end)

ResetPitchSpeedDistortion.MouseButton1Click:connect(function()
workspace["Music_Player"].PlaybackSpeed = 1
wait()
workspace["Music_Player"].PitchShiftSoundEffect:Remove()
wait()
workspace["Music_Player"].DistortionSoundEffect:Remove()
end)
end)

-- Guns 
local Guns = Window:NewTab("Guns")
local GunsSection = Guns:NewSection("Copy to Clipboard Guns")


GunsSection:NewButton("AK-45", "", function()
    setclipboard("!spawn Ak+eo+gre")
end)

GunsSection:NewButton("As-Val", "", function()
    setclipboard("!spawn As+eo+gre")
end)

GunsSection:NewButton("Desert eagle", "", function()
    setclipboard("!spawn Desert+eo+gre")
end)

GunsSection:NewButton("Five Seven", "", function()
    setclipboard("!spawn five+eo+gre")
end)

GunsSection:NewButton("G36C", "", function()
    setclipboard("!spawn G36C+eo+gre")
end)

GunsSection:NewButton("Glock-18", "", function()
    setclipboard("!spawn glock+eo+gre")
end)

GunsSection:NewButton("L85A2", "", function()
    setclipboard("!spawn L8+eo+gre")
end)

GunsSection:NewButton("M16A3", "", function()
    setclipboard("!spawn M16+eo+gre")
end)

GunsSection:NewButton("M1911", "", function()
    setclipboard("!spawn M19+eo+gre")
end)

GunsSection:NewButton("M4", "", function()
    setclipboard("!spawn M4+eo+gre")
end)

GunsSection:NewButton("M9", "", function()
    setclipboard("!spawn M9+eo+gre")
end)

GunsSection:NewButton("Magnum Revolver", "", function()
    setclipboard("!spawn Magnum+eo+gre")
end)

GunsSection:NewButton("MG4", "", function()
    setclipboard("!spawn MG+eo+gre")
end)

GunsSection:NewButton("MP443", "", function()
    setclipboard("!spawn MP4+eo+gre")
end)

GunsSection:NewButton("MP7", "", function()
    setclipboard("!spawn MP7+eo+gre")
end)

GunsSection:NewButton("P226", "", function()
    setclipboard("!spawn P22+eo+gre")
end)

GunsSection:NewButton("Remington 870", "", function()
    setclipboard("!spawn Remington+eo+gre")
end)

GunsSection:NewButton("RF8", "", function()
    setclipboard("!spawn RF+eo+gre")
end)

GunsSection:NewButton("Saddlegun", "", function()
    setclipboard("!spawn Sedd+eo+gre")
end)

GunsSection:NewButton("SKS", "", function()
    setclipboard("!spawn SKS+eo+gre")
end)

GunsSection:NewButton("SR-2", "", function()
    setclipboard("!spawn SR+eo+gre")
end) 

GunsSection:NewButton("Steyr Elit", "", function()
    setclipboard("!spawn Steyr+eo+gre")
end)

GunsSection:NewButton("Ump-40", "", function()
    setclipboard("!spawn Ump+eo+Gre")
end)

GunsSection:NewButton("Tumor-growth", "", function()
    setclipboard("!spawn Tumor+eo+gre")
end)

local GunsSection = Guns:NewSection("Gamepass Guns clipboard")

GunsSection:NewButton("Akimbo M9", "", function()
    setclipboard("!spawn Akimbo+eo+gre")
end)

GunsSection:NewButton("Cowboy Gun", "", function()
    setclipboard("!spawn Cowboy+eo+gre")
end)

GunsSection:NewButton("Double barrel", "", function()
    setclipboard("!spawn Double+eo+gre")
end)

GunsSection:NewButton("FAL", "", function()
    setclipboard("!spawn FAL+eo+gre")
end)

GunsSection:NewButton("SPAS-12", "", function()
    setclipboard("!spawn Spas+eo+gre")
end)

GunsSection:NewButton("Groza-4", "", function()
    setclipboard("!spawn Groza+eo+gre")
end)

GunsSection:NewButton("Classic Pistol", "", function()
    setclipboard("!spawn Classic+eo+gre")
end)

GunsSection:NewButton("BArret M82A3", "", function()
    setclipboard("!spawn Barret+Hunt+gre")
end)

GunsSection:NewButton("PP2000", "", function()
    setclipboard("!spawn PP2+eo+gre")
end)

GunsSection:NewButton("Unica-6", "", function()
    setclipboard("!spawn Unic+eo+gre")
end)

GunsSection:NewButton("Fail", "", function()
    setclipboard("!spawn Fail+eo+gre")
end)

GunsSection:NewButton("Ithaca 37 StakeOut", "", function()
    setclipboard("!spawn Itha+eo+gre")
end)

GunsSection:NewButton("KRISS Vector", "", function()
    setclipboard("!spawn Kriss+eo+gre")
end)

GunsSection:NewButton("Luger P08", "", function()
    setclipboard("!spawn Luger+eo+gre")
end)

GunsSection:NewButton("M1921", "", function()
    setclipboard("!spawn M1921+eo+gre")
end)

GunsSection:NewButton("Riot Shield", "", function()
    setclipboard("!spawn riot+eo+gre")
end)

GunsSection:NewButton("Scar-H", "", function()
    setclipboard("!spawn Scar+eo+gre")
end)

GunsSection:NewButton(" UTS-15", "", function()
    setclipboard("!spawn Uts+eo+gre")
end)

GunsSection:NewButton("Walther WA2000", "", function()
    setclipboard("!spawn Walther+eo+gre")
end)


--Armor
local Armor = Window:NewTab("Armor")
local ArmorSection = Armor:NewSection("Copy to Clipboard Armor")

ArmorSection:NewButton("COM", "", function()
    setclipboard("!sa com")
end)

ArmorSection:NewButton("FBI", "", function()
    setclipboard("!sa fbi")
end)

ArmorSection:NewButton("The rise of GRU", "", function()
    setclipboard("!sa gru")
end)

ArmorSection:NewButton("HCS", "", function()
    setclipboard("!sa hcs")
end)

ArmorSection:NewButton("RGF", "", function()
    setclipboard("!sa RGF")
end)

ArmorSection:NewButton("RIOT", "", function()
    setclipboard("!sa riot")
end)

ArmorSection:NewButton("ROBES", "", function()
    setclipboard("!sa robes")
end)

ArmorSection:NewButton("ROBES2", "", function()
    setclipboard("!sa robes2")
end)

ArmorSection:NewButton("SAS", "", function()
    setclipboard("!sa SAS")
end)

ArmorSection:NewButton("SLAV", "", function()
    setclipboard("!sa Slav")
end)

ArmorSection:NewButton("SWAT", "", function()
    setclipboard("!sa swat")
end)

ArmorSection:NewButton("TENOR", "", function()
    setclipboard("!sa Tenor")
end)

ArmorSection:NewButton("VDV", "", function()
    setclipboard("!sa VDV")
end)

ArmorSection:NewButton("RUSKY", "", function()
    setclipboard("!sa rusky")
end)

--Others
local Others = Window:NewTab("Others")
local OthersSection = Others:NewSection("Copy to Clipboard Others")

OthersSection:NewButton("Balaclava", "", function()
    setclipboard("!spawn balaclava")
end)

OthersSection:NewButton("Ballistics Helmet", "", function()
    setclipboard("!spawn ballisticshelmet")
end)

OthersSection:NewButton("Ballistics Vest", "", function()
    setclipboard("!spawn ballisticsvest")
end)

OthersSection:NewButton("Bandage", "", function()
    setclipboard("!spawn bandage")
end)

OthersSection:NewButton("Defibrillator", "", function()
    setclipboard("!spawn def")
end)

OthersSection:NewButton("fire axe", "", function()
    setclipboard("!spawn fire")
end)

OthersSection:NewButton("Hammer", "", function()
    setclipboard("!spawn hammer")
end)

OthersSection:NewButton("Laptop", "", function()
    setclipboard("!spawn laptop")
end)
OthersSection:NewButton("Mask", "", function()
    setclipboard("!spawn mask")
end)

OthersSection:NewButton("Medikit", "", function()
    setclipboard("!spawn medikit")
end)

OthersSection:NewButton("Nv", "", function()
    setclipboard("!spawn nv")
end)

OthersSection:NewButton("Pickaxe", "", function()
    setclipboard("!spawn pickaxe")
end)

OthersSection:NewButton("Wrench", "", function()
    setclipboard("!spawn wrench")
end)
