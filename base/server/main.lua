EZ.net:server('ez:requestPlayerData', function()
    local src = source
    if not src then
        return
    end

    local player = EZ.GetPlayer(src)
    local data = player:getData()
    EZ.emit:client('ez:sendData', src, data)
end)
