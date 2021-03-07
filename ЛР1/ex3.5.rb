value = gets
case value
when 1..10
  puts "Число принадлежит промежутку [1;10]"
when 15
  puts "Это число 15"
when "Антон"
  puts "Ваше имя Антон!"
when String
  puts "Вы ввели строку"
else
  puts "Ничего не подошло"
end

gets