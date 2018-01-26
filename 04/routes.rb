class Route
  attr_reader :number
  attr_accessor :stations
  include InstanceCounter

  NUMBER_FORMAT = /\d[3]/

  def initialize(number)
    @number = number
    @stations = []
    @@instances = register_instance
    validate!
    raise "Error!"
  end

  def stations_list
    puts "В маршруте #{@stations.size} станций: #{@stations}."
    @stations.each do  |st|
      puts "Station: #{st.name}."
    end
  end

  def remove_station(station)
    puts "Из маршрута #{@number} исключается станция #{station.name}."
    @stations.delete(station) if @stations.include?(station)
  end

  def add_station(station)
    puts "В маршрут #{@number} включена станция #{station.name}."
    @stations << station
    raise "This station is not Railway Station" if station.class != RailwayStation
  end

  def valid?
    validate!
  rescue
    false
  end

  begin
    initialize
    add_station
  rescue StandardError => e
    puts e.inspect
  end

  puts 'After error'

  protected

  def validate!
    raise "Number can`t be nil" if number.nil?
    raise "Number should be at least 3 symbols" if number.length < 3
    raise "Number has invalid format" if number !~ NUMBER_FORMAT
    true
  end
end