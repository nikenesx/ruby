def min(arr)
	min = arr[0]
	for i in 1..arr.length - 1 do
		if arr[i] < min then
			min = arr[i]
		end
	end
	return min
end

def max(arr)
	max = arr[0]
	for i in 1..arr.length - 1 do
		if arr[i] > max then
			max = arr[i]
		end
	end
	return max
end

def sum(arr)
	sum = 0
	for i in 0..arr.length - 1 do
		sum = sum + arr[i]
	end
	return sum
end

def prod(arr)
	prod = 1
	for i in 0..arr.length - 1 do
		prod = prod * arr[i]
	end
	return prod
end

print "Введите количество элементов массива-> "
n = gets.to_i
arr = Array.[]
for i in 0..n-1 do
	arr[i] = gets.to_i
end

puts "Минимальный элемент массива = #{min(arr)}"
puts "Максимальный элемент массива = #{max(arr)}"
puts "Сумма элементов массива = #{sum(arr)}"
puts "Произведение элементов массива = #{prod(arr)}"