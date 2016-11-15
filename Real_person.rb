require './Player'

class Real_person < Player

  def scan
    $stdout.flush
    $stdin.gets
  end

  def input(player, deck)
    player.neat_info_hand
    puts "what would you like to do?"
    $stdout.flush
    down = scan.downcase
    type = down.gsub(/\s+/,"")

    if type == "draw"
      draw(player, deck)
    elsif type == "discard"
      puts "rank of card?"
    elsif type == "rank"

    elsif type == "suit"

    end
  end

  def draw(player, deck)
    deck.deal(player)
    input(player, deck)
  end
end
