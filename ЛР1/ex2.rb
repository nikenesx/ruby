menu = "1"

while menu != "0"

	puts "1. Вывести приветсвие
2. Показать все методы класса String
3. Выполнить методы класса String
4. Примеры форматирования строк
5. Переменные и константы"

	menu = gets.strip

	case menu
		when "1"
			print "Введите ваше имя: " #Вывод без переноса на следующую строку
			names = gets # ввод с клавиатуры
			printf "Привет, #{names}" # приветствие пользователя, вывод с переносом

		when "2"
			for method in String.methods
				puts method
			end
			puts String.methods.count

		when "3"
			#Повторяет строку
			puts "\"Hello\" * 5\nВывод:"
			puts "Hello" * 5
			gets

			#Сложение строк
			puts "\"Hello\" + \" world\nВывод:"
			puts "Hello" + " wordl"
			gets

			#-1 если левая строка больше правой, 0 если равны, 1 если правая больше левой
			puts "\"abc\" <=> \"abc\"\nВывод:"
			puts "abc" <=> "abc"
			gets

			#true если равны, false иначе
			puts "\"abc\" == \"abd\"\nВывод:"
			puts "abc" == "abd"
			gets

			#Регистронезависимая версия <=>
			puts "\"abcdef\".casecmp(\"ABCDEF\")\nВывод:"
			puts "abcdef".casecmp("ABCDEF")
			gets

			#Если не был передан аргумент и не параметр separator, то удаляется \r и \n, nil если не было изменений
			puts "\"hope\\n\".chomp\nВывод:"
			puts "hope\n".chomp
			puts "\"what?\".chomp(\"t?\")\nВывод:"
			puts "what?".chomp("t?")
			gets

			#Удаляет последний символ. Если есть комбинация /r/n, то удаляется вся комбинация
			puts "\"cristal\\n\\r\".chop\nВывод:"
			puts "cristal\n\r".chop
			gets

			#возвращает односимвольную строку с начала строки
			puts "\"abcd\".chr\nВывод:"
			puts "abcd".chr
			puts "\"bcd\".chr\nВывод:"
			puts "bcd".chr
			gets

			#Возвращает кол-во символов
			puts "\"hello world\".count \"o\"\nВывод:"
			puts "hello world".count "o"
			gets

			#Возвращае ткопию с удаленными символами, nil усли строка не была модифицирована
			puts "\"I like beer\".delete(\"er\")\nВывод:"
			puts "I like beer".delete("er")
			gets

			#Передает каждый символ строки в блок
			puts "\"salam\".each_char {|s| print s}\nВывод:"
			"salam".each_char {|s| print s}
			gets

			# Сопостовляет правило, nil если нет совпадений
			puts "\"abcc\".match(/abc/)\nВывод:"
			puts "abcc".match(/abc/)
			gets

			#Вставляет строку п оиндексу
			puts "\"ello\".insert(0, \"H\")\nВывод:"
			puts "ello".insert(0, "H")
			gets

			#вычисляется следующий элемент увеличением кода крайнего правого элемента строки на единицу.
			puts "\"abcd\".next\nВывод:"
			puts "abcd".next
			gets

			#Возвращает новую строку в которой символы строки переставлены в обратном порядке
			puts "\"stressed\".reverse\nВывод:"
			puts "stressed".reverse
			gets

			puts "\"kitchen\".chars\nВывод:"
			p "kitchen".chars
			gets

			puts "\"hello\".tr('eo', '!')\nВывод:"
			puts "hello".tr('eo', '!')
			gets

			#Удаляет ведущие и замыкающие пробелы, nil если не было изменений
			puts "\"    hello    \".strip\nВывод:"
			puts "    hello    ".strip
			gets

			# длина строки
			puts "\"операционная система\".length\nВывод:"
			puts "операционная система".length
			gets

			# проверить пустая ли строка
			puts "\"\".empty?\nВывод:"
			puts "".empty?
			puts "\"When?\".empty?\nВывод:"
			puts "When?".empty?
			gets

			# доступ к символам в строке, nil если ненаход
			puts "\"Хороший день\".slice(0)\nВывод:"
			puts "Хороший день".slice(0)
			puts "\"Хороший день\".slice(1..4)\nВывод:"
			puts "Хороший день".slice(1..4)
			gets

			puts "\"Хороший день\"[0]\nВывод:"
			puts "Хороший день"[0]
			puts "\"Хороший день\"[1..4]\nВывод:"
			puts "Хороший день"[1..4]
			gets

			# верхний и нижний регистр
			puts "\"я хочу стать больше\".upcase\nВывод:"
			puts "я хочу стать больше".upcase
			gets

			puts "\"ПОМОГИТЕ\".downcase\nВывод:"
			puts "ПОМОГИТЕ".downcase
			gets

			# верхний регистр у первого символа
			puts "\"евгений\".capitalize\nВывод:"
			puts "евгений".capitalize
			gets

			# работа с отступами
			puts "\"манго\".ljust(20)\nВывод:"
			puts "манго".ljust(20)
			gets

			puts "\"манго\".rjust(20)\nВывод:"
			puts "манго".rjust(20)
			gets

			puts "\"манго\".center(21)\nВывод:"
			puts "манго".center(21)
			gets

			# поиск символов в строке
			puts "\"программист\".include?(\"о\")\nВывод:"
			puts "программист".include?("о")
			puts "\"программист\".include?(\"д\")\nВывод:"
			puts "программист".include?("д")
			gets

			#nil если нет совпадений
			puts "\"программист\".index(\"о\")\nВывод:"
			puts "программист".index("о")
			gets

			# замена символов
			puts "\"У меня есть деньги\".sub(\"меня\",\"нас\")\nВывод:"
			puts "У меня есть деньги".sub("меня","нас")
			gets

			puts "\"Hello world\".rindex('o')\nВывод"
			puts "Hello world".rindex('o')
			gets

			puts "\"How are you?\".gsub(/(\\s*)/, "")\nВывод"
			puts "How are you?".gsub(/(\s*)/, "")
			gets

			puts "\"abcd\".succ\nВывод:"
			puts "abcd".succ
			gets

			puts "\"salam\".each_line('l') {|s| print s}\nВывод:"
			"salam".each_line('l') {|s| print s}
			gets

			puts "\"What\".clear\nВывод:"
			puts "What".clear
			gets

			puts "\"    how\".rstrip\nВывод:"
			puts "    how".rstrip
			gets

			puts "\"how    \".lstrip\nВывод:"
			puts "how    ".lstrip

		when "4"
			puts "puts 'простая строка'\nВывод:"
			puts 'простая строка'
			gets

			puts "x = 7\ny = 3\ns2 = \"\#{x} * \#{y} = \#{x * y}\"\nputs s2\nВывод:"
			x = 7
			y = 3
			s2 = "#{x} * #{y} = #{x * y}"
			puts s2
			gets

			puts "puts %q[строка с “кавычками”]\nВывод:"
			puts %q[строка с “кавычками”]
			gets

			puts "puts %Q:Это тоже строка со „специальными символами‟ \\t\\n:\nВывод:"
			puts %Q:Это тоже строка со „специальными символами‟ \\t\\n:
			gets

			puts "s = `ruby -v`"
			s = `ruby -v`
			puts s

		when "5"
			puts "count = 3 - локальная переменная"
			puts "$value = 130 - глобальная переменная"
			puts "Mounths = 12 - константа"

	end
end



