f = File.new("lines.txt", "r:UTF-8")
lines = f.readlines
regIsNum = Regexp.compile(/[0-9]+/)
regIsStr = Regexp.compile(/[^0-9]+/)
tempArr = Array.new
for line in lines
    count = 0
    for index in 1..line.split(" ").count
        if line.split(" ")[index] != nil && line.split(" ")[index - 1] != nil
            if line.split(" ")[index][regIsStr] != nil && line.split(" ")[index - 1][regIsNum] != nil
                count = count + 1
            end
        end
    end
    tempArr.push(count)
end
a, b = tempArr.zip(lines).sort.transpose
puts b