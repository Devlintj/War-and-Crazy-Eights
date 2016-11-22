class Laser

  attr_accessor :x, :y, :vel_x, :vel_y, :angle

  def initialize(x, y, angle)
    @image = Gosu::Image.new("media/laser.jpg")
    @x = x
    @y = y
    @vel_x = 0
    @vel_y = 0
    @angle = angle
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y

    @vel_x *= 1.05
    @vel_y *= 1.05
  end

  def hit_wall?(laser)
    if laser.reject!{|laser| laser.x > 1280 || laser.x < 0 || laser.y > 960 || laser.y < 0} then
      true
    else
      false
    end
  end
end
