require './Cards'
require './Player'
require './Real_person'

class Deck

  def initialize(type)
    @type = type
    @new_set = standard
    @size = new_set.length
    @used_set = []
    @top_rank = ""
  end

  attr_accessor :size, :type, :new_set, :used_set, :top_rank

  def standard
    rank = ['1', '2', '3', '4', '5', '6',
            '7', '8', '9', '10', 'jack', 'queen', 'king']
    suite = ['spades', 'clubs', 'hearts', 'diamonds']
    cards = []
    13.times do |n|
      4.times do |s|
        cards.push(Cards.new(rank[n%rank.size], suite[s%suite.size], n + 1))
      end
    end
    cards
  end

  def init_deal(player1, player2, num)
    player = 10
    num.times do |card|
      card = rand(new_set.length)

      used_set.push(new_set[card])
      if player % 10 == 0
        player1.hand.push(new_set[card])
      else
        player2.hand.push(new_set[card])
      end
      new_set.delete_at(card)
      player += 5
    end
  end

  def deal(player)
    card = rand(new_set.length)

    used_set.push(new_set[card])
    player.hand.push(new_set[card])
    new_set.delete_at(card)
  end

end
