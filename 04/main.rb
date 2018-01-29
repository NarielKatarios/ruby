# Выполнить следующие задачи:
# 1 - Написать модуль, содержащий 2 метода, которые можно вызывать на урвне класса:
#   - метод att_accessor_with_history.
#     Динамически создает геттеры и сеттеры для любого кол-ва атрибутов,
#     при этом сеттер сохраняет все значения инстанс-переменной при изменении этого значения.
#     Также должен быть метод <имя_атрибута>_history,
#     который возвращает массив всех значений данной переменной.
#   - метод strong_attr_acessor, который принимает имя атрибута и его класс.
#     При этом создается геттер и сеттер для одноименной инстанс-переменной,
#     но сеттер проверяет тип присваемоего значения.
#
#     Если тип отличается от того,
#     который указан вторым параметром, то выбрасывается исключение.
#     Если тип совпадает, то значение присваивается.
#
# 2 - Подключить модуль в класс и продемонстрировать применение этих методов.
#     Написать модуль Validation, который:
# 1 - Содержит метод класса validate.
#     Этот метод принимает в качестве параметров имя проверяемого атрибута,
#     а также тип валидации и при необходимости дополнительные параметры.
#     Возможные типы валидаций:
#
#   - presence - требует, чтобы значение атрибута было не nil и не пустой строкой.
#     Пример использования: validate :name, :presence
#   - format (при этом отдельным параметром задается регулярное выражение для формата).
#     Треубет соответствия значения атрибута заданному регулярному выражению.
#     Пример: validate :number, :format, /A-Z{0,3}/
#   - type (третий параметр - класс атрибута).
#     Требует соответствия значения атрибута заданному классу.
#     Пример: validate :station, :type, RailwayStation
#
# 2 - Содержит инстанс-метод validate!, который запускает все проверки (валидации),
#     указанные в классе через метод класса validate.
#
#     В случае ошибки валидации выбрасывает исключение с сообщением о том,
#     какая именно валидация не прошла.
#
# 3 - Содержит инстанс-метод valid? который возвращает true,
#     если все проверки валидации прошли успешно и false, если есть ошибки валидации.
#     Заменить валидации в проекте железной дороги на этот модуль и методы из него.

require_relative 'module_company'
require_relative 'module_instance_counter'
require_relative 'module_metaprogram'
require_relative 'trains'
require_relative 'stations'
require_relative 'routes'
require_relative 'wagons'

RailwayStation.new('Москва')
RailwayStation.new('Симферополь')
RailwayStation.new('Ростов-на-Дону')
RailwayStation.new('Керчb')
RailwayStation.new('Севастополь')
RailwayStation.new('Сочи')
answer = ''

while answer != 0
  puts '-------------------------------------'
  puts '1 - Создать поезд'
  puts '2 - Добавить вагон к поезду'
  puts '3 - Отцепить вагон от поезда'
  puts '4 - Поместить поезд на станцию'
  puts '5 - Список станций и поездов на станции'
  puts '6 - create Route'
  puts '7 - add station to Route'
  puts '8 - remove station from Route'
  puts '0 - exit'
  answer = gets.to_i
  if answer == 1
    puts '1 - passenger'
    puts '2 - cargo'
    answer2 = gets.to_i
    puts 'input train name'
    name = gets.chomp
    if answer2 == 1
      PassengerTrain.new(name)
    elsif answer2 == 2
      CargoTrain.new(name)
    end
  elsif answer == 2
    puts 'Введите номер поезда, к которому добавить вагон'
    Train.all.each { |tr| puts tr.name }
    number = gets.chomp
    train = Train.find(number)
    if train && train.type == 'passenger'
      train.add_wagon(PassengerWagon.new)
    elsif train && train.type == 'cargo'
      train.add_wagon(CargoWagon.new)
    else
      puts "Train with number #{number} not found"
    end
  elsif answer == 3
    puts 'Введите номер поезда, от которого отцепить вагон'
    Train.all.each { |tr| puts tr.name }
    number = gets.chomp
    train = Train.find(number)
    train.remove_wagon
  elsif answer == 4
    puts 'Введите номер поезда, который хотите поместить на станцию.'
    Train.all.each { |tr| puts tr.name }
    number = gets.chomp
    train = Train.find(number)
    puts 'Введите номер станции.'
    RailwayStation.all.each_with_index { |station, index| puts "#{index + 1} - #{station.name}" }
    station_index = gets.to_i - 1
    station = RailwayStation.all[station_index]
    train.station = station
    station.add_train(train)
  elsif answer == 5
    RailwayStation.all.each_with_index do |st, index|
      puts "#{index + 1} - #{st.name}"
      puts station.trains_list
      station.do_with_trains do |tr|
        puts tr.name
        train.do_with_wagons { |wagon| puts wagon.type }
      end
    end

  elsif answer == 6
    puts 'Введите номер маршрута, который хотите создать'
    @number = gets.chomp
  elsif answer == 7
    puts 'Введите номер маршрута, чтобы добавить в него станцию.'
    Route.all.each { |rou| puts rou.name }
    number = gets.chomp
    @route = Route.find(number)
  elsif answer == 8
    puts 'Введите номер маршрута, чтобы удалить из него станцию.'
    @route = find_route
    @route.remove_station
  else
    puts 'Неверное значение.'
  end
end

train = Train.new
station = RailwayStation.new
c1_wagon = CargoWagon.new
p_wagon = PassengerWagon.new
route = Route.new
train.company('ru')
train.company
c1_wagon.company('uk')
c1_wagon.company
p_wagon.company('ru')
p_wagon.company
RailwayStation.all
RailwayStation.all.size
Train.methods
Train.instance_methods
train = '13'
@trains = []
@trains << Train.new('12')
@trains << Train.new('13')
@trains.find('12')
@trains.find('14')
station.instances
route.instances
train.instances
train.instances
train.register_instance
