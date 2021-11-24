require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'
class Converter
  def self.hash_to_people_arr(arr)
    instance_arr = arr.map do |item|
      case item['type']
      when 'Teacher'
        Teacher.new(
          age: item['age'],
          specialization: item['specialization'],
          name: item['name'],
          id: item['id']
        )
      when 'Student'
        Student.new(
          age: item['age'],
          name: item['name'],
          parent_permission: item['parent_permission'],
          id: item['id']
        )
      end
    end
    instance_arr.empty? ? [] : instance_arr
  end

  def self.hash_to_books_arr(arr)
    arr.map do |item|
      Book.new(item['title'], item['author'])
    end
  end

  def self.hash_to_rentals_arr(arr, _books, people)
    instance_arr = []
    arr.each do |l|
      people.each do |p|
        instance_arr << Rental.new(l['date'], Book.new(l['title'], l['author']), p) if l['person-id'] == p.id
      end
    end
    instance_arr
  end
end
