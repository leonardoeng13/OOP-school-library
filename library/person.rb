require_relative 'corrector'
require_relative 'rental'

class Person
  attr_accessor :name, :age, :rentals, :id

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  private

  def of_age?
    @age >= 18
  end

  def to_s
    "Name: #{@name}, ID: #{@id}, Age: #{@age}"
  end
end
