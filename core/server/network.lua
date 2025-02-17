EZ.net:server('sessionStarted', function()
    local src = source
    if not src then
        return
    end

    AddPlayer(src)
    local objSync = EZ.GetPlayerObject(src)
    objSync:setState('timeCreate', os.time())
end)

AddEventHandler('playerDropped', function(reason)
    local src = sourc
    if not src then
        return
    end

    RemovePlayer(src)
end)
