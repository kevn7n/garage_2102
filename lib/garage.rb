class Garage
  attr_reader :name, :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def all_cars
    all = []
    @customers.each do |customer|
      all << customer.cars
    end
    all.flatten
  end

  def oldest_cars
    older_first = all_cars.sort do |car|
      car.split(' ')[0].to_i
    end
    older_first.reverse
  end

end
