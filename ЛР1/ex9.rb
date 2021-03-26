require 'prime'
# сумма цифр числа
def sum(n)
  sumDigits = 0
  n.digits.map {|digit| sumDigits = sumDigits + digit}
  sumDigits
end

# произведение цифр числа
def mn(n)
  mlDigits = 1
  n.digits.map {|digit| mlDigits = mlDigits * digit}
  mlDigits
end

# максимальная цифра числа
def max(n, n2)
  maxDigit = 1
  n.digits.map {|digit| maxDigit = digit if maxDigit < digit}
  maxDigit
end

# минимальная цифра числа
def min(n, n2)
  minDigit = 9
  n.digits.map {|digit| minDigit = digit if minDigit > digit}
  minDigit
end

# наибольший простой делитель
def maxd(v)
  maxdel = 1
  v.times {|i| maxdel = i if v % (i + 1) == 0 and Prime.prime?(i + 1)}
  maxdel + 1
end

# Найти произведение цифр числа, не делящихся на 5
def proizvd(n)
  mlDig = 1
  n.digits.map {|i| mlDig = mlDig * i if i % 5 > 0}
  mlDig
end

# НОД максимального нечетного непростого делителя числа и прозведения цифр данного числа.
def f(num)
  maxd = 1
  num.times {|i| maxd = i if (num % (i + 1) == 0) and (i + 1) % 2 > 0 and (i + 1) > maxd and !(Prime.prime?(i + 1))}
  (maxd + 1).gcd mn(num)
end

def abt(num)
  puts "1. Сумма цифр числа\n2. Произведение цифр числа\n3. Минимальная цифра числа
4. максимальная цифра числа\n5. Наибольший простой делитель\n6. Произведение цифр числа, не делящихся на 5
7. НОД максимального нечетного непростого делителя числа и прозведения цифр данного числа\nВведите параметр: "
  v = gets.chomp
  main(v, num)
end

def main(v, num)
  case v.to_str
    when '1'
      puts sum(num)
    when '2'
      puts mn(num)
    when '3'
      puts min(num, 10)
    when '4'
      puts max(num, 0)
    when '5'
      puts maxd(num)
    when '6'
      puts proizvd(num)
    when '7'
      puts f(num)
    when '-h'
      abt(num)
    else
      abt(num)
  end
end

puts "Введите число: "
num = gets.to_i


puts "Введите параметр: "
v = gets.chomp
while v != "0"
  main(v, num)
  v = gets.chomp
end




