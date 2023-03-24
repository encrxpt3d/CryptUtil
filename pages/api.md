---
sidebar_position: 1
---

# Queue

Queues allow for code to be ran in order of its placement.

For example:

```lua
local queue = Queue.new()

queue:setFunc(function(...)
    print("Received:", ...)
end)

queue:run("Hi!")
queue:run(2 + 12)
queue:run(false)
```
