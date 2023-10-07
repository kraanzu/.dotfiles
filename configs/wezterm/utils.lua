local M = {}

function M.appendTables(dest, source)
	for _, value in ipairs(source) do
		table.insert(dest, value)
	end
end

function M.prependTable(dest, source)
	for i = #source, 1, -1 do
		table.insert(dest, 1, source[i])
	end
end

function M.is_in(phrase, substring)
	local ok, _ = phrase:find(substring)
	return ok
end

return M
