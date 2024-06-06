local M = {}

local function noremap(mode, input, output)
	map(mode, input, output, { noremap = true })
end

return M
