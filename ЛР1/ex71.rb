def is_s1mple(v)
	for i in 2..v-1 do
		if v % i == 0 then
			return false
		end
	end
	return true
end

# наибольший простой делитель
def maxd(v)
	maxdel = 1
	for i in 2..v-1 do
		if v % i == 0 and is_s1mple(i) == true and i > maxdel then
			maxdel = i
		end
	end
	return maxdel
end

puts maxd(28)
gets