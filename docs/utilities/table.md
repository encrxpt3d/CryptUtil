# Table

Useful functions which could be ran to grant even more table usage.

---

## Example Usage

```lua
local myItems = { "Cheese", "Milk", "Oatmeal" }
Table.shift(myItems)
Table.print(myItems) --[[
    [1] = "Milk",
    [2] = "Oatmeal",
]]
```

---

## Class Functions

### Table.shift()

```lua
Table.shift({ "Item1", "Item2", "Item3" })
```

Removes the first index of the table, and returns it.

### Table.cloneInto()

```lua
Table.cloneInto(tblCloningDataFrom, tblToCloneInto)
```

Clones every item (including nested items) from the first table into the second table.

### Table.getKeyFromValue()

```lua
Table.getKeyFromValue("Lucky1")
```

Returns the index of the specified value.

### Table.print()

There are two ways you can output the table: in brackets, or with colons.

```lua
Table.print({
    hi = "hello",
    bye = "cya"
})
```

This will output the table with colons.

```lua
Table.print({
    hi = "hello",
    bye = "cya"
}, "Bracket")
```

This will output the table in brackets.

---

This function accepts three parameters:
    <table> -> a table object;
    [printType] -> a print type;
    [data] -> a data table object;
        [name] -> holds the name of the table
