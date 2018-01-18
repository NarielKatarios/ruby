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
# train1 = Train.new('fast', 'cargo', 12)
# train2 = Train.new('slow', 'passenger', 7)

class Train
  attr_accessor :wagon
  attr_reader :type
  attr_accessor :speed
  attr_reader :name_train
  attr_accessor :name_route
  attr_accessor :name_station

  # $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $
  # это все можно записывать в одну строку через запятую  $
  # типа attr_reader :type, :name_train                   $
  # правильнее по англ train_name, station_name и тд      $
  # но в нашем случаее маршрут и станцию вообще надо      $
  # писать без name_ _name,                               $
  # потому что у маршрута есть и номер и станции          $
  # $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $ $

  def initialize(name_train, type, wagon)
    @name_train = name_train
    @type = type
    @wagon = wagon # наверное надо во множ числе?
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
    # надо учесть что он тебе покажет если ты стоишь на последней станции, следующей(+1) у него нет
    # а вообще у тебя в этой переменно помоему не массив
    gain_speed
  end

  def braking=(speed)
    puts "Start to stop.Current station: #{name_station}" # пробельчика после точки не хватает
    @name_route = name_route
    @speed = speed
  end

  def current_speed
    puts "Current_speed: #{@speed}"
  end

  def wagon # лучше назвать метод чтоб было понятно что он делает - например wagons_count, а то я не понял бы что делает метод Вагон
    puts "Number of wagons: #{@wagon}"
  end

  def add_wagon
    @speed == 0 ? puts(@wagon+1) : puts "Stop first!"
    # я так понимаю что он напечатает что вагон добавлен, но не сохранит
    # надо: @wagon = @wagon + 1 или @wagon += 1
    @wagon = wagon # а здесь вызовется твой метод Вагон и в переменную @wagon вместо числа запишется 81-ая строка )))
  end

  def remove_wagon
    @speed == 0 ? puts(@wagon-1) : puts "Stop first!" # тоже что и с добавлением вагонов
    @wagon = wagon
  end

  def take_route = (name_route) # здесь рубишахта тебе подчеркивает что знак равно лишний
  @name_route = name_route # табуляции или двух пробелов не хватает
  end

  def route
    puts "Route #{@name_route}. Last station: #{@name_station-1}, current station: #{@name_station}, next station: #{@name_station+1}."
    # тоже что и в методе next_station
    # если у тебя в перемоеено @name_station будет имя станции текст - то при прибавлении к тексту единички
    # будет ('text' + 1) == 'text1'
    # а при вычитании вообще ошибка))
  end
end

# station1 = RailwayStation.new('east')
# station2 = RailwayStation.new('west')
# station3 = RailwayStation.new('north')
# station4 = RailwayStation.new('south')
# примеры лучше использовать реальные - например "Москва"

class RailwayStation
  attr_reader :name_station
  attr_accessor :list

  def initialize(name_station)
    @name_station = name_station
    @list = {@type: @name_train} #??????????? массив или хэш поставить, тут не то
    # да нужен массив []
    # в который мы будем добавлять поезда методом .push или <<
    # [train1, train5, train2]
    # и назвать его trains или trains_list
    # (лучше первое, а второе для названия метода который выведет этот список)
    # @list = []
    # а у тебя что-то не понятное {@type: @name_train}
    # это хэш с ключем '@type' а не переменная @type
  end

  def receive_train
    puts "На станцию #{name_station} прибыл поезд #{name_train}."  #англо-русская версия)))))
    list << "#{name_train}"          #??????????? массив или хэш
    # здесь у тебя в name_train текст - значит интерполяция не нужна и
    # можно просто list << name_train
    list_of_trains
    # принцип единственной ответственности
    # метод должен делать что то одно, судя по названию - принимать поезд на станцию
    # а мы еще и выводим список всех поездов зачем то
  end

  def list_of_trains
    puts "На станции находится #{@list.size} поездов: #{list}."  #??????????? массив или хэш
    # в одном месте @list в другом list
    # надо что-то одно))
  end

  def list_of_trains_type
    puts "На станции находится #{@list[:cargo].size} грузовых поездов и #{@list[:passenger].size} пассажирских."
    # в лист будет массив а не хеш, скорее всего массив хешей, поэтому надо будет перебрать все поезда
    # любым методо итератором (.each .map .select) и вернуть только те элементы тип у которых равен тому типу который ты ищешь
  end

  # :013 > @list = { @type: [@name_train, @name_train], @type: [@name_train, @name_train]}
  #=> {:@type>[@name_train, @name_train, :@type=>[@name_train, @name_train]}
  # :014 > @list[:@type]
  #=> [@name_train, @name_train]


  def departure_train
    puts "Со станции #{name_station} отправляется поезд #{name_train}."  #англо-русская версия)))))
    list.delete(name_train) # тут молодец - это правильно
    list_of_trains # тоже что и в receive_train
  end



end # много лишних пустых строк

# route1 = Route.new('sea')
# route2 = Route.new('town')
# примеры лучше использовать реальные

class Route
  attr_reader :name_route

  attr_accessor :list

  def initialize(name_route)
    @name_route = name_route # наверное лучше ни имя маршрута, а номер
    @list = {@type: @name_train} #??????????? массив или хэш поставить, тут не то
    # тоже что и в RailwayStation
    # ['Москва', 'Росто-на-Дону',  '...',  'Симферополь']
  end

  def list_of_stations # уже лучше название, но stations_list еще лучше)))
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
#---------------------------
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


# и в конце надо все это протестировать выполнив свой закоменченный код
station1 = RailwayStation.new('Москва')
station2 = RailwayStation.new('Симферополь')
station3 = RailwayStation.new('Ростов-на-Дону')
station4 = RailwayStation.new('Керч')
station5 = RailwayStation.new('Севастополь')
station6 = RailwayStation.new('Сочи')

route1 = Route.new(101) # создаем новый маршрут с номером 101
route1.trains << station1 # добавляем в него станции ['Москва', 'Керч', 'Симферополь', 'Севастополь']
route1.trains << station4
route1.trains << station2
route1.trains << station5
route1.trains << station6 # нечаянно добавили сюда Сочи
route1.trains.delete(station6) # удаляем сочи
route1.trains_list # выводим список станций

route2 = Route.new(115) # создаем маршрут №115 ['Москва', 'Ростов-на-Дону']
route2.trains << station1
route2.trains << station3

train1 = Train.new('fast', 'cargo', 12)
train2 = Train.new('slow', 'passenger', 7)
train1.route = route1 # назначаем нашим поездам маршруты
train2.route = route2
train1.name # этот метод должен вывести имя поезда
train1.type # тип
train1.wagons # количество вагонов
train1.route # маршрут
train1.speed # текущую скорость
train1.station # станцию на которой он находится