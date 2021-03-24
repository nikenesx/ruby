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

