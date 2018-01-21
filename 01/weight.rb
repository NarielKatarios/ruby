puts "Как тебя зовут?"
name = gets.chomp

puts "Какой у тебя рост в сантиметрах?"
growth = gets.chomp

if growth.to_i >= 110
puts "#{name}, привет! Твой идеальный вес -  #{growth.to_i - 110} кг."
else
puts "Ваш вес уже оптимальный."
end


