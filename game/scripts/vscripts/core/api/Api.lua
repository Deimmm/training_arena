local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 2,["10"] = 2,["12"] = 3,["13"] = 4,["14"] = 5,["15"] = 6,["16"] = 6,["17"] = 8,["19"] = 9,["20"] = 10,["22"] = 6,["23"] = 6,["24"] = 4,["25"] = 14,["26"] = 15,["27"] = 19,["28"] = 19,["29"] = 19,["30"] = 19,["31"] = 20,["32"] = 21,["33"] = 22,["35"] = 24,["37"] = 20,["38"] = 14,["39"] = 28,["41"] = 29,["42"] = 34,["43"] = 35,["44"] = 36,["46"] = 38,["47"] = 39,["48"] = 40,["49"] = 41,["50"] = 47,["52"] = 34,["54"] = 28});
local ____exports = {}
____exports.API = __TS__Class()
local API = ____exports.API
API.name = "API"
function API.prototype.____constructor(self)
end
function API.prototype.listenEvents(self)
    DeepPrintTable(CustomGameEventManager)
    CustomGameEventManager:RegisterListener(
        "aim_common.table.get",
        function(event)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                print("[SERVER] aim_common.table.get")
                ____exports.API:getCommonAim()
            end)
        end
    )
end
function API.updateCommonAim(self, input)
    local request = CreateHTTPRequest("POST", "http://localhost:3000/common-aim")
    request:SetHTTPRequestRawPostBody(
        "application/json",
        json.encode(input)
    )
    request:Send(function(res)
        if res.StatusCode < 200 or res.StatusCode > 299 then
            print("SUPER HTTP ERROR: ", res.StatusCode, res.Body)
        else
            print("HTTP SUCCESS")
        end
    end)
end
function API.getCommonAim(self)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local request = CreateHTTPRequest("GET", "http://localhost:3000/common-aim")
        request:Send(function(res)
            if res.StatusCode < 200 or res.StatusCode > 299 then
                print("HTTP ERROR: ", res.StatusCode, res.Body)
            else
                print("HTTP SUCCESS", res.Body)
                local body = (json.decode(res.Body))
                DeepPrintTable(body)
                CustomNetTables:SetTableValue("common-aim", "table", body)
                CustomGameEventManager:Send_ServerToAllClients("aim_common.table.get.response", {good = true})
            end
        end)
    end)
end
return ____exports
