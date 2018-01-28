puts 'Введите коэффициенты a, b и c квадратного уравнения (через enter?)'
a = gets.to_i
b = gets.to_i
c = gets.to_i

d = b**2 - 4 * a * c

if d >= 0
  x1 = (- b + Math.sqrt(d)) / (2 * a)
  x2 = (- b - Math.sqrt(d)) / (2 * a)
else
  puts "d = #{d}, корней нет."
end

if d > 0
  puts "d = #{d}, x1 = #{x1}, x2 = #{x2}."
elsif d.zero?
  puts "d = #{d}, x1 = #{x1}."
end
