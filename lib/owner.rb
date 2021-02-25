class Owner
  attr_reader :name, :occupation, :cars
  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
  end

  # Sorry, couldn't push specific car instances using key/value, so used strings to show processes.
  # description: "#{car.split(' ')[1]} #{car.split(' ')[2]}
  # year: car.split(' ')[0]
  def buy(car)
    @cars << car
  end

  def vintage_cars
    vintage = []
    @cars.each do |car|
      vintage << car if car.split(' ')[0].to_i < 1996
    end
    vintage
  end

end
