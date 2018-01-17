-------------------------------------------------------
#С этого занятия мы будем создавать прилоежение, которое поможет диспетчеру железнодорожной странции управлять поездами:
# принимать, отправлять, показывать информацию и т.д. (точнее, мы будем создавать его объектную модель).
# Нужно написать:
#*: Классы Train и RailwayStation, Route для поезда, ж.д. станции и маршрута соответственно.
-------------------------------------------------------
#    *: Станция:
#    *: Имеет название, которое указывается при ее создании
#*: Может принимать поезда
#*: Может показывать список всех поездов на станции, находящиеся в текущий момент
#*: Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
#*: Может отправлять поезда (при этом, поезд удаляется из списка поездов, находящихся на станции).
-------------------------------------------------------
#    *: Маршрут:
#    *: Имеет начальную и конечную станцию, а также список промежуточных станций
#*: Может добавлять станцию в список
#*: Может удалять станцию из списка
#*: Может выводить список всех станций по-порядку от начальной до конечной
-------------------------------------------------------
#*: Поезд:
#    *: Имеет, тип, который указывается при создании: грузовой, пассажирский
# и количество вагонов.
#    *: Поезд может делать следующие вещи:
#*: набирать скорость
#*: показывать текущую скорость
#*: тормозить
#*: показывать количество вагонов
#*: прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов).
# Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
#    *: Принимать маршрут следования
#*: Перемещаться между станциями, указанными в маршруте.
#    *: Показывать предыдущую станцию, текущую, следующую, на основе маршрута
-------------------------------------------------------
# train1 = Train.new('fast', 'cargo', 12)
# train2 = Train.new('slow', 'passenger', 7)

class Train
  attr_accessor :wagon
  attr_reader :type
  attr_accessor :speed
  attr_reader :name_train
  attr_accessor :name_route
  attr_accessor :name_station

  def initialize(name_train, type, wagon)
    @name_train = name_train
    @type = type
    @wagon = wagon
    @name_station = name_station
    @name_route = name_route
    @speed = speed
  end

  def gain_speed
    puts "Tooo-tooo!"
    self.speed = 100
  end

  def next_station
    puts " Current station: #{name_station}. Next station: #{name_station+1}"
    gain_speed
  end

  def braking=(speed)
    puts "Start to stop.Current station: #{name_station}"
    @name_route = name_route
    @speed = speed
  end

  def current_speed
    puts "Current_speed: #{@speed}"
  end

  def wagon
    puts "Number of wagons: #{@wagon}"
  end

  def add_wagon
    @speed == 0 ? puts(@wagon+1) : puts "Stop first!"
    @wagon = wagon
  end

  def remove_wagon
    @speed == 0 ? puts(@wagon-1) : puts "Stop first!"
    @wagon = wagon
  end

   def take_route = (name_route)
  @name_route = name_route
  end

  def route
  puts "Route #{@name_route}. Last station: #{@name_station-1}, current station: #{@name_station}, next station: #{@name_station+1}."
  end
end

# station1 = RailwayStation.new('east')
# station2 = RailwayStation.new('west')
# station3 = RailwayStation.new('north')
# station4 = RailwayStation.new('south')

class RailwayStation
  attr_reader :name_station
  attr_accessor :list

  def initialize(name_station)
    @name_station = name_station
    @list = {@type: @name_train} #??????????? массив или хэш поставить, тут не то
  end

  def receive_train
    puts "На станцию #{name_station} прибыл поезд #{name_train}."  #англо-русская версия)))))
    list << "#{name_train}"          #??????????? массив или хэш
    list_of_trains
  end

  def list_of_trains
    puts "На станции находится #{@list.size} поездов: #{list}."  #??????????? массив или хэш
  end

  def list_of_trains_type
    puts "На станции находится #{@list[:cargo].size} грузовых поездов и #{@list[:passenger].size} пассажирских."
  end

  # :013 > @list = { @type: [@name_train, @name_train], @type: [@name_train, @name_train]}
  #=> {:@type>[@name_train, @name_train, :@type=>[@name_train, @name_train]}
  # :014 > @list[:@type]
  #=> [@name_train, @name_train]


  def departure_train
    puts "Со станции #{name_station} отправляется поезд #{name_train}."  #англо-русская версия)))))
    list.delete(name_train)
    list_of_trains
  end



end

# route1 = Route.new('sea')
# route2 = Route.new('town')

class Route
  attr_reader :name_route

  attr_accessor :list

  def initialize(name_route)
    @name_route = name_route
    @list = {@type: @name_train} #??????????? массив или хэш поставить, тут не то
  end

    def list_of_stations
    puts "На станции находится #{@list.size} поездов: #{list}."  #??????????? массив или хэш
  end

  def list_of_trains_type
    puts "На станции находится #{@list[:cargo].size} грузовых поездов и #{@list[:passenger].size} пассажирских."
  end

  def remove_stations
    puts "Со станции #{name_station} отправляется поезд #{name_train}."  #англо-русская версия)))))
    list.delete(name_train)
    list_of_stations
  end




  # в маршруте сделать хэш со списком name_station
end

# терминале
#fish не забываем
# irb
# load './car.rb' - метод лоад с именем файла для загрузки в ирб
# Car - класс Car
# car = Car.new, car2 = Car.new - создаем объект с помощью переменной Класс и метод нью (показывается конкретный адрес в памяти, который этот объект занимает )
# car.object_id == car2.object_id - не равны, то есть false
# сar.receive_train и сar2.receive_train и все методы, которые придумали в приложении, через точку к переменной
# @название_переменной - данные представлены инстанс переменными или переменными экземпляра класса
#
#
---------------------------
#название файла с маленькой без пробелов,
# можно с _нижним_подчеркиванием
#имя констант, класса, модуля с большой буквы слитно - BigCar
#методы и названия переменных - с маленькой буквы с нижним подчеркиванием
#методы: def свое_название
#в терминале car.метод
# #данные - инстанст переменные или переменные экземпляра класса
# они начинаются с @с мал буквы без пробелов
#get - метод возвращения - по названию переменной, которую возвращает
#set - метод установления,
#attr_accessor :speed - метод и геттер и сеттер
# одновременно для аргумента attr_writer :speed и attr_reader :speed

#аттеры заменяют методы геттеры и сеттеры:
# #car.current_speed - текущая скорость
#get геттор метод - метод возвращения - по названию

#def speed
#@speed
#end

#def engine_volume
#@engine_volume
#end

#set сеттер метод - метод установления, по названию
# def set_speed(speed)
# car.speed = 60 #новая скорость

#def speed=(speed)
#@speed = speed
#end


class Car
  attr_accessor :speed

  attr_reader :engine_volume

  #car = Car.new если в инициализации нет аргументов
  #car2 = Car.new , а потом просто car
  #car = Car.new(10, 2.0) если в инициализации есть аргументы
  # def initialize(speed, engine_volume)
  # если нужны аргументы по умолчанию в инициализации присваивается к аргументам значения
  # def initialize(speed = 0, engine_volume = 1.6)

  def initialize(speed = 0, engine_volume) #метод конструктор - вызывается при создании объекта - пусть начинается двигаться и сигналить, когда мы его создаем, едет со ск 10 и бип бипкает
    @speed = speed
    @engine_volume = engine_volume
  end

  def start_engine
    puts "Wroom!"
  end

  def beep
    puts "beep beep"
  end

  def stop
    self.speed = 0 #@speed - self.speed - чтобы просто спид не было локальной переменной
  end

  #car.go

  def go
    self.speed = 50
    beep
  end
end
