class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = 111
    @name = name
    @parent_permission = parent_permission
    @age = age
  end
  def of_age?
    @age > 18
  end

  def can_use_service?
    is_of_age? || @parent_permission
  end

  

  private :of_age?
end

person = Person.new(14, 'houssam')
puts person.instance_eval { of_age? }
