class Route
  attr_reader :number
  attr_accessor :stations
  include InstanceCounter

  def initialize(number)
    @number = number
    @stations = []
    @@instances = register_instance
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
  end
end