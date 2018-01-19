#-------------------------------------------------------
# С этого занятия мы будем создавать прилоежение, которое поможет диспетчеру железнодорожной странции управлять поездами:
# принимать, отправлять, показывать информацию и т.д. (точнее, мы будем создавать его объектную модель).
# Нужно написать:
# *: Классы Train и RailwayStation, Route для поезда, ж.д. станции и маршрута соответственно.
#-------------------------------------------------------
#    *: Станция:
# *: Имеет название, которое указывается при ее создании
# *: Может принимать поезда
# *: Может показывать список всех поездов на станции, находящиеся в текущий момент
# *: Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# *: Может отправлять поезда (при этом, поезд удаляется из списка поездов, находящихся на станции).
#-------------------------------------------------------
#    *: Маршрут:
# *: Имеет начальную и конечную станцию, а также список промежуточных станций
# *: Может добавлять станцию в список
# *: Может удалять станцию из списка
# *: Может выводить список всех станций по-порядку от начальной до конечной
#-------------------------------------------------------
#    *: Поезд:
# *: Имеет, тип, который указывается при создании: грузовой, пассажирский и количество вагонов.
# *: Поезд может делать следующие вещи:
# *: набирать скорость
# *: показывать текущую скорость
# *: тормозить
# *: показывать количество вагонов
# *: прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов).
# Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# *: Принимать маршрут следования
# *: Перемещаться между станциями, указанными в маршруте.
# *: Показывать предыдущую станцию, текущую, следующую, на основе маршрута
#-------------------------------------------------------

class Train
  attr_accessor :wagons, :speed, :route, :station
  attr_reader :type, :name

  def initialize(name='unknown', type='cargo', wagons=0)
    @name = name
    @type = type
    @wagons = wagons
    @station = nil
    @route = nil
    @speed = 0
    @stations = []
    @trains = []
  end

  def gain_speed
    puts "Tooo-tooo!"
    @speed = 100
  end

  def next_station
    st = @route.stations.find { |station| station == @station }
    index = @route.stations.index(st)
    if index <= (@route.stations.size - 1 - 1)
      puts " Current station: #{@station}. Next station: #{@route.stations[find_station_index+1].name}"
    else
      puts "End station"
    end
  end

  def braking
    puts "Start to stop. Current station: #{@station}"
    @speed -= 50
    @speed = 0 if @speed <= 0
  end

  def current_speed
    puts "Current_speed: #{@speed}"
  end

  def wagons_count
    puts "Number of wagons: #{@wagons}"
  end

  def add_wagon
    @speed == 0 ? @wagons += 1 : puts("Stop first!")
  end

  def remove_wagon
    if @wagons == 0
      puts("No wagons.")
    else
      @speed == 0 ? @wagons -= 1 : puts("Stop first!")
    end
  end
end

class RailwayStation
  attr_reader :name
  attr_accessor :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def trains_list
    puts "На станции находится #{@trains.size} поездов:"
    @trains.each do  |train|
      puts "Train: #{train.name} - #{train.wagons} wagons, type: #{train.type}"
    end
  end

  def trains_list_type
    cargo_trains = @trains.select { |train| train.type == 'cargo' }
    passenger_trains = @trains.select { |train| train.type == 'passenger' }
    puts "На станции находится #{cargo_trains.size} грузовых поездов и #{passenger_trains.size} пассажирских."
  end

  def departure_train(train)
    puts "Со станции #{@name} отправляется поезд #{train.name}."
    @trains.delete(train)
  end
end

class Route
  attr_reader :number
  attr_accessor :stations

  def initialize(number)
    @number = number
    @stations = []
  end

  def stations_list
    puts "В маршруте #{@stations.size} станций: #{@stations}."
    @stations.each do  |st|
      puts "Station: #{st.name}."
    end
  end

  def remove_station(station)
    puts "Из маршрута #{@number} исключается станция #{station.name}."
    @stations.delete(station) if @stations.include?(station)
  end

  def add_station(station)
    puts "В маршрут #{@number} включена станция #{station.name}."
    @stations << station
  end
end

station1 = RailwayStation.new('Москва')
station2 = RailwayStation.new('Симферополь')
station3 = RailwayStation.new('Ростов-на-Дону')
station4 = RailwayStation.new('Керчb')
station5 = RailwayStation.new('Севастополь')
station6 = RailwayStation.new('Сочи')

route1 = Route.new(101) # создаем новый маршрут с номером 101
route1.stations << station1 # добавляем в него станции ['Москва', 'Керч', 'Симферополь', 'Севастополь']
route1.stations << station4
route1.stations << station2
route1.add_station(station5)                                  # почему там . траинс?????????????? мож, стэйшнз??
route1.stations << station6 # нечаянно добавили сюда Сочи
puts "====================1"
route1.stations_list # выводим список станций                 # стэйшнз???? без лист
route1.remove_station(station6) # удаляем сочи
puts "====================2"
route1.stations_list # выводим список станций                 # стэйшнз???? без лист

route2 = Route.new(115) # создаем маршрут №115 ['Москва', 'Ростов-на-Дону']
route2.stations << station1
route2.stations << station3

train1 = Train.new('fast', 'cargo', 12)
train2 = Train.new('slow', 'passenger', 7)
train1.route = route1 # назначаем нашим поездам маршруты
train2.route = route2
train1.name # этот метод должен вывести имя поезда
train1.type # тип
train1.wagons # количество вагонов
train1.route = route1 # маршрут
train1.speed # текущую скорость
train1.station = station1# станцию на которой он находится

station1.trains << train1
station1.trains << train2
station1.trains_list
station1.trains_list_type
station1.departure_train(train2)
station1.trains_list_type
