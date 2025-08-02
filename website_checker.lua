-- Website Network Status Checker
print("Starting website checker...\n")

-- Color Codes
local COLORS = {
    RED = "\27[31m",   
    GREEN = "\27[32m",  
    RESET = "\27[0m"    
}

local function readWebsites()
    local websites = {}
    local file = io.open("websites.txt", "r")
    
    if not file then
        print(COLORS.RED.."ERROR: Missing websites.txt"..COLORS.RESET)
        print("Create a file named 'websites.txt' with one URL per line")
        return nil
    end
    
    print("Websites to check:")
    for line in file:lines() do
        line = line:gsub("%s+", "") 
        if line ~= "" then
            if not line:match("^https?://") then
                line = "http://"..line 
            end
            table.insert(websites, line)
            print("- "..line)
        end
    end
    file:close()
    
    return websites
end

local function checkWebsite(url)
    local socket = require("socket")
    local tcp = socket.tcp()
    tcp:settimeout(5)
    
    local protocol, host = url:match("^(https?)://([^/]+)")
    local port = protocol == "https" and 443 or 80
    
    local success, err = pcall(function()
        return tcp:connect(host, port)
    end)
    tcp:close()
    
    return success, err
end

-- Main --
local websites = readWebsites()
if not websites then return end

print("\nChecking status...")
for _, url in ipairs(websites) do
    local success, err = checkWebsite(url)
    local status = success and "UP" or "DOWN ("..(err:match("[^:]+$") or "timeout")..")"
    local color = success and COLORS.GREEN or COLORS.RED
    
    print(string.format("%-40s: %s%s%s", 
          url, 
          color, 
          status, 
          COLORS.RESET))
end

print("\nAll done!")


if package.config:sub(1,1) == "\\" then
    print("\nPress Enter to exit...")
    local _ = io.read()
end