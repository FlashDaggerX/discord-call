-- GLua Script

webhook = {}

local json = {}
local held = nil

function webhook:CreateEmbeds(content)
    json["embeds"] = content
end

function webhook:CreateUsername(content)
    json["username"] = content
end

function webhook:CreateContent(content)
    json["content"] = content
end

function webhook:CreateWebhookJSON(store)
    local final = ""
    local obj = ""

    for k, v in pairs(json) do
        if type(v) == 'table' then
            for kf, vf in pairs(json[k]) do
                if vf == nil then vf = "" end

                obj = obj.."\""..kf.."\":\""..vf.."\","
            end
        else
            final = final.."\""..k.."\":\""..v.."\","
        end

    end
    obj = "{"..obj.."}"
    final = "{"..final.."\"embeds\":".."["..obj.."]".."}"

    -- This is done because 'string.TrimLeft(obj, ',')' doesn't work. Must be a bug.
    final = string.SetChar(final, #final-3, '')

    if store then held = final end
    
    return final
end

function webhook:GetHeldJSON()
    return held
end

function webhook:Clear()
    json = {}
    held = nil
end
