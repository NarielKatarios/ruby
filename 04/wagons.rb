class Wagon
  include Company
  include InstanceCounter

  attr_reader :type

  def initialize
    validate!
    raise "Error!"
  end

  def valid?
    validate!
  rescue
    false
  end

  begin
    initialize
  rescue StandardError => e
    puts e.inspect
  end

  puts 'After error'

  protected

  def validate!
    raise "Type can`t be nil" if type.nil?
    true
  end
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