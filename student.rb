require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age: , name: 'Unknown', parent_permission: true)
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    
    @classroom = classroom
    @classroom.students.push(self) unless @classroom.students.include?(self)
    
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student1 = Student.new(age:15)
puts student1.age
