class Employe
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

    def initialize name=nil, birtDate=nil, phoneNumber=nil, adress=nil, email=nil, pasport=nil, specialty=nil,
                   workExperience=nil, nameLastWork=nil, position=nil, lastSalary=nil
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

    def phoneNumber=(val)
        begin
            @phoneNumber = correctNumber(val)
        rescue Exception => e
            puts e.message
        end
    end

    def correctNumber(number)
        regCorrectNumber = Regexp.compile(/(^(\+?7|8|\+?\d\s*\d?\s*\d?\s*)\s*\(?\s*\d{3}\)?\s*\d\s*\d\s*\d\s*-?\s*\d\s*\d\s*-?\s*\d\s*\d)/)
        if number.match?(regCorrectNumber) && isNumberRussian(number)
            number = number.gsub(/\s+/, "")
            number = number[1..number.length] if number[0] == "+"
            number[0] = "7"
            number = number.gsub("-", "")
            number = number.gsub("(", "")
            number = number.gsub(")", "")
            number.insert 1, "-"
            number.insert 5, "-"
            number
        else
            Exception.new(msg = "Исключение: некорректный номер телефона.")
        end
    end

    def printEmployers
        puts @name, @birthDate, @phoneNumber, @adress, @email, @pasport,
             @specialty, @workExperience

        if @workExperience != "0"
            puts @nameLastWork, @position, @lastSalary
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

employe1.phoneNumber = "8(918)160-18-16"
puts employe1.phoneNumber

employe2.phoneNumber = "+1(918)160-18-16"
puts employe2.phoneNumber
