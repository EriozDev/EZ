Player = {};

PlayerList = {};

local __instance = {
    __index = Player
};

function Player.createPlayerObject(id)
    local self = {};

    self.source = id;
    self.name = GetPlayerName(id);
    self.identifier = GetPlayerIdentifierByType(id, 'license');
    self.group = 'user';
    self.job = 'unemployed';
    self.jobGrade = 0;
    self.job2 = 'unemployed2';
    self.jobGrade2 = 0;
    self.money = {
        cash = 0,
        bank = 0,
        dirty = 0
    };
    self.states = {};

    setmetatable(self, __instance);
    return self;
end

function AddPlayer(id)
    if PlayerList[id] then
        return
    end

    PlayerList[id] = Player.createPlayerObject(id)
end

function RemovePlayer(id)
    if not PlayerList[id] then
        return
    end

    PlayerList[id] = nil
end

function EZ.GetPlayer(id)
    return PlayerList[id]
end

function EZ.GetPlayers()
    local players = {}
    for id, object in pairs(PlayerList) do
        table.insert(players, id)
    end
    return players
end

function Player:getIdentifier()
    return self.identifier;
end

function Player:getUserName()
    return self.name;
end

function Player:getGroup()
    return self.group;
end

function Player:getMoney(type)
    if type == 'cash' then
        return self.money.cash;
    elseif type == 'bank' then
        return self.money.bank;
    elseif type == 'dirty' then
        return self.money.dirty;
    end

    return nil
end

function Player:getStates()
    return self.states;
end

function Player:getJob()
    return self.job;
end

function Player:getJobGrade()
    return self.jobGrade;
end

function Player:getJob2()
    return self.job2;
end

function Player:getJobGrade2()
    return self.jobGrade2;
end

-- [[ SETTERS ]] --
function Player:setGroup(newGroup)
    self.group = newGroup;
end

function Player:setJob(newJob)
    self.job = newJob;
end

function Player:setJobGrade(newGrade)
    self.jobGrade = newGrade;
end

function Player:setJob2(newJob2)
    self.job2 = newJob2;
end

function Player:setJobGrade2(newGrade2)
    self.jobGrade2 = newGrade2;
end

function Player:addMoney(type, number)
    if type == 'cash' then
        self.money.cash = self:getMoney('cash') + number;
    elseif type == 'bank' then
        self.money.bank = self:getMoney('bank') + number;
    elseif type == 'dirty' then
        self.money.dirty = self:getMoney('dirty') + number;
    end
end

function Player:removeMoney(type, number)
    if type == 'cash' then
        self.money.cash = self:getMoney('cash') - number;
    elseif type == 'bank' then
        self.money.bank = self:getMoney('bank') - number;
    elseif type == 'dirty' then
        self.money.dirty = self:getMoney('dirty') - number;
    end
end

function Player:setStates(k, v)
    self.states[k] = v;
end