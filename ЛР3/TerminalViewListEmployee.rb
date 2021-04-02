Encoding.default_external = Encoding.find(Encoding.locale_charmap)
Encoding.default_internal = __ENCODING__
[STDIN, STDOUT].each do |io|
	io.set_encoding(Encoding.default_external, Encoding.default_internal)
end

require_relative 'TestEmployee'

class TerminalViewListEmployee < TestEmployee

	attr_accessor :list_of_emp

	def initialize
		@list_of_emp = []
	end

	def inputListEmployee
		employersList = Array.new
		nextemp = true

		while nextemp
			emp = TestEmployee.new

			begin
				print "Введите ФИО сотрудника->"
				data = gets.strip
				emp.name = data
			rescue Exception => e
				puts e.message
				retry
			end

			begin
				print "Введите дату рождения сотрудника->"
				data = gets.strip
				emp.birthDate = data
			rescue Exception => e
				puts e.message
				retry
			end

			begin
				print "Введите номер телефона сотрудника->"
				data = gets.strip
				emp.phoneNumber = data
			rescue Exception => e
				puts e.message
				retry
			end

			print "Введите адрес сотрудника->"
			data = gets.strip
			emp.adress = data

			begin
				print "Введите email сотрудника->"
				data = gets.strip
				emp.email = data
			rescue Exception => e
				puts e.message
				retry
			end

			begin
				print "Введите паспорт сотрудника->"
				data = gets.strip
				emp.pasport = data
			rescue Exception => e
				puts e.message
				retry
			end

			print "Введите специальность сотрудника->"
			data = gets.strip
			emp.specialty = data

			begin
				print "Введите опыт работы сотрудника->"
				data = gets.strip
				emp.workExperience = data
			rescue Exception => e
				puts e.message
				retry
			end


			if emp.workExperience != "0"
				print "Введите название предыдущего места работы сотрудника->"
				data = gets.strip
				emp.nameLastWork = data

				print "Введите должность сотрудника->"
				data = gets.strip
				emp.position = data

				print "Введите зарплату сотрудника->"
				data = gets.strip
				emp.lastSalary = data
			end

			@list_of_emp.push(emp)
			puts "Ввести данные еще одного сотудника?\n1. Да\n2. Нет"
			f = gets.strip
			nextemp = false if f == "2" || f == "Нет"
		end
	end

end
