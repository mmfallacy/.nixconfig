local M = {}

function M.map_event(...)
  -- Stash varargs to events
  local events = { ... }

  -- Return driver function
  return function(tbl)
    -- For every entry in tbl set the event
    for _, v in ipairs(tbl) do
      v.event = events
    end
    -- Return mutated table
    return tbl
  end
end

return M
