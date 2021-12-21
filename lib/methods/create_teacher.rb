require_relative '../classes/teacher'

class CreateTeacher
  def initialize(people)
    @people = people
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    created_teacher = Teacher.new(age: age, name: name, specialization: specialization)
    @people.push(created_teacher)

    puts "Person Created!  \n\n"
  end
end
