require_relative './create_teacher'
require_relative './create_student'

class PersonType
  def initialize(people)
    @people = people
    @teacher = CreateTeacher.new(@people)
    @student = CreateStudent.new(@people)
  end

  def choose_person
    print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
    loop do
      input = gets.chomp.to_i

      case input
      when 1
        @student.create_student
        break
      when 2
        @teacher.create_teacher
        break
      else
        puts 'please enter valid number ( 1 or 2) !'
      end
    end
  end
end
