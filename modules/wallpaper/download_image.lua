local curl = require("lcurl")

local function download_image(dest, url)
    local response_status = -1
    local response_header = {}
    local f = io.open(dest, 'w')
    curl.easy({
        url = url,
        writefunction = function (s)
            f:write(s)
        end,
        headerfunction = function (s)
            table.insert(response_header, s)
        end
    }):perform():close()
    f:close()

    local sheaders = {}
    for i in response_header[1]:gmatch("%S+") do
        table.insert(sheaders, i)
    end

    response_status = tonumber(sheaders[2])
    return response_status
end

return download_image