class Client

	attr_accessor :name,
				  :birth_date,
				  :phone_number,
				  :email,
				  :address

	def initialize(name=nil, birth_date=nil, phone_number=nil, email=nil, address=nil)
		self.name = name if name != nil
		self.birth_date = birth_date birth_date != nil
		self.phone_number = phone_number if phone_number != nil
		self.email = email if email != nil
		@address = address
	end

	def name=(value)
		@name = Client.correct_name(value)
		self.email = email
	end

	def birth_date=(value)
		@birth_date = Client.correct_date(value)
	end

	def phone_number=(value)
		@phone_number = Client.correct_phone_number(value)
	end

	def email=(value)
		@email = Client.correct_email(value)
	end


	def self.correct_name(name)
		if Client.is_name(name)
			name = name.strip.downcase.gsub(/\s*-\s*/, "-").gsub(/\s+/, " ").chars
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

	def self.is_name(name)
		reg_name = Regexp.compile(/(\s*^[а-яА-Яa-zA-Z]+\s*(-\s*[а-яА-Яa-zA-Z]+)?\s+[а-яА-Яa-zA-Z]+\s*(-\s*[а-яА-Яa-zA-Z]+)?\s+[а-яА-Яa-zA-Z]+\s*(-\s*[а-яА-Яa-zA-Z]+)?\s*$)/)
		name.match?(reg_name)
	end


	def self.correct_date(date)
		if Client.is_date(date)
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

	def self.is_date(date)
		reg_date = Regexp.compile(/(^\s*([12][0-9]|0?[1-9]|3[01])\s*\.\s*([1][0-2]|0?[1-9])\s*\.\s*(19[1-9][0-9]|20[0-1][0-9]|202[01]|1[0-9]|0?[0-9]|21)\s*$)/)
		date.match?(reg_date)
	end


	def self.correct_phone_number(number)
		if Client.is_number(number)
			number = number.delete(' ()+\-')
			number[0] = "7"
			return number.insert(1, "-").insert(5, "-")
		else
			raise "Некорректный номер телефона."
		end
	end

	def self.is_number(number)
		reg_number = Regexp.compile(/(^\s*(\+?7|8)\s*-?\s*\(?\s*\d{3}\)?-?\s*\d\s*\d\s*\d\s*-?\s*\d\s*\d\s*-?\s*\d\s*\d\s*$)/)
		return number.match?(reg_number)
	end


	def self.correct_email(email)
		if Client.is_email(email)
			email.downcase.delete(" ")
		else
			raise "Некорректный email."
		end
	end

	def self.is_email(line)
		reg_email = Regexp.compile(/(^\s*\w{2,254}@[a-zA-Z]{2,255}\.[a-zA-Z]{2,63}\s*)/)
		line.match?(reg_email)
	end
end
