class Player

  def initialize(name = "")
    @name = name
    @hand = []
    @face_up = []
  end

  attr_accessor :hand, :name, :face_up

  def play_card
    face_up.unshift(hand.pop)
  end

  def take_cards(winner, loser)
    while loser.face_up.length > 0
      winner.hand.unshift(loser.face_up.pop)
    end
    while winner.face_up.length > 0
      winner.hand.unshift(winner.face_up.pop)
    end
  end

  def top_card(player)
    puts player.face_up[0].rank + " of " + player.face_up[0].suit
  end

  def neat_info_hand
    puts "hand of #{name}:"
    hand.each do |n|
      puts "#{n.rank} of #{n.suit}"
      puts ""
    end
  end

  def neat_info_face
    puts "hand of #{name}:"
    face_up.each do |n|
      puts "#{n.rank} of #{n.suit}"
      puts ""
    end
  end

  def draw(player, deck)
    deck.deal(player)
  end

  def discard(rank, suit)
    
  end

  def rank_dis

  end

  def suit_dis

  end

  def throw_card

  end
end
