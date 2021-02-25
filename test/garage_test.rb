require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'
require './lib/owner'
require './lib/garage'

class GarageTest < Minitest::Test
  #ITERATION 3
  def setup
    @garage = Garage.new('Totally Safe Garage') #CHANGED from 'Parking'

    @owner_1 = Owner.new('Regina George', 'Heiress')
    @owner_2 = Owner.new('Glen Coco', 'Unknown')

    @car_1 = Car.new({description: 'Green Ford Mustang', year: '1967'})
    @car_2 = Car.new({description: 'Silver BMW 3-Series', year: '2001'})
    @car_3 = Car.new({description: 'Green Chevrolet Corvette', year: '1963'})
    @car_4 = Car.new({description: 'Blue Ford Escape', year: '2001'})
    @car_5 = Car.new({description: 'Silver Volvo XC90', year: '2020'})

  end

  def test_it_exists

    assert_instance_of Garage, @garage
  end

  def test_it_has_attributes

    assert_equal "Totally Safe Garage", @garage.name
    assert_equal [], @garage.customers
  end

  def test_it_adds_customers

    assert_equal [], @garage.customers

    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

    assert_equal [@owner_1, @owner_2], @garage.customers
  end

  def test_it_customers_have_cars

    @owner_1.buy('1967 Green Ford Mustang')
    @owner_1.buy('2001 Blue Ford Escape')

    @owner_2.buy('1963 Green Chevrolet Corvette')  #was 'Red'?
    @owner_2.buy('2020 Silver Volvo XC90')

    @garage.add_customer(@owner_1)
    @garage.add_customer(@owner_2)

#SHOULD BE WITH CAR INSTANCES:
    # assert_equal [@car_1, @car_4, @car_3, @car_5], @garage.all_cars
    # expected = {
    #             "Ford" => [@car_1, @car_4],
    #             "Chevrolet" => [@car_3],
    #             "Volvo" => [@car_5]
    #            }
    # assert_equal expected, @garage.garage.cars_by_make
    #
    # assert_equal [@car_3, @car_1, @car_4], @garage.oldest_cars

    expected = ['1967 Green Ford Mustang', '2001 Blue Ford Escape', '1963 Green Chevrolet Corvette', '1963 Green Chevrolet Corvette']
    assert_equal expected, @garage.all_cars

    expected = {
                "Ford" => ['1967 Green Ford Mustang', '2001 Blue Ford Escape'],
                "Chevrolet" => ['1963 Green Chevrolet Corvette'],
                "Volvo" => ['2020 Silver Volvo XC90']
               }
    assert_equal expected, @garage.garage.cars_by_make

    expected = ['1963 Green Chevrolet Corvette', '1967 Green Ford Mustang', '2001 Blue Ford Escape']
    assert_equal expected, @garage.oldest_cars
  end

end
