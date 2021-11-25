require_relative 'corrector'

class Person
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(age:, name: 'Unknown', parent_permission: true, id: 0)
    @id = id.eql?(0) ? Random.rand(1..1000) : id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    true if of_age? || @parent_permission
  end

  def validate_name
    correct = Corrector.new
    @name = correct.correct_name @name
  end

  private

  def of_age?
    @age >= 18
  end
end
