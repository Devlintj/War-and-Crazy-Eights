class Laser

  attr_accessor :x, :y, :vel_x, :vel_y, :angle

  def initialize(x, y, angle)
    @image = Gosu::Image.new("media/laser.jpg")
    @x = x
    @y = y
    @vel_x = vel_x
    @vel_y = vel_y
    @angle = angle
  end

  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y

    if @y > 960 || @y < 0 || @x > 1280 || @x < 0
      reject
    end

    @vel_x *= 0.95
    @vel_y *= 0.95
  end
