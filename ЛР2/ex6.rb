def filear(filepath)
  file = IO.read(filepath)
  Array.new | file.split(' ')
end

def keyarr(n)
  Array.new(n){ |index| gets.strip}
end

def sizeOfArray(array)
  count = 0
  for elem in array
    count = count + 1
  end
  count
end

def countOfRepelem(elem, array)
  count = 0
  for el in array
    if elem == el
      count = count + 1
    end
  end
  count
end

def n3(i, arr)
  max = arr[0]
  for elem in arr
    if elem > max
      max = elem
    end
  end
  max
end

def n15(i, arr)
  min = arr[0]
  for elem in arr
    if elem < min
      min = elem
    end
  end
  min
end

def n27(arr)
  temp = arr[0]
  arr = arr[1..sizeOfArray(arr)]
  arr.insert(-1, temp)
end

def n39(arr)
  arr1 = Array.new
  arr2 = Array.new
  for index in 0..sizeOfArray(arr)
    if index % 2 == 0
      arr1.push(arr[index])
    else
      arr2.push(arr[index])
    end
  end
  puts arr1, '---', arr2
end

def n51(arr)
  uniqarr = Array.new
  countArr = Array.new
  for elem in arr
    if uniqarr.include?(elem) == false
      uniqarr.push(elem)
    end
  end
  for elem in uniqarr
    countArr.push(countOfRepelem(elem, arr))
  end
  puts uniqarr, '---', countArr

end

def main(arr)
  puts "Введенный список: #{arr}"
  print "1. Задача 3\n2. Задача 15\n3. Задача 27\n4. Задача 39\n5. Задача 51\n6. Выход\nВведите номер задачи:"
  exz = gets.strip
  case exz
  when "1"
    puts "Введите индекс"
    ind = gets.to_i
    puts n3(ind, arr)
    main(arr)
  when "2"
    puts "Введите индекс"
    ind = gets.to_i
    puts n15(ind, arr)
    main(arr)
  when "3"
    puts n27(arr)
    main(arr)
  when "4"
    n39(arr)
    main(arr)
  when "5"
    n51(arr)
    main(arr)
  when "6"
    n51(arr)
    main(arr)
  else
    main(arr)
  end
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
main(arr)



