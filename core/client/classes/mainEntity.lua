EntityClient = {};

local __instance = {
    __index = EntityClient
}

ClientSyncEntities = {};

function EntityClient.New(type, model, coords)
    local self = {};

    self.type = type
    self.model = model
    self.coords = coords

    setmetatable(self, __instance)
    return self;
end

function EntityClient:sync()
    ClientSyncEntities[self.model] = self
end

EZ.net:client('EntityStreamer:load', function(type, model)
    if type == nil or model == nil then
        return
    end

--TODO: finish
end)
