class Employee
	attr_accessor :birthDate,
				  :adress,
				  :pasport,
				  :specialty,
				  :workExperience,
				  :nameLastWork,
				  :position,
				  :lastSalary

	attr_reader :name,
				:phoneNumber,
				:email


	def initialize(*args)
		if args.length == 8 or args.length == 11
			self.name = args[0]
			@birthDate = args[1]
			self.phoneNumber = args[2]
			@adress = args[3]
			self.email = args[4]
			@pasport = args[5]
			@specialty = args[6]
			@workExperience = args[7]

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


	def phoneNumber=(val)
		@phoneNumber = correctNumber(val)
	end


	def email=(val)
		@email = correctEmail(val)
	end


	def correctName(name)
		if isName(name)
			if name.strip != nil
				name.strip!
			end
			name = name.gsub(/\s*-\s*/, "-").gsub(/\s+/, " ").downcase!.chars
			name.each_index {|i| name[i].upcase! if name[i-1] == " " || name[i-1] == "-" || i == 0}
			name = name.join
			if name.match?(/^[а-яА-Я]+(-[а-яА-Я]+)?\s[а-яА-Я]+(-[а-яА-Я]+)?\s[а-яА-Я]+\s[а-яА-Я]+/)
				name[name.rindex(" ") + 1] = name[name.rindex(" ") + 1].downcase
			end
			name
		else
			raise "Некорректный формат имени."
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


	def isName(name)
		regIsName = Regexp.compile(/(^[а-яА-Я]+\s*(-\s*[а-яА-Я]+)?\s*[а-яА-Я]+\s*(-\s*[а-яА-Я]+)?\s*[а-яА-Я]+\s*([а-яА-Я]+)?$)/)
		name.strip! if name.strip != nil
		name.match?(regIsName)
	end


	def isNumberRussian(number)
		regRusNumber = Regexp.compile(/(^\s*(\+?7|8)\s*\(?\s*\d{3}\)?\s*\d\s*\d\s*\d\s*-?\s*\d\s*\d\s*-?\s*\d\s*\d\s*$)/)
		return number.match?(regRusNumber)
	end


	def isEmail(line)
		regIsEmail = Regexp.compile(/(^\s*\w{2,254}@[a-zA-Z]{2,255}\.[a-zA-Z]{2,63}\s*)/)
		line.match?(regIsEmail)
	end


	def printEmployers
		puts @name, @birthDate, @phoneNumber, @adress, @email, @pasport,
			 @specialty, @workExperience

		if @workExperience != "0"
			puts @nameLastWork, @position, @lastSalary
		end
	end
end


