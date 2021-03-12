def min(arr)
	arr.min
end

def max(arr)
	arr.max
end

def sum(arr)
	arr.inject(0){ |result, elem| result + elem }
end

def prod(arr)
	arr.inject(1){ |result, elem| result * elem }
end

print "Введите количество элементов массива-> "
n = gets.to_i
arr = Array.new
for i in 0..n-1 do
	arr[i] = gets.to_i
end

puts "Минимальный элемент массива = #{min(arr)}"
puts "Максимальный элемент массива = #{max(arr)}"
puts "Сумма элементов массива = #{sum(arr)}"
puts "Произведение элементов массива = #{prod(arr)}"