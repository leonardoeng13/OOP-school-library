require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age:, specialization:, name: 'Unknown', parent_permission: true, id: 0)
    super(name: name, age: age, parent_permission: parent_permission, id: id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    {
      'type' => 'Teacher',
      'name' => @name,
      'specialization' => @specialization,
      'age' => @age,
      'id' => @id
    }
  end
end
