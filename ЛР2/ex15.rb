def n3
    f = File.new("lines.txt", "r:UTF-8")
    lines = f.readlines
    freeqA = 1.0/26.0
    differenceArr = Array.new
    mostOftenSym = Array.new
    for line in lines
        uniqElmsInLine = line.chars.uniq
        countOfRept = Array.new
        uniqElmsInLine.find_all {|elem| countOfRept.push(line.chars.count(elem))}
        a, b = countOfRept.zip(uniqElmsInLine).sort.reverse.transpose
        freqSymInLine = (a[0] * 1.0)/(line.length * 1.0)
        mostOftenSym.push(b[0])
        differenceArr.push((freqSymInLine - freeqA).abs)
    end
    a, b = differenceArr.zip(lines).sort.transpose
    a, c = differenceArr.zip(mostOftenSym).sort.transpose
    puts a, "---", b, '---', c
end

def n5
    f = File.new("lines.txt", "r:UTF-8")
    lines = f.readlines
    freeqA = 1.0/26.0
    differenceArr = Array.new
    mostOftenSym = Array.new
    for line in lines
        uniqElmsInLine = line.chars.uniq
        countOfRept = Array.new
        uniqElmsInLine.find_all {|elem| countOfRept.push(line.chars.count(elem))}
        a, b = countOfRept.zip(uniqElmsInLine).sort.reverse.transpose
        freqSymInLine = (a[0] * 1.0)/(line.length * 1.0)
        mostOftenSym.push(b[0])
        differenceArr.push(Math.sqrt((freqSymInLine + freeqA)/2))
    end
    a, b = differenceArr.zip(lines).sort.transpose
    a, c = differenceArr.zip(mostOftenSym).sort.transpose
    puts a, "---", b, '---', c
end

def n7
    f = File.new("lines.txt", "r:UTF-8")
    lines = f.readlines
    regGS = Regexp.compile(/[aeiouy][^aeiouy]/)
    regSG = Regexp.compile(/[^aeiouy][aeiouy]/)
    arrOfDif = Array.new
    for line in lines
        temp = (line.scan(regGS).count - line.scan(regSG).count).abs
        arrOfDif.push(temp)
    end
    a, b = arrOfDif.zip(lines).sort.transpose
    puts b
end

def n12
    f = File.new("lines.txt", "r:UTF-8")
    lines = f.readlines # Считывание в массив элементами которого являются строки фалйа
    f = File.new("lines.txt", "r:UTF-8")
    fullfile = f.read # Целый файл
    differenceArr = Array.new
    mostOftenSym = Array.new
    for line in lines
        uniqElmsInLine = line.chars.uniq # Массив с уникальными символами строки
        countOfRept = Array.new
        uniqElmsInLine.find_all {|elem| countOfRept.push(line.chars.count(elem))} # Считаем скалько раз повторятеся каждый элемент из uniqElmsLine
        a, b = countOfRept.zip(uniqElmsInLine).sort.reverse.transpose # Сортируем два массива по убыванию
        freqSymInLine = (a[0] * 1.0)/(line.length * 1.0) # Частота самого частовстречаемого символа в строке
        countofRepSym = (fullfile.scan(b[0]).count * 1.0)/(fullfile.length * 1.0) #Частота самаого встречаемого символа в строке во всем файле
        mostOftenSym.push(b[0])
        differenceArr.push(Math.sqrt((freqSymInLine + countofRepSym)/2)) # Среднеквадратичное отклонение
    end
    a, b = differenceArr.zip(lines).sort.transpose
    puts lines
end

puts "1. Задача 3\n2. Задача 5\n3. Задача 7\n4. Задача 12\nВыберите номер задачи:"
n = gets.strip.to_i
case n
when 1
    n3
when 2
    n5
when 3
    n7
when 4
    n7
end