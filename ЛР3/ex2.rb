require_relative 'TestEmployee'

employe1 = TestEmployee.new("Евгений Жидков Алексеевич", "25.05.1997", "79183456734",
						"г. Краснодар ул. Ленина д.23", "evgesha@mail.ru", "0520 265395",
						"Системный администратор", "0")

employe2 = TestEmployee.new("Арсений Иванов Иванович", "06.11.1988", "79187562456",
						"г. Краснодар ул. Ставропольская д.129", "killer228@gmail.com", "0519 458105",
						"C# разработчик", "6", "Крутая компания",
						"Старший программист", "90000")

employe1.printEmployers
employe2.printEmployers