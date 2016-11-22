require "gosu"

class Player
  def initialize
    @image = Gosu::Image.new("media/starfighter.jpg")
    @beep = Gosu::Sample.new("media/beep.wav")
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
    @lives = 5
  end

  attr_accessor :x, :y, :angle, :score, :lives

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1280
    @y %= 960

    @vel_x *= 0.95
    @vel_y *= 0.95
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end

  def collect_stars(stars)
    if stars.reject! {|star| Gosu::distance(@x, @y, star.x, star.y) < 35 } then
      @score += 1
      @beep.play
      true
    else
      false
    end
  end

  def take_damage(enemies)
    if enemies.reject! {|enemies| Gosu::distance(@x, @y, enemies.x, enemies.y) < 70} then
      @lives -= 1
      true
    else
      false
    end
  end

  def collect_health(health)
    if health.reject! {|health| Gosu::distance(@x, @y, health.x, health.y) < 50} then
      @lives += 1
      true
    else
      false
    end
  end
end
