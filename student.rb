require_relative './person'

# Student class to compare
class Student < Person
  
  attr_reader :classroom

  def initialize(age:, classroom:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

student = Student.new(age: 18, parent_permission: true, classroom: 'Psychologist 001')

puts student.play_hooky
