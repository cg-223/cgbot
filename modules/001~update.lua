local oldupd = love.update
local interval = 0.2
local last = love.timer.getTime()


function love.update(dt)
    CGBOT.modules.update.processUpdate(dt)
    oldupd(dt)
end


CGBOT.modules.update.processUpdate = function(dt)
    
end