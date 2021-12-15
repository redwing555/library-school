require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age:, name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = []
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    if @classroom.include?(classroom)
      puts 'Student already enrolled in this classroom'
    else
      classroom.add_student(self)
      @classroom.push(classroom)
    end
  end
end
