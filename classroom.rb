require_relative './student'
class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    if @students.include?(student)
      puts 'Student already exists in this class'
    else
      @students.push(student)
      student.classroom = self
     
    end
  end
end
