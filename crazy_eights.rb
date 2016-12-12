require './Deck'

def start_game
  deck = Deck.new("standard")
  player1 = Real_person.new("NNNPC")
  player2 = Player.new("Rick")

  deck.init_deal(player1, player2, 14)

  card = rand(deck.new_set.length)

  deck.used_set.push(deck.new_set[card])
  player1.face_up.push(deck.new_set[card])
  player2.face_up.push(deck.new_set[card])
  deck.new_set.delete_at(card)

  play_game(player1, player2, deck)
end

def play_game(player1, player2, deck)
  while player1.hand.size > 0 && player2.hand.size > 0 && deck.size > 0
    puts ""
    puts player1.top_card(player1)
    puts "#{player1.name}'s turn begins!!!"
    player1.input(player1, deck)
    player2.face_up_update(player1)

    puts ""
    puts player2.top_card(player2)
    puts "#{player2.name}'s turn begins!!!"
    player2.ai_logic(player2, deck)
    player1.face_up_update(player2)
  end
end

start_game
