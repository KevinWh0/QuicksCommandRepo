	["P"] = {
		func = function (doc, arguments, Utils, Settings, Defaults)
			local str = "";
			for i = 1, #arguments do
				if i ~= 1 then
					str = str .. "," .. arguments[i]
				else
					str = str .. arguments[i]
				end
			end
			
			return "print("..str..")";
		end,
	},
