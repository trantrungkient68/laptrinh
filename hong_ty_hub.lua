repeat task.wait() until game:IsLoaded()

-- 🟢 Nút mở menu chính
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=98094506942005"

UICorner.CornerRadius = UDim.new(1, 10)
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

-- 🪟 Giao diện chính
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat wait() until game:IsLoaded()

local Window = Fluent:CreateWindow({
	Title = "Hong_Ty Hub",
	SubTitle = "",
	TabWidth = 157,
	Size = UDim2.fromOffset(450, 300),
	Acrylic = true,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.End
})

-- 📑 Tabs
local Tabs = {
	Main0 = Window:AddTab({ Title = "main" }),
	Main1 = Window:AddTab({ Title = "tab troll" }),
	Main2 = Window:AddTab({ Title = "tab hết cứu" }),
	Main3 = Window:AddTab({ Title = "tab ADMIN" }),
	Main4 = Window:AddTab({ Title = "Server VIP" }),
	Main5 = Window:AddTab({ Title = "ban người chơi" })
}

-- TAB main
Tabs.Main0:AddButton({
	Title = "99 đêm trong nhà",
	Description = "99 đêm",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
	end
})

Tabs.Main0:AddButton({
	Title = "SHARDER",
	Description = "KO DÀNH CHO MÁY YẾU",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua'))()
	end
})

Tabs.Main0:AddButton({
	Title = "fly all game 🚀",
	Description = "Bay trong mọi game cực mượt 😎",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
	end
})

-- TAB troll
Tabs.Main1:AddButton({
	Title = "ko có chức năng",
	Description = "script này ngon á ko đủ chức năng cả😃",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
	end
})

-- TAB hết cứu
Tabs.Main2:AddButton({
	Title = "Lọ Vương Đại Đế 💀🔥",
	Description = "Triệu hồi sức mạnh tối thượng 👑",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))("Spider Script")
	end
})

-- TAB ADMIN
Tabs.Main3:AddButton({
	Title = "Admin👑",
	Description = "Mở lệnh admin (Infinite Yield)",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end
})

Tabs.Main3:AddButton({
	Title = "GodMode 💪",
	Description = "Bật chế độ bất tử",
	Callback = function()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		character:WaitForChild("Humanoid").Health = math.huge
		character:WaitForChild("Humanoid").MaxHealth = math.huge
		character:WaitForChild("Humanoid"):GetPropertyChangedSignal("Health"):Connect(function()
			character.Humanoid.Health = character.Humanoid.MaxHealth
		end)
	end
})

-- TAB Server VIP
Tabs.Main4:AddButton({
	Title = "Chuyển server ít người 🌐",
	Description = "Tự động chuyển qua server ít người nhất",
	Callback = function()
		local Http = game:GetService("HttpService")
		local TPS = game:GetService("TeleportService")
		local Api = "https://games.roblox.com/v1/games/"
		local _place = game.PlaceId
		local _servers = Api .. _place .. "/servers/Public?sortOrder=Asc&limit=100"
		local function ListServers(cursor)
			local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
			return Http:JSONDecode(Raw)
		end
		local Next
		repeat
			local Servers = ListServers(Next)
			for _, v in next, Servers.data do
				if v.playing < v.maxPlayers then
					TPS:TeleportToPlaceInstance(_place, v.id, game.Players.LocalPlayer)
					return
				end
			end
			Next = Servers.nextPageCursor
		until not Next
	end
})

Tabs.Main4:AddButton({
	Title = "Tạo server VIP (1 mình) 🔒",
	Description = "Tạo server riêng miễn phí chỉ có 1 mình bạn",
	Callback = function()
		local TeleportService = game:GetService("TeleportService")
		local placeId = game.PlaceId
		TeleportService:Teleport(placeId, game.Players.LocalPlayer)
	end
})
