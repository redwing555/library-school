require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age:, specialization: 'None', name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*_args)
    JSON.dump({
                classname: self.class,
                age: @age,
                name: @name,
                parent_permission: @parent_permission,
                specialization: @specialization
              })
  end
end
