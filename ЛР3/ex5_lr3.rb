class Employe
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

	def initialize name=nil, birtDate=nil, phoneNumber=nil, adress=nil, email=nil, pasport=nil, specialty=nil, workExperience=nil, nameLastWork=nil, position=nil, lastSalary=nil
		@name = name
		@birthDate = birtDate
		@phoneNumber = phoneNumber
		@adress = adress
		@email = email
		@pasport = pasport
		@specialty = specialty
		@workExperience = workExperience
		if @workExperience != "0"
			@nameLastWork = nameLastWork
			@position = position
			@lastSalary = lastSalary
		end
	end

	def name=(val)
		begin
			@name = correctName(val)
		rescue Exception => e
			puts e.message
		end
	end

	def phoneNumber=(val)
		begin
			@phoneNumber = correctNumber(val)
		rescue Exception => e
			puts e.message
		end
	end

	def email=(val)
		begin
			@email = correctEmail(val)
		rescue Exception => e
			puts e.message
		end
	end

	def correctNumber number
		regCorrectNumber = Regexp.compile(/(^(\+?7|8|\+?\d\s*\d?\s*\d?\s*)\s*\(?\s*\d{3}\)?\s*\d\s*\d\s*\d\s*-?\s*\d\s*\d\s*-?\s*\d\s*\d)/)
		if number.match?(regCorrectNumber) && isNumberRussian(number)
			number = number.gsub(/\s+/, "")
			number = number[1..number.length] if number[0] == "+"
			number[0] = "7"
			number = number.gsub("-", "").gsub("(", "").gsub(")", "")
			number.insert(1, "-").insert(5, "-")
			number
		else
			Exception.new(msg = "Некорректный номер телефона.")
		end
	end

	def correctEmail email
		if isEmail email
			email.downcase
		else
			Exception.new("Неверный email")
		end
	end

	def correctName name
		if isName name
			if name.strip != nil
				name.strip!
			end
			name = name.gsub(/\s*-\s*/, "-").gsub(/\s+/, " ").downcase!
			name = name.chars
			name.each_index {|i| name[i].upcase! if name[i-1] == " " || name[i-1] == "-" || i == 0}
			name = name.join
			if name.match?(/^[а-яА-Я]+(-[а-яА-Я]+)?\s[а-яА-Я]+(-[а-яА-Я]+)?\s[а-яА-Я]+\s[а-яА-Я]+/)
				name[name.rindex(" ") + 1] = name[name.rindex(" ") + 1].downcase
			end
			name
		else
			Exception.new("Некорректный формат имени.")
		end
	end

	def isNumberRussian number
		regRusNumber = Regexp.compile(/(^(\+?7|8)\s*\(?\s*\d{3}\)?\s*\d\s*\d\s*\d\s*-?\s*\d\s*\d\s*-?\s*\d\s*\d$)/)
		if number.match?(regRusNumber) == true
			true
		else
			false
		end
	end

	def isEmail line
		regIsEmail = Regexp.compile(/(^\w{2,254}@[a-zA-Z]{2,255}\.[a-zA-Z]{2,63})/)
		line.match?(regIsEmail)
	end

	def isName name
		regIsName = Regexp.compile(/(^[а-яА-Я]+\s*(-\s*[а-яА-Я]+)?\s*[а-яА-Я]+\s*(-\s*[а-яА-Я]+)?\s*[а-яА-Я]+\s*([а-яА-Я]+)?$)/)
		name.strip!
		name.match?(regIsName)
	end

	def printEmployers
		puts @name, @birthDate, @phoneNumber, @adress, @email, @pasport,
			 @specialty, @workExperience

		if @workExperience != "0"
			puts @nameLastWork, @position, @lastSalary
		end
	end
end

class TestEmploye < Employe

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

employe1 = TestEmploye.new("Евгений Жидков Алексеевич", "25.05.1997", "79183456734",
						   "г. Краснодар ул. Ленина д.23", "evgesha@mail.ru", "0520 265395",
						   "Системный администратор", "0")

employe2 = TestEmploye.new("Арсений Иванов Иванович", "06.11.1988", "79187562456",
						   "г. Краснодар ул. Ставропольская д.129", "killer228@gmail.com", "0519 458105",
						   "C# разработчик", "6", "Крутая компания",
						   "Старший программист", "90000")

employe3 = Employe.new
employe3.name = " АрТеМ  - Евкакий  ИВАнов- КРАСИВОВов Азгорович Азанян"
puts employe3.name

employe3 = Employe.new
employe3.name = " АрТеМ   Евкакий  ИВАнов- КРАСИВОВов Азгорович Азанян"
puts employe3.name


