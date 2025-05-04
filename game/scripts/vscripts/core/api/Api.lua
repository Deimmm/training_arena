local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__AsyncAwaiter = ____lualib.__TS__AsyncAwaiter
local __TS__Await = ____lualib.__TS__Await
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 7,["16"] = 9,["18"] = 10,["19"] = 11,["21"] = 7,["22"] = 7,["23"] = 14,["24"] = 14,["25"] = 16,["27"] = 17,["28"] = 18,["30"] = 14,["31"] = 14,["32"] = 6,["33"] = 22,["34"] = 23,["35"] = 24,["36"] = 24,["37"] = 24,["38"] = 24,["39"] = 25,["40"] = 26,["41"] = 27,["42"] = 28,["44"] = 30,["46"] = 25,["47"] = 22,["48"] = 34,["50"] = 35,["51"] = 37,["52"] = 38,["53"] = 39,["55"] = 41,["56"] = 42,["57"] = 43,["58"] = 49,["60"] = 37,["62"] = 34,["63"] = 57,["65"] = 58,["66"] = 60,["67"] = 61,["68"] = 62,["70"] = 64,["71"] = 65,["72"] = 66,["73"] = 72,["75"] = 60,["77"] = 57,["78"] = 79,["79"] = 80,["80"] = 81,["81"] = 81,["82"] = 81,["83"] = 81,["84"] = 82,["85"] = 83,["86"] = 84,["88"] = 86,["90"] = 82,["91"] = 79,["92"] = 4});
local ____exports = {}
____exports.API = __TS__Class()
local API = ____exports.API
API.name = "API"
function API.prototype.____constructor(self)
end
function API.prototype.listenEvents(self)
    CustomGameEventManager:RegisterListener(
        "aim_common.table.get",
        function(event)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                print("[SERVER] aim_common.table.get")
                ____exports.API:getCommonAim()
            end)
        end
    )
    CustomGameEventManager:RegisterListener(
        "aim_vector.table.get",
        function(event)
            return __TS__AsyncAwaiter(function(____awaiter_resolve)
                print("[SERVER] aim_vector.table.get")
                ____exports.API:getVectorAim()
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
            else
                print("HTTP SUCCESS", res.Body)
                local body = (json.decode(res.Body))
                CustomNetTables:SetTableValue("common-aim", "table", body)
                CustomGameEventManager:Send_ServerToAllClients("aim_common.table.get.response", {good = true})
            end
        end)
    end)
end
function API.getVectorAim(self)
    return __TS__AsyncAwaiter(function(____awaiter_resolve)
        local request = CreateHTTPRequest("GET", self.url .. "/vector-aim")
        request:Send(function(res)
            if res.StatusCode < 200 or res.StatusCode > 299 then
                print("HTTP ERROR: ", res.StatusCode, res.Body)
            else
                print("HTTP SUCCESS", res.Body)
                local body = (json.decode(res.Body))
                CustomNetTables:SetTableValue("vector-aim", "table", body)
                CustomGameEventManager:Send_ServerToAllClients("aim_vector.table.get.response", {good = true})
            end
        end)
    end)
end
function API.updateVectorAim(self, input)
    local request = CreateHTTPRequest("POST", self.url .. "/vector-aim")
    request:SetHTTPRequestRawPostBody(
        "application/json",
        json.encode(input)
    )
    request:Send(function(res)
        if res.StatusCode < 200 or res.StatusCode > 299 then
            print("HTTP ERROR: ", res.StatusCode, res.Body)
        else
            print("HTTP SUCCESS")
        end
    end)
end
API.url = "https://training-arena.coduluz.com"
return ____exports
