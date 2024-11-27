--handles events that happen every frame
--api updates first, as most other things block themselves if an action is in progress

local oldupd = love.update
local interval = 0.2
local last = love.timer.getTime()
local modules = CGBOT.modules

function love.update(dt)
    modules.update.processUpdate(dt)
    oldupd(dt)
end


modules.update.processUpdate = function(dt)
    if love.timer.getTime() - interval > last then
        local sinceLast = love.timer.getTime() - last
        last = love.timer.getTime()
        modules.api.update(sinceLast)
        modules.stateManager.update(sinceLast)
    end
end

modules.stateManager.states.gamestart = {
    compCheck = function(self)
        
    end,
    update = function(self, dt)

    end,
    finalize = function(self)

    end,
    initialize = function(self)

    end,
}