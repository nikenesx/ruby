line = "31 февраля 2007 21 марта 2007 31 dhgfsdghfsdgh 2007"
reg = Regexp.compile(/(\d{2} (января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря) \d{4})/)
l = 'e'
while l != nil
    l = line[reg]
    puts l
    if l != nil
        line = line[l.length..line.length]
    else
        break
    end
end

