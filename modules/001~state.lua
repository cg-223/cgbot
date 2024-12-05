local modules = CGBOT.modules
local stateManager = modules.stateManager
local api = modules.api

function stateManager:update(dt)
    if api.inProgress then
        return api.update(dt)
    end

    if self.curState then
        if not self:sanityCheck(self.curState) then
            self.curState = self.resetToDefaultState()
        end
        if self.curState:compCheck() then
            self.curState:finalize()
            self.curState = self.curState.nextState:initialize()
        else
            self.curState:update(dt)
        end
    end
end

function stateManager:sanityCheck(state)
    return assert((state.compCheck and state.finalize and state.update), "Insane state: " .. inspect(state))
end

modules.stateManager.states = {}