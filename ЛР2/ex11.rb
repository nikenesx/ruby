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
