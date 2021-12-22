require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age:, name: 'Unknown', parent_permission: true)
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

  def to_json(*_args)
    JSON.dump({
                classname: self.class,
                age: @age,
                name: @name,
                parent_permission: @parent_permission,
                classroom: @classroom

              })
  end
end
