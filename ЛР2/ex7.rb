def filear(filepath)
    file = IO.read(filepath)
    Array.new | file.split(' ')
end

def keyarr(n)
    Array.new(n){ |index| gets.strip}
end

def n3(i, arr)
    arr[i] == arr.max
end

def n15(i, arr)
    arr[i] == arr.min
end

def n27(arr)
    arr.push(arr.shift)
end

def n39(arr)
    arr.each_index { |i| puts arr[i] if i % 2 == 0}
    puts "---"
    arr.each_index { |i| puts arr[i] if i % 2 > 0}
end

def n51(arr)
    l1 = Array.new + arr.uniq
    l2 = Array.new
    l1.find_all {|elem| l2.push(arr.count(elem))}
    puts l1, "\n", l2
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



