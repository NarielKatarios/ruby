#Реализовать проверку (валидацию) данных для всех классов.
# Проверять основные атрибуты (название, номер, тип и т.п.) на наличие, длину и т.п.
# (в зависимости от атрибута):
#    Валидация должна взываться при создании объекта, если объект невалидный,
# то должно выбрасываться исключение
#Должен быть метод valid? который возвращает true, если объект валидный
# и false - в противном случае.
# Релизовать проверку на формат номера поезда.
# Допустимый формат: три буквы или цифры в любом порядке, /.[3]-*.[2]/i
# необязательный дефис (может быть, а может нет) и еще 2 буквы или цифры после дефиса.
# Релизовать интерфейс, который бы выводил пользователю ошибки валидации
# без прекращения работы программы.
#
# Убрать из классов все puts (кроме методов, которые и должны что-то выводить на экран)
# , методы просто возвращают значения. (Начинаем бороться за чистоту кода). - ???????????????????????
#
# UPDATE к заданию:
#- Дополнительно сделать следующее:
# при добавлениит вагонов к поезду и несовпадении типов также выбрасывать исключение.
#- Для класса маршрута сделать валидацию на то,
# что при добавлении станций объекты имеют тип (класс) RailwayStation
# (или как он у вас называется).
#
# - Добавить валидацию (с выбросом исключения)на глобальную уникальность номера поезда.
# То есть, нельзя создать 2 объекта класса Train с одинаковым номером.


require_relative 'module_company'
require_relative 'module_instance_counter'
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