require_relative 'app'
# rubocop:disable Metrics/CyclomaticComplexity
def main
  app = App.new
  puts 'Welcome to School Library App!'
  loop do
    app.choices
    case gets.chomp
    when '1' then app.list_books
    when '2' then app.list_people
    when '3' then app.create_person
    when '4' then app.create_book
    when '5' then app.create_rental
    when '6' then app.list_rentals
    when '7'
      puts 'Thanks for using this app.'
      return
    end
  end
end

main
# rubocop:enable Metrics/CyclomaticComplexity
