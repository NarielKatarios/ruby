class RailwayStation
  attr_reader :name
  attr_accessor :trains
  include InstanceCounter

  NAME_FORMAT = /^[A-Z]$/i

  @@stations = []
  def self.all
    @@stations.each do |station|
      puts "Станция: #{station.name}"
    end
  end

  def initialize(name)
    @name = name
    @trains = []
    @@instances = register_instance
    @@stations << self
    validate!
  end

  def trains_list
    @trains.each do  |train|
      puts "Train: #{train.name} - #{train.wagons.size} wagons, type: #{train.type}"
    end
    puts "На станции находится #{@trains.size} поездов:"
  end

  def trains_list_type
    cargo_trains = @trains.select { |train| train.type == 'cargo' }
    passenger_trains = @trains.select { |train| train.type == 'passenger' }
    puts "На станции находится #{cargo_trains.size} грузовых поездов и #{passenger_trains.size} пассажирских."
  end

  def departure_train(train)
    puts "Со станции #{@name} отправляется поезд #{train.name}."
    @trains.delete(train)
  end

  def add_train(train)
    @trains << train
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Name can`t be nil" if name.nil?
    raise "Name should be at least 6 symbols" if name.length < 6
    raise "Name has invalid format" if name !~ NAME_FORMAT
    true
  end

end