#Вагоны теперь делятся на грузовые и пассажирские (отдельные классы).
# К пассажирскому поезду можно прицепить только пассажирские, к грузовому - грузовые.
#    Усложненное задание: создать программу в файле main.rb,
# которая будет позволять пользователю через текстовый интерфейс делать следующее:
#                                                                                                                                      - Создавать станции
#- Создавать поезда
#- Добавлять вагоны к поезду
#- Отцеплять вагоны от поезда
#- Помещать поезда на станцию
#- Просматривать список станций и список поездов на станции

require_relative 'trains'
require_relative 'stations'
require_relative 'routes'
require_relative 'wagons'
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