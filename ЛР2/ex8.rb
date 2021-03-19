line = "1 2 3 4 5 6 7 8 9 10"
sum = 0
line.split(" ").each {|elem| sum = sum + elem.to_i}
puts sum
