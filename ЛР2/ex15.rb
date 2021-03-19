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