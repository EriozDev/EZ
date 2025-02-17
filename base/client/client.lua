C = {}
C.Name = nil
C.ServerId = 0
C.ClientId = 0
C.Bucket = 0
C.State = {}
C.Group = 'user'
C.Job = 'unemployed'
C.JobGrade = 0
C.Job2 = 'unemployed2'
C.JobGrade2 = 0
C.Money = {
    cash = 0,
    bank = 0,
    dirty = 0
}
C.readyToPlay = false

Client = {}

function Client.Init()
    C.Name = GetPlayerName(PlayerId())
    C.ServerId = GetPlayerServerId(PlayerId())
    C.ClientId = PlayerId()
end

function Client.MakeReadyToPlay()
    C.readyToPlay = true
end

function Client.get()
    return C
end

function CPlayer()
    return C
end

function CPlayer.Get(k)
    return C.k
end

function CPlayer.Set(k, v)
    C.k = v
end

EZ.CreateLoop(true, 1000, function()
    EZ.emit:server('ez:requestPlayerData')
end)

EZ.net:client('ez:sendData', function(serverData)
    local src = source
    if not src then
        return
    end

    C.Group = serverData.group
    C.Job = serverData.job
    C.JobGrade = serverData.jobGrade
    C.Job2 = serverData.job2
    C.JobGrade2 = serverData.jobGrade2
    C.Money.cash = serverData.money.cash
    C.Money.bank = serverData.money.bank
    C.Money.dirty = serverData.money.dirty
end)
