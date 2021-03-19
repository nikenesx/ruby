def n3
    line = "фбвгдabcd"
    reg = Regexp.compile(/[а-я]/)
    l = 'e'
    count = 0
    while l != nil
        l = line[reg]
        if l != nil
            line = line[l.length..line.length]
            count = count + 1
        else
            break
        end
    end
    puts count
end

def n8
    line = "фбвгдabcd"
    reg = Regexp.compile(/[a-z]/)
    l = 'e'
    count = 0
    while l != nil
        l = line[reg]
        if l != nil
            line = line[l.length..line.length]
            count = count + 1
        else
            break
        end
    end
    puts count
end

def n16
    line = "dfg dfg fg 54 thr23"
    reg = Regexp.compile(/[0-9]/)
    l = 'e'
    sr = Array.new
    while l != nil
        l = line[reg]
        if l != nil
            line = line[l.length..line.length]
            sr.push(l.to_i)
        else
            break
        end
    end
    puts sr.min
end

puts "1. Задача 3\n2. Задача 8\n3. Задача 16\nВыберите номер задачи:"
n = gets.strip.to_i
case n
when 1
    n3
when 2
    n8
when 3
    n16
end