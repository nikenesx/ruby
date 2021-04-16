require_relative 'ListEmployee'

newclass = ListEmployee.new
newclass.readfile
empp = newclass.find_by_name('Иванов Александр Евгеньевич')
puts empp.phoneNumber