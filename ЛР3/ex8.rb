Encoding.default_external = Encoding.find(Encoding.locale_charmap)
Encoding.default_internal = __ENCODING__
[STDIN, STDOUT].each do |io|
	io.set_encoding(Encoding.default_external, Encoding.default_internal)
end

require_relative 'TestEmployee'

employe1 = TestEmployee.new("Арсений Иванов Иванович", "06.11.1988", "79187562456",
						   "г. Краснодар ул. Ставропольская д.129", "killer228@gmail.com", "0519 458105",
						   "C# разработчик", "6", "Крутая компания",
						   "Старший программист", "90000")


while true
	puts "Какое поле нужно ввести?\n1. ФИО | 2. Номер телефона | 3. Дата рождения | 4. email | 0. Выход"
	n = gets.strip

	if n == "1" || n == "ФИО"
		begin
			puts "Введите ФИО:"
			data = gets
			employe1.name = data
			puts employe1.name
		rescue
			puts "Неверно введено ФИО. Введите повторно:"
			retry
		end

	elsif n == "2" || n == "Номер телефона"
		begin
			puts "Номер телефона"
			data = gets
			employe1.phoneNumber = data
			puts employe1.phoneNumber
		rescue
			puts "Неверно введен номер метефона. Введите повторно:"
			retry
		end

	elsif n == "3" || n == "Дата рождения"
		begin
			puts "Введите дату рождения:"
			data = gets
			employe1.birthDate = data
			puts employe1.birthDate
		rescue
			puts "Неверно введена дата рождения. Введите повторно:"
			retry
		end

	elsif n == "4" || n == "email"
		begin
			puts "Введите ФИО"
			data = gets
			employe1.email = data
			puts employe1.email
		rescue
			puts "Неверно введен email. Введите повторно:"
			retry
		end
	end
end
