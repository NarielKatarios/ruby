class Train
  include Company
  include InstanceCounter

  attr_accessor :wagons, :speed, :route, :station
  attr_reader  :name, :type

  @@trains = []
  def self.find(number)
    @@trains.select{ |train| train.number  == number }.first
  end

    def initialize(name='unknown')
      @name = name
      @wagons = []
      @station = nil
      @route = nil
      @speed = 0
      @stations = []
      @trains = []
      @type = train_type
      @@instances = register_instance
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
      puts " Current station: #{@station}. Next station: #{@route.stations[find_station_index+1].name}"
    else
      puts "End station"
    end
  end

  def braking
    puts "Start to stop. Current station: #{@station}"
    @speed -= 50
    @speed = 0 if @speed <= 0
  end

  def current_speed
    puts "Current_speed: #{@speed}"
  end

  def wagons_count
    puts "Number of wagons: #{@wagons.size}"
  end

  def add_wagon(wagon)
    @speed == 0 ? @wagons.push(wagon) : puts("Stop first!")
  end

  def remove_wagon
    if @wagons.size == 0
      puts("No wagons.")
    else
      @speed == 0 ? @wagons.delete(@wagons.last) : puts("Stop first!")
    end
  end

  private

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
