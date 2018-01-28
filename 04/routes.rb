class Route
  attr_reader :number
  attr_accessor :stations
  include InstanceCounter

  NUMBER_FORMAT = /\d{3}/

  @routes = []
  def self.find(number)
    @routes.select { |route| route.number == number }.first
  end

  def self.all
    @routes
  end

  def initialize(number)
    @number = number
    @stations = []
    @instances = register_instance
    validate!
    @routes << self
  end

  def stations_list
    @stations.map { |st| "Station: #{st.name}." }
  end

  def remove_station(station)
    @stations.delete(station) if @stations.include?(station)
  end

  def add_station(station)
    raise 'This station is not Railway Station' if station.class != RailwayStation
    @stations << station
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  protected

  def validate!
    raise 'Number can`t be nil' if @number.nil?
    raise 'Number should be at least 3 symbols' if @number.length < 3
    raise 'Number has invalid format' if @number !~ NUMBER_FORMAT
    true
  end
end
