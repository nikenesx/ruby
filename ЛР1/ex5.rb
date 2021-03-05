value = gets.to_i()
sum = 0
while value > 0 do
	sum = sum + value % 10
	value = value / 10
end

puts sum

# НОД и НОК
6.gcdlcm 9 #=> [3, 18]

# НОК
6.lcm 7 #=> 42

# НОД
72.gcd 168 #=> 24

10.integer? #=> true

1.next #=> 2

# Массив из простых делителей числа
35.prime_division #=> [[5, 1], [7, 1]]

# выполняет блок i - 1 раз
times do |i|
end

# выполняет блок с 5 до 10
5.upto(10) { |i| print i}

# преобразует двумерный массив из простых делителей обратно в целое число
Integer.from_prime_division( [[5,1], [7,1]] ) #=> 35

5.downto(1) { |n| print n, ".. " }