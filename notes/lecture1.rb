# OOP in Ruby
# 1. classes and objects
# 2. classes contain behaviors

class Dog
  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def speak
    @name + " barked!"
  end

  def get_name
    @name
  end

  def info
    "#{@name} is #{@height} feet tall and weighs #{@weight} pounds"
  end
end

teddy = Dog.new('teddy', 3, 95)
fido = Dog.new('fido', 1, 35)

puts teddy.speak
puts fido.speak
puts teddy.get_name
puts fido.get_name
puts teddy.info
puts fido.info