require_relative 'TerminalViewListEmployee'

class ListEmployee < TerminalViewListEmployee
	@@list_emp = []


	def readfile
		puts "Введите ключ:"
		keey = gets.strip
		while keey != @@key
			puts 'Ключ неверен. повторите попытку: '
			keey = gets.strip
			if keey == '0'
				break
			end
		end
		if keey == @@key
			file = File.open('employers_to_read.txt', 'r', encoding:'utf-8')
			conffile = file.readlines
			for i in 1...conffile.size
				emp = TestEmployee.new
				emp.name = conffile[i][0,30].strip
				emp.birthDate = conffile[i][30,12].strip
				emp.phoneNumber = conffile[i][42,15].strip
				emp.adress = conffile[i][57,35].strip
				emp.email = conffile[i][92, 25].strip
				emp.pasport = deshift(conffile[i][117, 12].strip, keey)
				emp.specialty = conffile[i][129,20].strip
				emp.workExperience = conffile[i][149,18].strip
				if emp.workExperience != '0'
					emp.nameLastWork = conffile[i][167,30].strip
					emp.position = conffile[i][197,17].strip
					emp.lastSalary = conffile[i][214,10].strip
				end
				@@list_emp.push(emp)
			end
		end
	end


	def inputEmployee
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
		@@list_emp.push(emp)
	end


	def outputall
		for emp in @@list_emp
			emp.printEmployers
			print("---------------\n")
		end
	end


	def find_by_name(name)
		raise "Список работников пуст" if @@list_emp.length == 0
		raise "Неверный формат аргумента" if not isName(name)
		finded_emp = nil
		for employe in @@list_emp
			if employe.name == name
				finded_emp = employe
			end
		end
		finded_emp
	end


	def find_by_email(email)
		raise "Список работников пуст" if @@list_emp.length == 0
		raise "Неверный формат аргумента" if not isEmail(name)
		finded_emp = nil
		for employe in @@list_emp
			if employe.email == email
				finded_emp = employe
			end
		end
		finded_emp
	end


	def find_by_number(number)
		raise "Список работников пуст" if @@list_emp.length == 0
		raise "Неверный формат аргумента" if not isNumberRussian(name)
		finded_emp = nil
		for employe in @@list_emp
			if employe.phoneNumber == number
				finded_emp = employe
			end
		end
		finded_emp
	end


	def find_by_pasport(pasport)
		raise "Список работников пуст" if @@list_emp.length == 0
		raise "Неверный формат аргумента" if not isPasport(name)
		finded_emp = nil
		for employe in @@list_emp
			if employe.pasport == pasport
				finded_emp = employe
			end
		end
		finded_emp
	end
end
