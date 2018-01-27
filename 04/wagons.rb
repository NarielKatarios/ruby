class Wagon
  include Company
  include InstanceCounter

  attr_reader :type

  def initialize
    @@instances = register_instance
    validate!
    @@wagons << self
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Type can`t be nil" if @type.nil?
    true
  end
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