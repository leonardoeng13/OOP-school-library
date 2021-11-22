# rubocop:disable Metrics\CyclomaticComplexity, Metrics/MethodLength
require './library/people/student'
require './library/people/teacher'

class PeopleIntializer
  attr_reader :people

  def initialize
    @people = []
  end

  def list_all_people
    if @people.empty?
      puts 'Your Library is empty, please add more people by clicking on 3'
      return
    end
    @people.each do |person|
      print "[#{person.class.name}] Name: #{person.name.capitalize}, ID: #{person.id}, Age: #{person.age}\n"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '

    option = gets.chomp

    case option
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      permission_resp = gets.chomp
      parent_permission = permission_resp.downcase == 'y'

      create_student(age, name, parent_permission)

    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp

      create_teacher(age, name, specialization)

    else
      puts 'Please choose number 1 or 2'
      nil
    end
  end

  def create_student(age, name, parent_permission)
    student = Student.new(age, name, parent_permission)
    @people << student
    puts "Person created successfully\n"
  end

  def create_teacher(age, name, specialization)
    teacher = Teacher.new(specialization, age, name)
    @people << teacher
    puts "Person created successfully\n"
  end
end
# rubocop:enable Metrics\CyclomaticComplexity, Metrics/MethodLength
