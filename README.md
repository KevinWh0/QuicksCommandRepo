# QuicksCommandRepo

A repo of commands to extend my roblox plugin called Quicks
You can find the plugin [Here](https://www.roblox.com/library/10469484730/Quicks)

# Contributing your quick

1. make a folder in the repo with the command name. eg. ` QuicksCommandRepo/plugins/ezprint`
2. inside this folder put a main.lua

### Formatting main.lua

```lua
	["COMMAND_NAME_HERE"] = {
		func = function (doc, arguments, Utils, Settings, Defaults)
      --Put all your code here. Nothing can be outside of this
		end,
	},
```

#### Note:

- Please include a comma at the end of your final curly bracket

Need any more help? Take a look at my example quick [ezprint](https://github.com/KevinWh0/QuicksCommandRepo/tree/main/plugins/ezprint) for any help. If that doesnt help feel free to ask in an [issue](https://github.com/KevinWh0/QuicksCommandRepo/issues/new).
