class Employee
	attr_accessor :name,
				  :birthDate,
				  :adress,
				  :email,
				  :pasport,
				  :specialty,
				  :workExperience,
				  :nameLastWork,
				  :position,
				  :lastSalary

	attr_reader :phoneNumber


	def initialize(*args)
		if args.length == 8 or args.length == 11
			@name = args[0]
			@birthDate = args[1]
			self.phoneNumber = args[2]
			@adress = args[3]
			@email = args[4]
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


	def phoneNumber=(val)
		@phoneNumber = correctNumber(val)
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


	def isNumberRussian(number)
		regRusNumber = Regexp.compile(/(^\s*(\+?7|8)\s*\(?\s*\d{3}\)?\s*\d\s*\d\s*\d\s*-?\s*\d\s*\d\s*-?\s*\d\s*\d\s*$)/)
		return number.match?(regRusNumber)
	end


	def printEmployers
		puts @name, @birthDate, @phoneNumber, @adress, @email, @pasport,
			 @specialty, @workExperience

		if @workExperience != "0"
			puts @nameLastWork, @position, @lastSalary
		end
	end
end


