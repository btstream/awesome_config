local curl = require("lcurl")
-- local gears = require("gears")
local json = require("dkjson")

local BING = "https://www.bing.com/"
local META_URL = "https://www.bing.com/HPImageArchive.aspx?&format=js&idx=0&mkt=en-US&n=1"

local bingwallpaper = {
    savefolder = os.getenv("HOME") .. "/Pictures/Bing",
    -- cache_dir = gears.filesystem.get_xdg_cache_home()
    save_format = "jpg"
}

-- local function check_path()
--     if gears.filesystem.is_dir(bingwallpaper.savefolder) == false then
--         gears.filesystem.make_directories(bingwallpaper.savefolder)
--     end

--     if gears.filesystem.is_dir(bingwallpaper.cache_dir) == false then
--         gears.filesystem.make_directories(bingwallpaper.cache_dir)
--     end
-- end

function bingwallpaper.get_paper(size)
    -- check is path exist
    -- check_path()
    local meta_info = nil
    local retry = -1

    -- get meta info
    while meta_info == nil do
        curl.easy({
            url = META_URL,
            writefunction = function (s)
                meta_info, _, _ = json.decode(s, 1, nil)
            end,
        }):perform():close()
        retry = retry + 1
        if retry > 5 then
            break
        end
    end

    -- if get meta info success
    if meta_info ~= nil then
        -- image url
        local image_url = BING .. meta_info.images[1].urlbase .. "_" .. size .. "." .. bingwallpaper.save_format
        local back_url = BING .. meta_info.images[1].url
        local enddate = meta_info.images[1].enddate

        -- creata a temp file to save
        local tmp_file = os.tmpname()
        
        -- try to download image
        local res_status = -1
        retry = -1
        while res_status ~= 200 do
            local f = io.open(tmp_file, 'w')
            local down_url = image_url
            -- return code is 404, change back to back_image url
            if res_status == 404 then
                down_url = back_url
            end
            res_status = -1
            curl.easy({
                url = down_url,
                writefunction = function (s)
                    f:write(s)
                end,
                headerfunction = function (s)
                    -- print(s)
                    local i, _ = string.find(s, "HTTP/2")
                    if i ~= nil then
                        local res = {}
                        for word in s:gmatch("%w+") do
                            table.insert(res, word)
                        end
                        if res_status == -1 then
                            res_status = tonumber(res[#res])
                        end
                    end
                end
            }):perform():close()
            retry = retry + 1
            if res_status == 200 or retry > 5 then
                break
            end
            f:close()
        end

        -- download ok
        if res_status == 200 then
            -- TODO:
        end
    end
end

bingwallpaper.get_paper("3000x2000")
-- return bingwallpaper