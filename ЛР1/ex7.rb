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

# произведение цифр числа
def mn(n)
	if n < 10
		return n
	else
		return n % 10 * mn(n / 10)
	end
end

def f(num)
	max_d = 1
	for i in 1..num do
		if num % i == 0 and is_s1mple(i) == false and i > max_d and i % 2 > 0
			max_d = i
		end
	end
	return i.gcd mn(num)
end