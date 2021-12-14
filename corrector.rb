class Corrector
  def correct_name(name)
    name.length > 10 ? name = name.slice(0, 10) : nil
    name.capitalize
  end
end
