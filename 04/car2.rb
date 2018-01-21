module FuelTank
  def fill_tank(level)
    self.fuel_tank = level
  end

  def fuel_level
    self.fuel_tank
  end

  protected
  attr_accessor :fuel_tank
end

module Debugger# == Debugger = Module.new do ... end
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def debug(log)
    puts "!!!DEBUG: #{log}!!!"
    end
  end

  module InstanceMethods
    def debug(log)
      self.class.debug(log)
    end
    def print_class
      puts self.class
    end
  end
end

class Car # == Car = Class.new do ... end
  include FuelTank
  include Debugger

  attr_reader :current_rpm

  #создать метод класса - объявить метод с помощью селф
 # def self.description
 # puts "Это родительский класс для всех авто."
 # end
  # или
#  class << self
#    def description
#      puts "Это родительский класс для всех авто."
#    end
#  end

 # def description
 #   puts "Это экземплчр класса Car."
#  end
    #  public
    # завести двигатель

  @@instances = 0      #переменная класса

  def self.instances
    @@instances
  end



  debug 'Start interface'

  def initialize
    @current_rmp = 0
    @@instances += 1
    debug 'initialize'
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

  debug 'End interface'

  protected

  attr_writer :current_rpm


 # INITIAL_RPM = 700 # константа - большими буквами с подчеркиваниями

  def initial_rpm
  700
  end

  def start_engine!
    # устанавливает начальные обороты
    self.current_rpm = iinitial_rpm
  end
# остановить двигатель
end

class MotoBike
  include FuelTank
  include Debugger


  debug 'MotoBike class'
end

car = Car.new
bike = MotoBike.new
car.fill_tank(50)
car.fuel_level
bike.fill_tank(20)
bike.fuel_level
car.print_class
bike.print_class
MotoBike.debug '123'

Car.methods
Car.public_methods
Car.instance_methods
car.methods
car.class
Car.class
Class.methods
Class.instance_methods
MyClass = Class.new do
  def m1
    puts "m1"
  end
  def m2
    puts "m2"
  end
end
my = MyClass.new
my.m1
my.m2
Class.class
Car.superclass
Class.superclass
Module.class
Module.superclass
Module.private_instance_methods
MyModule = Module.new do
end
o = Object.new
o.class
Object.class
Object.superclass
BasicObject.class
BasicObject.superclass




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

# методы класса -
# Car.new, User.find(5), User.where(email: 'test@user.com')
#
#
#
# file modules.rb
#пространство имен
#module Admin
#  class Car
#    #реализация
#  end
#end

class Admin::Car

end

Admin::Car.new
admin_car = Admin::Car.new
admin_car.class

Math.class
Math.sin(3)
Math::PI
Math.methods
