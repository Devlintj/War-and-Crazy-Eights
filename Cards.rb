class Cards

  def initialize(rank, suit, rank_num)
    @rank = rank
    @suit = suit
    @rank_num = rank_num
  end

  attr_reader :rank, :suit, :rank_num

end
