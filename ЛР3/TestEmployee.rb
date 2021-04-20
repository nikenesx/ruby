require_relative 'Employee'

class TestEmployee


	def self.create_employers
		employee1 = Employee.new("Жидков Евгений Алексеевич", "25.05.1997", "79183456734",
														 "г. Краснодар ул. Ленина д.23", "evgesha@mail.ru",
														 "0520 265395", "Крутой программист", "2", "МакДоналдс",
														 "Продавец-кассир", "25000")

		employee2 = Employee.new("Кравчук Александр Юрьевич", "1.1.1995", "+7(938)6532201",
														 "г. Краснодар ул. Красная д.147", "killer228@mail.ru",
														 "0150 245823", "Повар", "3", "Gray Goose",
														 "Повар", "35000")

		employee3 = Employee.new("Карасев Владислав Петрович", "25.05.1990", "8918345-67-34",
														 "г. Краснодар ул. Ставропольская д.56", "theking@gmail.com",
														 "0611 732395", "С# разработчик", "0")

		list_emp = [employee1, employee2, employee3]
		return list_emp
	end


	def self.test_work
		employee = Employee.new("Жидков Евгений Алексеевич", "25.05.1997", "79183456734",
														 "г. Краснодар ул. Ленина д.23", "evgesha@mail.ru",
														 "0520 265395", "Крутой программист", "2", "МакДоналдс",
														 "Продавец-кассир", "25000")

		print "Что ввести?\n1. ФИО\n2. Дата рождения\n3. Номер телефона\n4. Email\n->"
		answer = gets.strip

		until answer.match?(/[1234]/)
			print "Неверный ввод. Повторите попытку\n->"
			answer = gets.strip
		end

		if answer.match?(/[1]/)
			begin
				puts "Введите имя:"
				value = gets.strip
				employee.name = value
			rescue Exception => e
				puts e.message
				retry
			end
		end

		if answer.match?(/[2]/)
			begin
				puts "Введите дату рождения:"
				value = gets.strip
				employee.birthDate = value
			rescue Exception => e
				puts e.message
				retry
			end
		end

		if answer.match?(/[3]/)
			begin
				puts "Введите номер:"
				value = gets.strip
				employee.phoneNumber = value
			rescue Exception => e
				puts e.message
				retry
			end
		end

		if answer.match?(/[4]/)
			begin
				puts "Введите email:"
				value = gets.strip
				employee.email = value
			rescue Exception => e
				puts e.message
				retry
			end
		end

		puts employee

	end

end
