--This file outlines intermediaries between the games actions (e.g. buying a card, using a consumeable, etc) and CGBOT.
--Due to the nature of the game, taking an action generally blocks other things from happening for a period of time.
--Some actions queue other actions.

local modules = CGBOT.modules
local api = modules.api
local stateManager = modules.stateManager

function api.update(dt)
    if api.inProgress then
        if api.checkUpdate(dt) then
            if api.queued then
                api.queued(table.unpack(api.args))
            end
        end
    end
end

function api.queue(action, args)

end

function api.play(cards)

end

function api.pickFromPack(card)

end

function api.buy(card)

end

function api.sell(card)

end

function api.reorder(card, pos)
    
end

function api.discard(cards)

end

function api.highlight(cards, area)

end

function api.press_play()

end

function api.press_discard()

end