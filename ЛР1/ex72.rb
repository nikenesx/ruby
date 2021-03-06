def proizvd(n)
	if n < 10 and n != 5 then 
		return n
	elsif n < 10 and n == 5
		return 0		
	elsif n % 10 != 5
		return n % 10 * proizvd(n / 10)
	else
		return proizvd(n / 10)
	end
end

puts proizvd(235)
gets