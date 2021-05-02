-- allow require('folder')
if not string.match(';' .. package.path .. ';', ';./?/init.lua;') then
	package.path = './?/init.lua;' .. package.path
end

require 'my'
