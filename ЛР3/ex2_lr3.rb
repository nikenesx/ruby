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

    def initialize name, birtDate, phoneNumber, adress, email, pasport, specialty, workExperience, nameLastWork=nil, position=nil, lastSalary=nil
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

employe1.printEmployers
puts
employe2.printEmployers
