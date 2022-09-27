    ["KILLBRICK"] = {
        func = function (doc, arguments, Utils, Settings, Defaults)
            if arguments[1] == "" then
                Utils.Warn("Please provide a part.")
                return
            end
            
            if arguments[2] then
                Utils.Warn("Consider using CollectionService(https://create.roblox.com/docs/reference/engine/classes/CollectionService) for multiple kill parts. (This quick will still run)")
            end
            
            local result = ""
            
            for _, argument in arguments do
                if result then
                    result = result.."\n"..argument..[[.Touched:Connect(function(hit)
    local Humanoid = hit.Parent.Parent:FindFirstChildWhichIsA("Humanoid", true)
    if not Humanoid then
        return
    end
    Humanoid.Health = 0
    end)]]
                else
                    -- Removes new line from first part.
                    result = result..argument..[[.Touched:Connect(function(hit)
    local Humanoid = hit.Parent.Parent:FindFirstChildWhichIsA("Humanoid", true)
    if not Humanoid then
        return
    end
    Humanoid.Health = 0
    end)]]
                end
            end
            
            return result
        end,
    },
