local Players = game.Players
local lp = Players.LocalPlayer

local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
lp.OnTeleport:Connect(function() queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/FadedIndividual/My-Own-Scripts/main/jaded.lua'))()") end)

local Seconds = loadstring(game:HttpGet('https://raw.githubusercontent.com/FadedIndividual/My-Own-Scripts/main/Serverhop.lua'))()
local tablef = loadstring(game:HttpGet('https://raw.githubusercontent.com/FadedIndividual/My-Own-Scripts/main/STRINGS.lua'))()
local Tick, tik, tiktok = tick(), tick(), tick()

function chatMessage(str)
    str = tostring(str)
    if game.TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        game.TextChatService.TextChannels.RBXGeneral:SendAsync(str)
    else
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, "All")
    end
end

Funk_RV = function()
	for _,z in pairs(lp.Character:GetChildren()) do
		if z:IsA'BasePart' then
			z.Velocity = Vector3.zero
			z.RotVelocity = Vector3.zero
			z.Massless = true
			z.CanCollide = false
		end
	end
end

Funk = function(pqs, Original)
	if pqs and pqs.Character and pqs.Character.Humanoid and pqs.Character.Humanoid.Health >= 1.5 then
		local num = 0
		local rndd = math.random(1, 5)
		local timeee = tick()
		repeat task.wait()
			pcall(function()
				num = num + 10
				local Ours, Theirs = lp.Character:FindFirstChild("HumanoidRootPart"), pqs.Character:FindFirstChild("HumanoidRootPart")
				
				if Ours and Theirs then
					spawn(Funk_RV) Ours.CFrame = Theirs.CFrame * CFrame.Angles(0, math.rad(num), 0) * CFrame.new(0, 0, rndd) spawn(Funk_RV)
				end
			end)
		until not pqs or not pqs.Character or pqs.Character:FindFirstChild("Humanoid").Health <= 1.5 or not pqs.Character:FindFirstChild("HumanoidRootPart") or (pqs.Character:FindFirstChild("HumanoidRootPart").Position - Original).Magnitude >= 13 or tick() - timeee >= 15
		return
	else
		return
	end
end

spawn(function()
	while task.wait() do
		if tick() - tiktok >= 2 then tiktok = tick()
			pcall(function()
				lp.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
			end)
		end
		if tick()-tik >= 6 then tik = tick()
			local rnp = tablef[math.random(1, #tablef)]
			for _, z in pairs(rnp) do
				chatMessage(z)
			end
		end
		if tick() - Tick >= 20 then Tick = tick()
			tablef = loadstring(game:HttpGet('https://raw.githubusercontent.com/FadedIndividual/My-Own-Scripts/main/STRINGS.lua'))()
		end
	end
end)

spawn(function()
	while task.wait() do
		for _, z in pairs(Players:GetPlayers()) do
			if z~=lp and not table.find({186860567}, z.UserId) then
				if z.Character and z.Character:FindFirstChild("HumanoidRootPart") then
					local Pos_Saved = z.Character:FindFirstChild("HumanoidRootPart").Position
					pcall(function()
						Funk(z, Pos_Saved)
					end)
				end
			end
		end
	end
end)
