require './Deck'

def start_game
  deck = Deck.new("standard")
  player1 = Player.new("Billy")
  player2 = Player.new("Cubs")

  deck.init_deal(player1, player2, 52)

  play_game(player1, player2)
end

def play_game(player1, player2)
  while player1.hand.size > 0 && player2.hand.size > 0
    draw(player1, player2)
    $stdout.flush
  end
  puts "Game over!"
end

def draw(player1, player2)
  player1.play_card
  player2.play_card
  puts player1.neat_info_face
  puts player2.neat_info_face
  $stdout.flush

  check_win(player1, player2)
end

def check_win(player1, player2)
  if player1.face_up[0].rank_num > player2.face_up[0].rank_num
    player1.take_cards(player1, player2)
    puts "player1 wins " * 5
    puts ""
    $stdout
  elsif player1.face_up[0].rank_num < player2.face_up[0].rank_num
    player2.take_cards(player2, player1)
    puts "player2 wins " * 5
    puts ""
    $stdout
  else
    puts "War! " * 5
    puts ""
    $stdout
  end

end

start_game
