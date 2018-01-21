require_relative 'car2'
require_relative 'truck2'
require_relative 'sport_car2'

truck = Truck.new
truck.start_engine
puts "Truck RPM: #{truck.current_rpm}."

car = Car.new
car.start_engine
puts "Sport Car RPM: #{car.current_rpm}."


sport_car = SportCar.new
sport_car.start_engine
puts "Sport Car RPM: #{sport_car.current_rpm}."


# ruby main.rb
#
#
