class Car
  attr_reader :make, :model, :color, :year, :age

  def initialize(info)
    @info = info
    @make = info[:description].split(' ')[1]
    @model = info[:description].split(' ')[2]
    @color = info[:description].split(' ')[0]
    @year = info[:year]
    @age = 2021 - info[:year].to_i
  end

end
