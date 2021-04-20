class Employee

	attr_accessor :adress,
				  :specialty,
				  :workExperience,
				  :nameLastWork,
				  :position,
				  :lastSalary

	attr_reader :name,
				:birthDate,
				:phoneNumber,
				:email,
				:pasport


	def initialize(*args)
		if args.length == 8 or args.length == 11
			self.name = args[0]
			self.birthDate = args[1]
			self.phoneNumber = args[2]
			@adress = args[3]
			self.email = args[4]
			self.pasport = args[5]
			@specialty = args[6]
			self.workExperience = args[7]

			if args[7].to_i > 0 and args[7].to_i < 80
				@nameLastWork = args[8]
				@position = args[9]
				@lastSalary = args[10]

			elsif args[7].to_i < 0 or args[7].to_i > 80
				raise 'Неверно введено поле \'Опыт работы\'.'
			end

		else
			raise 'Неверное количество аргументов.'
		end
	end


	def name=(val)
		@name = correctName(val)
	end


	def birthDate=(val)
		@birthDate = correctDate(val)
	end


	def phoneNumber=(val)
		@phoneNumber = correctNumber(val)
	end


	def email=(val)
		@email = correctEmail(val)
	end


	def pasport=(val)
		@pasport = correctPasport(val)
	end


	def workExperience=(val)
		if val.to_i < 0
			raise "Неверный формат поля 'Опыт работы'"
		end
		@workExperience = val
	end


	def correctName(name)
		if isName(name)
			if name.strip != nil
				name.strip!
			end
			name = name.gsub(/\s*-\s*/, "-").gsub(/\s+/, " ")
			name.downcase! if name.downcase! != nil
			name = name.chars
			name.each_index {|i| name[i].upcase! if name[i-1] == " " || name[i-1] == "-" || i == 0}
			name = name.join
			if name.match?(/^[а-яА-Яa-zA-Z]+(-[а-яА-Яa-zA-Z]+)?\s[а-яА-Яa-zA-Z]+(-[а-яА-Яa-zA-Z]+)?\s[а-яА-Яa-zA-Z]+\s[а-яА-Яa-zA-Z]+/)
				name[name.rindex(" ") + 1] = name[name.rindex(" ") + 1].downcase
			end
			name
		else
			raise "Некорректный формат имени."
		end
	end


	def correctDate(date)
		if isDate(date)
			date = date.delete(' ')
			temp = date.split(".")
			temp[0] = "0" + temp[0] if temp[0].strip.length == 1
			temp[1] = "0" + temp[1] if temp[1].strip.length == 1
			temp[2] = "20" + temp[2] if temp[2].strip.length == 2
			temp[2] = "200" + temp[2] if temp[2].strip.length == 1
			date = ""
			temp.each {|el| date += el + "."}
			date[0..date.length - 2]
		else
			raise "Неверный формат даты"
		end
	end


	def correctNumber(number)
		if isNumberRussian(number)
			number = number.delete(' ()+\-')
			number[0] = "7"
			return number.insert(1, "-").insert(5, "-")
		else
			raise "Некорректный номер телефона."
		end
	end


	def correctEmail(email)
		if isEmail(email)
			email.downcase.delete(" ")
		else
			raise "Некорректный email."
		end
	end


	def correctPasport data
		if isPasport(data)
			data = data.delete(' ')
			data.insert(2, ' ').insert(5, ' ')
		else
			raise "Неверный формат паспортных данных."
		end
	end


	def isName(name)
		regIsName = Regexp.compile(/(\s*^[а-яА-Яa-zA-Z]+\s*(-\s*[а-яА-Яa-zA-Z]+)?\s+[а-яА-Яa-zA-Z]+\s*(-\s*[а-яА-Яa-zA-Z]+)?\s+[а-яА-Яa-zA-Z]+\s*([а-яА-Яa-zA-Z]+)?\s*$)/)
		name.match?(regIsName)
	end


	def isDate(date)
		regIsDate = Regexp.compile(/(^\s*([12][0-9]|0?[1-9]|3[01])\s*\.\s*([1][0-2]|0?[1-9])\s*\.\s*(19[1-9][0-9]|20[0-1][0-9]|202[01]|1[0-9]|0?[0-9]|21)\s*$)/)
		date.match?(regIsDate)
	end


	def isNumberRussian(number)
		regRusNumber = Regexp.compile(/(^\s*(\+?7|8)\s*\-?\s*\(?\s*\d{3}\)?-?\s*\d\s*\d\s*\d\s*-?\s*\d\s*\d\s*-?\s*\d\s*\d\s*$)/)
		return number.match?(regRusNumber)
	end


	def isEmail(line)
		regIsEmail = Regexp.compile(/(^\s*\w{2,254}@[a-zA-Z]{2,255}\.[a-zA-Z]{2,63}\s*)/)
		line.match?(regIsEmail)
	end


	def isPasport(data)
		regIsPasport = Regexp.compile(/(^\s*(\d\s*){10}\s*$)/)
		data.match?(regIsPasport)
	end


	def to_s
		str = '-'* 65 + "\n" +
				+ format("%25s | %s\n", "Имя", @name) +
				+ format("%25s | %s\n", "Дата рождения", @birthDate) +
				+ format("%25s | %s\n", "Номер телефона", @phoneNumber) +
				+ format("%25s | %s\n", "Адрес", @adress) +
				+ format("%25s | %s\n", "Email", @email) +
				+ format("%25s | %s\n", "Паспортные данные", @pasport) +
				+ format("%25s | %s\n", "Специальность", @specialty) +
				+ format("%25s | %s\n", "Опыт работы", @workExperience)
		if @workExperience != "0"
			str += + format("%25s | %s\n", "Наз. пред. места работы", @nameLastWork) +
						+ format("%25s | %s\n", "Должность на пред. работе", @position) +
						+ format("%25s | %s\n", "Зарплата на пред. работе", @lastSalary)
		end
		str += '-'* 65
		str
	end
end


