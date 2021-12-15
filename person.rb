require_relative './corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1...1_000_000)
    @name = name
    @parent_permission = parent_permission
    @age = age
    @corrector = Corrector.new
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? && @parent_permission
  end

  private :of_age?
end

p1 = Person.new(age: 18, name: 'houssam')
p p1.age
