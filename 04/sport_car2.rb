class SportCar < Car
  def start_engine
    puts "Click!!"
    super
    puts "Wroom!!"
  end
  protected

  def iinitial_rpm
    1000
  end
end

sport_car = SportCar.new
#sport_car.load
sport_car.start_engine
sport_car.current_rpm