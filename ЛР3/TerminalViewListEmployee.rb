Encoding.default_external = Encoding.find(Encoding.locale_charmap)
Encoding.default_internal = __ENCODING__
[STDIN, STDOUT].each do |io|
	io.set_encoding(Encoding.default_external, Encoding.default_internal)
end

require_relative 'TestEmployee'

class TerminalViewListEmployee < TestEmployee

	attr_accessor :list_of_emp

	@@key = 'DOG'
	@@list_of_emp = []


	def inputListEmployee
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

			@@list_of_emp.push(emp)
			puts "Ввести данные еще одного сотудника?\n1. Да\n2. Нет"
			f = gets.strip
			nextemp = false if f == "2" || f == "Нет"
		end
	end


	def shifr(word)
		alph = 'A/B*C+D-E!F?G&H0I1J2K3L4M5N6O7P8Q9R@S:T>U<V#W%X=YZ'.chars
		word = word.delete(" ").chars
		kk = @@key * (alph.length / @@key.length + 1)
		kk = kk[0, word.length]
		res = Array.new
		for i in 0..word.length - 1
			res.push((word[i].to_i + alph.index(kk[i]) % alph.length))
		end
		res2 = ''
		res.each { |i| res2 += alph[i]}
		return res2
	end


	def deshift(line, key)
		if key == @@key
			alph = 'A/B*C+D-E!F?G&H0I1J2K3L4M5N6O7P8Q9R@S:T>U<V#W%X=YZ'.chars
			line = line.chars
			kk = key * (alph.length / @@key.length + 1)
			kk = kk[0, line.length]
			res = Array.new
			for i in 0..line.length - 1
				res.push((alph.index(line[i]) - alph.index(kk[i]) + 26) % 26)
			end
			res.join('')
		end
	end


	def outinfile
		file = File.open('employers.txt', 'w', encoding: 'utf-8')
		tempstr = ''
		s = "Name".ljust(30) +
			+ "Birth date".ljust(12) +
			+ "Phone number".ljust(15) +
			+ "Adres".ljust(35) +
			+ "Email".ljust(25) +
			+ "Pasport".ljust(12) +
			+ "Specialty".ljust(20) +
			+ "Work experience".ljust(18) +
			+ "Last work name".ljust(30) +
			+ "Position".ljust(17) +
			+ "Salary".ljust(10) + "\n"
		for elem in @list_of_emp
			tempstr += elem.name.ljust(30)
			tempstr += elem.birthDate.ljust(12)
			tempstr += elem.phoneNumber.ljust(15)
			tempstr += elem.adress.ljust(35)
			tempstr += elem.email.ljust(25)
			pass = shifr(elem.pasport)
			tempstr += pass.ljust(12)
			tempstr += elem.specialty.ljust(20)
			tempstr += elem.workExperience.ljust(18)
			if elem.workExperience != '0'
				tempstr += elem.nameLastWork.ljust(30)
				tempstr += elem.position.ljust(17)
				tempstr += elem.lastSalary.ljust(10)
			end
			tempstr += "\n"
			s += tempstr
			tempstr = ""
		end
		file.write(s)
	end


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
				@@list_of_emp.push(emp)
				emp.printEmployers
				puts '----------------------'
			end
		end
	end

end
