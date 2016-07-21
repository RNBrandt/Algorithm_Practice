class Node
 attr_accessor :bigger, :smaller
 attr_reader :value
  def initialize(value)
    @value = value
    @bigger = nil
    @smaller = nil
  end
end
