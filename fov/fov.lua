-- https://github.com/darkfrei/love2d-lua-tests/tree/main/field-of-view

local module = {}

-- c and r - number of columns and rows, integers
-- x and y - part

module.abs = math.abs
module.floor = math.floor

module.march_line = function (map, view, c1, r1, c2, r2) -- source and target
	local length = module.abs(c2 - c1) + module.abs(r2 - r1)
	if length > 1 then
		local dx = (c2 - c1) / length
		local dy = (r2 - r1) / length
		for n = 1, length do
			local c, r = module.floor (c1 + n * dx + 0.5), module.floor (r1 + n * dy + 0.5)
			view[c] = view[c] or {}
			if map[c] and map[c][r] and map[c][r] == 0 then
				-- not visible
				view[c][r] = false
				return
			else
				-- is visible
				view[c][r] = true
			end
		end
	else
		if map[c2] and map[c2][r2] and map[c2][r2] == 0 then
			view[c2] = view[c2] or {}
			view[c2][r2] = false
		end
	end
end

module.get = function (map, c, r, radius)
	local view = {}
	for c2 = c - radius, c + radius do
		module.march_line (map, view, c, r, c2, r + radius)
		module.march_line (map, view, c, r, c2, r - radius)
	end
	for r2 = r - radius + 1, c + radius - 1 do
		module.march_line (map, view, c, r, c + radius, r2)
		module.march_line (map, view, c, r, c - radius, r2)
	end
	return view
end

return module
