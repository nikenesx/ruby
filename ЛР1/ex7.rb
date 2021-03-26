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