class Setter
  def generate_code
    Array.new(4) { rand(1..6) }
  end
end

setter = Setter.new

puts setter.generate_code