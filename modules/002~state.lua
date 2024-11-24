local modules = CGBOT.modules
local stateManager = modules.stateManager
local api = modules.api

function stateManager.update(dt)
    if api.inProgress then
        return api.update(dt)
    end

    if stateManager.curState then
        if not stateManager.sanityCheck(stateManager.curState) then
            stateManager.curState = stateManager.resetToDefaultState()
        end
        if stateManager.curState.compCheck() then
            stateManager.curState.finalize()
            stateManager.curState = stateManager.curState.nextState.initialize()
        else
            stateManager.curState.update(dt)
        end
    end
end

function stateManager.sanityCheck(state)
    return assert((state.compCheck and state.finalize and state.update), "Insane state: " .. inspect(state))
end