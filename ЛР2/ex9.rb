def n0
    line = "1 2 3 4 5 6 7 8 9 10"
    sum = 0
    line.split(" ").each {|elem| sum = sum + elem.to_i}
    puts sum
end

def n3
    line = "Привет мой дорогой друг Егор как твои дела".split(" ").sort_by { rand }
    puts line
end

def n8
    line = "посмотри на этот огромный мульный пузырь"
    sum = 0
    line.each_line(' ') { |elem| sum = sum + 1 if elem.strip.length % 2 == 0 }
    puts sum
end

def n16
    array = ["красный", "синий", "белый"].sort_by { rand }
    array.sort!
    array[1], array[2] = array[2], array[1]
    puts array
end
