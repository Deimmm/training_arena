local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 2,["10"] = 2,["12"] = 4,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 9,["19"] = 10,["20"] = 11,["22"] = 7,["23"] = 7,["24"] = 5,["25"] = 15,["26"] = 16,["27"] = 17,["28"] = 17,["29"] = 17,["30"] = 17,["31"] = 18,["32"] = 19,["33"] = 20,["34"] = 21,["36"] = 23,["38"] = 18,["39"] = 15,["40"] = 27,["42"] = 28,["43"] = 30,["44"] = 31,["45"] = 32,["46"] = 33,["48"] = 35,["49"] = 36,["50"] = 37,["51"] = 38,["52"] = 44,["54"] = 30,["56"] = 27,["57"] = 3});
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
    local request = CreateHTTPRequest("POST", self.url .. "/common-aim")
    request:SetHTTPRequestRawPostBody(
        "application/json",
        json.encode(input)
    )
    request:Send(function(res)
        if res.StatusCode < 200 or res.StatusCode > 299 then
            print("HTTP ERROR: ", res.StatusCode, res.Body)
            DeepPrintTable(res)
        else
            print("HTTP SUCCESS")
        end
    end)
end
function API.getCommonAim(self)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local request = CreateHTTPRequest("GET", self.url .. "/common-aim")
        request:Send(function(res)
            if res.StatusCode < 200 or res.StatusCode > 299 then
                print("HTTP ERROR: ", res.StatusCode, res.Body)
                DeepPrintTable(res)
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
API.url = "http://training-arena.coduluz.com"
return ____exports
