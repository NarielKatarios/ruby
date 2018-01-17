# хешСделать хеш, содеращий месяцы и количество дней в месяце.
#     В цикле выводить те месяцы, у которых количество дней ровно 30
months = {january: 31,
         february: 28,
         march: 31, april: 30,
         may: 31, june: 30, july: 31, august: 31,
         september: 30, october: 31, november: 30, december: 31}
months.each { |key, value| puts key if value == 30 }


months = {jan: 31, feb: 28, mar: 31, apr: 30, may: 31, jun: 30, jul: 31, aug: 31, sep: 30, oct: 31, nov: 30, dec: 31 }
months.each { |month, day| puts month if day == 30 }
array_of_30_days = months.map { |month, day| month if day == 30 }
array_of_31_days = months.map { |month, day| month if day !=  30 }

array = [ 1, 2, 3, 'a', 'b'] # это массив
hash = { a: '1', b: '2', c: 3, 'd': 4, 'e' => 5, e: 6} # это ассоциативный массив, простыми словами хэш


# Заполнить массив числами от 10 до 100 с шагом 5

#10.step(100, 5) { |n| puts n }
#array.push(1) тоже самое что и array << 1

arr = []
index = 10
while index <= 100
  arr << index
  index += 5
end
arr

#Заполнить массив числами фибоначи до 100
# если есть лишние есть метод .uniq!
# [1, 2, 3, 3, 3, 4, 4, 5].uniq вернет [1, 2, 3, 4, 5]
arr = [1, 1]
index = arr[-1]+arr[-2]
while index <= 100
  arr << index
  index += arr[-2]
end
arr

arr = [1, 2]
index = arr[-1]+arr[-2]
while index <= 100
  arr << index
  index += arr[-2]
end
arr

#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

hash = {}
array = ('a'..'z').to_a
str = ['a', 'e', 'i', 'o', 'u']
array.each_with_index { |val,index| hash.merge!({(index+1) => val}) if str.include? val}
hash

#тернарный оператор
a = 5
b = 3

if a > b
  puts a
else
  puts b
end

a > b ? puts(a) : puts(b)