EZ = {};
EZ.emit = {};
EZ.net = {};

function EZ.CreateLoop(cd, tm, cb)
    if cb == nil then
        return
    end

    CreateThread(function()
        while cd do
            Wait(tm)

            cb()
        end
    end)
end

function EZ.FormatStringToCoreString(event)
    return ('ez:%s'):format(event)
end

if IsDuplicityVersion() then
    function EZ.emit:client(eventName, target, ...)
        if eventName == nil or target == nil then
            return
        end
        TriggerClientEvent(eventName, target, ...)
    end

    function EZ.net:server(eventName, eventFn)
        if eventName == nil or eventFn == nil then
            return
        end

        RegisterNetEvent(eventName, eventFn())
    end
else
    function EZ.emit:server(eventName, ...)
        if eventName == nil then
            return
        end
        TriggerServerEvent(eventName, ...)
    end

    function EZ.net:client(eventName, eventFn)
        if eventName == nil or eventFn == nil then
            return
        end

        RegisterNetEvent(eventName, eventFn())
    end
end
