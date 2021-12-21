require_relative '../classes/student'

class CreateStudent
    def initialize(people)
        @people = people
    end

    
  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'Y'
    created_student = Student.new(age: age, name: name, parent_permission: parent_permission)
    @people.push(created_student)

    puts "Person Created!  \n\n"
  end
end