class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    if @students.include?(student)
      puts 'Student already exists in this class'
    else
      student.add_classroom(self)
      @students.push(student)
    end
  end
end

