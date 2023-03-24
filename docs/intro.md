---
sidebar_position: 1
---

# Getting Started

These Roblox utility modules can be acquired from my [CryptUtil module](https://roblox.com/).

## Usage Example

The imported asset is now available for use.

```lua
-- Reference folder with utilities:
local Utilities = require(game:GetService("ReplicatedStorage")).CryptUtil

-- Require the utility modules:
local Queue = require(Utilities.Queue)

-- Use the modules:
local testQueue = Queue.new()
```
