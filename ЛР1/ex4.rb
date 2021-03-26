print "Введите команду языка ruby: "
c1 = gets
puts (eval c1).to_s

print "Введите команду OC: "
c2 = gets
s2 =  `#{c2}`
puts s2
