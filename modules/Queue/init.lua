-- [ Private Variables ]
local _Queues = {}
local queueFuncs = {}


-- [ Private Functions ]
local function getNumIndexes(tbl)
    local num = 0
    for _, _ in pairs(tbl) do
        num = num + 1
    end
    return num
end

local function getKeyFromValue(tbl, value)
    for k, v in pairs(tbl) do
        if v == value then
            return k
        end
    end
    return nil
end


-- [ Queue: Private Functions ]

-- Adds an item to the queue.
local function add(queue, key, value)
    if not value then
        queue.Queue[getNumIndexes(queue.Queue) + 1] = key
        return queue.Queue[getNumIndexes(queue.Queue)]
    else
        queue.Queue[key] = value
        return queue.Queue[key]
    end
end

-- Removes an item from the queue.
local function remove(queue, key)
    if queue.Queue[key] then
        queue.Queue[key] = nil
    else
        key = getKeyFromValue(queue.Queue, key)
        if key then
            queue.Queue[key] = nil
        end
    end
end

-- Assures that the item in the queue has finished running.
local function done(queue)
    remove(queue, 1)
end


-- [ Class Creation ]
local Queue = {}


-- [ Class Initialization ]
Queue.__index = Queue
queueFuncs.__index = queueFuncs


-- [ Queue: Constructor ]

-- Creates a new queue.
function Queue.new(queueName)
    queueName = queueName or "Queue_" .. getNumIndexes(_Queues) + 1

    local newQueue = {}
    newQueue.Queue = {}

    function newQueue:setFunc(fn)
        self._Func = fn
    end

    function newQueue:run(...)
        add(self, getNumIndexes(self.Queue) + 1, "_run")
        repeat task.wait() until getNumIndexes(self.Queue) <= 1
        self._Func(...)
        done(self)
    end

    _Queues[queueName] = newQueue
    return queue
end

-- Returns a queue in the index if it is there.
function Queue.find(queueName)
    return _Queues[queueName]
end

-- Remvoes a queue from the index if it is there.
function Queue.remove(queueName)
    _Queues[queueName] = nil
end


-- [ Utility Return ]
return Queue