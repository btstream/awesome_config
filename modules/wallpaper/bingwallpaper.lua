local curl = require("lcurl")
local awful = require("awful")
local json = require("dkjson")
local naughty = require("naughty")
local beautiful = require("beautiful")
local gears = require("gears")
local download_image = require("modules.wallpaper.download_image")

local BING = "https://www.bing.com/"
local META_URL = "https://www.bing.com/HPImageArchive.aspx?&format=js&idx=0&mkt=en-US&n=1"

local bingwallpaper = {
    savefolder = os.getenv("HOME") .. "/Pictures/Bing",
    wallpaper = gears.filesystem.get_xdg_cache_home() .. "/awesome-bingwallpaper",
    save_format = "jpg"
}

local function check_path()
    if gears.filesystem.is_dir(bingwallpaper.savefolder) == false then
        gears.filesystem.make_directories(bingwallpaper.savefolder)
    end
end

check_path()
-- if cache path does not exist, create a link from default theme
function bingwallpaper:set_wallpaper(s)
    if not gears.filesystem.file_readable(bingwallpaper.wallpaper) then
        awful.spawn.easy_async_with_shell(
            "ln -sf " .. beautiful.wallpaper .. " " .. bingwallpaper.wallpaper,
            function()
                gears.wallpaper.maximized(bingwallpaper.wallpaper, s, true)
                awful.spawn.with_shell("betterlockscreen -u " .. beautiful.wallpaper)
            end
        )
    else
        gears.wallpaper.maximized(bingwallpaper.wallpaper, s, true)
    end
end

function bingwallpaper.update(size, callback)
    -- check is path exist
    local meta_info = nil
    local retry = -1
    callback = callback or function() 
        for s in screen do
            s:emit_signal("request::wallpaper")
        end
    end

    -- get meta info
    while meta_info == nil do
        curl.easy({
            url = META_URL,
            writefunction = function (s)
                print(s)
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
        local copyright = meta_info.images[1].copyright
        local saved_image = bingwallpaper.savefolder .. "/bing-wallpaper-" .. enddate .. "." .. bingwallpaper.save_format
        local saved_copyright = bingwallpaper.savefolder .. "/bing-wallpaper-" .. enddate .. ".txt"

        if gears.filesystem.file_readable(saved_image) then
            return
        end

        -- creata a temp file to save
        local tmp_file = os.tmpname()

        -- try to download image
        local res_status = download_image(tmp_file, image_url)

        -- image does not exist, change to back_url
        if res_status == 404 then
            res_status = download_image(tmp_file, back_url)
        end

        local save_image_cmd = "mv " .. tmp_file .. " " .. saved_image .. " && ln -sf " .. saved_image .. " " .. bingwallpaper.wallpaper
        if res_status == 200 then
            -- move file to saved path
            if (bingwallpaper.savefolder ~= nil) then
                -- write copyright infomation
                local copyright_file = io.open(saved_copyright, "w")
                copyright_file:write(copyright)
                copyright_file:close()
            else
                save_image_cmd = "mv " .. tmp_file .. " " .. bingwallpaper.wallpaper
            end
            awful.spawn.easy_async_with_shell(
                save_image_cmd,
                function()
                    callback()
                    awful.spawn.with_shell("betterlockscreen -u " .. bingwallpaper.wallpaper)
                end
            )
        end
    end
end

return bingwallpaper
