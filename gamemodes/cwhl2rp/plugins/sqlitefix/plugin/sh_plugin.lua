local PLUGIN = PLUGIN;

if (SERVER) then
	function sql.SQLStr( str_in, bNoQuotes )
		
		local str = tostring( str_in )
		
	--	str = str:gsub( "'", "''" ) <-- Here's the culprit.
		
		local null_chr = string.find( str, "\0" )
		if null_chr then
			str = string.sub( str, 1, null_chr - 1 )
		end
		
		if ( bNoQuotes ) then
			return str
		end
		
		return "'" .. str .. "'"
	end
end;