class RailwayStation
  attr_reader :name
  attr_accessor :trains
  include InstanceCounter

  @stations = []
  def self.all
    @stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @instances = register_instance
    validate!
    @stations << self
  end

  def do_with_trains
    @trains.each { |n| yield(n) }
  end

  def trains_list
    @trains.map do |train|
      "Train: #{train.name} - #{train.wagons.size} wagons, type: #{train.type}"
    end
  end

  def trains_list_type
    cargo_trains = @trains.select { |train| train.type == 'cargo' }
    passenger_trains = @trains.select { |train| train.type == 'passenger' }
    "На станции находится #{cargo_trains.size} грузовых поездов и #{passenger_trains.size} пассажирских."
  end

  def departure_train(train)
    @trains.delete(train)
  end

  def add_train(train)
    @trains << train
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  protected

  def validate!
    raise 'Name can`t be nil' if @name.nil?
    raise 'Name should be at least 3 symbols' if @name.length < 3
    true
  end
end
