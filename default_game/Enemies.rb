require './Player'

class Enemies < Player
  def initialize
    enemies []
    rick1 = Gosu::Image.new("media/rick/rick1.jpg")
    rick2 = Gosu::Image.new("media/rick/rick2.jpg")
    rick3 = Gosu::Image.new("media/rick/rick3.jpg")
    rick4 = Gosu::Image.new("media/rick/rick4.jpg")
    rick5 = Gosu::Image.new("media/rick/rick5.jpg")
    rick6 = Gosu::Image.new("media/rick/rick6.jpg")
    rick7 = Gosu::Image.new("media/rick/rick7.jpg")
    rick8 = Gosu::Image.new("media/rick/rick8.jpg")
    rick9 = Gosu::Image.new("media/rick/rick9.jpg")
    rick10 = Gosu::Image.new("media/rick/rick10.jpg")
    rick11 = Gosu::Image.new("media/rick/rick11.jpg")
    rick12 = Gosu::Image.new("media/rick/rick12.jpg")
    rick13 = Gosu::Image.new("media/rick/rick13.jpg")
    rick14 = Gosu::Image.new("media/rick/rick14.jpg")
    enemies.push(rick1)
    enemies.push(rick2)
    enemies.push(rick3)
    enemies.push(rick4)
    enemies.push(rick5)
    enemies.push(rick6)
    enemies.push(rick7)
    enemies.push(rick8)
    enemies.push(rick9)
    enemies.push(rick10)
    enemies.push(rick11)
    enemies.push(rick12)
    enemies.push(rick13)
    enemies.push(rick14)
    @image = enemies[rand(enemies.length)]
