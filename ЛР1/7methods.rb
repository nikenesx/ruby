# сумма цифр числа
def sum(n)
  if n < 10 then
    return n
  else
    return n%10 + sum(n/10)
  end
end

# произведение цифр числа
def mn(n)
  if n < 10 then
    return n
  else
    return n%10 * mn(n/10)
  end
end

# максимальная цифра числа
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

# минимальная цифра числа
def min(n, n2)
  if n == 0
    return n2
  end

  if n % 10 < n2
    return min(n/10, n % 10)
  else
    return min(n/10, n2)
  end
end

# наибольший простой делитель
def maxd(v)
  maxdel = 1
  for i in 2..v-1 do
    if v % i == 0 and i.prime? == true and i > maxdel then
      maxdel = i
    end
  end
  return maxdel
end

# Найти произведение цифр числа, не делящихся на 5
def proizvd(n)
  if n < 10 and n != 5
    return n
  elsif n < 10 and n == 5
    return 0
  elsif n % 10 != 5
    return n % 10 * proizvd(n / 10)
  else
    return proizvd(n / 10)
  end
end

# НОД максимального нечетного непростого делителя числа и прозведения цифр данного числа.
def f(num)
  max_d = 1
  for i in 1..num do
    if num % i == 0 and i.prime? == false and i > max_d and i % 2 > 0
      max_d = i
    end
  end
  return i.gcd mn(num)
end

def main(v, num)
  case v
  when '1'
    puts sum(num)
  when '2'
    puts mn(num)
  when '3'
    put min(num, 10)
  when '4'
    puts max(num, 0)
  when '5'
    puts maxd(num)
  when '6'
    puts proizvd(num)
  when '7'
    puts f(num)
  else
    puts "Hello world"
  end
end

puts "Введите число: \r"
num = gets.to_i

puts "Введите параметр: "
v = gets.chomp
main(v, num)

