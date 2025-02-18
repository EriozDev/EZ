-- Author: Erioz (xyz.erz)

EntityStreamer = {};

_EntityStreamed = {};

local __instance = {
    __index = EntityStreamer
}

function EntityStreamer.New(type, model)
    local self = {};

    if type == 'prop' then
        self.type = 'prop'
    elseif type == 'vehicle' then
        self.type = 'vehicle'
    elseif type == 'ped' then
        self.type = 'ped'
    end

    self.entityModel = model
    self.data = {}

    setmetatable(self, __instance)

    _EntityStreamed[entityModel] = self
    return self
end

function EntityStreamer:load()
    if not self then
        return false;
    end

    local type = self.type
    local model = self.entityModel

    local PlayersReady = EZ.GetPlayers()
    for i = 1, #PlayersReady do
        local PlayersReady_I = PlayersReady[i]
        EZ.emit:client('EntityStreamer:load', PlayersReady_I, type, model)
    end
    return self;
end
