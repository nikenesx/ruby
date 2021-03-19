def n0
    line = "1 2 3 4 5 6 7 8 9 10"
    sum = 0
    line.split(" ").each {|elem| sum = sum + elem.to_i}
    puts sum
end

def n3
    line = "hello my dear friend Egor how are you".split(" ").sort_by { rand }
    puts line
end
