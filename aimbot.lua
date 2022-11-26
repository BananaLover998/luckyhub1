-- variables
getgenv().aimbot = false
getgenv().espcheck = false
getgenv().teamgame = false
local camera = game.Workspace.CurrentCamera
local plr = game.Players.LocalPlayer
local distance = nil 
local inputserv = game:GetService("UserInputService")
local distancechosen
local targetpart
local highlight = Instance.new("Highlight")



-- gui 

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "LuckyHub Universal Aimbot", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = "gg/2YwgM2rEPG",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
OrionLib:MakeNotification({
	Name = "Loading!",
	Content = "Made by behavior.#4917",
	Image = "rbxassetid://4483345998",
	Time = 5
})

Tab:AddToggle({
    Name = 'Team Game?',
    Default = false,
    Callback = function(value)
        teamgame = value
    end 
})


Tab:AddSlider({
	Name = "Distance(Lower the Closer)",
	Min = 10,
	Max = 200,
	Default = 75,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "studs",
	Callback = function(value)
		distancechosen = value
	end    
})

Tab:AddBind({
	Name = "Aimbot On",
	Default = Enum.KeyCode.Q,
	Hold = false,
	Callback = function(value)
	    
		if aimbot == true then 
		   aimbot = false 
		   OrionLib:MakeNotification({
            	Name = "Aimbot Toggle",
            	Content = "Off!",
            	Image = "rbxassetid://4483345998",
            	Time = 2
            })
	
		else
		    aimbot=true
		    OrionLib:MakeNotification({
            	Name = "Aimbot Toggle",
            	Content = "On!",
            	Image = "rbxassetid://4483345998",
            	Time = 2
            })
		end
	
	end    
})

Tab:AddToggle({
    Name = 'ESP',
    Default = false,
    Callback = function(value)
        espcheck = value
    end 
})

Tab:AddDropdown({
	Name = "Target Part",
	Default = "Head",
	Options = {"Head", "Torso"},
	Callback = function(Value)
		if Value == 'Head' then
            targetpart = Value 
        end 
        if Value == "Torso" then 
            targetpart = Value
        end
	end    
})






--esp 

 

    

-- actual aimbot 
while wait() do
    spawn(function()
        --esp start 
        if teamgame == false then 
            if espcheck == true then 
                for i, v in pairs(game.Players:GetChildren()) do 
                    if v.Character and v ~= plr and v.Character:FindFirstChild("Highlight") == nil then 
                        
                        local clone = highlight:Clone()
                        clone.FillTransparency = 0.5
                        clone.OutlineTransparency = 0.5
                        clone.Parent = v.Character 
                    end 
                end
            end
            
            if espcheck == false then 
                
                for i, v in pairs(game.Players:GetChildren()) do 
                    
                    if v.Character and v.Character:FindFirstChild("Highlight") then 
                        v.Character:FindFirstChild("Highlight"):Destroy()
                    end 
                end 
            end
            -- aimbot start 
            
            if aimbot == true then 
                
            
        
       
                for i, v in pairs(game.Players:GetChildren()) do
                    if v ~= plr and v.Character then 
                       
                        distance = (plr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                        if distance <= distancechosen then 
                            if targetpart == 'Head' then 
                                camera.CFrame = CFrame.new(camera.CFrame.Position, v.Character.Head.Position)
                                wait(0.01)
                            end 
                            if targetpart == "Torso" then 
                                camera.CFrame = CFrame.new(camera.CFrame.Position, v.Character.Torso.Position)
                                wait(0.01)
                            end 
                        end 
                    
                     
                    end
                end
            end
        end
        
        if teamgame == true then 
            if espcheck == true then 
                for i, v in pairs(game.Players:GetChildren()) do 
                    if v.Character and v ~= plr and v.Character:FindFirstChild("Highlight") == nil then 
                        if v.Team ~= plr.Team then 
                        
                            local clone = highlight:Clone()
                            clone.FillTransparency = 0.5
                            clone.OutlineTransparency = 0.5
                            clone.Parent = v.Character 
                        end 
                    end 
                end
            end
            
            if espcheck == false then 
                
                for i, v in pairs(game.Players:GetChildren()) do 
                    
                    if v.Character and v.Character:FindFirstChild("Highlight") then 
                        v.Character:FindFirstChild("Highlight"):Destroy()
                    end 
                end 
            end
            -- aimbot start 
            
            if aimbot == true then 
                
            
        
       
                for i, v in pairs(game.Players:GetChildren()) do
                    if v ~= plr and v.Character then 
                        if v.Team ~= plr.Team then 

                            distance = (plr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                            if distance <= distancechosen then 
                                if targetpart == 'Head' then 
                                    camera.CFrame = CFrame.new(camera.CFrame.Position, v.Character.Head.Position)
                                    wait(0.01)
                                end 
                                if targetpart == "Torso" then 
                                    camera.CFrame = CFrame.new(camera.CFrame.Position, v.Character.Torso.Position)
                                    wait(0.01)
                                end 
                            end 
                        end 
                    
                     
                    end
                end
            end
        end
    end)
end

OrionLib:Init()