# String

Useful functions which could be ran to grant even more string usage.

---

## Example Usage

```lua
local myStr = "Hello, world!"
local args = String.split(myStr) -- returns an array of each word in the string.

for _, str in pairs(args) do
    print(str) --[[
        Hello,
        world!
    ]]
end
```

---

## Class Functions

### String.split()

```lua
String.split(<string>, [seperator])
```

Returns an array of words in the specified string.
