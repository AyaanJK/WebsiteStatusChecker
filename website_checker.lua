-- Website Status Checker
print("Starting website checker...\n")

-- Function to read websites from text file
local function readWebsites()
    local websites = {}  
    local file = io.open("websites.txt", "r") 
    
    if not file then
        print("ERROR: Missing websites.txt")
        print("Please create a websites.txt file with one URL per line")
        return nil 
    end
    
    print("Websites to check:")
    for line in file:lines() do  
        line = line:gsub("%s+", "")
        if line ~= "" then  
            table.insert(websites, line)  
            print("- " .. line) 
        end
    end
    file:close() 
    
    return websites 
end

-- Function to check if a website is up
local function checkWebsite(url)
    local socket = require("socket")  
    local tcp = socket.tcp()  
    tcp:settimeout(5) 
    
    
    local protocol, host, port = url:match("^(https?)://([^:/]+):?(%d*)")
    port = port ~= "" and tonumber(port) or (protocol == "https" and 443 or 80)
    host = host:gsub("/.*$", "")  
    
  
    local success, err = pcall(function()
        return tcp:connect(host, port)
    end)
    
    tcp:close()  
    
    
    if success then
        return "UP"
    else
        
        return "DOWN ("..(err:match("[^:]+$") or "unknown error")..")"
    end
end

-- Main program execution
local websites = readWebsites()  -- Get list of websites
if not websites then return end  -- Exit if no websites found

print("\nChecking status...")
for _, url in ipairs(websites) do  -- Loop through each URL
    local status = checkWebsite(url)  -- Check current URL
    print(url .. ": " .. status)  -- Print result
end

print("\nAll done!")

-- Keep window open on Windows when double-clicked
if package.config:sub(1,1) == "\\" then
    print("\nPress Enter to exit...")
    local _ = io.read()
end
