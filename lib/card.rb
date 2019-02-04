class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def card_value
    case @rank
    when 'A'
      14
    when 'K'
      13
    when 'Q'
      12
    when 'J'
      11
    else
      @rank
    end
  end
end
