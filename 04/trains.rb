class Train
  include Company
  include InstanceCounter

  attr_accessor :wagons, :speed, :route, :station
  attr_reader  :name, :type

  NAME_FORMAT = /^[\w]{3}-*[\w]{2}$/i

  @@trains = []
  def self.find(name)
    @@trains.select{ |train| train.name == name }.first
  end

  def self.all
    @@trains
  end

  def initialize(name='unknown')
    @name = name
    @wagons = []
    @station = nil
    @route = nil
    @speed = 0
    @stations = []
    @type = train_type
    @@instances = register_instance
    begin
      validate!
    rescue Exception => e
      puts "Ошибка: " + e.message
    end
    @@trains << self
  end

  def gain_speed
    puts "Tooo-tooo!"
    @speed = 100
  end

  def next_station
    st = @route.stations.find { |station| station == @station }
    index = @route.stations.index(st)
    if index <= (@route.stations.size - 1 - 1)
      @route.stations[find_station_index+1].name
    else
      "End station"
    end
  end

  def braking
    @speed -= 50
    @speed = 0 if @speed <= 0
  end

  def wagons_count
    @wagons.size
  end

  def add_wagon(wagon)
    raise "wrong type" if wagon.type != @type
    @speed == 0 ? @wagons.push(wagon) : puts("Stop first!")
  end

  def remove_wagon
    if @wagons.size == 0
      "No wagons."
    else
      @speed == 0 ? @wagons.delete(@wagons.last) : "Stop first!"
    end
  end

  def valid?
    validate!
  rescue
    false
  end

  private

  def validate!
    raise "Name can`t be nil" if @name.nil?
    raise "Name should be at least 5 symbols" if @name.length < 5
    raise "Name has invalid format" if @name !~ NAME_FORMAT
    raise "Type can`t be nil" if @type.nil?
    raise "Name can`t be the same" if @@trains.any? { |train| train.name == @name }
    true
  end

  def train_type
    ''
  end
end

class PassengerTrain < Train

  private

  def train_type
    @type = 'passenger'
  end
end

class CargoTrain < Train

  private

  def train_type
    @type = 'cargo'
  end
end