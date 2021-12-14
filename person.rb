require_relative './corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
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

person1 = Person.new(20, 'mark')
person2 = Person.new(18, 'john')
person3 = Person.new(14, 'alice')
person4 = Person.new(20, 'bob')
person5 = Person.new(15, 'mike')
person6 = Person.new(10, 'darius')

arr = [person1, person2, person3, person4,person5,person6]
new_arr = []

# array of people that have only odd age that is less than or equal to 14 or is a multiples of 3

arr.each do |person|
  new_arr << person.name if person.age.odd? && person.age >= 14 || person.age%3 == 0
end

p new_arr          #   ["mike"]


