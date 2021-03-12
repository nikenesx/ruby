def var1(n)
  arr = Array.new
  for i in 0...n do
    arr[i] = gets
  end
  arr
end

def var2(n)
  arr = Array.new
  for i in 0...n do
    arr.push(gets)
  end
  arr
end

def var3(n)
  st = ""
  for i in 0...n do
    st.concat(gets)
  end
  Array.[](st.split(" "))
end

def var4(n)
  st = ""
  for i in 0...n do
    st.concat(gets)
  end
  Array.new | st.split(" ")
end

print("Введите количество элементов массива-> ")
n = gets.to_i

#arr = var1(n)
#arr = var2(n)
#arr = var3(n)
arr = var4(n)
#arr = var5(n)
puts arr
