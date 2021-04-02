require_relative 'TerminalViewListEmployee'

emp = TerminalViewListEmployee.new
emp.inputListEmployee
for empoloyee in emp.list_of_emp
	empoloyee.printEmployers
end
