# Queue

Queues allow for code to be ran in order of its placement.

---

## Example Usage

```lua
local queue = Queue.new()

queue:setFunc(function(...)
    print("Received:", ...)
end)

queue:run("Hi!")
queue:run(2 + 12)
queue:run(false)
```

---

## Class Functions

### Queue.new()

```lua
Queue.new() --> NewQueue
```

Constructs a new queue.

### Queue.delete()

```lua
Queue.delete("queueName") --> nil
```

Deletes the queue.

---

## Queue Functions

### NewQueue:setFunc()

```lua
Queue:setFunc(function(...)
    -- code here
end)
```

Sets the function which will be ran on each item in the queue once at a time.

### NewQueue:run()

```lua
Queue:run(...) --> any? : any
```

Adds a new item to the queue, which is set to run with the specified arguments.
