class Wagon
  attr_reader :type
end

class CargoWagon < Wagon
  def initialize
    @type = 'cargo'
  end
end

class PassengerWagon < Wagon
  def initialize
    @type = 'passenger'
  end
end