class Health

  attr_reader :x, :y

  def initialize
    @image = Gosu::Image.new("media/mic.jpg")
    @x = rand * 1280
    @y = rand * 960
  end

  def draw
    @image.draw(@x, @y, 1)
  end
end
