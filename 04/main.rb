#- Создать модуль, который позволит указывать название компании-производителя и получать его.
# Подключить модуль к классам Вагон и Поезд
# В классе RailwayStation (жд станция) создать метод класса all, который выводит список всех станций,
# созданных на данный момент
# #- В классе Train создать метод класса find,
#который принимает номер поезда и возвращает объект поезда по номеру
# # или nil, если поезд с таким номером не найден.
#    - Усложенное задание: Создать модуль InstanceCounter,
# содержащий следующие методы класса и инстанс-методы,
# которые подключаются автоматически при вызове include в классе:
# Методы класса:
#    instances, который возвращает кол-во экземпляров данного класса
#Инастанс-методы:
#
 #   register_instance, который увеличивает счетчик кол-ва экземпляров класса
# и который можно вызвать из конструктора. При этом, данный метод не должен быть публичным.

require_relative 'trains'
require_relative 'stations'
require_relative 'routes'
require_relative 'wagons'
require_relative 'module_company'
require_relative 'module_instance_counter'
@stations = []

@stations << RailwayStation.new('Москва')
@stations << RailwayStation.new('Симферополь')
@stations << RailwayStation.new('Ростов-на-Дону')
@stations << RailwayStation.new('Керчb')
@stations << RailwayStation.new('Севастополь')
@stations << RailwayStation.new('Сочи')
@trains = []
answer = ''

def find_train
  @trains.each_with_index { |train, index| puts "#{index+1} - #{train.name}" }
  @trains[gets.to_i-1]
end

while answer != 0
  puts '-------------------------------------'
  puts '1 - Создать поезд'
  puts '2 - Добавить вагон к поезду'
  puts '3 - Отцепить вагон от поезда'
  puts '4 - Поместить поезд на станцию'
  puts '5 - Список станций и поездов на станции'
  puts '0 - exit'
  answer = gets.to_i
  if answer == 1
    puts '1 - passenger'
    puts '2 - cargo'
    answer2 = gets.to_i
    puts 'input train name'
    name = gets.chomp
    if answer2 == 1
      @trains << PassengerTrain.new(name)
    elsif answer2 == 2
      @trains << CargoTrain.new(name)
    end
  elsif answer == 2
    puts 'Введите номер поезда, к которому добавить вагон'
    train = find_train
    if train.type == 'passenger'
      train.add_wagon(PassengerWagon.new)
    elsif train.type == 'cargo'
      train.add_wagon(CargoWagon.new)
    end
  elsif answer == 3
    puts 'Введите номер поезда, от которого отцепить вагон'
    train = find_train
    train.remove_wagon
  elsif answer == 4
    puts 'Введите номер поезда, который хотите поместить на станцию.'
    train = find_train
    puts 'Введите номер станции.'
    @stations.each_with_index { |station, index| puts "#{index+1} - #{station.name}" }
    station_index = gets.to_i-1
    station = @stations[station_index]
    train.station = station
    station.add_train(train)
  elsif answer == 5
    @stations.each_with_index do |station, index|
      puts "#{index+1} - #{station.name}"
      puts station.trains_list
    end
  else
    puts 'Неверное значение.'
  end
end