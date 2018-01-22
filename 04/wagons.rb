class Wagon
  include Company
  include InstanceCounter

  attr_reader :type
end

class CargoWagon < Wagon
  def initialize
    @type = 'cargo'
    @@instances = register_instance
  end
end

class PassengerWagon < Wagon
  def initialize
    @type = 'passenger'
  end
end