require_relative 'module_company'
require_relative 'module_instance_counter'
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
train1 = Train.new
station = RailwayStation.new
c_wagon = CargoWagon.new
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
train1 = '12'
@@trains = []
@@trains << Train.new('12')
@@trains << Train.new('13')
@@trains.find('12')
@@trains.find('14')
station.instances
route.instances
train.instances
train2 = Train.new
train.instances
train.register_instance