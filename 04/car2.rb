class Car

  attr_reader :current_rpm

    #  public
    # завести двигатель

  def initialize
    @current_rmp = 0
  end

  def start_engine
    # запустить двигатель, если он не запущен
    star_engine! if engine_stopped
 # set('rpm', 700) if rpm == 0 - обороты в секунду
 # current_rpm - текущие обороты
  end

  def engine_stopped?
    #true, если обороты на нуле
    current_rpm.zero? # или current_rpm == 0
  end

  protected

  attr_writer :current_rpm

 # INITIAL_RPM = 700 # константа - большими буквами с подчеркиваниями

  def iinitial_rpm
  700
  end

  def start_engine!
    # устанавливает начальные обороты
    self.current_rpm = iinitial_rpm
  end
# остановить двигатель
end



#class X
 # def start_engine
 #   puts "Hello!"
#  end
#end

#class Driver
#  def drive(car)
#    #сесть в машину
 #   # запустить двигатель
 #   car.start_engine
 #   # тронуться с места
 # end
#end

# бэнк-методы
  # ! - изменяет состояние или производит что-то важное
  # ? - метод предикат, метод возвращает труфолс
  # zero возвращает тру, если значение равно нулю
# рефакторинг - изменение кода без изменения функциональности (его поведения)
# 700 - магические числа - не понятно. почему именно 700, нелогичные
# избавление от магических чисел - константой или методом
# интерфейс класса - публичные методы класса, как можем действовать над классом
# наследование - перенос из базового всех методов для общего пользования
# DRY - dont repeat yourself - не повторяй сам себя
# полиморфизм - переопределение поведения в подклассе, мы можем передавать подклассы в базовый класс
# режимы: public private protected
# private- видны только внутри класса - но тоже наследуются -
# методы после привате доступны только в этом классе, но и в подклассах, если не вызывать метод селф
# protected - извне не видны, но видны в подклассе
#родительский класс - суперкласс, то есть класс над текущим
# duck typing - утиная типизация, если некий объект крякает как утка, то это утка
#
car = Car.new
car.current_rpm
car.start_engine #публичный метод - public - все методы публичные по умолчанию
car.current_rpm
car.engine_stopped?
car.start_engine!#приватный метод - если он после привате - в терминале будет ошибка




#driver = Driver.new
#driver.drive(car)
#car.current_rpm
#driver.drive(sport_car)
#driver.drive(truck)

#x = X.new
#driver.drive(x)
# x.current_rpm # ненайденный метод

