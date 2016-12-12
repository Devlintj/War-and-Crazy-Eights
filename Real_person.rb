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
      puts ""
      puts "rank of card?"
      $stdout.flush
      rank = scan.downcase
      puts ""
      puts "suit?"
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
    works = false
    card_num = 0
    puts face_up[0].rank
    puts face_up[0].suit
    hand.each do |card|
      puts "info #{card.rank} #{card.suit}"
      $stdout.flush
      if card.rank == rank && card.suit == suit && face_up[0].suit == suit
        face_up.unshift(hand[card_num])
        hand.delete_at(card_num)
        works = true
      elsif card.rank == rank && card.suit == suit && face_up[0].rank == rank
        face_up.unshift(hand[card_num])
        hand.delete_at(card_num)
        works = true
      elsif card.rank == rank && card.rank == '8'
        face_up.unshift(hand[card_num])
        hand.delete_at(card_num)
        works = true
      end
      card_num += 1
      puts works
      puts ""
    end
    if works
      puts ""
      puts 'sorry that card cannot be discarded'
      puts ""
      $stdout.flush
      input(player, draw)
    end
  end
end
