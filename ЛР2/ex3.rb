def var1(n)
  arr = Array.new
  for i in 0...n do
    arr[i] = gets
  end
  arr
end

print("Введите количество элементов массива-> ")
n = gets.to_i

arr = var1(n)
#arr = var2(n)
#arr = var3(n)
#arr = var4(n)
#arr = var5(n)
puts arr
