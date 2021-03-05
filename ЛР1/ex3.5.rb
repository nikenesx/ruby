value = gets
case value
when 1..10
  "Число принадлежит промежутку [1;10]"
when 15
  "Это число 15"
when "Антон"
  "Ваше имя Антон!"
when String
  "Вы ввели строку"
else
  "Ничего не подошло"
end

gets