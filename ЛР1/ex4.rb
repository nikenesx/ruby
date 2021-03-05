puts "Введите команду для Ruby: "
command1 = gets

puts "Введите команду для OC: "
command2 = gets

if command1.include?("puts") == true then
	command1 = command1.split(" ")
	puts command1[1]
end

s2 =  `#{command2}" `
puts s2
gets