class PeopleList
  def initialize(people)
    @people = people
  end

  def list_people
    puts "\n\nNo person is added yet, add someone!" if @people.empty?

    @people.each do |person|
      person.validate_name
      puts "[#{person.class.name}] Name: #{person.name}, ID:#{person.id}, Age: #{person.age}\n"
    end
  end
end
