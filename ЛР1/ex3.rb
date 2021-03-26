puts "Какай ваш любимый язык?"
language = gets
puts language
case language
when "ruby"
    puts "Не подлизывайся"
when "python"
    puts "Слишком скучно, ruby его заменит"
when "c++"
    puts "Может и так, но с ruby интересней"
when "pascal"
    puts "o_O"
else
    "Ответ неверный! Скоро твоим любимым языком станет Ruby!"
end

x = 3
puts "x = 3" if x == 3
gets

value = 10
unless value < 100 then
    value = value + 20
else
    value = value + 100
end
gets

hk = 'up'
x = -1.0
x = x + 2.5 unless hk == 'up'
gets

y = 3
puts "y = #{y}" if y == 3

