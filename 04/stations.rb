class RailwayStation
  attr_reader :name
  attr_accessor :trains
  include InstanceCounter


  def self.all#???????????????????????????????????????
    @stations.each_with_index do |station, index|
      puts "#{index+1} - #{station.name}"
  end

  def initialize(name)
    @name = name
    @trains = []
    @@instances += 1
    @stations = [] #??????????????????????????????????????
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
end