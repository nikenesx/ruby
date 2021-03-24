class Employe
    # Сеттеры и геттеры
    attr_accessor :adress,
                  :pasport,
                  :specialty,
                  :workExperience,
                  :nameLastWork,
                  :position,
                  :lastSalary
    # Геттеры
    attr_reader :name,
                :phoneNumber,
                :email,
                :birthDate

    # Констурктор класса Employe
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

    # Сеттер для поля name с выбрасыванием исключения если val имеет некорректный формат
    def name=(val)
        begin
            raise correctName(val) if correctName(val).instance_of? Exception
            @name = correctName(val)
        rescue Exception => e
            puts e.message
        end
    end

    # Сеттер для поля birthDate с выбрасыванием исключения если val имеет некорректный формат
    def birthDate=(val)
        begin
            raise correctDate(val) if correctDate(val).instance_of? Exception
            @birthDate = correctDate(val)
        rescue Exception => e
            puts e.message
        end
    end

    # Сеттер для поля phoneNumber с выбрасыванием исключения если val имеет некорректный формат
    def phoneNumber=(val)
        begin
            raise correctNumber(val) if correctNumber(val).instance_of? Exception
            @phoneNumber = correctNumber(val)
        rescue Exception => e
            puts e.message
        end
    end

    # Сеттер для поля email с выбрасыванием исключения если val имеет некорректный формат
    def email=(val)
        begin
            raise correctEmail(val) if correctEmail(val).instance_of? Exception
            @email = correctEmail(val)
        rescue Exception => e
            puts e.message
        end
    end

    # Сеттер для поля pasport с выбрасыванием исключения если val имеет некорректный формат
    def pasport=(val)
        begin
            raise correctPasport(val) if correctPasport(val).instance_of? Exception
            @pasport = correctPasport(val)
        rescue Exception => e
            puts e.message
        end
    end

    # Метод который возвращает нужный формат имени если оно имеет корректный формат, иначе Исключение
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

    # Метод который возвращает нужный формат номера телефона если оно имеет корректный формат, иначе Исключение
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
            Exception.new("Некорректный формат номера телефона.")
        end
    end

    # Метод который возвращает нужный формат имэйла если оно имеет корректный формат, иначе Исключение
    def correctEmail email
        if isEmail email
            email.downcase
        else
            Exception.new("Некорректный формат email")
        end
    end

    # Метод который возвращает нужный формат даты если оно имеет корректный формат, иначе Исключение
    def correctDate date
        if isDate date
            temp = date.split(".")
            temp[0] = "0" + temp[0] if temp[0].length == 1
            temp[1] = "0" + temp[1] if temp[1].length == 1
            temp[2] = "20" + temp[2] if temp[2].length == 2
            date = ""
            temp.each {|el| date += el + "."}
            date[0..date.length - 2]
        else
            Exception.new("Неверный формат даты")
        end
    end

    # Метод который возвращает нужный формат даты если оно имеет корректный формат, иначе Исключение
    def correctPasport data
        if isPasport data
            data.gsub(/\s+/, " ")
        else
            Exception.new("Неверный формат паспортных данных")
        end
    end

    # Метод который возвращает true если аршумент number является номером телефона, иначе false
    def isNumberRussian number
        regRusNumber = Regexp.compile(/(^(\+?7|8)\s*\(?\s*\d{3}\)?\s*\d\s*\d\s*\d\s*-?\s*\d\s*\d\s*-?\s*\d\s*\d$)/)
        number.match?(regRusNumber)
    end

    # Метод который возвращает true если аршумент line является имэйлом, иначе false
    def isEmail line
        regIsEmail = Regexp.compile(/(^\w{2,254}@[a-zA-Z]{2,255}\.[a-zA-Z]{2,63})/)
        line.match?(regIsEmail)
    end

    # Метод который возвращает true если аршумент name является именем фамилией отчеством, иначе false
    def isName name
        regIsName = Regexp.compile(/(^[а-яА-Я]+\s*(-\s*[а-яА-Я]+)?\s*[а-яА-Я]+\s*(-\s*[а-яА-Я]+)?\s*[а-яА-Я]+\s*([а-яА-Я]+)?$)/)
        name.strip!
        name.match?(regIsName)
    end

    # Метод который возвращает true если аршумент date является датой, иначе false
    def isDate date
        regIsDate = Regexp.compile(/(^([12][0-9]|0?[1-9]|3[01])\.([1][0-2]|0?[1-9])\.(19[1-9][0-9]|20[0-1][0-9]|202[01]|1[0-9]|0?[0-9]|21)$)/)
        date.match?(regIsDate)
    end

    # Метод который возвращает true если аршумент data является серией и номером паспорта, иначе false
    def isPasport data
        data.strip!
        regIsPasport = Regexp.compile(/(^\d{2}\s*\d{2}\s*\d{6}$)/)
        data.match?(regIsPasport)
    end

    # Метод который выводит значения полей класса
    def printEmployers
        puts @name, @birthDate, @phoneNumber, @adress, @email, @pasport,
             @specialty, @workExperience

        if @workExperience != "0"
            puts @nameLastWork, @position, @lastSalary
        end
    end
end

class TestEmploye < Employe

    # Переопределнный метод класса Employe который выводит поля класса TestEmploye с описанием
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

employe3 = TestEmploye.new
puts "Какое поле нужно ввести?\n1. ФИО\n2. Номер телефона\n3. Дата рождения\n4. email\n->"
n = gets.strip

if n == "1" || n == "ФИО"
    puts "Введите ФИО"
    name = gets.strip
    employe3.name = name
    puts employe3.name if employe3.name != nil

elsif n == "2" || n == "Номер телефона"
    puts "Введите номер телефона"
    number = gets.strip
    employe3.phoneNumber = number
    puts employe3.phoneNumber if employe3.phoneNumber != nil

elsif n == "3" || n == "Дата рождения"
    puts "Введите дату рождения"
    date = gets.strip
    employe3.birthDate = date
    puts employe3.birthDate if employe3.birthDate != nil

elsif n == "4" || n == "email"
    puts "Введите email"
    email = gets.strip
    employe3.email = email
    puts employe3.email if employe3.email != nil

end
