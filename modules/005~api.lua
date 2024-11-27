--This file outlines intermediaries between the games actions (e.g. buying a card, using a consumeable, etc) and CGBOT.
--Due to the nature of the game, taking an action generally blocks other things from happening for a period of time.
--Some actions queue other actions.

local modules = CGBOT.modules
local api = modules.api
local stateManager = modules.stateManager

function api.update(dt)
    if api.inProgress then
        if api.checkUpdate(dt) then
            if api.queuedAction then
                api.queuedAction(table.unpack(api.args))
            end
        end
    end
end

function api.queue(action, checker, ...)
    api.inProgress = true
    api.queuedAction = action
    api.checkUpdate = checker
    api.args = {...}
end

function api.play(cards)
    for i, card in pairs(cards) do
        api.highlight(card, G.hand)
    end

    api.queue(api.press_play,  api.allCardsHighlighted)
end

function api.allCardsHighlighted(dt)

end

function api.discard(cards)
    for i, card in pairs(cards) do
        api.highlight(card, G.hand)
    end

    api.queue(api.press_discard)
end

function api.pickFromPack(card)

end

function api.buy(card)

end

function api.sell(card)

end

function api.reorder(card, pos)
    
end


function api.highlight(cards, area)

end

function api.press_play()

end

function api.press_discard()

end

function api.reroll()

end