require_relative 'Employee'

employe1 = Employee.new("Евгений Жидков Алексеевич", "25.05.1997", " 8(918) 345-67  34",
						"г. Краснодар ул. Ленина д.23", " Evgesha@mail.ru  ", "0520 265395",
						"Системный администратор", "0")

puts(employe1.email)
