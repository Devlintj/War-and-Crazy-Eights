##https://github.com/gosu/gosu/wiki/Ruby-tutorial

require "gosu"
require "./Player"
require "./ZOrder"
require "./Star"
require "./Enemies"
require "./Health"


class GameWindow < Gosu::Window

  def initialize
    super 1280, 960, false
    self.caption = "Hello, World"

    @background_image = Gosu::Image.new("media/space.jpg", :tileable => true)

    @player = Player.new
    @player.warp(320, 240)

    @star_anim = Gosu::Image::load_tiles("media/star.png", 25, 25)
    @stars = Array.new

    @enemies = Array.new

    @health = Array.new

    @laser = Array.new

    @font = Gosu::Font.new(20)
  end

  def update
    if Gosu::button_down? Gosu::KbLeft or Gosu::button_down? Gosu::GpLeft then
      @player.turn_left
    end

    if Gosu::button_down? Gosu::KbRight or Gosu::button_down? Gosu::GpRight then
      @player.turn_right
    end

    if Gosu::button_down? Gosu::KbUp or Gosu::button_down? Gosu::GpButton0 then
      @player.accelerate
    end
    @player.move
    @player.collect_stars(@stars)
    @player.collect_health(@health)
    @player.take_damage(@enemies)

    if rand(100) < 4 and @stars.size < 25 then
      @stars.push(Star.new(@star_anim))
    end

    if rand(1000) < 10 and @enemies.size < 10 then
      @enemies.push(Enemies.new)
    end

    if rand(10000) < 10 and @health.size < 5 then
      @health.push(Health.new)
    end

    # if Gosu 

    @enemies.each {|enemies| enemies.accelerate}
    @enemies.each {|enemies| enemies.move}

    @laser.each {|laser| laser.accelerate}
    @laser.each {|laser| laser.move}

    death
  end

  def draw
    @player.draw
    @enemies.each {|enemies| enemies.draw }
    @health.each {|health| health.draw}
    @background_image.draw(0,0,0)
    @stars.each { |star| star.draw}
    @font.draw("Score: #{@player.score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
    @font.draw("Lives: #{@player.lives}", 30, 30, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end

  def death
    if @player.lives < 1
      close
    end
  end
end


sound = Gosu::Sample.new("media/sound.wav")
sound.play(1, 1, true)

window = GameWindow.new
window.show
