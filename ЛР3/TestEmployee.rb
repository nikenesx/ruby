require_relative 'Employee'

class TestEmployee < Employee

	attr_accessor :newemp

	def initialize
		@newemp = Employee.new("Евгений Жидков Алексеевич", "25.05.1997", "79183456734",
			"г. Краснодар ул. Ленина д.23", "evgesha@mail.ru", "0520 265395",
			"Системный администратор", "0")
	end

	def printEmployers
		puts "Данные сотрудника\nИмя Фамилия Отчество: #{@name}\nДата рождения: #{@birthDate}
Номер телефона: #{@phoneNumber}\nАдрес: #{@adress}\nЭлектронная почта: #{@email}\nПаспорт: #{@pasport}
Специальность: #{@specialty}"

		if @workExperience != "0"
			puts "Опыт работы: #{@workExperience}\nНазвание предыдущего места работы: #{@nameLastWork}
Должность: #{@position}\nЗарплата: #{@lastSalary}"
		else
			puts "Опыт работы: отсутствует"
		end
	end

end
