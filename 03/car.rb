#название файла с маленькой без пробелов,
# можно с _нижним_подчеркиванием
#имя констант, класса, модуля с большой буквы слитно - BigCar
#методы и названия переменных - с маленькой буквы с нижним подчеркиванием
#методы: def свое_название
#в терминале car = Car.new - создаем объект
#в терминале car.метод
# #данные - инстанст переменные или переменные экземпляра класса
# они начинаются с @с мал буквы без пробелов, которую возвращает
#get - метод возвращения - по названию переменной
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
#fish не забываем
# load './car.rb'

class Car
  attr_accessor :speed

  attr_reader :engine_volume

  #car = Car.new если в инициализации нет аргументов
  #car2 = Car.new , а потом просто car
  #car = Car.new(10, 2.0) если в инициализации есть аргументы
  # def initialize(speed, engine_volume)
  # если нужны аргументы по умолчанию в инициализации присваивается к аргументам значения
  # def initialize(speed = 0, engine_volume = 1.6)

  def initialize(speed = 0, engine_volume) #пусть всегда едет со скоростью 10 и бип бипкает
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

#speed = 40
#puts "local speed: #{speed}, instance speed^ #{@speed}"
#speed = 23
#, local speed: #{speed}