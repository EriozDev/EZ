EZ.CreateLoop(true, 1000, function()
    if NetworkIsSessionStarted() then
        ShutdownLoadingScreen()
        ResetPausedRenderphases()
        ShutdownLoadingScreenNui()

        DoScreenFadeOut(0)
        Wait(1000)

        Client.Init()

        local client = Client.get()

        while not client().readyToPlay do
            Citizen.Wait(0)
        end

        Client.MakeReadyToPlay()
        EZ.emit:server('sessionStarted')
        break
    end
end)
