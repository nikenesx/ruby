def sum(n)
	if n < 10 then 
		return n
	else 
		return n%10 + sum(n/10)
	end
end

def mn(n)
	if n < 10 then 
		return n
	else 
		return n%10 * sum(n/10)
	end
end

def max(n, n2)
	if n == 0 then
		return n2
	end

	if n % 10 > n2 then
		return max(n/10, n % 10)
	else 
		return max(n/10, n2)
	end
end

def min(n, n2)
	if n == 0 then
		return n2
	end

	if n % 10 < n2 then
		return min(n/10, n % 10)
	else 
		return min(n/10, n2)
	end
end
	
puts "Введите число"
num = gets.to_i()
f = sum(num)
puts f
f = mn(num)
puts f
f = max(num, 0)
puts f
f = min(num, 9)
puts f
gets