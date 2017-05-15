class TriangleError < StandardError
  def initialize(msg)
    super("Triangle Error: #{msg}")
  end
end