require './Player'

class Real_person < Player

  def scan
    $stdout.flush
    $stdin.gets
  end

  def input(player, deck)
    player.neat_info_hand
    puts "what would you like to do?"
    puts ""
    $stdout.flush
    down = scan.downcase
    type = down.gsub(/\s+/,"")

    if type == "draw"
      draw(player, deck)
    elsif type == "discard"
      puts "rank of card?"
      puts ""
      $stdout.flush
      rank = scan.downcase
      puts "suit?"
      puts ""
      $stdout.flush
      suit = scan.downcase
      player.check_card(rank, suit, player.face_up, player, deck)
    else
      puts "that is not a proper command. draw a card or discard one."
      puts ""
      input(player, deck)
    end
  end

  def draw(player, deck)
    deck.deal(player)
    input(player, deck)
  end

  def check_card(rank, suit, face_up, player, draw)
    check = 0
    card_num = 0
    hand.each do |card|
      if card.rank == rank && card.suit == suit && face_up[0].suit == card.suit
        face_up.unshift(hand[card_num])
        hand.delete_at(card_num)
        check = 1
      elsif card.rank == rank && card.suit == suit && face_up[0].rank == card.rank
        face_up.unshift(hand[card_num])
        hand.delete_at(card_num)
        check = 1
      elsif card.rank == rank && card.rank = '8'
        face_up.unshift(hand[card_num])
        hand.delete_at(card_num)
        check = 1
      end
      card_num += 1
    end
    if check == 0
      puts ""
      puts 'sorry that card is not in your deck'
      $stdout.flush
      input(player, draw)
    end
  end
end
