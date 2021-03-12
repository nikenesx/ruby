def filear(filepath)
  file = IO.read(filepath)
  Array.new | file.split(' ')
end

def keyarr(n)
  Array.new(n){ |index| gets}
end

def n15(i, arr)
  arr[i] == arr.min
end

arr = Array.new
print "1. Считать список из файла\n2. Ввод с клавиатуры\n-> "
n = gets.to_i
case n
when 1
  print "Введите путь к файлу-> "
  fp = gets.strip
  printf fp
  arr = filear(fp)
when 2
  print "Введите количество элементов-> "
  n = gets.to_i
  arr = keyarr(n)
else
  puts "Ошибка"
end

print "Введите индекс элемента-> "
i = gets.to_i
puts n15(i, arr)

