class Employee
	attr_accessor :name,
				  :birthDate,
				  :phoneNumber,
				  :adress,
				  :email,
				  :pasport,
				  :specialty,
				  :workExperience,
				  :nameLastWork,
				  :position,
				  :lastSalary


	def initialize *args
		if args.length == 8 or args.length == 11
			@name = args[0]
			@birthDate = args[1]
			@phoneNumber = args[2]
			@adress = args[3]
			@email = args[4]
			@pasport = args[5]
			@specialty = args[6]
			@workExperience = args[7]

			if args[7].to_i > 0 and args[7].to_i < 80
				@nameLastWork = args[8]
				@position = args[9]
				@lastSalary = args[10]

			elsif args[7].to_i < 0
				raise 'Неверно введено поле \'Опыт работы\'.'
			end

		else
			raise 'Неверное количество аргументов.'
		end
	end


	def printEmployers
		puts @name, @birthDate, @phoneNumber, @adress, @email, @pasport,
			 @specialty, @workExperience

		if @workExperience != "0"
			puts @nameLastWork, @position, @lastSalary
		end
	end
end


