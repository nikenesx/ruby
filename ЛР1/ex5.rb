menu = "1"

while menu != "0"

	puts "1. Найти суммцу цифр числа
2. Посмотреть все методы типа int
3. Выполнить методы типа int"

	menu = gets.strip

	case menu
		when "1"
			puts "Введите число: "
			value = gets.strip.to_i()
			tmp = value
			sum = 0
			while value > 0 do
				sum = sum + value % 10
				value = value / 10
			end
			puts "Сумма цифр числа #{tmp} = #{sum}"

		when "2"
			for method in Integer.methods
				puts method
			end

		when "3"
			puts "5 + 10\nРезультат:"
			puts 5 + 10
			gets

			puts "5 - 10\nРезультат:"
			puts 5 - 10
			gets

			puts "5 * 10\nРезультат:"
			puts 5 * 10
			gets

			puts "5 ** 3\nРезультат:"
			puts 5 ** 3
			gets

			puts "10 / 5\nРезультат:"
			puts 10 / 5
			gets

			puts "12 % 5\nРезультат:"
			puts 12 % 5
			gets

			puts "12 > 5\nРезультат:"
			puts 12 > 5
			gets

			puts "12 < 5\nРезультат:"
			puts 12 < 5
			gets

			puts "12 == 5\nРезультат:"
			puts 12 == 5
			gets

			puts "12 === 5\nРезультат:"
			puts 12 === 5
			puts "12 === 'string'\nРезультат:"
			puts 12 === 'string'
			gets

			puts "13 <= 13\nРезультат:"
			puts 13 <= 13
			gets

			puts "13 >= 13\nРезультат:"
			puts 13 >= 13
			gets

			puts "-500.abs\nРезультат:"
			puts -500.abs
			gets

			puts "65.chr\nРезультат"
			puts 65.chr
			gets

			puts "12345.digits\nРезультат"
			p 12345.digits, "\n"
			gets

			puts "5.downto(1) { |n| print n, \" \" }\nРезультат"
			puts 5.downto(1) { |n| print n, " " }
			gets

			puts "36.gcd(60)  \nРезультат:"
			puts 36.gcd(60)
			gets

			puts "36.gcdlcm(60)\nРезультат:"
			puts 36.gcdlcm(60)
			gets

			puts "5.integer?\nРезультат:"
			puts 5.integer?
			gets

			puts "36.lcm(60)\nРезультат:"
			puts 36.lcm(60)
			gets

			puts "1.next\nРезультат:"
			puts 1.next
			gets

			puts "2.pow(3)\nРезультат:"
			puts 2.pow(3)
			gets

			puts "2.pred\nРезультат:"
			puts 2.pred
			gets

			puts "1.size\nРезультат:"
			puts 1.size
			gets

			puts "100.succ\nРезультат:"
			puts 100.succ
			gets

			puts "4.to_f\nРезультат:"
			puts 4.to_f
			gets

			puts "35.to_r\nРезультат:"
			puts 35.to_r
			gets

			puts "12345.to_s\nРезультат:"
			p 12345.to_s; puts
			gets

			puts "5.upto(10) {|i| print i, " " }\nРезультат:"
			puts 5.upto(10) {|i| print i, " " }
			gets

			puts "10.times {|i| print i, " "}\nРезультат:"
			puts 10.times {|i| print i, " "}
			gets
	end
end




